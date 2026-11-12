$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$root = $PSScriptRoot
if (-not $root) { $root = $PWD.Path }

$rpDir      = Join-Path $root "resourcepack"
$bedrockDir = Join-Path $root "bedrock"
$packDir    = Join-Path $bedrockDir "pack"
$mapDir     = Join-Path $bedrockDir "custom_mappings"

if (Test-Path $packDir) { Remove-Item $packDir -Recurse -Force }
if (Test-Path $mapDir)  { Remove-Item $mapDir -Recurse -Force }

$dirs = @(
    $packDir,
    $mapDir,
    (Join-Path $packDir "attachables"),
    (Join-Path $packDir "animations"),
    (Join-Path $packDir "models\entity"),
    (Join-Path $packDir "textures\entity\momentum_hookshot"),
    (Join-Path $packDir "textures\items"),
    (Join-Path $packDir "sounds\chuzume\lemudcrab"),
    (Join-Path $packDir "texts")
)
foreach ($d in $dirs) { New-Item -ItemType Directory -Path $d -Force | Out-Null }

function Get-DeterministicGuid([string]$seed) {
    $md5 = [System.Security.Cryptography.MD5]::Create()
    try {
        $bytes = $md5.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($seed))
        return ([Guid]::New($bytes)).ToString()
    } finally {
        $md5.Dispose()
    }
}

function Write-JsonUtf8([string]$path, [object]$obj) {
    $json = ($obj | ConvertTo-Json -Depth 32).Replace('\u0027', "'").Replace('\u0026', '&').Replace("`r`n", "`n") + "`n"
    [System.IO.File]::WriteAllText($path, $json, $utf8NoBom)
}

function Convert-JavaModelToBedrockGeo([string]$javaModelPath, [string]$geoId) {
    $jm = [System.IO.File]::ReadAllText($javaModelPath, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
    $texW = if ($jm.texture_size) { [int]$jm.texture_size[0] } else { 16 }
    $texH = if ($jm.texture_size) { [int]$jm.texture_size[1] } else { 16 }
    $uvScaleU = $texW / 16.0
    $uvScaleV = $texH / 16.0

    $cubes = New-Object System.Collections.Generic.List[object]
    foreach ($el in $jm.elements) {
        $fx = [double]$el.from[0]; $fy = [double]$el.from[1]; $fz = [double]$el.from[2]
        $tx = [double]$el.to[0];   $ty = [double]$el.to[1];   $tz = [double]$el.to[2]

        $origin = [double[]]@(
            [Math]::Round(8.0 - $tx, 5),
            [Math]::Round($fy - 8.0, 5),
            [Math]::Round($fz - 8.0, 5)
        )
        $size = [double[]]@(
            [Math]::Round($tx - $fx, 5),
            [Math]::Round($ty - $fy, 5),
            [Math]::Round($tz - $fz, 5)
        )

        $uvMap = [ordered]@{}
        foreach ($faceName in @("north", "east", "south", "west", "up", "down")) {
            $faceProp = $el.faces.PSObject.Properties[$faceName]
            if ($null -ne $faceProp -and $null -ne $faceProp.Value) {
                $f = $faceProp.Value
                $u1 = [double]$f.uv[0] * $uvScaleU
                $v1 = [double]$f.uv[1] * $uvScaleV
                $u2 = [double]$f.uv[2] * $uvScaleU
                $v2 = [double]$f.uv[3] * $uvScaleV

                if ($faceName -eq "up" -or $faceName -eq "down") {
                    $uvPos  = [double[]]@([Math]::Round($u2, 4), [Math]::Round($v2, 4))
                    $uvSize = [double[]]@([Math]::Round($u1 - $u2, 4), [Math]::Round($v1 - $v2, 4))
                } else {
                    $uvPos  = [double[]]@([Math]::Round($u1, 4), [Math]::Round($v1, 4))
                    $uvSize = [double[]]@([Math]::Round($u2 - $u1, 4), [Math]::Round($v2 - $v1, 4))
                }

                $fOut = [ordered]@{
                    uv      = $uvPos
                    uv_size = $uvSize
                }
                if ($null -ne $f.rotation -and [int]$f.rotation -ne 0) {
                    $fOut["uv_rotation"] = [int]$f.rotation
                }
                $uvMap[$faceName] = $fOut
            }
        }

        $cubeObj = [ordered]@{
            origin = $origin
            size   = $size
        }
        if ($null -ne $el.rotation -and [double]$el.rotation.angle -ne 0.0) {
            $ang = [double]$el.rotation.angle
            $ox  = [double]$el.rotation.origin[0]
            $oy  = [double]$el.rotation.origin[1]
            $oz  = [double]$el.rotation.origin[2]
            $cubeObj["pivot"] = [double[]]@(
                [Math]::Round(8.0 - $ox, 5),
                [Math]::Round($oy - 8.0, 5),
                [Math]::Round($oz - 8.0, 5)
            )
            $rotVec = switch ([string]$el.rotation.axis) {
                "x" { [double[]]@([Math]::Round(-$ang, 4), 0.0, 0.0) }
                "y" { [double[]]@(0.0, [Math]::Round(-$ang, 4), 0.0) }
                "z" { [double[]]@(0.0, 0.0, [Math]::Round($ang, 4)) }
            }
            $cubeObj["rotation"] = $rotVec
        }
        $cubeObj["uv"] = $uvMap
        [void]$cubes.Add($cubeObj)
    }

    return [ordered]@{
        format_version = "1.21.0"
        "minecraft:geometry" = [object[]]@(
            [ordered]@{
                description = [ordered]@{
                    identifier            = $geoId
                    texture_width         = $texW
                    texture_height        = $texH
                    visible_bounds_width  = 4.0
                    visible_bounds_height = 4.0
                    visible_bounds_offset = [double[]]@(0.0, 0.5, 0.0)
                }
                bones = [object[]]@(
                    [ordered]@{
                        name    = "hookshot_root"
                        pivot   = [double[]]@(0.0, 0.0, 0.0)
                        binding = "q.item_slot_to_bone_name(c.item_slot)"
                    },
                    [ordered]@{
                        name   = "hookshot_display"
                        parent = "hookshot_root"
                        pivot  = [double[]]@(0.0, 0.0, 0.0)
                        cubes  = [object[]]$cubes.ToArray()
                    }
                )
            }
        )
    }
}

function Render-HookshotIcon([string]$javaModelPath, [string]$texPngPath, [string]$outPngPath) {
    $jm  = [System.IO.File]::ReadAllText($javaModelPath, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
    $src = New-Object System.Drawing.Bitmap($texPngPath)
    $outSize = 64
    $bmp = New-Object System.Drawing.Bitmap($outSize, $outSize, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    try {
        $sorted = $jm.elements | Sort-Object { [double]$_.from[1] + [double]$_.to[1] }
        $cosGui = [Math]::Cos(-45.0 * [Math]::PI / 180.0)
        $sinGui = [Math]::Sin(-45.0 * [Math]::PI / 180.0)
        $scale  = 20.5 / [double]$outSize

        for ($py = 0; $py -lt $outSize; $py++) {
            for ($px = 0; $px -lt $outSize; $px++) {
                $vx = ($px + 0.5 - ($outSize / 2.0)) * $scale
                $vz = ($py + 0.5 - ($outSize / 2.0)) * $scale
                $mx = 8.0 + ($vx * $cosGui - $vz * $sinGui)
                $mz = 6.8 + ($vx * $sinGui + $vz * $cosGui)

                for ($i = $sorted.Count - 1; $i -ge 0; $i--) {
                    $el = $sorted[$i]
                    $lx = $mx; $lz = $mz
                    if ($null -ne $el.rotation -and [string]$el.rotation.axis -eq "y" -and [double]$el.rotation.angle -ne 0.0) {
                        $rad = -[double]$el.rotation.angle * [Math]::PI / 180.0
                        $ox  = [double]$el.rotation.origin[0]
                        $oz  = [double]$el.rotation.origin[2]
                        $dx  = $mx - $ox; $dz = $mz - $oz
                        $lx  = $ox + ($dx * [Math]::Cos($rad) + $dz * [Math]::Sin($rad))
                        $lz  = $oz + (-$dx * [Math]::Sin($rad) + $dz * [Math]::Cos($rad))
                    }
                    $fx = [double]$el.from[0]; $tx = [double]$el.to[0]
                    $fz = [double]$el.from[2]; $tz = [double]$el.to[2]
                    if ($lx -ge $fx -and $lx -le $tx -and $lz -ge $fz -and $lz -le $tz) {
                        $up = $el.faces.up
                        if ($null -ne $up) {
                            $rx = if (($tx - $fx) -gt 0.001) { ($lx - $fx) / ($tx - $fx) } else { 0.5 }
                            $rz = if (($tz - $fz) -gt 0.001) { ($lz - $fz) / ($tz - $fz) } else { 0.5 }
                            $u = ([double]$up.uv[0] + ($rx * ([double]$up.uv[2] - [double]$up.uv[0]))) * ($src.Width / 16.0)
                            $v = ([double]$up.uv[1] + ($rz * ([double]$up.uv[3] - [double]$up.uv[1]))) * ($src.Height / 16.0)
                            $iu = [Math]::Min($src.Width - 1, [Math]::Max(0, [int][Math]::Floor($u)))
                            $iv = [Math]::Min($src.Height - 1, [Math]::Max(0, [int][Math]::Floor($v)))
                            $col = $src.GetPixel($iu, $iv)
                            if ($col.A -gt 16) {
                                $bmp.SetPixel($px, $py, $col)
                                break
                            }
                        }
                    }
                }
            }
        }
        $bmp.Save($outPngPath, [System.Drawing.Imaging.ImageFormat]::Png)
    } finally {
        $bmp.Dispose()
        $src.Dispose()
    }
}

# 1. Copy textures, icons, and sounds
$srcTex       = Join-Path $rpDir "assets\minecraft\textures\item\custom_item\momentum_hookshot\standby.png"
$srcSound     = Join-Path $rpDir "assets\chuzume\sounds\lemudcrab\launcher.ogg"
$srcIcon      = Join-Path $rpDir "pack.png"
$standbyModel = Join-Path $rpDir "assets\minecraft\models\item\3dmodel\weapon\momentum_hookshot\standby.json"
$reloadModel  = Join-Path $rpDir "assets\minecraft\models\item\3dmodel\weapon\momentum_hookshot\reload.json"

Copy-Item $srcTex   (Join-Path $packDir "textures\entity\momentum_hookshot\standby.png") -Force
Copy-Item $srcSound (Join-Path $packDir "sounds\chuzume\lemudcrab\launcher.ogg") -Force
if (Test-Path $srcIcon) { Copy-Item $srcIcon (Join-Path $packDir "pack_icon.png") -Force }

Render-HookshotIcon $standbyModel $srcTex (Join-Path $packDir "textures\items\momentum_hookshot_standby.png")
Render-HookshotIcon $reloadModel  $srcTex (Join-Path $packDir "textures\items\momentum_hookshot_reload.png")

# 2. manifest.json (fresh UUID v3 + version 1.2.0 to force Bedrock client cache refresh)
$manifest = [ordered]@{
    format_version = 2
    header = [ordered]@{
        name               = "Momentum Hookshot Bedrock"
        description        = "Momentum Hookshot 3D Skins & Sounds for GeyserMC (26.3+)"
        uuid               = (Get-DeterministicGuid "Momentum-Hook-shot:BedrockPack:Header:v3")
        version            = [int[]]@(1, 2, 0)
        min_engine_version = [int[]]@(1, 21, 0)
    }
    modules = [object[]]@(
        [ordered]@{
            type        = "resources"
            description = "Momentum Hookshot Resources"
            uuid        = (Get-DeterministicGuid "Momentum-Hook-shot:BedrockPack:Module:v3")
            version     = [int[]]@(1, 2, 0)
        }
    )
}
Write-JsonUtf8 (Join-Path $packDir "manifest.json") $manifest

# 3. 3D geometry conversion (standby / reload)
$geoStandby = Convert-JavaModelToBedrockGeo $standbyModel "geometry.momentum_hookshot.standby"
$geoReload  = Convert-JavaModelToBedrockGeo $reloadModel  "geometry.momentum_hookshot.reload"
Write-JsonUtf8 (Join-Path $packDir "models\entity\momentum_hookshot_standby.geo.json") $geoStandby
Write-JsonUtf8 (Join-Path $packDir "models\entity\momentum_hookshot_reload.geo.json")  $geoReload

# 4. First-person and third-person hand animations
$animObj = [ordered]@{
    format_version = "1.10.0"
    animations = [ordered]@{
        "animation.momentum_hookshot.first_person" = [ordered]@{
            loop  = $true
            bones = [ordered]@{
                hookshot_display = [ordered]@{
                    position = [double[]]@(1.5, -1.5, -3.5)
                    rotation = [double[]]@(75.0, 12.0, -8.0)
                    scale    = [double[]]@(0.85, 0.85, 0.85)
                }
            }
        }
        "animation.momentum_hookshot.third_person" = [ordered]@{
            loop  = $true
            bones = [ordered]@{
                hookshot_display = [ordered]@{
                    position = [double[]]@(0.0, -1.75, -4.25)
                    rotation = [double[]]@(85.0, 15.0, 0.0)
                    scale    = [double[]]@(0.85, 0.85, 0.85)
                }
            }
        }
    }
}
Write-JsonUtf8 (Join-Path $packDir "animations\momentum_hookshot.animation.json") $animObj

# 4b. Third-person two-handed crossbow aiming stance when holding hookshot
$playerPoseAnim = [ordered]@{
    format_version = "1.10.0"
    animations = [ordered]@{
        "animation.humanoid.holding" = [ordered]@{
            loop  = $true
            bones = [ordered]@{
                leftArm = [ordered]@{
                    rotation = [object[]]@(
                        "query.is_item_name_any('slot.weapon.mainhand', 0, 'geyser_custom:momentum_hookshot_standby', 'geyser_custom:momentum_hookshot_reload') ? (math.clamp(query.target_x_rotation, -50.0, 50.0) - 82.0 - this) : (query.is_item_name_any('slot.weapon.offhand', 0, 'geyser_custom:momentum_hookshot_standby', 'geyser_custom:momentum_hookshot_reload') ? (math.clamp(query.target_x_rotation, -50.0, 50.0) - 85.0 - this) : (variable.is_holding_left ? (-this * 0.5 - 18.0) : 0.0))",
                        "query.is_item_name_any('slot.weapon.mainhand', 0, 'geyser_custom:momentum_hookshot_standby', 'geyser_custom:momentum_hookshot_reload') ? (math.clamp(query.target_y_rotation, -45.0, 45.0) + 34.0) : (query.is_item_name_any('slot.weapon.offhand', 0, 'geyser_custom:momentum_hookshot_standby', 'geyser_custom:momentum_hookshot_reload') ? (math.clamp(query.target_y_rotation, -45.0, 45.0) + 15.0) : 0.0)",
                        0.0
                    )
                }
                rightArm = [ordered]@{
                    rotation = [object[]]@(
                        "query.is_item_name_any('slot.weapon.mainhand', 0, 'geyser_custom:momentum_hookshot_standby', 'geyser_custom:momentum_hookshot_reload') ? (math.clamp(query.target_x_rotation, -50.0, 50.0) - 85.0 - this) : (query.is_item_name_any('slot.weapon.offhand', 0, 'geyser_custom:momentum_hookshot_standby', 'geyser_custom:momentum_hookshot_reload') ? (math.clamp(query.target_x_rotation, -50.0, 50.0) - 82.0 - this) : (variable.is_holding_right ? (-this * 0.5 - 18.0) : 0.0))",
                        "query.is_item_name_any('slot.weapon.mainhand', 0, 'geyser_custom:momentum_hookshot_standby', 'geyser_custom:momentum_hookshot_reload') ? (math.clamp(query.target_y_rotation, -45.0, 45.0) - 15.0) : (query.is_item_name_any('slot.weapon.offhand', 0, 'geyser_custom:momentum_hookshot_standby', 'geyser_custom:momentum_hookshot_reload') ? (math.clamp(query.target_y_rotation, -45.0, 45.0) - 34.0) : 0.0)",
                        0.0
                    )
                }
            }
        }
    }
}
Write-JsonUtf8 (Join-Path $packDir "animations\player_hookshot_pose.animation.json") $playerPoseAnim

# 5. Attachables
foreach ($variant in @("standby", "reload")) {
    $attObj = [ordered]@{
        format_version = "1.10.0"
        "minecraft:attachable" = [ordered]@{
            description = [ordered]@{
                identifier = "geyser_custom:momentum_hookshot_$variant"
                materials  = [ordered]@{
                    default   = "entity_alphatest"
                    enchanted = "entity_alphatest"
                }
                textures   = [ordered]@{
                    default   = "textures/entity/momentum_hookshot/standby"
                    enchanted = "textures/entity/momentum_hookshot/standby"
                }
                geometry   = [ordered]@{
                    default = "geometry.momentum_hookshot.$variant"
                }
                animations = [ordered]@{
                    first_person = "animation.momentum_hookshot.first_person"
                    third_person = "animation.momentum_hookshot.third_person"
                }
                scripts = [ordered]@{
                    animate = [object[]]@(
                        [ordered]@{ first_person = "c.is_first_person" },
                        [ordered]@{ third_person = "!c.is_first_person" }
                    )
                }
                render_controllers = [string[]]@("controller.render.default")
            }
        }
    }
    Write-JsonUtf8 (Join-Path $packDir "attachables\momentum_hookshot_$variant.json") $attObj
}

# 6. Item icons, sounds, and lang files (read UTF-8 directly from Java resourcepack lang JSON)
$itemTexObj = [ordered]@{
    resource_pack_name = "momentum_hookshot"
    texture_name       = "atlas.items"
    texture_data       = [ordered]@{
        momentum_hookshot_standby = [ordered]@{ textures = "textures/items/momentum_hookshot_standby" }
        momentum_hookshot_reload  = [ordered]@{ textures = "textures/items/momentum_hookshot_reload" }
    }
}
Write-JsonUtf8 (Join-Path $packDir "textures\item_texture.json") $itemTexObj

$soundDefObj = [ordered]@{
    format_version    = "1.20.20"
    sound_definitions = [ordered]@{
        "chuzume:launcher_shot" = [ordered]@{
            category = "player"
            sounds   = [string[]]@("sounds/chuzume/lemudcrab/launcher")
        }
        "chuzume.launcher_shot" = [ordered]@{
            category = "player"
            sounds   = [string[]]@("sounds/chuzume/lemudcrab/launcher")
        }
    }
}
Write-JsonUtf8 (Join-Path $packDir "sounds\sound_definitions.json") $soundDefObj

foreach ($pair in @(
    @{ src = "en_us.json"; dst = "en_US.lang" },
    @{ src = "ja_jp.json"; dst = "ja_JP.lang" }
)) {
    $langLines = New-Object System.Collections.Generic.List[string]
    [void]$langLines.Add("item.geyser_custom:momentum_hookshot_standby.name=Momentum Hookshot")
    [void]$langLines.Add("item.geyser_custom:momentum_hookshot_reload.name=Momentum Hookshot")
    $srcLangPath = Join-Path $rpDir ("assets\minecraft\lang\" + $pair.src)
    if (Test-Path $srcLangPath) {
        $langJson = [System.IO.File]::ReadAllText($srcLangPath, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
        foreach ($prop in $langJson.PSObject.Properties) {
            [void]$langLines.Add("$($prop.Name)=$($prop.Value)")
        }
    }
    [System.IO.File]::WriteAllText((Join-Path $packDir ("texts\" + $pair.dst)), ($langLines -join "`n") + "`n", $utf8NoBom)
}
Write-JsonUtf8 (Join-Path $packDir "texts\languages.json") ([string[]]@("en_US", "ja_JP"))

# 7. Geyser custom mappings v2 (definition + range_dispatch)
$geyserMapping = [ordered]@{
    format_version = 2
    items = [ordered]@{
        "minecraft:crossbow" = [object[]]@(
            [ordered]@{
                type               = "definition"
                model              = "minecraft:crossbow"
                bedrock_identifier = "geyser_custom:momentum_hookshot_reload"
                display_name       = "Momentum Hookshot"
                priority           = 2
                predicate          = [ordered]@{
                    type      = "range_dispatch"
                    property  = "custom_model_data"
                    index     = 0
                    threshold = 40
                }
                bedrock_options    = [ordered]@{
                    icon          = "momentum_hookshot_reload"
                    allow_offhand = $true
                }
            },
            [ordered]@{
                type               = "definition"
                model              = "minecraft:crossbow"
                bedrock_identifier = "geyser_custom:momentum_hookshot_standby"
                display_name       = "Momentum Hookshot"
                priority           = 1
                predicate          = [ordered]@{
                    type      = "range_dispatch"
                    property  = "custom_model_data"
                    index     = 0
                    threshold = 38
                }
                bedrock_options    = [ordered]@{
                    icon          = "momentum_hookshot_standby"
                    allow_offhand = $true
                }
            }
        )
    }
}
$mapFileCustom = Join-Path $mapDir "momentum_hookshot.json"
$mapFileRoot   = Join-Path $bedrockDir "momentum_hookshot.json"
Write-JsonUtf8 $mapFileCustom $geyserMapping
Write-JsonUtf8 $mapFileRoot   $geyserMapping

# 8. Build .mcpack archive
$mcpackPath = Join-Path $bedrockDir "Momentum-HookShot-Bedrock.mcpack"
if (Test-Path $mcpackPath) { Remove-Item $mcpackPath -Force }
$zip = [System.IO.Compression.ZipFile]::Open($mcpackPath, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    Get-ChildItem -Path $packDir -Recurse -File | ForEach-Object {
        $rel = $_.FullName.Substring($packDir.Length + 1).Replace("\", "/")
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, $rel) | Out-Null
    }
} finally {
    $zip.Dispose()
}

# 9. Build Geyser config pack archive
$configPackPath = Join-Path $bedrockDir "Momentum-HookShot-Geyser-ConfigPack.zip"
if (Test-Path $configPackPath) { Remove-Item $configPackPath -Force }
$czip = [System.IO.Compression.ZipFile]::Open($configPackPath, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($czip, $mcpackPath, "packs/Momentum-HookShot-Bedrock.mcpack") | Out-Null
    [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($czip, $mapFileCustom, "custom_mappings/momentum_hookshot.json") | Out-Null
} finally {
    $czip.Dispose()
}

Write-Host "Built mcpack     :" $mcpackPath
Write-Host "Built mapping    :" $mapFileCustom
Write-Host "Built configpack :" $configPackPath

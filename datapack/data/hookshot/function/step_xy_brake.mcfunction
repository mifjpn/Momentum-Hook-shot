scoreboard players set $c100 Hookshot.VelY 100
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
summon minecraft:marker ~ ~ ~ {Tags:["hook_math_tmp"]}
execute at @s rotated ~ 0 positioned ^ ^ ^1 run tp @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] ~ ~ ~
execute store result score $px Hookshot.VelY run data get entity @s Pos[0] 100
execute store result score $pz Hookshot.VelY run data get entity @s Pos[2] 100
execute store result score $lx Hookshot.VelY run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[0] 100
execute store result score $lz Hookshot.VelY run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[2] 100
execute at @s rotated ~ 0 positioned ^1 ^ ^ run tp @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] ~ ~ ~
execute store result score $sx Hookshot.VelY run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[0] 100
execute store result score $sz Hookshot.VelY run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[2] 100
kill @e[type=minecraft:marker,tag=hook_math_tmp]
scoreboard players operation $lx Hookshot.VelY -= $px Hookshot.VelY
scoreboard players operation $lz Hookshot.VelY -= $pz Hookshot.VelY
scoreboard players operation $sx Hookshot.VelY -= $px Hookshot.VelY
scoreboard players operation $sz Hookshot.VelY -= $pz Hookshot.VelY
execute store result score $vx Hookshot.VelY run data get entity @s Motion[0] 100
execute store result score $vz Hookshot.VelY run data get entity @s Motion[2] 100
scoreboard players operation $f1 Hookshot.VelY = $vx Hookshot.VelY
scoreboard players operation $f1 Hookshot.VelY *= $lx Hookshot.VelY
scoreboard players operation $f2 Hookshot.VelY = $vz Hookshot.VelY
scoreboard players operation $f2 Hookshot.VelY *= $lz Hookshot.VelY
scoreboard players operation $fwd Hookshot.VelY = $f1 Hookshot.VelY
scoreboard players operation $fwd Hookshot.VelY += $f2 Hookshot.VelY
scoreboard players operation $fwd Hookshot.VelY /= $c100 Hookshot.VelY
scoreboard players operation $s1 Hookshot.VelY = $vx Hookshot.VelY
scoreboard players operation $s1 Hookshot.VelY *= $sx Hookshot.VelY
scoreboard players operation $s2 Hookshot.VelY = $vz Hookshot.VelY
scoreboard players operation $s2 Hookshot.VelY *= $sz Hookshot.VelY
scoreboard players operation $lat Hookshot.VelY = $s1 Hookshot.VelY
scoreboard players operation $lat Hookshot.VelY += $s2 Hookshot.VelY
scoreboard players operation $lat Hookshot.VelY /= $c100 Hookshot.VelY
execute if score @s Hookshot.Pitch matches -45..45 if score $fwd Hookshot.VelY matches 80.. run scoreboard players set @s Hookshot.Impulse 51
execute if score @s Hookshot.Pitch matches -45..45 if score $fwd Hookshot.VelY matches 48..79 run scoreboard players set @s Hookshot.Impulse 52
execute if score @s Hookshot.Pitch matches -45..45 if score $fwd Hookshot.VelY matches 24..47 run scoreboard players set @s Hookshot.Impulse 53
execute if score @s Hookshot.Pitch matches -45..45 if score $fwd Hookshot.VelY matches 14..23 run scoreboard players set @s Hookshot.Impulse 54
execute if score @s Hookshot.Pitch matches ..-46 if score $fwd Hookshot.VelY matches 80.. run scoreboard players set @s Hookshot.Impulse 61
execute if score @s Hookshot.Pitch matches ..-46 if score $fwd Hookshot.VelY matches 48..79 run scoreboard players set @s Hookshot.Impulse 62
execute if score @s Hookshot.Pitch matches ..-46 if score $fwd Hookshot.VelY matches 24..47 run scoreboard players set @s Hookshot.Impulse 63
execute if score @s Hookshot.Pitch matches ..-46 if score $fwd Hookshot.VelY matches 14..23 run scoreboard players set @s Hookshot.Impulse 64
execute if score @s Hookshot.Pitch matches 46.. if score $fwd Hookshot.VelY matches 80.. run scoreboard players set @s Hookshot.Impulse 71
execute if score @s Hookshot.Pitch matches 46.. if score $fwd Hookshot.VelY matches 48..79 run scoreboard players set @s Hookshot.Impulse 72
execute if score @s Hookshot.Pitch matches 46.. if score $fwd Hookshot.VelY matches 24..47 run scoreboard players set @s Hookshot.Impulse 73
execute if score @s Hookshot.Pitch matches 46.. if score $fwd Hookshot.VelY matches 14..23 run scoreboard players set @s Hookshot.Impulse 74
execute if score @s Hookshot.Pitch matches -45..45 if score $fwd Hookshot.VelY matches ..-80 run scoreboard players set @s Hookshot.Impulse 81
execute if score @s Hookshot.Pitch matches -45..45 if score $fwd Hookshot.VelY matches -79..-48 run scoreboard players set @s Hookshot.Impulse 82
execute if score @s Hookshot.Pitch matches -45..45 if score $fwd Hookshot.VelY matches -47..-24 run scoreboard players set @s Hookshot.Impulse 83
execute if score @s Hookshot.Pitch matches -45..45 if score $fwd Hookshot.VelY matches -23..-14 run scoreboard players set @s Hookshot.Impulse 84
execute if score @s Hookshot.Pitch matches ..-46 if score $fwd Hookshot.VelY matches ..-80 run scoreboard players set @s Hookshot.Impulse 91
execute if score @s Hookshot.Pitch matches ..-46 if score $fwd Hookshot.VelY matches -79..-48 run scoreboard players set @s Hookshot.Impulse 92
execute if score @s Hookshot.Pitch matches ..-46 if score $fwd Hookshot.VelY matches -47..-24 run scoreboard players set @s Hookshot.Impulse 93
execute if score @s Hookshot.Pitch matches ..-46 if score $fwd Hookshot.VelY matches -23..-14 run scoreboard players set @s Hookshot.Impulse 94
execute if score @s Hookshot.Pitch matches 46.. if score $fwd Hookshot.VelY matches ..-80 run scoreboard players set @s Hookshot.Impulse 101
execute if score @s Hookshot.Pitch matches 46.. if score $fwd Hookshot.VelY matches -79..-48 run scoreboard players set @s Hookshot.Impulse 102
execute if score @s Hookshot.Pitch matches 46.. if score $fwd Hookshot.VelY matches -47..-24 run scoreboard players set @s Hookshot.Impulse 103
execute if score @s Hookshot.Pitch matches 46.. if score $fwd Hookshot.VelY matches -23..-14 run scoreboard players set @s Hookshot.Impulse 104
execute if score $lat Hookshot.VelY matches 75.. run scoreboard players set @s Hookshot.ImpulseLat 1
execute if score $lat Hookshot.VelY matches 45..74 run scoreboard players set @s Hookshot.ImpulseLat 2
execute if score $lat Hookshot.VelY matches 22..44 run scoreboard players set @s Hookshot.ImpulseLat 3
execute if score $lat Hookshot.VelY matches 14..21 run scoreboard players set @s Hookshot.ImpulseLat 4
execute if score $lat Hookshot.VelY matches ..-75 run scoreboard players set @s Hookshot.ImpulseLat 11
execute if score $lat Hookshot.VelY matches -74..-45 run scoreboard players set @s Hookshot.ImpulseLat 12
execute if score $lat Hookshot.VelY matches -44..-22 run scoreboard players set @s Hookshot.ImpulseLat 13
execute if score $lat Hookshot.VelY matches -21..-14 run scoreboard players set @s Hookshot.ImpulseLat 14
execute if score @s Hookshot.BrakeTicks matches 2.. if score $fwd Hookshot.VelY matches -13..13 if score $lat Hookshot.VelY matches -13..13 run scoreboard players set @s Hookshot.BrakeTicks 1
execute if score @s Hookshot.BrakeTicks matches 1.. run scoreboard players remove @s Hookshot.BrakeTicks 1

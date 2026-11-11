scoreboard players set $c100 Hookshot.VelY 100
summon minecraft:marker ~ ~ ~ {Tags:["hook_math_tmp"]}
execute at @s rotated ~ 0 positioned ^ ^ ^1 run tp @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] ~ ~ ~
execute store result score $px Hookshot.VelY run data get entity @s Pos[0] 100
execute store result score $pz Hookshot.VelY run data get entity @s Pos[2] 100
execute store result score $lx Hookshot.VelY run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[0] 100
execute store result score $lz Hookshot.VelY run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[2] 100
kill @e[type=minecraft:marker,tag=hook_math_tmp]
scoreboard players operation $lx Hookshot.VelY -= $px Hookshot.VelY
scoreboard players operation $lz Hookshot.VelY -= $pz Hookshot.VelY
execute store result score $vx Hookshot.VelY run data get entity @s Motion[0] 100
execute store result score $vz Hookshot.VelY run data get entity @s Motion[2] 100
scoreboard players operation $vx Hookshot.VelY *= $lx Hookshot.VelY
scoreboard players operation $vz Hookshot.VelY *= $lz Hookshot.VelY
scoreboard players operation $fwd Hookshot.VelY = $vx Hookshot.VelY
scoreboard players operation $fwd Hookshot.VelY += $vz Hookshot.VelY
scoreboard players operation $fwd Hookshot.VelY /= $c100 Hookshot.VelY
execute if score $fwd Hookshot.VelY matches 85.. run scoreboard players set @s Hookshot.Impulse 51
execute if score $fwd Hookshot.VelY matches 50..84 run scoreboard players set @s Hookshot.Impulse 52
execute if score $fwd Hookshot.VelY matches 24..49 run scoreboard players set @s Hookshot.Impulse 53
execute if score $fwd Hookshot.VelY matches 10..23 run scoreboard players set @s Hookshot.Impulse 54
execute if score $fwd Hookshot.VelY matches ..9 run scoreboard players set @s Hookshot.BrakeTicks 1
scoreboard players remove @s Hookshot.BrakeTicks 1

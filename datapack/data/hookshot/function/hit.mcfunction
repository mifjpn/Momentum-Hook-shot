playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.9 1.25
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.35 1.9
particle minecraft:gust ~ ~ ~ 0.15 0.15 0.15 0 2 force
particle minecraft:crit ~ ~ ~ 0.15 0.15 0.15 0.1 8 force
function hookshot:place_safe_stop
function hookshot:spawn_wire_entities
attribute @s minecraft:fall_damage_multiplier modifier remove hookshot:fall_guard
attribute @s minecraft:fall_damage_multiplier modifier add hookshot:fall_guard -1 add_multiplied_total
scoreboard players set @s Hookshot.FallGuard 180
attribute @s minecraft:step_height modifier remove hookshot:step_boost
attribute @s minecraft:step_height modifier add hookshot:step_boost 1.5 add_value
scoreboard players set @s Hookshot.StepGuard 30
scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
tag @e[tag=hook_cur_stop] remove hook_cur_stop
execute as @e[type=minecraft:marker,tag=hook_anchor] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_anchor
execute as @e[type=minecraft:marker,tag=hook_stop] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_stop
execute store result score @s Hookshot.LastX run data get entity @s Pos[0] 50
execute store result score @s Hookshot.LastY run data get entity @s Pos[1] 50
execute store result score @s Hookshot.LastZ run data get entity @s Pos[2] 50
execute store result score @s Hookshot.StopX run data get entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] Pos[0] 50
execute store result score @s Hookshot.StopY run data get entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] Pos[1] 50
execute store result score @s Hookshot.StopZ run data get entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] Pos[2] 50
scoreboard players operation @s Hookshot.RayX = @s Hookshot.StopX
scoreboard players operation @s Hookshot.RayX -= @s Hookshot.LastX
scoreboard players operation @s Hookshot.RayY = @s Hookshot.StopY
scoreboard players operation @s Hookshot.RayY -= @s Hookshot.LastY
scoreboard players operation @s Hookshot.RayZ = @s Hookshot.StopZ
scoreboard players operation @s Hookshot.RayZ -= @s Hookshot.LastZ
scoreboard players operation $rx2 Hookshot.Math = @s Hookshot.RayX
scoreboard players operation $rx2 Hookshot.Math *= @s Hookshot.RayX
scoreboard players operation $rz2 Hookshot.Math = @s Hookshot.RayZ
scoreboard players operation $rz2 Hookshot.Math *= @s Hookshot.RayZ
scoreboard players operation @s Hookshot.InitH2 = $rx2 Hookshot.Math
scoreboard players operation @s Hookshot.InitH2 += $rz2 Hookshot.Math
scoreboard players operation $ry2 Hookshot.Math = @s Hookshot.RayY
scoreboard players operation $ry2 Hookshot.Math *= @s Hookshot.RayY
scoreboard players operation @s Hookshot.MinD2 = @s Hookshot.InitH2
scoreboard players operation @s Hookshot.MinD2 += $ry2 Hookshot.Math
function hookshot:calc_horiz_dist
scoreboard players operation @s Hookshot.H2Div = @s Hookshot.InitH2
scoreboard players operation @s Hookshot.H2Div /= #c100 Hookshot.Math
execute if score @s Hookshot.H2Div matches ..0 run scoreboard players set @s Hookshot.H2Div 1
execute store result score @s Hookshot.ShotPitch run data get entity @s Rotation[1] 1
scoreboard players operation @s Hookshot.Pitch = @s Hookshot.ShotPitch
scoreboard players set @s Hookshot.Mode 0
execute if score @s Hookshot.ShotPitch matches 50.. if score @s Hookshot.RayY matches ..-25 run scoreboard players set @s Hookshot.Mode 1
scoreboard players set @s Hookshot.ArchH 0
execute if score @s Hookshot.Mode matches 0 if score @s Hookshot.HorizDist matches 120.. run scoreboard players operation @s Hookshot.ArchH = @s Hookshot.HorizDist
execute if score @s Hookshot.Mode matches 0 if score @s Hookshot.HorizDist matches 120.. run scoreboard players operation @s Hookshot.ArchH *= #arch_scale Hookshot.Math
execute if score @s Hookshot.Mode matches 0 if score @s Hookshot.HorizDist matches 120.. run scoreboard players operation @s Hookshot.ArchH /= #c100 Hookshot.Math
execute if score @s Hookshot.Mode matches 0 if score @s Hookshot.HorizDist matches 120.. run scoreboard players add @s Hookshot.ArchH 35
execute if score @s Hookshot.ArchH matches 451.. run scoreboard players set @s Hookshot.ArchH 450
attribute @s minecraft:gravity modifier remove hookshot:wall_hang
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
attribute @s minecraft:gravity modifier add hookshot:zero_grav -1 add_multiplied_total
scoreboard players set @s Hookshot.PullTicks 130
scoreboard players set @s Hookshot.PullElapsed 0
scoreboard players set @s Hookshot.StuckTicks 0
scoreboard players set @s Hookshot.WireLife 8
execute at @s run function hookshot:update_wire_geometry
execute at @s run function hookshot:step_pull_physics
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
tag @e[tag=hook_cur_stop] remove hook_cur_stop

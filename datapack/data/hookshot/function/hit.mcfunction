playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.9 1.25
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.35 1.9
particle minecraft:gust ~ ~ ~ 0.15 0.15 0.15 0 2 force
particle minecraft:crit ~ ~ ~ 0.15 0.15 0.15 0.1 8 force
function hookshot:place_safe_stop
function hookshot:spawn_wire_entities
attribute @s minecraft:fall_damage_multiplier modifier remove hookshot:fall_guard
attribute @s minecraft:fall_damage_multiplier modifier add hookshot:fall_guard -1 add_multiplied_total
scoreboard players set @s Hookshot.FallGuard 160
attribute @s minecraft:step_height modifier remove hookshot:step_boost
attribute @s minecraft:step_height modifier add hookshot:step_boost 1.0 add_value
scoreboard players set @s Hookshot.StepGuard 25
execute store result score @s Hookshot.PlayerY run data get entity @s Pos[1] 100
scoreboard players operation @s Hookshot.LastY = @s Hookshot.PlayerY
execute store result score @s Hookshot.ShotPitch run data get entity @s Rotation[1] 1
scoreboard players operation @s Hookshot.Pitch = @s Hookshot.ShotPitch
scoreboard players operation $dy Hookshot.AnchorY = @s Hookshot.AnchorY
scoreboard players operation $dy Hookshot.AnchorY -= @s Hookshot.PlayerY
scoreboard players set @s Hookshot.Mode 0
execute if score @s Hookshot.ShotPitch matches 50.. if score $dy Hookshot.AnchorY matches ..-40 run scoreboard players set @s Hookshot.Mode 1
attribute @s minecraft:gravity modifier remove hookshot:wall_hang
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
attribute @s minecraft:gravity modifier add hookshot:zero_grav -1 add_multiplied_total
scoreboard players set @s Hookshot.PullTicks 110
scoreboard players set @s Hookshot.PullElapsed 0
scoreboard players set @s Hookshot.LastSteps 999
scoreboard players set @s Hookshot.StuckTicks 0
scoreboard players set @s Hookshot.WireLife 10
scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
tag @e[tag=hook_cur_stop] remove hook_cur_stop
execute as @e[type=minecraft:marker,tag=hook_anchor] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_anchor
execute as @e[type=minecraft:marker,tag=hook_stop] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_stop
execute at @s run function hookshot:update_wire_geometry
execute at @s run function hookshot:step_pull_physics
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
tag @e[tag=hook_cur_stop] remove hook_cur_stop

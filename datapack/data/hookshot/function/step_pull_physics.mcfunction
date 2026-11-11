scoreboard players set @s Hookshot.FallGuard 140
scoreboard players set @s Hookshot.StepGuard 22
execute store result score @s Hookshot.PlayerY run data get entity @s Pos[1] 100
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
scoreboard players operation $dy Hookshot.AnchorY = @s Hookshot.AnchorY
scoreboard players operation $dy Hookshot.AnchorY -= @s Hookshot.PlayerY
scoreboard players operation $move_y Hookshot.PlayerY = @s Hookshot.PlayerY
scoreboard players operation $move_y Hookshot.PlayerY -= @s Hookshot.LastY
scoreboard players operation @s Hookshot.LastY = @s Hookshot.PlayerY
execute if score @s Hookshot.PullElapsed matches 4.. if score $wire_steps Hookshot.Step >= @s Hookshot.LastSteps if score $move_y Hookshot.PlayerY matches -4..4 run scoreboard players add @s Hookshot.StuckTicks 1
execute if score $wire_steps Hookshot.Step < @s Hookshot.LastSteps run scoreboard players set @s Hookshot.StuckTicks 0
execute if score $move_y Hookshot.PlayerY matches 5.. run scoreboard players set @s Hookshot.StuckTicks 0
execute if score $move_y Hookshot.PlayerY matches ..-5 run scoreboard players set @s Hookshot.StuckTicks 0
scoreboard players operation @s Hookshot.LastSteps = $wire_steps Hookshot.Step
execute positioned ~ ~1.1 ~ if entity @e[tag=hook_cur_anchor,distance=..1.9] run return run function hookshot:arrive_anchor
execute positioned ~ ~1.1 ~ if entity @e[tag=hook_cur_anchor,distance=..3.6] if score @s Hookshot.StuckTicks matches 2.. run return run function hookshot:arrive_anchor
execute if score @s Hookshot.StuckTicks matches 8.. run return run function hookshot:arrive_anchor
scoreboard players remove @s Hookshot.PullTicks 1
scoreboard players add @s Hookshot.PullElapsed 1
execute unless score @s Hookshot.PullTicks matches 1.. run attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute positioned ~ ~1.1 ~ if entity @e[tag=hook_cur_anchor,distance=32..] run scoreboard players set @s Hookshot.Impulse 7
execute positioned ~ ~1.1 ~ if entity @e[tag=hook_cur_anchor,distance=4.5..32] run scoreboard players set @s Hookshot.Impulse 1
execute positioned ~ ~1.1 ~ if entity @e[tag=hook_cur_anchor,distance=..4.5] run scoreboard players set @s Hookshot.Impulse 2
execute positioned ~ ~1.1 ~ if entity @e[tag=hook_cur_anchor,distance=..32] if score $dy Hookshot.AnchorY matches 220.. if score @s Hookshot.Pitch matches -19..35 run scoreboard players set @s Hookshot.Impulse 9
execute positioned ~ ~1.1 ~ if entity @e[tag=hook_cur_anchor,distance=2.0..4.5] if score @s Hookshot.ShotPitch matches -20..49 if score @s Hookshot.PullElapsed matches 10.. unless entity @s[tag=hook_braked] run function hookshot:trigger_approach_brake

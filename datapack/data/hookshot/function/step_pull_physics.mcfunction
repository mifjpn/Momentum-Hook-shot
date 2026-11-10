scoreboard players set @s Hookshot.FallGuard 100
scoreboard players set @s Hookshot.StepGuard 18
execute if score $wire_steps Hookshot.Step >= @s Hookshot.LastSteps run scoreboard players add @s Hookshot.StuckTicks 1
execute if score $wire_steps Hookshot.Step < @s Hookshot.LastSteps run scoreboard players set @s Hookshot.StuckTicks 0
scoreboard players operation @s Hookshot.LastSteps = $wire_steps Hookshot.Step
execute store result score @s Hookshot.PlayerY run data get entity @s Pos[1] 100
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
scoreboard players operation $dy Hookshot.AnchorY = @s Hookshot.AnchorY
scoreboard players operation $dy Hookshot.AnchorY -= @s Hookshot.PlayerY
execute if score $wire_steps Hookshot.Step matches ..7 run return run function hookshot:arrive_anchor
execute if score @s Hookshot.StuckTicks matches 4.. run return run function hookshot:arrive_anchor
scoreboard players remove @s Hookshot.PullTicks 1
scoreboard players add @s Hookshot.PullElapsed 1
execute unless score @s Hookshot.PullTicks matches 1.. run attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute if score $wire_steps Hookshot.Step matches 16.. run scoreboard players set @s Hookshot.Impulse 1
execute if score $wire_steps Hookshot.Step matches 8..15 if score @s Hookshot.PullElapsed matches ..4 run scoreboard players set @s Hookshot.Impulse 2
execute if score $wire_steps Hookshot.Step matches 8..15 if score @s Hookshot.PullElapsed matches 5.. unless entity @s[tag=hook_braked] run function hookshot:trigger_approach_brake
execute if score $wire_steps Hookshot.Step matches 8..15 if score @s Hookshot.PullElapsed matches 5.. if entity @s[tag=hook_braked] run scoreboard players set @s Hookshot.Impulse 2

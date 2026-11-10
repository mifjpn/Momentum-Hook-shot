scoreboard players set @s Hookshot.FallGuard 100
execute if score $wire_steps Hookshot.Step >= @s Hookshot.LastSteps run scoreboard players add @s Hookshot.StuckTicks 1
execute if score $wire_steps Hookshot.Step < @s Hookshot.LastSteps run scoreboard players set @s Hookshot.StuckTicks 0
scoreboard players operation @s Hookshot.LastSteps = $wire_steps Hookshot.Step
execute store result score @s Hookshot.PlayerY run data get entity @s Pos[1] 100
scoreboard players operation $dy Hookshot.AnchorY = @s Hookshot.AnchorY
scoreboard players operation $dy Hookshot.AnchorY -= @s Hookshot.PlayerY
execute if score $wire_steps Hookshot.Step matches ..4 run return run function hookshot:arrive_anchor
execute if score @s Hookshot.StuckTicks matches 5.. run return run function hookshot:arrive_anchor
scoreboard players remove @s Hookshot.PullTicks 1
scoreboard players add @s Hookshot.PullElapsed 1
execute if score $wire_steps Hookshot.Step matches 10.. run scoreboard players set @s Hookshot.Impulse 1
execute if score $wire_steps Hookshot.Step matches 5..9 if score @s Hookshot.PullElapsed matches ..5 run scoreboard players set @s Hookshot.Impulse 2
execute if score $wire_steps Hookshot.Step matches 5..9 if score @s Hookshot.PullElapsed matches 8.. unless entity @s[tag=hook_braked] run function hookshot:trigger_approach_brake

scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
execute as @e[type=minecraft:marker,tag=hook_anchor] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_anchor
execute unless entity @e[tag=hook_cur_anchor] run return run function hookshot:abort_pull
execute positioned ~ ~1.25 ~ rotated as @s positioned ^-0.16 ^-0.05 ^0.35 as @e[type=minecraft:block_display,tag=hook_wire] if score @s Hookshot.ID = $cid Hookshot.ID run tp @s ~ ~ ~ facing entity @e[tag=hook_cur_anchor,limit=1] feet
scoreboard players set $wire_steps Hookshot.Step 0
execute as @e[type=minecraft:block_display,tag=hook_wire] if score @s Hookshot.ID = $cid Hookshot.ID at @s run function hookshot:measure_wire
data modify storage hookshot:temp scale set value [0.05f,0.05f,0.25f]
execute if score $wire_steps Hookshot.Step matches 1.. store result storage hookshot:temp scale[2] float 0.5 run scoreboard players get $wire_steps Hookshot.Step
execute as @e[type=minecraft:block_display,tag=hook_wire] if score @s Hookshot.ID = $cid Hookshot.ID run function hookshot:apply_wire_scale
execute if score @s Hookshot.PullTicks matches 1.. run function hookshot:step_pull_physics
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor

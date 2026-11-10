execute anchored eyes positioned ^-0.22 ^-0.18 ^0.40 anchored feet as @e[type=minecraft:block_display,tag=hook_wire] if score @s Hookshot.ID = $cid Hookshot.ID run tp @s ~ ~ ~ facing entity @e[tag=hook_cur_anchor,limit=1] feet
scoreboard players set $wire_steps Hookshot.Step 0
execute as @e[type=minecraft:block_display,tag=hook_wire] if score @s Hookshot.ID = $cid Hookshot.ID at @s run function hookshot:measure_wire
data modify storage hookshot:temp transformation set value {left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-0.04f,-0.04f,0.0f],scale:[0.08f,0.08f,0.4f]}
execute if score $wire_steps Hookshot.Step matches 1.. store result storage hookshot:temp transformation.scale[2] float 0.25 run scoreboard players get $wire_steps Hookshot.Step
execute as @e[type=minecraft:block_display,tag=hook_wire] if score @s Hookshot.ID = $cid Hookshot.ID run function hookshot:apply_wire_scale

particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force
particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force
execute if entity @e[tag=hook_cur_anchor,distance=..0.65] run return 0
scoreboard players add $wire_steps Hookshot.Step 1
execute if score $wire_steps Hookshot.Step matches ..220 positioned ^ ^ ^0.5 run function hookshot:measure_wire

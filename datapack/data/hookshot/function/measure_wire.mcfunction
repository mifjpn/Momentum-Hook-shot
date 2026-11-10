execute if entity @e[tag=hook_cur_anchor,distance=..0.30] run return 0
scoreboard players add $wire_steps Hookshot.Step 1
execute if score $wire_steps Hookshot.Step matches ..190 positioned ^ ^ ^0.25 run function hookshot:measure_wire

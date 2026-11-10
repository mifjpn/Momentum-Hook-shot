execute unless block ~ ~ ~ #hookshot:passable run return run function hookshot:hit
scoreboard players remove $step Hookshot.Step 1
execute if score $step Hookshot.Step matches 1.. positioned ^ ^ ^0.5 run return run function hookshot:raycast
function hookshot:miss

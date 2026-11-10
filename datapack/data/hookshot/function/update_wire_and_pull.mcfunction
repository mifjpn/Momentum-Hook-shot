scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
scoreboard players set $holding Hookshot.Step 0
execute if items entity @s weapon.mainhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run scoreboard players set $holding Hookshot.Step 1
execute if items entity @s weapon.offhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run scoreboard players set $holding Hookshot.Step 1
execute if score $holding Hookshot.Step matches 0 run return run function hookshot:abort_pull
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
execute as @e[type=minecraft:marker,tag=hook_anchor] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_anchor
execute unless entity @e[tag=hook_cur_anchor] run return run function hookshot:abort_pull
function hookshot:update_wire_geometry
execute if score @s Hookshot.PullTicks matches 1.. run function hookshot:step_pull_physics
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor

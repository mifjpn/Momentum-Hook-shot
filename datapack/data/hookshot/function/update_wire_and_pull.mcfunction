scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
tag @e[tag=hook_cur_stop] remove hook_cur_stop
execute as @e[type=minecraft:marker,tag=hook_anchor] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_anchor
execute as @e[type=minecraft:marker,tag=hook_stop] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_stop
execute unless entity @e[tag=hook_cur_anchor] run scoreboard players set @s Hookshot.PullTicks 0
execute unless entity @e[tag=hook_cur_anchor] run attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute if entity @e[tag=hook_cur_anchor] run function hookshot:update_wire_geometry
execute if entity @e[tag=hook_cur_anchor] if score @s Hookshot.PullTicks matches 1.. run function hookshot:step_pull_physics
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
tag @e[tag=hook_cur_stop] remove hook_cur_stop

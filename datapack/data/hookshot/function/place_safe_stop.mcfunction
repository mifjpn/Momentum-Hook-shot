tag @e[tag=hook_new_stop] remove hook_new_stop
positioned ^ ^ ^-0.65 summon minecraft:marker ~ ~ ~ {Tags:["hook_obj","hook_stop","hook_new_stop"]}
execute unless block ^ ^ ^-0.65 #hookshot:passable positioned ^ ^ ^-1.15 run tp @e[type=minecraft:marker,tag=hook_new_stop,limit=1] ~ ~ ~
scoreboard players operation @e[type=minecraft:marker,tag=hook_new_stop,limit=1] Hookshot.ID = @s Hookshot.ID
execute as @e[type=minecraft:marker,tag=hook_new_stop,limit=1] at @s run function hookshot:adjust_stop_pos
tag @e[tag=hook_new_stop] remove hook_new_stop

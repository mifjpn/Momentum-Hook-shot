tag @e[tag=hook_new_stop] remove hook_new_stop
execute positioned ^ ^ ^-0.55 run summon minecraft:marker ~ ~ ~ {Tags:["hook_obj","hook_stop","hook_new_stop"]}
execute unless block ^ ^ ^-0.55 #hookshot:passable positioned ^ ^ ^-0.55 if block ~ ~1.0 ~ #hookshot:passable if block ~ ~2.0 ~ #hookshot:passable run tp @e[type=minecraft:marker,tag=hook_new_stop,limit=1] ~ ~1.05 ~
execute as @e[type=minecraft:marker,tag=hook_new_stop,limit=1] at @s unless block ~ ~ ~ #hookshot:passable run scoreboard players set $need_back Hookshot.Math 1
execute if score $need_back Hookshot.Math matches 1 positioned ^ ^ ^-1.05 run tp @e[type=minecraft:marker,tag=hook_new_stop,limit=1] ~ ~ ~
scoreboard players set $need_back Hookshot.Math 0
execute as @e[type=minecraft:marker,tag=hook_new_stop,limit=1] at @s unless block ~ ~ ~ #hookshot:passable run scoreboard players set $need_back Hookshot.Math 1
execute if score $need_back Hookshot.Math matches 1 positioned ^ ^ ^-1.50 run tp @e[type=minecraft:marker,tag=hook_new_stop,limit=1] ~ ~ ~
scoreboard players set $need_back Hookshot.Math 0
scoreboard players operation @e[type=minecraft:marker,tag=hook_new_stop,limit=1] Hookshot.ID = @s Hookshot.ID
execute as @e[type=minecraft:marker,tag=hook_new_stop,limit=1] at @s run function hookshot:adjust_stop_pos
tag @e[tag=hook_new_stop] remove hook_new_stop

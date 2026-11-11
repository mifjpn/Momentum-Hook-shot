scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 5
scoreboard players set @s Hookshot.Impulse 0
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute if entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] run data modify storage hookshot:tp x set from entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] Pos[0]
execute if entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] run data modify storage hookshot:tp y set from entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] Pos[1]
execute if entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] run data modify storage hookshot:tp z set from entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] Pos[2]
execute if entity @e[type=minecraft:marker,tag=hook_cur_stop,limit=1] run function hookshot:tp_to_stop with storage hookshot:tp
kill @e[type=minecraft:marker,tag=hook_cur_stop]
execute if score @s Hookshot.Mode matches 1 run return 0
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
execute if score @s Hookshot.Pitch matches ..-65 run scoreboard players set @s Hookshot.ImpulseV 1
execute if score @s Hookshot.Pitch matches -64..-39 run scoreboard players set @s Hookshot.ImpulseV 2
execute if score @s Hookshot.Pitch matches -38..-13 run scoreboard players set @s Hookshot.ImpulseV 3
execute if score @s Hookshot.Pitch matches -12..12 run scoreboard players set @s Hookshot.ImpulseV 4
execute if score @s Hookshot.Pitch matches 13..38 run scoreboard players set @s Hookshot.ImpulseV 5
execute if score @s Hookshot.Pitch matches 39..64 run scoreboard players set @s Hookshot.ImpulseV 6
execute if score @s Hookshot.Pitch matches 65.. run scoreboard players set @s Hookshot.ImpulseV 7

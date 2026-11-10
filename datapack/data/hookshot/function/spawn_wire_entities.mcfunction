scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
summon minecraft:marker ~ ~ ~ {Tags:["hook_anchor","hook_obj","hook_init"]}
execute positioned ^ ^ ^-0.24 run summon minecraft:block_display ~ ~ ~ {Tags:["hook_head","hook_obj","hook_init"],billboard:"fixed",width:32.0f,height:32.0f,brightness:{sky:15,block:15},block_state:{Name:"minecraft:heavy_core"},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-0.11f,-0.11f,-0.11f],scale:[0.22f,0.22f,0.28f]}}
execute positioned ^ ^ ^-0.28 run summon minecraft:item_display ~ ~ ~ {Tags:["hook_claw","hook_obj","hook_init"],billboard:"fixed",width:32.0f,height:32.0f,brightness:{sky:15,block:15},item:{id:"minecraft:tripwire_hook",count:1},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[0.0f,0.0f,0.0f],scale:[0.85f,0.85f,0.85f]}}
data modify entity @e[tag=hook_head,tag=hook_init,limit=1] Rotation set from entity @s Rotation
data modify entity @e[tag=hook_claw,tag=hook_init,limit=1] Rotation set from entity @s Rotation
execute store result score @s Hookshot.AnchorY run data get entity @e[type=minecraft:marker,tag=hook_anchor,tag=hook_init,limit=1] Pos[1] 100
execute at @s anchored eyes positioned ^-0.22 ^-0.18 ^0.40 anchored feet run summon minecraft:block_display ~ ~ ~ {Tags:["hook_wire","hook_obj","hook_init"],billboard:"fixed",width:96.0f,height:96.0f,view_range:2.0f,teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15},block_state:{Name:"minecraft:netherite_block"},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-0.04f,-0.04f,0.0f],scale:[0.08f,0.08f,0.5f]}}
scoreboard players operation @e[tag=hook_init] Hookshot.ID = $cid Hookshot.ID
tag @e[tag=hook_init] remove hook_init
tag @s add hook_has_wire
tag @s remove hook_braked

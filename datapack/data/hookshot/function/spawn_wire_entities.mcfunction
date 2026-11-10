scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
summon minecraft:marker ~ ~ ~ {Tags:["hook_anchor","hook_obj","hook_init"]}
execute positioned ^ ^ ^-0.24 run summon minecraft:block_display ~ ~ ~ {Tags:["hook_head","hook_obj","hook_init"],billboard:"fixed",view_range:5.0f,Glowing:1b,glow_color_override:11197951,brightness:{sky:15,block:15},block_state:{Name:"minecraft:iron_block"},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-0.12f,-0.12f,-0.12f],scale:[0.24f,0.24f,0.30f]}}
execute positioned ^ ^ ^-0.28 run summon minecraft:item_display ~ ~ ~ {Tags:["hook_claw","hook_obj","hook_init"],billboard:"fixed",view_range:5.0f,Glowing:1b,glow_color_override:11197951,brightness:{sky:15,block:15},item:{id:"minecraft:tripwire_hook",count:1},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[0.0f,0.0f,0.0f],scale:[0.90f,0.90f,0.90f]}}
data modify entity @e[tag=hook_head,tag=hook_init,limit=1] Rotation set from entity @s Rotation
data modify entity @e[tag=hook_claw,tag=hook_init,limit=1] Rotation set from entity @s Rotation
execute store result score @s Hookshot.AnchorY run data get entity @e[type=minecraft:marker,tag=hook_anchor,tag=hook_init,limit=1] Pos[1] 100
execute at @s anchored eyes positioned ^-0.22 ^-0.16 ^0.65 anchored feet run summon minecraft:block_display ~ ~ ~ {Tags:["hook_wire","hook_obj","hook_init"],billboard:"fixed",view_range:5.0f,teleport_duration:0,interpolation_duration:0,Glowing:1b,glow_color_override:11197951,brightness:{sky:15,block:15},block_state:{Name:"minecraft:iron_block"},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-0.045f,-0.045f,0.0f],scale:[0.09f,0.09f,1.0f]}}
scoreboard players operation @e[tag=hook_init] Hookshot.ID = $cid Hookshot.ID
tag @e[tag=hook_init] remove hook_init
tag @s add hook_has_wire
tag @s remove hook_braked

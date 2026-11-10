scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
summon minecraft:marker ~ ~ ~ {Tags:["hook_anchor","hook_obj","hook_init"]}
summon minecraft:item_display ~ ~ ~ {Tags:["hook_claw","hook_obj","hook_init"],billboard:"fixed",brightness:{sky:15,block:15},item:{id:"minecraft:tripwire_hook",count:1},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[0.0f,0.0f,0.0f],scale:[0.65f,0.65f,0.65f]}}
data modify entity @e[tag=hook_claw,tag=hook_init,limit=1] Rotation set from entity @s Rotation
execute store result score @s Hookshot.AnchorY run data get entity @e[type=minecraft:marker,tag=hook_anchor,tag=hook_init,limit=1] Pos[1] 100
execute at @s positioned ~ ~1.25 ~ rotated as @s positioned ^-0.16 ^-0.05 ^0.35 run summon minecraft:block_display ~ ~ ~ {Tags:["hook_wire","hook_obj","hook_init"],billboard:"fixed",teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15},block_state:{Name:"minecraft:iron_block"},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-0.025f,-0.025f,0.0f],scale:[0.05f,0.05f,0.5f]}}
scoreboard players operation @e[tag=hook_init] Hookshot.ID = $cid Hookshot.ID
tag @e[tag=hook_init] remove hook_init
tag @s add hook_has_wire
tag @s remove hook_braked

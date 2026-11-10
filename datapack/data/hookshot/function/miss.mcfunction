execute at @s run playsound minecraft:entity.fishing_bobber.retrieve player @s ~ ~ ~ 0.8 1.5
execute at @s anchored eyes positioned ^ ^ ^25.0 anchored feet run function hookshot:spawn_wire_entities
scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
execute as @e[type=minecraft:marker,tag=hook_anchor] if score @s Hookshot.ID = $cid Hookshot.ID run tag @s add hook_cur_anchor
execute at @s run function hookshot:update_wire_geometry
tag @e[tag=hook_cur_anchor] remove hook_cur_anchor
scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 6

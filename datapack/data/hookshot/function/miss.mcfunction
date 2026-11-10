execute at @s run playsound minecraft:entity.fishing_bobber.retrieve player @s ~ ~ ~ 0.8 1.5
function hookshot:spawn_wire_entities
scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 4
execute at @s run function hookshot:update_wire_and_pull

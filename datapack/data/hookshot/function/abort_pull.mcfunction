scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 0
scoreboard players set @s Hookshot.Impulse 0
scoreboard players set @s Hookshot.ImpulseLat 0
scoreboard players set @s Hookshot.ImpulseV 0
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
data modify storage hookshot:tp x set from entity @s Pos[0]
data modify storage hookshot:tp y set from entity @s Pos[1]
data modify storage hookshot:tp z set from entity @s Pos[2]
function hookshot:tp_to_stop with storage hookshot:tp
function hookshot:finish_wire

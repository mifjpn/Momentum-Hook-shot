playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 1.0 1.2
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.35 1.9
particle minecraft:gust ~ ~ ~ 0.2 0.2 0.2 0 2 force
particle minecraft:crit ~ ~ ~ 0.15 0.15 0.15 0.1 8 force
function hookshot:spawn_wire_entities
attribute @s minecraft:fall_damage_multiplier modifier remove hookshot:fall_guard
attribute @s minecraft:fall_damage_multiplier modifier add hookshot:fall_guard -1 add_multiplied_total
scoreboard players set @s Hookshot.FallGuard 100
scoreboard players set @s Hookshot.PullTicks 36
scoreboard players set @s Hookshot.PullElapsed 0
scoreboard players set @s Hookshot.LastSteps 999
scoreboard players set @s Hookshot.StuckTicks 0
scoreboard players set @s Hookshot.WireLife 5
execute at @s run function hookshot:update_wire_and_pull

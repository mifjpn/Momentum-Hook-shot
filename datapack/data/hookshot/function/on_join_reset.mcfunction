advancement revoke @s only hookshot:use
scoreboard players set @s Hookshot.Shot 0
scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 0
scoreboard players set @s Hookshot.BrakeTicks 0
scoreboard players set @s Hookshot.ZBrakeTicks 0
scoreboard players set @s Hookshot.Impulse 0
scoreboard players set @s Hookshot.ImpulseLat 0
scoreboard players set @s Hookshot.ImpulseV 0
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
attribute @s minecraft:gravity modifier remove hookshot:wall_hang
function hookshot:cleanup_own_entities
tag @s remove hook_has_wire
tag @s remove hook_braked

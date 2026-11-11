scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 8
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
attribute @s minecraft:gravity modifier remove hookshot:wall_hang
attribute @s minecraft:gravity modifier add hookshot:wall_hang -0.35 add_multiplied_total
scoreboard players set @s Hookshot.WallHang 7
execute if score @s Hookshot.Pitch matches ..-45 if score @s Hookshot.VelY matches ..-35 run scoreboard players set @s Hookshot.Impulse 21
execute if score @s Hookshot.Pitch matches ..-45 if score @s Hookshot.VelY matches -34..30 run scoreboard players set @s Hookshot.Impulse 22
execute if score @s Hookshot.Pitch matches ..-45 if score @s Hookshot.VelY matches 31.. run scoreboard players set @s Hookshot.Impulse 23
execute if score @s Hookshot.Pitch matches -44..-20 if score @s Hookshot.VelY matches ..-35 run scoreboard players set @s Hookshot.Impulse 24
execute if score @s Hookshot.Pitch matches -44..-20 if score @s Hookshot.VelY matches -34..30 run scoreboard players set @s Hookshot.Impulse 25
execute if score @s Hookshot.Pitch matches -44..-20 if score @s Hookshot.VelY matches 31.. run scoreboard players set @s Hookshot.Impulse 26

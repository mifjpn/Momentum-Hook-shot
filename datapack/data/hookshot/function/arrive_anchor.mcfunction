scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 6
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.Pitch matches ..-20 run attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.Pitch matches ..-20 run attribute @s minecraft:gravity modifier add hookshot:wall_hang -0.55 add_multiplied_total
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.Pitch matches ..-20 run scoreboard players set @s Hookshot.WallHang 9
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.PullElapsed matches 2.. if score @s Hookshot.Pitch matches ..-45 run scoreboard players set @s Hookshot.Impulse 11
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.PullElapsed matches 2.. if score @s Hookshot.Pitch matches -44..-20 run scoreboard players set @s Hookshot.Impulse 12
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.PullElapsed matches 2.. if score @s Hookshot.Pitch matches -19..44 run scoreboard players set @s Hookshot.Impulse 17
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.PullElapsed matches 2.. if score @s Hookshot.Pitch matches 45.. run scoreboard players set @s Hookshot.Impulse 13
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.PullElapsed matches 0..1 if score @s Hookshot.Pitch matches ..-45 run scoreboard players set @s Hookshot.Impulse 14
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.PullElapsed matches 0..1 if score @s Hookshot.Pitch matches -44..-20 run scoreboard players set @s Hookshot.Impulse 15
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.PullElapsed matches 0..1 if score @s Hookshot.Pitch matches -19..44 run scoreboard players set @s Hookshot.Impulse 18
execute if score $dy Hookshot.AnchorY matches 35.. if score @s Hookshot.PullElapsed matches 0..1 if score @s Hookshot.Pitch matches 45.. run scoreboard players set @s Hookshot.Impulse 16
execute if score $dy Hookshot.AnchorY matches ..34 if score @s Hookshot.PullElapsed matches 2.. run scoreboard players set @s Hookshot.Impulse 6

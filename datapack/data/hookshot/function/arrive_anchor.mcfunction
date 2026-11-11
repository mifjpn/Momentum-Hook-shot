scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 6
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.Pitch matches ..34 run attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.Pitch matches ..34 run attribute @s minecraft:gravity modifier add hookshot:wall_hang -0.42 add_multiplied_total
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.Pitch matches ..34 run scoreboard players set @s Hookshot.WallHang 8
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.PullElapsed matches 3.. if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.Impulse 11
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.PullElapsed matches 3.. if score @s Hookshot.Pitch matches -54..-25 run scoreboard players set @s Hookshot.Impulse 12
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.PullElapsed matches 3.. if score @s Hookshot.Pitch matches -24..24 run scoreboard players set @s Hookshot.Impulse 13
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.PullElapsed matches 3.. if score @s Hookshot.Pitch matches 25..34 run scoreboard players set @s Hookshot.Impulse 14
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.PullElapsed matches 0..2 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.Impulse 15
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.PullElapsed matches 0..2 if score @s Hookshot.Pitch matches -54..-25 run scoreboard players set @s Hookshot.Impulse 16
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.PullElapsed matches 0..2 if score @s Hookshot.Pitch matches -24..34 run scoreboard players set @s Hookshot.Impulse 17
execute if score $dy Hookshot.AnchorY matches ..-26 if score @s Hookshot.PullElapsed matches 2.. run scoreboard players set @s Hookshot.Impulse 6
execute if score $dy Hookshot.AnchorY matches -25.. if score @s Hookshot.Pitch matches 35.. if score @s Hookshot.PullElapsed matches 2.. run scoreboard players set @s Hookshot.Impulse 6

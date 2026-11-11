scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 6
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute if score $dy Hookshot.AnchorY matches 65.. if score @s Hookshot.PullElapsed matches 2.. if score @s Hookshot.Pitch matches ..-45 run scoreboard players set @s Hookshot.Impulse 11
execute if score $dy Hookshot.AnchorY matches 65.. if score @s Hookshot.PullElapsed matches 2.. if score @s Hookshot.Pitch matches -44..44 run scoreboard players set @s Hookshot.Impulse 12
execute if score $dy Hookshot.AnchorY matches 65.. if score @s Hookshot.PullElapsed matches 2.. if score @s Hookshot.Pitch matches 45.. run scoreboard players set @s Hookshot.Impulse 13
execute if score $dy Hookshot.AnchorY matches 65.. if score @s Hookshot.PullElapsed matches 0..1 if score @s Hookshot.Pitch matches ..-45 run scoreboard players set @s Hookshot.Impulse 14
execute if score $dy Hookshot.AnchorY matches 65.. if score @s Hookshot.PullElapsed matches 0..1 if score @s Hookshot.Pitch matches -44..44 run scoreboard players set @s Hookshot.Impulse 15
execute if score $dy Hookshot.AnchorY matches 65.. if score @s Hookshot.PullElapsed matches 0..1 if score @s Hookshot.Pitch matches 45.. run scoreboard players set @s Hookshot.Impulse 16
execute if score $dy Hookshot.AnchorY matches ..64 if score @s Hookshot.PullElapsed matches 2.. run scoreboard players set @s Hookshot.Impulse 6

scoreboard players set @s Hookshot.PullTicks 0
execute if score $dy Hookshot.AnchorY matches 30.. if score @s Hookshot.PullElapsed matches 0..1 run scoreboard players set @s Hookshot.Impulse 5
execute if score $dy Hookshot.AnchorY matches 30.. if score @s Hookshot.PullElapsed matches 2.. run scoreboard players set @s Hookshot.Impulse 4
execute if score $dy Hookshot.AnchorY matches ..29 if score @s Hookshot.PullElapsed matches 2.. run scoreboard players set @s Hookshot.Impulse 6

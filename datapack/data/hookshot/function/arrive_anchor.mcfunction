scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 6
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
execute store result score @s Hookshot.VelY run data get entity @s Motion[1] 100
execute store result score @s Hookshot.PlayerY run data get entity @s Pos[1] 100
scoreboard players operation $dy Hookshot.AnchorY = @s Hookshot.AnchorY
scoreboard players operation $dy Hookshot.AnchorY -= @s Hookshot.PlayerY
execute if score @s Hookshot.ShotPitch matches 50.. if score $dy Hookshot.AnchorY matches ..-50 run return run scoreboard players set @s Hookshot.Impulse 6
attribute @s minecraft:gravity modifier remove hookshot:wall_hang
attribute @s minecraft:gravity modifier add hookshot:wall_hang -0.35 add_multiplied_total
scoreboard players set @s Hookshot.WallHang 10
execute if score @s Hookshot.VelY matches -19..24 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.Impulse 11
execute if score @s Hookshot.VelY matches -19..24 if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.Impulse 12
execute if score @s Hookshot.VelY matches -19..24 if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.Impulse 13
execute if score @s Hookshot.VelY matches -19..24 if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.Impulse 14
execute if score @s Hookshot.VelY matches -19..24 if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.Impulse 15
execute if score @s Hookshot.VelY matches ..-20 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.Impulse 21
execute if score @s Hookshot.VelY matches ..-20 if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.Impulse 22
execute if score @s Hookshot.VelY matches ..-20 if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.Impulse 23
execute if score @s Hookshot.VelY matches ..-20 if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.Impulse 24
execute if score @s Hookshot.VelY matches ..-20 if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.Impulse 25
execute if score @s Hookshot.VelY matches 25..64 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.Impulse 31
execute if score @s Hookshot.VelY matches 25..64 if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.Impulse 32
execute if score @s Hookshot.VelY matches 25..64 if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.Impulse 33
execute if score @s Hookshot.VelY matches 25..64 if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.Impulse 34
execute if score @s Hookshot.VelY matches 25..64 if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.Impulse 35
execute if score @s Hookshot.VelY matches 65.. if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.Impulse 41
execute if score @s Hookshot.VelY matches 65.. if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.Impulse 42
execute if score @s Hookshot.VelY matches 65.. if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.Impulse 43
execute if score @s Hookshot.VelY matches 65.. if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.Impulse 44
execute if score @s Hookshot.VelY matches 65.. if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.Impulse 45

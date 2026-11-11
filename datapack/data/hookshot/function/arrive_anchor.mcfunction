scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 6
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
execute store result score @s Hookshot.VelY run data get entity @s Motion[1] 100
execute store result score @s Hookshot.PlayerY run data get entity @s Pos[1] 100
scoreboard players operation $dy Hookshot.AnchorY = @s Hookshot.AnchorY
scoreboard players operation $dy Hookshot.AnchorY -= @s Hookshot.PlayerY
scoreboard players set @s Hookshot.BrakeTicks 3
function hookshot:step_xy_brake
execute if score @s Hookshot.ShotPitch matches 46.. if score $dy Hookshot.AnchorY matches ..-40 run return 0
scoreboard players set $v_tier Hookshot.VelY 0
execute if score @s Hookshot.ShotPitch matches -28.. run attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute if score @s Hookshot.ShotPitch matches -28.. run attribute @s minecraft:gravity modifier add hookshot:wall_hang -0.45 add_multiplied_total
execute if score @s Hookshot.ShotPitch matches -28.. run scoreboard players set @s Hookshot.WallHang 9
execute if score @s Hookshot.ShotPitch matches -28.. if score @s Hookshot.VelY matches ..-20 run scoreboard players set $v_tier Hookshot.VelY 3
execute if score @s Hookshot.ShotPitch matches -28.. if score @s Hookshot.VelY matches -19..-5 run scoreboard players set $v_tier Hookshot.VelY 2
execute if score @s Hookshot.ShotPitch matches -28.. if score @s Hookshot.VelY matches -4..18 run scoreboard players set $v_tier Hookshot.VelY 1
execute if score @s Hookshot.ShotPitch matches -28.. if score @s Hookshot.VelY matches 19..48 run scoreboard players set $v_tier Hookshot.VelY 5
execute if score @s Hookshot.ShotPitch matches -28.. if score @s Hookshot.VelY matches 65.. run scoreboard players set $v_tier Hookshot.VelY 4
execute if score @s Hookshot.ShotPitch matches ..-29 run attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute if score @s Hookshot.ShotPitch matches ..-29 run attribute @s minecraft:gravity modifier add hookshot:wall_hang -0.50 add_multiplied_total
execute if score @s Hookshot.ShotPitch matches ..-29 run scoreboard players set @s Hookshot.WallHang 10
execute if score @s Hookshot.ShotPitch matches ..-29 if score @s Hookshot.VelY matches ..15 run scoreboard players set $v_tier Hookshot.VelY 3
execute if score @s Hookshot.ShotPitch matches ..-29 if score @s Hookshot.VelY matches 16..45 run scoreboard players set $v_tier Hookshot.VelY 2
execute if score @s Hookshot.ShotPitch matches ..-29 if score @s Hookshot.VelY matches 75.. run scoreboard players set $v_tier Hookshot.VelY 4
execute if score $v_tier Hookshot.VelY matches 1 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.ImpulseV 11
execute if score $v_tier Hookshot.VelY matches 1 if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.ImpulseV 12
execute if score $v_tier Hookshot.VelY matches 1 if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.ImpulseV 13
execute if score $v_tier Hookshot.VelY matches 1 if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.ImpulseV 14
execute if score $v_tier Hookshot.VelY matches 1 if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.ImpulseV 15
execute if score $v_tier Hookshot.VelY matches 2 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.ImpulseV 21
execute if score $v_tier Hookshot.VelY matches 2 if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.ImpulseV 22
execute if score $v_tier Hookshot.VelY matches 2 if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.ImpulseV 23
execute if score $v_tier Hookshot.VelY matches 2 if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.ImpulseV 24
execute if score $v_tier Hookshot.VelY matches 2 if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.ImpulseV 25
execute if score $v_tier Hookshot.VelY matches 3 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.ImpulseV 31
execute if score $v_tier Hookshot.VelY matches 3 if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.ImpulseV 32
execute if score $v_tier Hookshot.VelY matches 3 if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.ImpulseV 33
execute if score $v_tier Hookshot.VelY matches 3 if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.ImpulseV 34
execute if score $v_tier Hookshot.VelY matches 3 if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.ImpulseV 35
execute if score $v_tier Hookshot.VelY matches 4 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.ImpulseV 41
execute if score $v_tier Hookshot.VelY matches 4 if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.ImpulseV 42
execute if score $v_tier Hookshot.VelY matches 4 if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.ImpulseV 43
execute if score $v_tier Hookshot.VelY matches 4 if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.ImpulseV 44
execute if score $v_tier Hookshot.VelY matches 4 if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.ImpulseV 45
execute if score $v_tier Hookshot.VelY matches 5 if score @s Hookshot.Pitch matches ..-55 run scoreboard players set @s Hookshot.ImpulseV 51
execute if score $v_tier Hookshot.VelY matches 5 if score @s Hookshot.Pitch matches -54..-20 run scoreboard players set @s Hookshot.ImpulseV 52
execute if score $v_tier Hookshot.VelY matches 5 if score @s Hookshot.Pitch matches -19..19 run scoreboard players set @s Hookshot.ImpulseV 53
execute if score $v_tier Hookshot.VelY matches 5 if score @s Hookshot.Pitch matches 20..54 run scoreboard players set @s Hookshot.ImpulseV 54
execute if score $v_tier Hookshot.VelY matches 5 if score @s Hookshot.Pitch matches 55.. run scoreboard players set @s Hookshot.ImpulseV 55

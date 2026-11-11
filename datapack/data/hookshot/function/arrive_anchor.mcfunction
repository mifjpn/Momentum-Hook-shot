scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 6
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
execute store result score @s Hookshot.VelY run data get entity @s Motion[1] 100
execute store result score @s Hookshot.PlayerY run data get entity @s Pos[1] 100
scoreboard players operation $dy Hookshot.AnchorY = @s Hookshot.AnchorY
scoreboard players operation $dy Hookshot.AnchorY -= @s Hookshot.PlayerY
scoreboard players set @s Hookshot.BrakeTicks 4
execute if score @s Hookshot.Mode matches 2 run scoreboard players set @s Hookshot.BrakeTicks 6
function hookshot:step_xy_brake
execute if score @s Hookshot.Mode matches 4 run return 0
execute if score @s Hookshot.Mode matches 2 run attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute if score @s Hookshot.Mode matches 2 run scoreboard players set @s Hookshot.WallHang 0
execute if score @s Hookshot.Mode matches 2 if score @s Hookshot.VelY matches 9.. run scoreboard players set @s Hookshot.ZBrakeTicks 5
execute if score @s Hookshot.Mode matches 2 if score @s Hookshot.VelY matches 9.. run return run function hookshot:step_z_brake
execute if score @s Hookshot.Mode matches 2 if score @s Hookshot.VelY matches ..-22 run scoreboard players set $v_tier Hookshot.VelY 5
execute if score @s Hookshot.Mode matches 2 if score @s Hookshot.VelY matches ..-22 run function hookshot:apply_v_tier
execute if score @s Hookshot.Mode matches 2 run return 0
scoreboard players set $v_tier Hookshot.VelY 0
execute if score @s Hookshot.Mode matches 1 run attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute if score @s Hookshot.Mode matches 1 run attribute @s minecraft:gravity modifier add hookshot:wall_hang -0.45 add_multiplied_total
execute if score @s Hookshot.Mode matches 1 run scoreboard players set @s Hookshot.WallHang 9
execute if score @s Hookshot.Mode matches 1 if score @s Hookshot.VelY matches ..-20 run scoreboard players set $v_tier Hookshot.VelY 3
execute if score @s Hookshot.Mode matches 1 if score @s Hookshot.VelY matches -19..-5 run scoreboard players set $v_tier Hookshot.VelY 2
execute if score @s Hookshot.Mode matches 1 if score @s Hookshot.VelY matches -4..18 run scoreboard players set $v_tier Hookshot.VelY 1
execute if score @s Hookshot.Mode matches 1 if score @s Hookshot.VelY matches 19..48 run scoreboard players set $v_tier Hookshot.VelY 5
execute if score @s Hookshot.Mode matches 1 if score @s Hookshot.VelY matches 65.. run scoreboard players set $v_tier Hookshot.VelY 4
execute if score @s Hookshot.Mode matches 3 run attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute if score @s Hookshot.Mode matches 3 run attribute @s minecraft:gravity modifier add hookshot:wall_hang -0.48 add_multiplied_total
execute if score @s Hookshot.Mode matches 3 run scoreboard players set @s Hookshot.WallHang 11
execute if score @s Hookshot.Mode matches 3 if score @s Hookshot.VelY matches ..5 run scoreboard players set $v_tier Hookshot.VelY 3
execute if score @s Hookshot.Mode matches 3 if score @s Hookshot.VelY matches 6..28 run scoreboard players set $v_tier Hookshot.VelY 2
execute if score @s Hookshot.Mode matches 3 if score @s Hookshot.VelY matches 29..52 run scoreboard players set $v_tier Hookshot.VelY 1
execute if score @s Hookshot.Mode matches 3 if score @s Hookshot.VelY matches 53..80 run scoreboard players set $v_tier Hookshot.VelY 5
execute if score @s Hookshot.Mode matches 3 if score @s Hookshot.VelY matches 115.. run scoreboard players set $v_tier Hookshot.VelY 4
execute if score $v_tier Hookshot.VelY matches 1.. run function hookshot:apply_v_tier

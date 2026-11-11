scoreboard players set @s Hookshot.PullTicks 0
scoreboard players set @s Hookshot.WireLife 6
attribute @s minecraft:gravity modifier remove hookshot:zero_grav
attribute @s minecraft:gravity modifier remove hookshot:wall_hang
scoreboard players set @s Hookshot.WallHang 0
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
execute store result score @s Hookshot.VelY run data get entity @s Motion[1] 100
scoreboard players set @s Hookshot.BrakeTicks 4
function hookshot:step_xy_brake
scoreboard players set $v_tier Hookshot.VelY 0
execute if score @s Hookshot.Mode matches 1 if score @s Hookshot.VelY matches 18..45 run scoreboard players set $v_tier Hookshot.VelY 7
execute if score @s Hookshot.Mode matches 1 if score @s Hookshot.VelY matches 46.. run scoreboard players set $v_tier Hookshot.VelY 8
execute if score @s Hookshot.Mode matches 1 if score @s Hookshot.VelY matches ..-60 run scoreboard players set $v_tier Hookshot.VelY 5
execute if score @s Hookshot.Mode matches 1 if score $v_tier Hookshot.VelY matches 1.. run function hookshot:apply_v_tier
execute if score @s Hookshot.Mode matches 1 run return 0
execute if score @s Hookshot.VelY matches ..-35 run scoreboard players set $v_tier Hookshot.VelY 1
execute if score @s Hookshot.VelY matches -34..-15 run scoreboard players set $v_tier Hookshot.VelY 2
execute if score @s Hookshot.VelY matches -14..6 run scoreboard players set $v_tier Hookshot.VelY 3
execute if score @s Hookshot.VelY matches 7..26 run scoreboard players set $v_tier Hookshot.VelY 4
execute if score @s Hookshot.VelY matches 27..46 run scoreboard players set $v_tier Hookshot.VelY 5
execute if score @s Hookshot.VelY matches 47..61 run scoreboard players set $v_tier Hookshot.VelY 6
execute if score @s Hookshot.VelY matches 77..96 run scoreboard players set $v_tier Hookshot.VelY 7
execute if score @s Hookshot.VelY matches 97..120 run scoreboard players set $v_tier Hookshot.VelY 8
execute if score @s Hookshot.VelY matches 121.. run scoreboard players set $v_tier Hookshot.VelY 9
execute if score $v_tier Hookshot.VelY matches 1.. run function hookshot:apply_v_tier

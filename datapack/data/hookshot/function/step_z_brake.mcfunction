execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
execute store result score @s Hookshot.VelY run data get entity @s Motion[1] 100
scoreboard players set $v_tier Hookshot.VelY 0
execute if score @s Hookshot.VelY matches 75.. run scoreboard players set $v_tier Hookshot.VelY 7
execute if score @s Hookshot.VelY matches 44..74 run scoreboard players set $v_tier Hookshot.VelY 6
execute if score @s Hookshot.VelY matches 21..43 run scoreboard players set $v_tier Hookshot.VelY 4
execute if score @s Hookshot.VelY matches 9..20 run scoreboard players set $v_tier Hookshot.VelY 8
execute if score $v_tier Hookshot.VelY matches 1.. run function hookshot:apply_v_tier
execute if score @s Hookshot.VelY matches ..8 run scoreboard players set @s Hookshot.ZBrakeTicks 1
scoreboard players remove @s Hookshot.ZBrakeTicks 1

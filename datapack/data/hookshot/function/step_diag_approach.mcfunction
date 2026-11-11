execute if score $v2 Hookshot.VelY matches ..3025 run scoreboard players set @s Hookshot.Impulse 2
execute if score $h2 Hookshot.VelY matches 5625.. run function hookshot:step_xy_brake
scoreboard players set $v_tier Hookshot.VelY 0
execute if score $vy Hookshot.VelY matches 45..74 run scoreboard players set $v_tier Hookshot.VelY 4
execute if score $vy Hookshot.VelY matches 75.. run scoreboard players set $v_tier Hookshot.VelY 6
execute if score $v_tier Hookshot.VelY matches 1.. run function hookshot:apply_v_tier

scoreboard players operation $s100 Hookshot.Math = $hdot Hookshot.Math
scoreboard players operation $s100 Hookshot.Math /= @s Hookshot.H2Div
execute if score $s100 Hookshot.Math matches ..0 run scoreboard players set $s100 Hookshot.Math 0
execute if score $s100 Hookshot.Math matches 101.. run scoreboard players set $s100 Hookshot.Math 100
scoreboard players operation $step_pct Hookshot.Math = #c35000 Hookshot.Math
scoreboard players operation $step_pct Hookshot.Math /= @s Hookshot.HorizDist
execute if score $step_pct Hookshot.Math matches ..21 run scoreboard players set $step_pct Hookshot.Math 22
execute if score $step_pct Hookshot.Math matches 46.. run scoreboard players set $step_pct Hookshot.Math 45
scoreboard players operation $s_aim Hookshot.Math = $s100 Hookshot.Math
scoreboard players operation $s_aim Hookshot.Math -= $step_pct Hookshot.Math
execute if score $s_aim Hookshot.Math matches ..0 run scoreboard players set $s_aim Hookshot.Math 0
scoreboard players operation $aim_x Hookshot.Math = @s Hookshot.RayX
scoreboard players operation $aim_x Hookshot.Math *= $s_aim Hookshot.Math
scoreboard players operation $aim_x Hookshot.Math /= #c100 Hookshot.Math
scoreboard players operation $tx Hookshot.Math = @s Hookshot.StopX
scoreboard players operation $tx Hookshot.Math -= $aim_x Hookshot.Math
scoreboard players operation $tx Hookshot.Math -= $px Hookshot.Math
scoreboard players operation $aim_z Hookshot.Math = @s Hookshot.RayZ
scoreboard players operation $aim_z Hookshot.Math *= $s_aim Hookshot.Math
scoreboard players operation $aim_z Hookshot.Math /= #c100 Hookshot.Math
scoreboard players operation $tz Hookshot.Math = @s Hookshot.StopZ
scoreboard players operation $tz Hookshot.Math -= $aim_z Hookshot.Math
scoreboard players operation $tz Hookshot.Math -= $pz Hookshot.Math
scoreboard players operation $aim_y Hookshot.Math = @s Hookshot.RayY
scoreboard players operation $aim_y Hookshot.Math *= $s_aim Hookshot.Math
scoreboard players operation $aim_y Hookshot.Math /= #c100 Hookshot.Math
scoreboard players operation $ty Hookshot.Math = @s Hookshot.StopY
scoreboard players operation $ty Hookshot.Math -= $aim_y Hookshot.Math
scoreboard players set $u100 Hookshot.Math 100
scoreboard players operation $u100 Hookshot.Math -= $s_aim Hookshot.Math
scoreboard players operation $arch Hookshot.Math = $s_aim Hookshot.Math
scoreboard players operation $arch Hookshot.Math *= $u100 Hookshot.Math
scoreboard players operation $arch Hookshot.Math *= #c4 Hookshot.Math
scoreboard players operation $arch Hookshot.Math *= @s Hookshot.ArchH
scoreboard players operation $arch Hookshot.Math /= #c10000 Hookshot.Math
execute unless block ~ ~2.3 ~ #hookshot:passable run scoreboard players set $arch Hookshot.Math 0
scoreboard players operation $ty Hookshot.Math += $arch Hookshot.Math
scoreboard players operation $ty Hookshot.Math -= $py Hookshot.Math

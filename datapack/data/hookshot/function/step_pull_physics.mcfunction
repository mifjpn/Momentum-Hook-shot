scoreboard players set @s Hookshot.FallGuard 180
scoreboard players set @s Hookshot.StepGuard 30
execute store result score $px Hookshot.Math run data get entity @s Pos[0] 50
execute store result score $py Hookshot.Math run data get entity @s Pos[1] 50
execute store result score $pz Hookshot.Math run data get entity @s Pos[2] 50
scoreboard players operation $avx Hookshot.Math = $px Hookshot.Math
scoreboard players operation $avx Hookshot.Math -= @s Hookshot.LastX
scoreboard players operation $avy Hookshot.Math = $py Hookshot.Math
scoreboard players operation $avy Hookshot.Math -= @s Hookshot.LastY
scoreboard players operation $avz Hookshot.Math = $pz Hookshot.Math
scoreboard players operation $avz Hookshot.Math -= @s Hookshot.LastZ
execute if score @s Hookshot.PullElapsed matches 0 run scoreboard players set $avx Hookshot.Math 0
execute if score @s Hookshot.PullElapsed matches 0 run scoreboard players set $avy Hookshot.Math 0
execute if score @s Hookshot.PullElapsed matches 0 run scoreboard players set $avz Hookshot.Math 0
scoreboard players operation @s Hookshot.LastX = $px Hookshot.Math
scoreboard players operation @s Hookshot.LastY = $py Hookshot.Math
scoreboard players operation @s Hookshot.LastZ = $pz Hookshot.Math
scoreboard players operation $dx Hookshot.Math = @s Hookshot.StopX
scoreboard players operation $dx Hookshot.Math -= $px Hookshot.Math
scoreboard players operation $dy Hookshot.Math = @s Hookshot.StopY
scoreboard players operation $dy Hookshot.Math -= $py Hookshot.Math
scoreboard players operation $dz Hookshot.Math = @s Hookshot.StopZ
scoreboard players operation $dz Hookshot.Math -= $pz Hookshot.Math
scoreboard players operation $t1 Hookshot.Math = $dx Hookshot.Math
scoreboard players operation $t1 Hookshot.Math *= $dx Hookshot.Math
scoreboard players operation $t2 Hookshot.Math = $dz Hookshot.Math
scoreboard players operation $t2 Hookshot.Math *= $dz Hookshot.Math
scoreboard players operation $h2 Hookshot.Math = $t1 Hookshot.Math
scoreboard players operation $h2 Hookshot.Math += $t2 Hookshot.Math
scoreboard players operation $t3 Hookshot.Math = $dy Hookshot.Math
scoreboard players operation $t3 Hookshot.Math *= $dy Hookshot.Math
scoreboard players operation $d2 Hookshot.Math = $h2 Hookshot.Math
scoreboard players operation $d2 Hookshot.Math += $t3 Hookshot.Math
scoreboard players operation $t1 Hookshot.Math = $dx Hookshot.Math
scoreboard players operation $t1 Hookshot.Math *= @s Hookshot.RayX
scoreboard players operation $t2 Hookshot.Math = $dz Hookshot.Math
scoreboard players operation $t2 Hookshot.Math *= @s Hookshot.RayZ
scoreboard players operation $hdot Hookshot.Math = $t1 Hookshot.Math
scoreboard players operation $hdot Hookshot.Math += $t2 Hookshot.Math
scoreboard players operation $t3 Hookshot.Math = $dy Hookshot.Math
scoreboard players operation $t3 Hookshot.Math *= @s Hookshot.RayY
scoreboard players operation $dot Hookshot.Math = $hdot Hookshot.Math
scoreboard players operation $dot Hookshot.Math += $t3 Hookshot.Math
execute if score $d2 Hookshot.Math matches ..361 run return run function hookshot:arrive_anchor
execute if score @s Hookshot.PullElapsed matches 1.. if score $h2 Hookshot.Math matches ..3600 if score $dy Hookshot.Math matches -225..135 run return run function hookshot:arrive_anchor
execute if score @s Hookshot.PullElapsed matches 1.. if score @s Hookshot.HorizDist matches 80.. if score $hdot Hookshot.Math matches ..0 if score $dy Hookshot.Math matches -250..145 if score $h2 Hookshot.Math matches ..40000 run return run function hookshot:arrive_anchor
execute if score @s Hookshot.PullElapsed matches 1.. if score @s Hookshot.HorizDist matches ..79 if score $dot Hookshot.Math matches ..0 if score $d2 Hookshot.Math matches ..62500 run return run function hookshot:arrive_anchor
execute if score @s Hookshot.PullElapsed matches 1.. if score @s Hookshot.HorizDist matches 80.. if score $hdot Hookshot.Math matches ..0 if score $dy Hookshot.Math matches ..-251 run return run function hookshot:arrive_anchor
scoreboard players operation $s1 Hookshot.Math = $avx Hookshot.Math
scoreboard players operation $s1 Hookshot.Math *= $avx Hookshot.Math
scoreboard players operation $s2 Hookshot.Math = $avy Hookshot.Math
scoreboard players operation $s2 Hookshot.Math *= $avy Hookshot.Math
scoreboard players operation $s3 Hookshot.Math = $avz Hookshot.Math
scoreboard players operation $s3 Hookshot.Math *= $avz Hookshot.Math
scoreboard players operation $spd2 Hookshot.Math = $s1 Hookshot.Math
scoreboard players operation $spd2 Hookshot.Math += $s2 Hookshot.Math
scoreboard players operation $spd2 Hookshot.Math += $s3 Hookshot.Math
execute if score @s Hookshot.PullElapsed matches 6.. if score $spd2 Hookshot.Math matches ..9 run scoreboard players add @s Hookshot.StuckTicks 1
execute if score $spd2 Hookshot.Math matches 10.. run scoreboard players set @s Hookshot.StuckTicks 0
execute if score $d2 Hookshot.Math < @s Hookshot.MinD2 run scoreboard players operation @s Hookshot.MinD2 = $d2 Hookshot.Math
execute if score $d2 Hookshot.Math matches ..40000 if score @s Hookshot.StuckTicks matches 3.. run return run function hookshot:arrive_anchor
execute if score @s Hookshot.StuckTicks matches 10.. run return run function hookshot:abort_pull
scoreboard players remove @s Hookshot.PullTicks 1
scoreboard players add @s Hookshot.PullElapsed 1
execute unless score @s Hookshot.PullTicks matches 1.. run return run function hookshot:abort_pull
particle minecraft:cloud ~ ~0.15 ~ 0.08 0.05 0.08 0.01 1 force
function hookshot:steer_along_wire

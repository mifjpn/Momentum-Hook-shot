scoreboard players operation $tx Hookshot.Math = $dx Hookshot.Math
scoreboard players operation $ty Hookshot.Math = $dy Hookshot.Math
scoreboard players operation $tz Hookshot.Math = $dz Hookshot.Math
execute if score @s Hookshot.ArchH matches 1.. if score $hdot Hookshot.Math matches 1.. run function hookshot:calc_parabola_aim
scoreboard players operation $ax Hookshot.Math = $tx Hookshot.Math
execute if score $ax Hookshot.Math matches ..-1 run scoreboard players operation $ax Hookshot.Math *= #neg1 Hookshot.Math
scoreboard players operation $ay Hookshot.Math = $ty Hookshot.Math
execute if score $ay Hookshot.Math matches ..-1 run scoreboard players operation $ay Hookshot.Math *= #neg1 Hookshot.Math
scoreboard players operation $az Hookshot.Math = $tz Hookshot.Math
execute if score $az Hookshot.Math matches ..-1 run scoreboard players operation $az Hookshot.Math *= #neg1 Hookshot.Math
scoreboard players operation $maxa Hookshot.Math = $ax Hookshot.Math
scoreboard players operation $maxa Hookshot.Math > $ay Hookshot.Math
scoreboard players operation $maxa Hookshot.Math > $az Hookshot.Math
scoreboard players operation $rem Hookshot.Math = $ax Hookshot.Math
scoreboard players operation $rem Hookshot.Math += $ay Hookshot.Math
scoreboard players operation $rem Hookshot.Math += $az Hookshot.Math
scoreboard players operation $rem Hookshot.Math -= $maxa Hookshot.Math
scoreboard players operation $rem Hookshot.Math *= #c3 Hookshot.Math
scoreboard players operation $rem Hookshot.Math /= #c8 Hookshot.Math
scoreboard players operation $dist Hookshot.Math = $maxa Hookshot.Math
scoreboard players operation $dist Hookshot.Math += $rem Hookshot.Math
execute if score $dist Hookshot.Math matches ..1 run scoreboard players set $dist Hookshot.Math 1
scoreboard players set $tspd Hookshot.Math 90
execute if score $d2 Hookshot.Math matches 32401..160000 run scoreboard players set $tspd Hookshot.Math 64
execute if score $d2 Hookshot.Math matches ..32400 run scoreboard players set $tspd Hookshot.Math 42
scoreboard players operation $dvx Hookshot.Math = $tx Hookshot.Math
scoreboard players operation $dvx Hookshot.Math *= $tspd Hookshot.Math
scoreboard players operation $dvx Hookshot.Math /= $dist Hookshot.Math
scoreboard players operation $dvy Hookshot.Math = $ty Hookshot.Math
scoreboard players operation $dvy Hookshot.Math *= $tspd Hookshot.Math
scoreboard players operation $dvy Hookshot.Math /= $dist Hookshot.Math
scoreboard players operation $dvz Hookshot.Math = $tz Hookshot.Math
scoreboard players operation $dvz Hookshot.Math *= $tspd Hookshot.Math
scoreboard players operation $dvz Hookshot.Math /= $dist Hookshot.Math
scoreboard players operation $ex Hookshot.Math = $avx Hookshot.Math
scoreboard players operation $ex Hookshot.Math *= #c91 Hookshot.Math
scoreboard players operation $ex Hookshot.Math /= #c100 Hookshot.Math
scoreboard players operation $ey Hookshot.Math = $avy Hookshot.Math
scoreboard players operation $ey Hookshot.Math *= #c98 Hookshot.Math
scoreboard players operation $ey Hookshot.Math /= #c100 Hookshot.Math
scoreboard players operation $ez Hookshot.Math = $avz Hookshot.Math
scoreboard players operation $ez Hookshot.Math *= #c91 Hookshot.Math
scoreboard players operation $ez Hookshot.Math /= #c100 Hookshot.Math
scoreboard players operation $dvx Hookshot.Math -= $ex Hookshot.Math
scoreboard players operation $dvy Hookshot.Math -= $ey Hookshot.Math
scoreboard players operation $dvz Hookshot.Math -= $ez Hookshot.Math
summon minecraft:marker ~ ~ ~ {Tags:["hook_math_tmp"]}
execute store result score $mpx Hookshot.Math run data get entity @s Pos[0] 100
execute store result score $mpz Hookshot.Math run data get entity @s Pos[2] 100
execute at @s rotated ~ 0 positioned ^ ^ ^1 run tp @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] ~ ~ ~
execute store result score $fx Hookshot.Math run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[0] 100
execute store result score $fz Hookshot.Math run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[2] 100
execute at @s rotated ~ 0 positioned ^1 ^ ^ run tp @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] ~ ~ ~
execute store result score $lx Hookshot.Math run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[0] 100
execute store result score $lz Hookshot.Math run data get entity @e[type=minecraft:marker,tag=hook_math_tmp,limit=1] Pos[2] 100
kill @e[type=minecraft:marker,tag=hook_math_tmp]
scoreboard players operation $fx Hookshot.Math -= $mpx Hookshot.Math
scoreboard players operation $fz Hookshot.Math -= $mpz Hookshot.Math
scoreboard players operation $lx Hookshot.Math -= $mpx Hookshot.Math
scoreboard players operation $lz Hookshot.Math -= $mpz Hookshot.Math
scoreboard players operation $t1 Hookshot.Math = $dvx Hookshot.Math
scoreboard players operation $t1 Hookshot.Math *= $fx Hookshot.Math
scoreboard players operation $t2 Hookshot.Math = $dvz Hookshot.Math
scoreboard players operation $t2 Hookshot.Math *= $fz Hookshot.Math
scoreboard players operation $dfwd Hookshot.Math = $t1 Hookshot.Math
scoreboard players operation $dfwd Hookshot.Math += $t2 Hookshot.Math
scoreboard players operation $dfwd Hookshot.Math /= #c100 Hookshot.Math
scoreboard players operation $t1 Hookshot.Math = $dvx Hookshot.Math
scoreboard players operation $t1 Hookshot.Math *= $lx Hookshot.Math
scoreboard players operation $t2 Hookshot.Math = $dvz Hookshot.Math
scoreboard players operation $t2 Hookshot.Math *= $lz Hookshot.Math
scoreboard players operation $dlat Hookshot.Math = $t1 Hookshot.Math
scoreboard players operation $dlat Hookshot.Math += $t2 Hookshot.Math
scoreboard players operation $dlat Hookshot.Math /= #c100 Hookshot.Math
execute store result score @s Hookshot.Pitch run data get entity @s Rotation[1] 1
scoreboard players set $hp Hookshot.Math 3
execute if score @s Hookshot.Pitch matches ..-56 run scoreboard players set $hp Hookshot.Math 1
execute if score @s Hookshot.Pitch matches -55..-20 run scoreboard players set $hp Hookshot.Math 2
execute if score @s Hookshot.Pitch matches 20..55 run scoreboard players set $hp Hookshot.Math 4
execute if score @s Hookshot.Pitch matches 56.. run scoreboard players set $hp Hookshot.Math 5
scoreboard players set $htier Hookshot.Math 0
execute if score $dfwd Hookshot.Math matches 5..12 run scoreboard players set $htier Hookshot.Math 10
execute if score $dfwd Hookshot.Math matches 13..22 run scoreboard players set $htier Hookshot.Math 20
execute if score $dfwd Hookshot.Math matches 23..34 run scoreboard players set $htier Hookshot.Math 30
execute if score $dfwd Hookshot.Math matches 35.. run scoreboard players set $htier Hookshot.Math 40
execute if score $dfwd Hookshot.Math matches -12..-5 run scoreboard players set $htier Hookshot.Math 50
execute if score $dfwd Hookshot.Math matches -22..-13 run scoreboard players set $htier Hookshot.Math 60
execute if score $dfwd Hookshot.Math matches -34..-23 run scoreboard players set $htier Hookshot.Math 70
execute if score $dfwd Hookshot.Math matches ..-35 run scoreboard players set $htier Hookshot.Math 80
execute if score $htier Hookshot.Math matches 10.. run scoreboard players operation $htier Hookshot.Math += $hp Hookshot.Math
execute if score $htier Hookshot.Math matches 10.. run scoreboard players operation @s Hookshot.Impulse = $htier Hookshot.Math
execute if score $dlat Hookshot.Math matches 5..12 run scoreboard players set @s Hookshot.ImpulseLat 1
execute if score $dlat Hookshot.Math matches 13..22 run scoreboard players set @s Hookshot.ImpulseLat 2
execute if score $dlat Hookshot.Math matches 23..34 run scoreboard players set @s Hookshot.ImpulseLat 3
execute if score $dlat Hookshot.Math matches 35.. run scoreboard players set @s Hookshot.ImpulseLat 4
execute if score $dlat Hookshot.Math matches -12..-5 run scoreboard players set @s Hookshot.ImpulseLat 11
execute if score $dlat Hookshot.Math matches -22..-13 run scoreboard players set @s Hookshot.ImpulseLat 12
execute if score $dlat Hookshot.Math matches -34..-23 run scoreboard players set @s Hookshot.ImpulseLat 13
execute if score $dlat Hookshot.Math matches ..-35 run scoreboard players set @s Hookshot.ImpulseLat 14
scoreboard players set $vp Hookshot.Math 4
execute if score @s Hookshot.Pitch matches ..-65 run scoreboard players set $vp Hookshot.Math 1
execute if score @s Hookshot.Pitch matches -64..-39 run scoreboard players set $vp Hookshot.Math 2
execute if score @s Hookshot.Pitch matches -38..-13 run scoreboard players set $vp Hookshot.Math 3
execute if score @s Hookshot.Pitch matches 13..38 run scoreboard players set $vp Hookshot.Math 5
execute if score @s Hookshot.Pitch matches 39..64 run scoreboard players set $vp Hookshot.Math 6
execute if score @s Hookshot.Pitch matches 65.. run scoreboard players set $vp Hookshot.Math 7
scoreboard players set $vtier Hookshot.Math 0
execute if score $dvy Hookshot.Math matches 4..10 run scoreboard players set $vtier Hookshot.Math 10
execute if score $dvy Hookshot.Math matches 11..19 run scoreboard players set $vtier Hookshot.Math 20
execute if score $dvy Hookshot.Math matches 20..30 run scoreboard players set $vtier Hookshot.Math 30
execute if score $dvy Hookshot.Math matches 31.. run scoreboard players set $vtier Hookshot.Math 40
execute if score $dvy Hookshot.Math matches -10..-4 run scoreboard players set $vtier Hookshot.Math 50
execute if score $dvy Hookshot.Math matches -19..-11 run scoreboard players set $vtier Hookshot.Math 60
execute if score $dvy Hookshot.Math matches -30..-20 run scoreboard players set $vtier Hookshot.Math 70
execute if score $dvy Hookshot.Math matches ..-31 run scoreboard players set $vtier Hookshot.Math 80
execute if score $vtier Hookshot.Math matches 10.. run scoreboard players operation $vtier Hookshot.Math += $vp Hookshot.Math
execute if score $vtier Hookshot.Math matches 10.. run scoreboard players operation @s Hookshot.ImpulseV = $vtier Hookshot.Math

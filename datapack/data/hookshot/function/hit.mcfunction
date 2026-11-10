data modify storage delta:storage TargetPos set from entity @s Pos
execute as @p[tag=using_hookshot,distance=..32] at @s run function hookshot:pull_player
playsound entity.wind_charge.wind_burst master @a ~ ~ ~ 1.2 1.2
particle gust ~ ~ ~ 0.5 0.5 0.1 0 5
kill @e[tag=hook_active,limit=1]

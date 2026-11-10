tp @s ^ ^ ^1.2
particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force
particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force
scoreboard players remove @s Hookshot.Step 1
execute unless block ~ ~ ~ #delta:no_collision run function hookshot:hit
execute if entity @s[scores={Hookshot.Step=..0}] run tag @a remove using_hookshot
execute if entity @s[scores={Hookshot.Step=..0}] run kill @s

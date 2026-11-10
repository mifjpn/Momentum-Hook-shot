execute as @e[tag=hook_active] at @s run tp @s ^ ^ ^1.5
execute as @e[tag=hook_active] at @s unless block ~ ~ ~ #delta:no_collision run function hookshot:hit
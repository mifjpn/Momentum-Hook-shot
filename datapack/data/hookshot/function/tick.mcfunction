execute as @a[scores={Hookshot.Cooldown=1..}] run scoreboard players remove @s Hookshot.Cooldown 1
execute as @e[type=marker,tag=hook_active] at @s run function hookshot:pull
advancement revoke @s only hookshot:use
execute if score @s Hookshot.Cooldown matches 1 run scoreboard players set @s Hookshot.Cooldown 2
execute if score @s Hookshot.Cooldown matches 1.. run return 0
scoreboard players set @s Hookshot.Cooldown 10
tag @s add using_hookshot
kill @e[type=marker,tag=hook_active]
execute anchored eyes positioned ^ ^ ^1 rotated as @s run summon marker ~ ~ ~ {Tags:["hook_active"]}
scoreboard players set @e[type=marker,tag=hook_active,limit=1] Hookshot.Step 25
playsound minecraft:entity.fishing_bobber.throw master @a ~ ~ ~ 1.0 1.2
playsound minecraft:entity.firework_rocket.launch master @a ~ ~ ~ 1.0 1.6
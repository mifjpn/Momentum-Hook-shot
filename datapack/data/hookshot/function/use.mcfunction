advancement revoke @s only hookshot:use
tag @s add using_hookshot
kill @e[type=marker,tag=hook_active]
execute anchored eyes positioned ^ ^ ^1 rotated as @s run summon marker ~ ~ ~ {Tags:["hook_active"]}
scoreboard players set @e[type=marker,tag=hook_active,limit=1] Hookshot.Step 25
playsound minecraft:entity.fishing_bobber.throw master @a ~ ~ ~ 1.0 1.2
playsound minecraft:entity.firework_rocket.launch master @a ~ ~ ~ 1.0 1.6

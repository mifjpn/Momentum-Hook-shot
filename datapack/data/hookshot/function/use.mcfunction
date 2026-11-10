advancement revoke @s only hookshot:use
scoreboard players set @s Hookshot.Shot 0
execute if score @s Hookshot.Cooldown matches 1.. run return 0
execute at @s anchored eyes positioned ~ ~-0.1 ~ run kill @e[type=minecraft:arrow,distance=..2.5,sort=nearest,limit=1]
scoreboard players set @s Hookshot.Cooldown 12
execute at @s run playsound chuzume:launcher_shot master @a ~ ~ ~ 0.8 1.2
execute at @s run playsound minecraft:entity.fishing_bobber.throw master @a ~ ~ ~ 1.0 1.2
scoreboard players set $step Hookshot.Step 45
execute at @s anchored eyes positioned ^ ^ ^0.8 anchored feet run function hookshot:raycast

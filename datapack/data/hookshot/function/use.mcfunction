advancement revoke @s only hookshot:use
scoreboard players set @s Hookshot.Shot 0
execute if score @s Hookshot.Cooldown matches 1.. run return 0
execute if score @s Hookshot.PullTicks matches 1.. run return 0
execute unless score @s Hookshot.ID matches 1.. store result score @s Hookshot.ID run scoreboard players add $next_id Hookshot.ID 1
execute if items entity @s weapon.mainhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run item modify entity @s weapon.mainhand hookshot:ensure_enchant
execute if items entity @s weapon.offhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run item modify entity @s weapon.offhand hookshot:ensure_enchant
execute at @s anchored eyes positioned ~ ~-0.1 ~ run kill @e[type=minecraft:arrow,distance=..2.5,nbt={inGround:0b},sort=nearest,limit=1]
scoreboard players set @s Hookshot.Cooldown 12
function hookshot:cleanup_own_entities
execute at @s run playsound chuzume:launcher_shot master @a ~ ~ ~ 0.8 1.2
execute at @s run playsound minecraft:entity.fishing_bobber.throw master @a ~ ~ ~ 1.0 1.2
scoreboard players set $step Hookshot.Step 90
execute at @s anchored eyes positioned ^ ^ ^0.6 anchored feet run function hookshot:raycast

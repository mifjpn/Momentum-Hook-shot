advancement revoke @s only hookshot:use
stopsound @a * minecraft:item.crossbow.shoot
kill @e[type=minecraft:arrow,distance=..5,sort=nearest,limit=1]
item modify entity @s weapon.mainhand {function:"minecraft:set_components",components:{"minecraft:charged_projectiles":[{id:"minecraft:arrow",count:1}]}}

tag @s add using_hookshot
kill @e[type=marker,tag=hook_active]
execute anchored eyes positioned ^ ^ ^1 rotated as @s run summon marker ~ ~ ~ {Tags:["hook_active"]}
scoreboard players set @e[type=marker,tag=hook_active,limit=1] Hookshot.Step 25

playsound minecraft:entity.fishing_bobber.throw master @a ~ ~ ~ 1.0 1.2
playsound minecraft:entity.iron_golem.attack master @a ~ ~ ~ 1.0 1.8

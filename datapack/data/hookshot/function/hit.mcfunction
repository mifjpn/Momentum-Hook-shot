playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 1.2 1.2
particle minecraft:gust ~ ~ ~ 0.3 0.3 0.3 0 3 force
execute if items entity @s weapon.mainhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run item modify entity @s weapon.mainhand hookshot:ensure_enchant
execute if items entity @s weapon.offhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run item modify entity @s weapon.offhand hookshot:ensure_enchant
scoreboard players set @s Hookshot.Impulse 1

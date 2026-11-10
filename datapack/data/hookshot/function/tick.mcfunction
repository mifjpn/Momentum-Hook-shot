execute as @a[scores={Hookshot.Shot=1..}] at @s unless score @s Hookshot.Cooldown matches 1.. if items entity @s weapon.mainhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run function hookshot:use
execute as @a[scores={Hookshot.Shot=1..}] at @s unless score @s Hookshot.Cooldown matches 1.. if items entity @s weapon.offhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run function hookshot:use
execute as @a[scores={Hookshot.Shot=1..}] run scoreboard players set @s Hookshot.Shot 0
execute as @a[scores={Hookshot.Cooldown=10}] run function hookshot:enter_reload
execute as @a[scores={Hookshot.Cooldown=1..}] run scoreboard players remove @s Hookshot.Cooldown 1
execute as @a unless score @s Hookshot.Cooldown matches 1.. at @s run function hookshot:check_recharge

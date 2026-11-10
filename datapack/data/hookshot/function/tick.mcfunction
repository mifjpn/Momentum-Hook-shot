execute as @a[scores={Hookshot.Shot=1..}] at @s unless score @s Hookshot.Cooldown matches 1.. if items entity @s weapon.mainhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run function hookshot:use
execute as @a[scores={Hookshot.Shot=1..}] at @s unless score @s Hookshot.Cooldown matches 1.. if items entity @s weapon.offhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b}] run function hookshot:use
execute as @a[scores={Hookshot.Shot=1..}] run scoreboard players set @s Hookshot.Shot 0
execute as @a[tag=hook_has_wire] at @s run function hookshot:update_wire_and_pull
execute as @a[scores={Hookshot.WireLife=1..}] run scoreboard players remove @s Hookshot.WireLife 1
execute as @a[tag=hook_has_wire] unless score @s Hookshot.PullTicks matches 1.. unless score @s Hookshot.WireLife matches 1.. run function hookshot:finish_wire
execute as @a[scores={Hookshot.FallGuard=1}] run attribute @s minecraft:fall_damage_multiplier modifier remove hookshot:fall_guard
execute as @a[scores={Hookshot.FallGuard=1..}] run scoreboard players remove @s Hookshot.FallGuard 1
execute as @a[scores={Hookshot.Cooldown=11}] run function hookshot:enter_reload
execute as @a[scores={Hookshot.Cooldown=1..}] run scoreboard players remove @s Hookshot.Cooldown 1
execute as @a unless score @s Hookshot.Cooldown matches 1.. unless tag @s hook_has_wire at @s run function hookshot:check_recharge

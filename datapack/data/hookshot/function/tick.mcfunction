scoreboard players add $server_tick Hookshot.Step 1
execute as @a at @s run function hookshot:check_join_guard
execute as @a[scores={Hookshot.Shot=1..}] at @s unless score @s Hookshot.JoinGuard matches 1.. unless score @s Hookshot.Cooldown matches 1.. if items entity @s weapon.mainhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b},minecraft:charged_projectiles=[]] run function hookshot:use
execute as @a[scores={Hookshot.Shot=1..}] at @s unless score @s Hookshot.JoinGuard matches 1.. unless score @s Hookshot.Cooldown matches 1.. if items entity @s weapon.offhand minecraft:crossbow[minecraft:custom_data~{Hookshot:1b},minecraft:charged_projectiles=[]] run function hookshot:use
execute as @a[scores={Hookshot.Shot=1..}] run scoreboard players set @s Hookshot.Shot 0
execute as @a[tag=hook_has_wire] at @s run function hookshot:update_wire_and_pull
execute as @a[scores={Hookshot.BrakeTicks=1..}] at @s run function hookshot:step_xy_brake
execute as @a[scores={Hookshot.WireLife=1..}] run scoreboard players remove @s Hookshot.WireLife 1
execute as @a[tag=hook_has_wire] unless score @s Hookshot.PullTicks matches 1.. unless score @s Hookshot.WireLife matches 1.. run function hookshot:finish_wire
execute as @a[scores={Hookshot.WallHang=1}] run attribute @s minecraft:gravity modifier remove hookshot:wall_hang
execute as @a[scores={Hookshot.WallHang=1..}] run scoreboard players remove @s Hookshot.WallHang 1
execute as @a[scores={Hookshot.StepGuard=1}] run attribute @s minecraft:step_height modifier remove hookshot:step_boost
execute as @a[scores={Hookshot.StepGuard=1..}] run scoreboard players remove @s Hookshot.StepGuard 1
execute as @a[scores={Hookshot.FallGuard=1}] run attribute @s minecraft:fall_damage_multiplier modifier remove hookshot:fall_guard
execute as @a[scores={Hookshot.FallGuard=1..}] run scoreboard players remove @s Hookshot.FallGuard 1
execute as @a[scores={Hookshot.Cooldown=4}] run function hookshot:enter_reload
execute as @a[scores={Hookshot.Cooldown=1..}] run scoreboard players remove @s Hookshot.Cooldown 1
execute as @a unless score @s Hookshot.Cooldown matches 1.. at @s run function hookshot:check_recharge

advancement revoke @s only delta:post_explosion_trigger
gamemode adventure @s[scores={delta.internal.gamemode=0}]
gamemode creative @s[scores={delta.internal.gamemode=1}]
gamemode spectator @s[scores={delta.internal.gamemode=2}]
gamemode survival @s[scores={delta.internal.gamemode=3}]
execute if score $diff delta.internal.gamemode matches 0 run difficulty peaceful
execute in minecraft:overworld run item replace entity @s weapon.mainhand from block 100001 -64 100000 container.0
execute in minecraft:overworld run item replace entity @s weapon.offhand from block 100001 -64 100000 container.1
execute in minecraft:overworld run item replace entity @s armor.feet from block 100001 -64 100000 container.2
execute in minecraft:overworld run item replace entity @s armor.legs from block 100001 -64 100000 container.3
execute in minecraft:overworld run item replace entity @s armor.chest from block 100001 -64 100000 container.4
execute in minecraft:overworld run item replace entity @s armor.head from block 100001 -64 100000 container.5
tp @s ~ ~-1000 ~
kill @e[type=bat,tag=delta.pre_explosion]
kill @e[type=bat,tag=delta.post_explosion]

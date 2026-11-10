advancement revoke @s only delta:pre_explosion_trigger
scoreboard players set @s[gamemode=adventure] delta.internal.gamemode 0
scoreboard players set @s[gamemode=creative] delta.internal.gamemode 1
scoreboard players set @s[gamemode=spectator] delta.internal.gamemode 2
scoreboard players set @s[gamemode=survival] delta.internal.gamemode 3
gamemode creative @s
tp @s ~ ~1000 ~
execute in minecraft:overworld run function delta:internal/subtick/store_armor
item replace entity @s armor.feet with minecraft:air
item replace entity @s armor.legs with minecraft:air
item replace entity @s armor.chest with minecraft:air
item replace entity @s armor.head with minecraft:air

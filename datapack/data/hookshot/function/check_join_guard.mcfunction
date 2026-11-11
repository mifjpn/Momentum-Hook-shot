scoreboard players operation $gap Hookshot.Step = $server_tick Hookshot.Step
scoreboard players operation $gap Hookshot.Step -= @s Hookshot.LastTick
scoreboard players operation @s Hookshot.LastTick = $server_tick Hookshot.Step
execute unless score $gap Hookshot.Step matches 1 run scoreboard players set @s Hookshot.JoinGuard 45
execute if score @s Hookshot.Leave matches 1.. run scoreboard players set @s Hookshot.JoinGuard 45
execute if score @s Hookshot.Leave matches 1.. run scoreboard players set @s Hookshot.Leave 0
execute if score @s Hookshot.JoinGuard matches 45 run function hookshot:on_join_reset
execute if score @s Hookshot.JoinGuard matches 1.. run scoreboard players set @s Hookshot.Shot 0
execute if score @s Hookshot.JoinGuard matches 1.. anchored eyes positioned ~ ~-0.1 ~ run kill @e[type=minecraft:arrow,distance=..2.5,nbt={inGround:0b},sort=nearest,limit=1]
execute if score @s Hookshot.JoinGuard matches 1.. run scoreboard players remove @s Hookshot.JoinGuard 1

scoreboard players set $strength delta.api.launch 20000
execute rotated as @s run function delta:api/launch_looking
playsound entity.firework_rocket.launch player @s ~ ~ ~ 1.0 1.6
particle firework ~ ~ ~ 0.5 0.5 0.5 0.1 10
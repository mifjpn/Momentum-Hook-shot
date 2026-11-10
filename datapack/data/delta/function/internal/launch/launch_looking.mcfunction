function delta:internal/subtick/begin_launch_context
function delta:internal/math/get_angle
execute store result score $diff delta.internal.gamemode run difficulty
execute if score $diff delta.internal.gamemode matches 0 run difficulty easy
execute anchored eyes positioned ^ ^ ^ run function delta:internal/summon/summon_creepers with storage delta:macros rotation
scoreboard players operation $temp delta.internal.id = @s delta.internal.id
execute anchored eyes positioned ^ ^ ^ positioned ~ ~1000 ~ as @e[type=creeper,tag=delta.init,distance=..0.02] at @s run function delta:internal/summon/initialize_creepers
function delta:internal/subtick/end_launch_context

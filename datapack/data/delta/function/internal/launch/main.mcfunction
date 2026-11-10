scoreboard players operation $temp delta.internal.x = @s delta.internal.x
scoreboard players operation $temp delta.internal.y = @s delta.internal.y
scoreboard players operation $temp delta.internal.z = @s delta.internal.z
execute in minecraft:overworld as d59ee2c6-58c8-4885-b9db-ecff066e4439 run function delta:internal/math/xyz_to_polar_wrapper
execute rotated as d59ee2c6-58c8-4885-b9db-ecff066e4439 run function delta:internal/launch/launch_looking
scoreboard players set $function_called delta.internal.dummy 0
tag @s remove delta.launch
scoreboard players reset @s delta.internal.x
scoreboard players reset @s delta.internal.y
scoreboard players reset @s delta.internal.z

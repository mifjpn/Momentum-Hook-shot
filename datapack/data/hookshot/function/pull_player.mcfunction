data modify storage delta:storage PlayerPos set from entity @s Pos
execute store result score $x delta.api.launch run data get storage delta:storage TargetPos[0] 12000
execute store result score $dx delta.api.launch run data get storage delta:storage PlayerPos[0] 12000
scoreboard players operation $x delta.api.launch -= $dx delta.api.launch
execute store result score $y delta.api.launch run data get storage delta:storage TargetPos[1] 12000
execute store result score $dy delta.api.launch run data get storage delta:storage PlayerPos[1] 12000
scoreboard players operation $y delta.api.launch -= $dy delta.api.launch
scoreboard players add $y delta.api.launch 4000
execute store result score $z delta.api.launch run data get storage delta:storage TargetPos[2] 12000
execute store result score $dz delta.api.launch run data get storage delta:storage PlayerPos[2] 12000
scoreboard players operation $z delta.api.launch -= $dz delta.api.launch
function delta:api/launch_xyz

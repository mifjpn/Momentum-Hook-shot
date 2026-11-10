# 汎用Entityを原点にTP
    execute in minecraft:overworld run tp 00000000-0000-0000-0000-00000000000a 0.0 0.0 0.0 ~ ~
# pitchを代入しベクトルをnormalize
    execute store result entity 00000000-0000-0000-0000-00000000000a Rotation[0] float 1 run data get storage forward_spreader:data Rotation[1]
    execute as 00000000-0000-0000-0000-00000000000a at @s run tp @s ^ ^ ^1
# pitchのsin/cosを取得
    data modify storage forward_spreader:data Pos set from entity 00000000-0000-0000-0000-00000000000a Pos
    execute store result score $PitchSin ForwardSpreader run data get storage forward_spreader:data Pos[0] -10000
    execute store result score $PitchCos ForwardSpreader run data get storage forward_spreader:data Pos[2] 10000
# リセット
    data remove storage forward_spreader:data Pos
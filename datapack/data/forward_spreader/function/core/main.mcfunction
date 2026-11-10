# 実行座標に汎用EntityをTP
    execute in minecraft:overworld run tp 00000000-0000-0000-0000-00000000000a 0.0 0.0 0.0 ~ ~
# 必要な実行座標のデータを取得
    execute store result score $Distance ForwardSpreader run data get storage forward_spreader:data Distance 10000
    execute store result score $Diameter ForwardSpreader run data get storage forward_spreader:data Spread 10000
    data modify storage forward_spreader:data Rotation set from entity 00000000-0000-0000-0000-00000000000a Rotation
# オーバーフロー警告
    execute if score $Diameter ForwardSpreader matches 46340.. run tellraw @a [{"text":"ERROR >>","color":"red"},{"text":"Spreadの絶対値が4.6340を上回っています。オーバーフローで正常に動作しない為、値を縮小してください。","color":"white"}]
    execute if score $Diameter ForwardSpreader matches ..-46340 run tellraw @a [{"text":"ERROR >>","color":"red"},{"text":"Spreadの絶対値が4.6340を上回っています。オーバーフローで正常に動作しない為、値を縮小してください。","color":"white"}]
# 実行座標のデータからベクトルを取得する
    function forward_spreader:core/yaw
    function forward_spreader:core/pitch
# 処理の下準備
    function forward_spreader:core/pre_randomizer
# 拡散範囲に収まるランダムなベクトルを生成する
    function forward_spreader:core/randomizer
    scoreboard players operation $VecZ ForwardSpreader = $Distance ForwardSpreader
# 計算
    function forward_spreader:core/calc
# 適用
    function forward_spreader:core/fetch
# リセット
    scoreboard players reset $X ForwardSpreader
    scoreboard players reset $Y ForwardSpreader
    scoreboard players reset $Z ForwardSpreader
    scoreboard players reset $Result ForwardSpreader
    data remove storage forward_spreader:data Distance
    data remove storage forward_spreader:data Spread
    data remove storage forward_spreader:data Rotation
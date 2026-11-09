# hookshot/functions/pull_player.mcfunction
# プレイヤーの位置とストレージの TargetPos との差分を計算して launch_xyz に渡す

# プレイヤージョンをストレージに一時保存
data modify storage delta:storage PlayerPos set from entity @s Pos

# 差分計算（TargetPos - PlayerPos）をストア
execute store result score $x delta.api.launch run data get storage delta:storage TargetPos[0] 1000
execute store result score $dx delta.api.launch run data get storage delta:storage PlayerPos[0] 1000
scoreboard players operation $x delta.api.launch -= $dx delta.api.launch

execute store result score $y delta.api.launch run data get storage delta:storage TargetPos[1] 1000
execute store result score $dy delta.api.launch run data get storage delta:storage PlayerPos[1] 1000
scoreboard players operation $y delta.api.launch -= $dy delta.api.launch

execute store result score $z delta.api.launch run data get storage delta:storage TargetPos[2] 1000
execute store result score $dz delta.api.launch run data get storage delta:storage PlayerPos[2] 1000
scoreboard players operation $z delta.api.launch -= $z delta.api.launch

# delta の launch_xyz API を実行してプレイヤーを高速牽引
function delta:api/launch_xyz

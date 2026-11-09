# 1. 射出の強度を設定（10000ベース、例: 20000で2倍の勢い）
scoreboard players set $strength delta.api.launch 20000

# 2. プレイヤーの視線方向へ delta の launch_looking API を使って勢いよく射出・牽引する[cite: 26]
# 引数やパワーの調整は delta 側の仕様に依存します[cite: 26]
execute rotated as @s run function delta:api/launch_looking[cite: 26]

# 3. 演出（サウンドとパーティクル）[cite: 26]
playsound entity.firework_rocket.launch player @s ~ ~ ~ 1.0 1.6[cite: 26]
particle firework ~ ~ ~ 0.5 0.5 0.5 0.1 10

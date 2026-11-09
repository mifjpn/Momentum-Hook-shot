# 1. ヒットしたマーカーの座標を一時ストレージに取得
data modify storage delta:storage TargetPos set from entity @s Pos

# 2. プレイヤーを対象にして、マーカー位置との差分（ベクトル）を計算し、delta.api.launch に設定して射出
# （※ここでは簡易的に最寄りの使用中プレイヤー @p を対象にしています）
execute as @p[tag=using_hookshot,distance=..32] at @s run function hookshot:pull_player

# 3. ヒット時のサウンドとパーティクル演出
playsound entity.wind_charge.wind_burst master @a ~ ~ ~ 1.2 1.2[cite: 30]
particle gust ~ ~ ~ 0.5 0.5 0.1 5[cite: 30]

# 4. 役割を終えたフックマーカーを消去
kill @e[tag=hook_active,limit=1][cite: 30]

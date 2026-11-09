# 毎ティック実行されるフックの監視処理
# 1. 活性化しているフックマーカーを前方に直進させる
execute as @e[tag=hook_active] at @s run tp @s ^ ^ ^1.5

# 2. 前方のブロックやエンティティへのヒット判定（当たっていれば hit を実行）
execute as @e[tag=hook_active] at @s unless block ~ ~ ~ air run function hookshot:hit
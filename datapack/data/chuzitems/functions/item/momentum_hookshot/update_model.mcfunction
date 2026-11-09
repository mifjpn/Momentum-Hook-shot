# リロード中の場合（ItemModeがreload等のとき、あるいはリロード用スコアが立っている場合）
execute if entity @s[scores={ChuzItems.Hookshot.Reload=1..}] run data modify entity @s SelectedItem.tag.CustomModelData set value 40

# 通常・構え時（リロード中でない場合）
execute if entity @s[scores={ChuzItems.Hookshot.Reload=..0}] run data modify entity @s SelectedItem.tag.CustomModelData set value 38
```[cite: 1]

---

#### 2. メインの定期実行（tick）ファンクションから呼び出す
上記で作成したファンクションを、プレイヤーごとの毎ティック処理（`tick.mcfunction` など）から呼び出します。その際、現在手に持っているアイテムが `momentum_hookshot` であるかを事前に条件として絞り込みます。

```mcfunction
# メインハンドに Momentum Hookshot を持っているプレイヤーのみを対象に実行
execute if data entity @s SelectedItem.tag.ChuzData{ItemID:"momentum_hookshot"} run function chuzitems:item/momentum_hookshot/update_model
```[cite: 1]

*Verification:* ゲーム内で該当アイテムを手に持ち、リロード状態（スコア等）を変化させた際、手元の3Dモデルが `38`（通常・構え）と `40`（リロード）の間で正しく切り替わり、モデルが消えずに描画されることを確認します[cite: 1]。

<ElicitationsGroup message="さらに詳細な判定やスコア連動について：">
  <Elicitation label="リロード状態のスコア判定を組み込む" query="ChuzItems.Hookshot.Reloadスコアをどのように増減させてリロード状態を検知するのか、その具体的なコマンドを教えてください。"/>
  <Elicitation label="オフハンドやインベントリ内の制御" query="メインハンドだけでなくオフハンドに持った場合やインベントリ内でのモデルデータ保持についても制御する方法を教えてください。"/>
</ElicitationsGroup>

<FollowUp label="Want me to show you how to handle the exact NBT selectors for ItemMode detection in the update function?" query="update_model.mcfunction内でスコアではなく直接ChuzDataのItemModeを監視してCustomModelDataを切り替える書き方を教えてください。"/>
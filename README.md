# Momentum Hook-shot

A lightweight, high-performance hook-shot data-pack optimized for Purpur 26.3 environments, powered by the **Delta** physics engine.

---

## Features
- **Momentum-based Pulling:** Uses advanced vector calculations to instantly launch and pull you toward your hook's target.
- **Lightweight & Optimized:** Stripped down to only the essential physics (`delta`) and hook modules for maximum server performance.
- **Crossbow Integration:** Seamlessly triggers via standard item usage.

---

## How to Get the Hook-shot

Run the following command in-game to obtain your hook-shot weapon:

```mcfunction
/give @s minecraft:crossbow[custom_data={hookshot:true},item_name='{"text":"モメンタム・フックショット","color":"aqua","bold":true}',lore=['{"text":"右クリックで前方に射出し、","color":"gray"}','{"text":"壁やブロックにヒットすると高速牽引します","color":"gray"}']] 1
```

---

## How to Use

1. **Equip** the **モメンタム・フックショット** in your hand.
2. **Right-click and hold / use** the item to fire the hook in your looking direction.
3. Upon hitting a block or target, you will be instantly pulled toward the landing spot with smooth momentum conservation.

---

## Credits & Libraries
- **Delta:** BigPapi13様 ([GitHub](https://github.com/BigPapi13/Delta))
- **Oh! My Dat!:** 赤石愛様 ([GitHub](https://github.com/Ai-Akaishi/OhMyDat))
- **MCCMD-ForwardSpread:** ちぇん様 ([GitHub](https://github.com/ChenCMD/MCCMD-ForwardSpread))

<!-- GEYSER-CONFIG-PACK-DOCS -->
## Bedrock / GeyserMC 対応（Geyser用設定パック）

uild_bedrock.ps1 を実行すると、edrock/ ディレクトリ直下に以下のファイルが同階層で出力されます。配布時は **Geyser用設定パック** として案内してください。

- edrock/Momentum-HookShot-Bedrock.mcpack : 統合版クライアント配信用3Dリソースパック（見た目・サウンドのみ）
- edrock/momentum_hookshot.json : GeyserMC サーバー用カスタムアイテムマッピング定義（ormat_version: 2）
- edrock/Momentum-HookShot-Geyser-ConfigPack.zip : 上記2つをGeyserのフォルダ構成（packs/ と custom_mappings/）でまとめた **Geyser用設定パック**

### GeyserMC（Velocity / Paper）への導入手順
1. Momentum-HookShot-Geyser-ConfigPack.zip を Geyser のデータフォルダ（例: plugins/Geyser-Velocity/）直下に展開します。
   - 個別に配置する場合は、.mcpack を packs/ へ、momentum_hookshot.json を custom_mappings/ へ配置します（momentum_hookshot.json を packs/ には置かないでください）。
2. Geyser の config.yml にて enable-custom-content: true および orce-resource-packs: true を設定します。
3. Velocity（またはGeyser稼働サーバー）を再起動すると、Geyserが起動時に custom_mappings/momentum_hookshot.json を自動読込し、接続した統合版クライアントへカスタムアイテム定義と .mcpack を自動配信します。

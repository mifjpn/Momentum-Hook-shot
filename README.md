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
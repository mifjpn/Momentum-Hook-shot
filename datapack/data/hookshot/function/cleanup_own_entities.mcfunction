scoreboard players operation $cid Hookshot.ID = @s Hookshot.ID
execute as @e[tag=hook_obj] if score @s Hookshot.ID = $cid Hookshot.ID run kill @s

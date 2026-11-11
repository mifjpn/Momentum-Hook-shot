scoreboard players set $res Hookshot.Math 0
scoreboard players operation $rem_sq Hookshot.Math = @s Hookshot.InitH2
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 4096
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 2048
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 1024
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 512
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 256
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 128
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 64
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 32
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 16
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 8
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 4
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 2
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation $try Hookshot.Math = $res Hookshot.Math
scoreboard players add $try Hookshot.Math 1
scoreboard players operation $sq Hookshot.Math = $try Hookshot.Math
scoreboard players operation $sq Hookshot.Math *= $try Hookshot.Math
execute if score $sq Hookshot.Math <= $rem_sq Hookshot.Math run scoreboard players operation $res Hookshot.Math = $try Hookshot.Math
scoreboard players operation @s Hookshot.HorizDist = $res Hookshot.Math

summon minecraft:area_effect_cloud ~ ~1000 ~ {Duration:1,Radius:0.0f,ReapplicationDelay:-1,Age:-1,WaitTime:0,potion_contents:{custom_effects:[{id:"minecraft:instant_damage",amplifier:0b,duration:1}]},Tags:["delta.init.aec"]}
summon minecraft:bat ~ ~1000 ~ {NoAI:1b,Health:2000.0f,Tags:["delta.pre_explosion"],PersistenceRequired:0b}
function delta:internal/subtick/get_player_uuid
execute positioned ~ ~1000 ~ as @e[type=area_effect_cloud,tag=delta.init.aec,distance=..0.05] run function delta:internal/subtick/aec_setup

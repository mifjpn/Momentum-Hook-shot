summon creeper ~ ~1000 ~ {Tags:["delta.launcher","delta.init"],Silent:1b,Invulnerable:1b,Team:"delta.no_collide",ExplosionRadius:-1b,Fuse:0s,PersistenceRequired:1b}
scoreboard players remove $creepers_remaining delta.internal.math 1
execute if score $creepers_remaining delta.internal.math matches 1.. run function delta:internal/summon/summon_creepers_recursive

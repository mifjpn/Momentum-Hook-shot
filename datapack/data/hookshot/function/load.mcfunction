scoreboard objectives add Hookshot.Shot minecraft.used:minecraft.crossbow
scoreboard objectives add Hookshot.Leave minecraft.custom:minecraft.leave_game
scoreboard objectives add Hookshot.Step dummy
scoreboard objectives add Hookshot.Cooldown dummy
scoreboard objectives add Hookshot.Impulse dummy
scoreboard objectives add Hookshot.ImpulseLat dummy
scoreboard objectives add Hookshot.ImpulseV dummy
scoreboard objectives add Hookshot.Mode dummy
scoreboard objectives add Hookshot.ID dummy
scoreboard objectives add Hookshot.PullTicks dummy
scoreboard objectives add Hookshot.PullElapsed dummy
scoreboard objectives add Hookshot.WireLife dummy
scoreboard objectives add Hookshot.FallGuard dummy
scoreboard objectives add Hookshot.StepGuard dummy
scoreboard objectives add Hookshot.AnchorY dummy
scoreboard objectives add Hookshot.Pitch dummy
scoreboard objectives add Hookshot.ShotPitch dummy
scoreboard objectives add Hookshot.StopX dummy
scoreboard objectives add Hookshot.StopY dummy
scoreboard objectives add Hookshot.StopZ dummy
scoreboard objectives add Hookshot.RayX dummy
scoreboard objectives add Hookshot.RayY dummy
scoreboard objectives add Hookshot.RayZ dummy
scoreboard objectives add Hookshot.InitH2 dummy
scoreboard objectives add Hookshot.HorizDist dummy
scoreboard objectives add Hookshot.H2Div dummy
scoreboard objectives add Hookshot.ArchH dummy
scoreboard objectives add Hookshot.MinD2 dummy
scoreboard objectives add Hookshot.LastX dummy
scoreboard objectives add Hookshot.LastY dummy
scoreboard objectives add Hookshot.LastZ dummy
scoreboard objectives add Hookshot.StuckTicks dummy
scoreboard objectives add Hookshot.LastTick dummy
scoreboard objectives add Hookshot.JoinGuard dummy
scoreboard objectives add Hookshot.Math dummy
scoreboard players add $server_tick Hookshot.Step 100
scoreboard players set #c3 Hookshot.Math 3
scoreboard players set #c4 Hookshot.Math 4
scoreboard players set #c8 Hookshot.Math 8
scoreboard players set #arch_scale Hookshot.Math 18
scoreboard players set #c91 Hookshot.Math 91
scoreboard players set #c98 Hookshot.Math 98
scoreboard players set #c100 Hookshot.Math 100
scoreboard players set #c10000 Hookshot.Math 10000
scoreboard players set #c35000 Hookshot.Math 35000
scoreboard players set #neg1 Hookshot.Math -1
kill @e[tag=hook_obj]
kill @e[tag=hook_math_tmp]
say [Momentum-Hook-shot] Hookshot Datapack Loaded successfully (26.3 ParabolicArc & ExactXYStop).

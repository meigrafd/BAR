# About this Project
While researching and looking at the NuttyB mod, I noticed a few inconsistencies, such as missing customisations for Armada or Legion.\
So I decided to develop an easy to use Google Sheet mask, like NuttyB provides, just for Scavenger.\
This should make the multiplayer more exciting and challenging.

The special feature is that all commanders have a shield with the same values, which improves with Evolving Commanders per level.\
As template i used [Cortex](https://github.com/beyond-all-reason/Beyond-All-Reason/blob/master/units/other/evocom/corcomlvl10.lua#L403), which already has a high-quality shield from the basic game.\
However, this will get cancelled/overwritten when you activate one of the "NuttyB"-Settings.

Ive added the Source-Lua-Code for every tweakdef or tweakunit to this repo.\
to Decode from base64: https://base64.guru/converter/decode \
to Encode to base64: https://base64.guru/converter/encode 


**Sheet**: https://docs.google.com/spreadsheets/d/1vo23r_rPDHBNn28kUU_a5o_cm4dVOlwsqkAqex5FdNE/edit?gid=1818736609


Default Settings:
- Own tweaked Evolving Commanders based on Cortex, for fairplay. File: [Scavengers_tweakdefs.lua](Scavengers_tweakdefs.lua)
- Satellite Units. Buildable at "Experimental Aircraft Plant". File: [tweakunits.lua](tweakunits.lua)


### Sheet Settings:
- `ScavengerBoss Health` controls the Health of the EndBoss only. Files: [tweakdefs1.lua](tweakdefs1.lua)
- `Difficulty` is the modoption of Scavenger and tries to figure out some balancing of start-metal/energy and the spawn settings. Easy, Normal, Hard, Very Hard, Epic.
- `NuttyB Commanders` are the own & unchanged modified Commanders from NuttyB v1.49, which had some changes to buildoptions, weapons and evolving; "Evolving Commanders" gets disabled for this. Files: [tweakunits1.lua](tweakunits1.lua), [tweakunits2.lua](tweakunits2.lua), [tweakunits3.lua](tweakunits3.lua)
- `NuttyB Unit Mods` modifies alot of Units and Defs. Files: [tweakunits5.lua](tweakunits5.lua), [tweakdefs_NuttyB.lua](tweakdefs_NuttyB.lua)
- `Mega Nuke` Enables Nukes and modifies them. Files: [tweakunits4.lua](tweakunits4.lua)
- `Restrict wind turbines to 20 maximum` Files: [tweakunits6_on.lua](tweakunits6_on.lua), [tweakunits6_off.lua](tweakunits6_off.lua)
- `Plasma Turret Overhaul` modifies plasma based long range turrets. [Source](https://docs.google.com/document/d/161NSONfbjG5xxX-BAGhlQr7mtegCWjIFDjHs03qECC4/edit). Files: [tweakunits7.lua](tweakunits7.lua)
- `Boost first 60sec` modifies "Base Builder". [Source](https://discord.com/channels/549281623154229250/1254587358830137415/1254587358830137415). Files: [tweakdefs2.lua](tweakdefs2.lua)
- `Evolve Eco` Intended for Difficulty Epic! Files: [tweakdefs3.lua](tweakdefs3.lua)


### Settings description:
`Boost first 60sec`:\
"Base Builder" boosts metalmake=25, energymake=5000, storage=10000 and workertime=5 for the first 60 seconds, after which it evolves back to its normal values.

`Evolve Eco`:\
Note that this is only intended for difficulty Epic and cheats without upgrade costs... To have more time for building Defence.\
Evolution-Timer starts after each build, but is disabled if enemies are within range (in-combat state). Building also needs repair after evolved.
| From | To | Timer (seconds) |
|:---|:---|:---|
| Wind Turbine | Solar Collector | 60 |
| Solar Collector | Advanced Solar Collector | 120 |
| Advanced Solar Collector | Advanced Wind Turbine | 240 |
| Advanced Wind Turbine | Fusion Reactor | 300 |
| Fusion Reactor | Advanced Fusion Reactor | 360 |
| Tidal Generator | Naval Fusion Reactor | 300 |
| Dragon's Teeth | Fortification Wall | 360 |
| Construction Turret | Advanced Construction Turret | 120 |
| Naval Construction Turret | Advanced Naval Construction Turret | 120 |
| Water Air Repair Pad | Mission Command Tower`*` | 60 |

`*` = with Shield, just4fun.




## Credits
- [NuttyB](https://discord.com/channels/549281623154229250/1168959237641216131)
- [Plasma Turret Overhaul](https://discord.com/channels/549281623154229250/1267251807185535089)
- [Speedy Scavengers](https://discord.com/channels/549281623154229250/1254587358830137415/1254587358830137415)

***Paste Machine Sheet***: https://docs.google.com/spreadsheets/d/1vo23r_rPDHBNn28kUU_a5o_cm4dVOlwsqkAqex5FdNE/edit?gid=1818736609



# About this Project
While researching and looking at the NuttyB mod, I noticed a few inconsistencies, such as missing customisations for Armada or Legion.\
So I decided to develop an easy to use [Sheet](https://docs.google.com/spreadsheets/d/1vo23r_rPDHBNn28kUU_a5o_cm4dVOlwsqkAqex5FdNE/edit?gid=1818736609), like NuttyB provides, just for Scavenger.\
This should make the multiplayer more exciting and challenging.

The special feature is that all commanders have a shield with the same values, which improves with Evolving Commanders per level.\
As template i used [Cortex](https://github.com/beyond-all-reason/Beyond-All-Reason/blob/master/units/other/evocom/corcomlvl10.lua#L403), which already has a high-quality shield from the basic game.\

Ive added the Source-Lua-Code for every tweakdef or tweakunit to this repo.\
to Decode from, or Encode to base64: https://www.base64encode.org \


Default Settings:
- Own tweaked Evolving Commanders based on Cortex, for fairplay. File: [tweakdefs.lua](tweakdefs.lua)
- Satellite Units. Buildable at "Experimental Aircraft Plant". File: [tweakunits.lua](tweakunits.lua)



### Optional Settings:
- `ScavengerBoss Health` controls the Health of the EndBoss only. Files: [tweakdefs1.lua](tweakdefs1.lua)
- `Difficulty` is the modoption of Scavenger and tries to figure out some balancing of start-metal/energy and the spawn settings. Easy, Normal, Hard, Very Hard, Epic.
- `NuttyB Unit Mods` modifies alot of Units and Defs. Files: [tweakunits1.lua](tweakunits1.lua)
- `Mega Nuke` Enables Nukes and modifies them. Files: [tweakunits2.lua](tweakunits2.lua)
- `Plasma Turret Overhaul` modifies plasma based long range turrets. [Source](https://docs.google.com/document/d/161NSONfbjG5xxX-BAGhlQr7mtegCWjIFDjHs03qECC4/edit). Files: [tweakunits3.lua](tweakunits3.lua)
- `Boost first 80sec` modifies "Base Builder". [Source](https://discord.com/channels/549281623154229250/1254587358830137415/1254587358830137415). Files: [tweakdefs2.lua](tweakdefs2.lua)
- `Evolve Eco` Intended for Difficulty Epic! Files: [tweakdefs3.lua](tweakdefs3.lua)
- `Restrict Eco` Restrict Evolve Eco Units to each 10. Files: [tweakdefs4.lua](tweakdefs4.lua)



### Settings description:
`Boost first 80sec`:\
"Base Builder" boosts metalmake=50, energymake=5000, storage=10000 and workertime=5 for the first 80 seconds, after which it evolves back to its normal values.

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
| Geothermal Powerplant | Advanced Geothermal Powerplant | 360 |
| Tidal Generator | Naval Fusion Reactor | 300 |
| Metal Extractor | Advanced Metal Extractor | 360 |
| Dragon's Teeth | Fortification Wall | 360 |
| Construction Turret | Advanced Construction Turret | 120 |
| Naval Construction Turret | Advanced Naval Construction Turret | 120 |
| Water Air Repair Pad | Mission Command Tower`*` | 60 |

`*` = with Shield, just4fun.

`Restrict Eco`:\
For games with 4 or more players, to prevent game lags. Each Power Building from Wind Turbine till Fusion Reactor is restricted to a maximum of 20. Theres no Limit for Advanced Fusion Reactor!




## Credits
- [NuttyB](https://discord.com/channels/549281623154229250/1168959237641216131)
- [Plasma Turret Overhaul](https://discord.com/channels/549281623154229250/1267251807185535089)
- [Speedy Scavengers](https://discord.com/channels/549281623154229250/1254587358830137415/1254587358830137415)
- [mex & goe workaround](https://discord.com/channels/549281623154229250/858397131148623892/1272528312429842543)
# About this Project
While researching and looking at the NuttyB mod, I noticed a few inconsistencies, such as missing customisations for Armada or Legion. 
So I decided to develop an easy to use Google Sheet mask, like NuttyB provides, just for Scavenger.

The special feature is that all commanders have a shield with the same values, which improves with Evolving Commanders per level. 
As template i used [Cortex](https://github.com/beyond-all-reason/Beyond-All-Reason/blob/master/units/other/evocom/corcomlvl10.lua#L403), which already has a high-quality shield from the basic game.
However, this will get cancelled/overwritten when you activate "NuttyB Commanders".

Ive added the Source-Lua-Code for every tweakdef or tweakunit to this repo.
To Decode from base64 use: https://base64.guru/converter/decode
To Encode Lua to base64 use: https://base64.guru/converter/encode


**Sheet**: https://docs.google.com/spreadsheets/d/1vo23r_rPDHBNn28kUU_a5o_cm4dVOlwsqkAqex5FdNE/edit?gid=1818736609


Default Settings:
- Own tweaked Evolving Commanders based on Cortex, for fairplay.
- Satellite Units. Buildable at "Experimental Aircraft Plant".


### Settings:
- **ScavengerBoss Health** controls the Health of the EndBoss only. Files: [tweakdefs1.lua](tweakdefs1.lua)
- **Difficulty** is the modoption of Scavenger and tries to figure out some balancing of start-metal/energy and the spawn settings. Easy, Normal, Hard, Very Hard, Epic.
- **NuttyB Commagers** are the own modified Commanders from NuttyB v1.49, which had some changes to buildoptions, weapons and evolving; "Evolving Commanders" gets disabled for this. Files: [tweakunits1.lua](tweakunits1.lua), [tweakunits2.lua](tweakunits2.lua), [tweakunits3.lua](tweakunits3.lua)
- **NuttyB Unit Mods** modifies alot of Units and Defs. Files: [tweakunits5.lua](tweakunits5.lua), [tweakudefs_NuttyB.lua](tweakudefs_NuttyB.lua)
- **Mega Nuke** Enables Mukes and modifies them. Files: [tweakunits4.lua](tweakunits4.lua)
- **Restrict wind turbines to 20 maximum** Files: [tweakunits6_on.lua](tweakunits6_on.lua), [tweakunits6_off.lua](tweakunits6_off.lua)



## Credits
Source is based on [NuttyB](https://discord.com/channels/549281623154229250/1168959237641216131)
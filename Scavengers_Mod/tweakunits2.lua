{
    armcom = {
        customparams = {
            evolution_announcement = "Arm Commanders upgraded",
            evolution_announcement_size = 18.5,
            evolution_target = "legcomecon",
            evolution_condition = "timer",
            evolution_timer = 420,
            combatradius = 0,
            stockpilelimit = 5
        },
        energymake = 100,
        metalmake = 10,
        autoheal = 55,
        health = 4500,
        speed = 40,
        canresurrect = true,
        buildoptions = {
            [1] = "armsolar",
            [2] = "armwin",
            [3] = "armmstor",
            [4] = "armestor",
            [5] = "armmex",
            [6] = "armmakr",
            [7] = "armlab",
            [8] = "armvp",
            [9] = "armap",
            [10] = "armeyes",
            [11] = "armrad",
            [12] = "armdrag",
            [13] = "armllt",
            [14] = "armrl",
            [15] = "armdl",
            [16] = "armtide",
            [17] = "armuwms",
            [18] = "armuwes",
            [20] = "armfmkr",
            [21] = "armsy",
            [22] = "armfdrag",
            [23] = "armtl",
            [24] = "armfrt",
            [25] = "armfrad",
            [26] = "armhp",
            [27] = "armfhp",
            [29] = "armgeo",
            [30] = "armamex",
            [32] = "armhp",
            [35] = "armbeamer",
            [40] = "armjamt",
            [42] = "armsy",
            [43] = "armrectr"
        },
        weapondefs = {
            armcomlaser = {
                range = 320,
                rgbcolor = "0.7 1 1",
                damage = {
                default  = 155
                }
            },
            old_armsnipe_weapon = {
                areaofeffect = 32,
                avoidfeature = true,
                avoidfriendly = true,
                collidefeature = true,
                collidefriendly = false,
                corethickness = 0.75,
                craterareaofeffect = 0,
                craterboost = 0,
                commandfire = true,
                cratermult = 0,
                cegtag = "railgun",
                duration = 0.12,
                edgeeffectiveness = 0.85,
                energypershot = 400,
                explosiongenerator = "custom:laserhit-large-blue",
                firestarter = 100,
                impulseboost = 0.4,
                impulsefactor = 1,
                intensity = 0.8,
                name = "Long-range g2g armor-piercing rifle",
                range = 550,
                reloadtime = 1,
                rgbcolor = "0 1 1",
                rgbcolor2 = "0 1 1",
                soundhit = "sniperhit",
                soundhitwet = "sizzle",
                soundstart = "sniper3",
                soundtrigger = true,
                stockpile = true,
                stockpiletime = 10,
                texture1 = "shot",
                texture2 = "empty",
                thickness = 4,
                tolerance = 1000,
                turret = true,
                weapontype = "LaserCannon",
                weaponvelocity = 3000,
                damage = {
                    commanders = 100,
                default  = 4700
                }
            }
        },
        weapons = {
            [3] = {
                def = "old_armsnipe_weapon",
                onlytargetcategory = "NOTSUB"
            }
        }
    },
    legcomecon = {
        customparams = {
            evolution_announcement = "Eco Commanders upgraded",
            evolution_announcement_size = 18.5,
            evolution_target = "legcomt2def",
            evolution_condition = "timer",
            evolution_timer = 900,
            combatradius = 0,
            stockpilelimit = 8
        },
        speed = 57.5,
        health = 7000,
        autoheal = 90,
        buildpic = "ARMCOM.DDS",
        energymake = 315,
        metalmake = 20,
        builddistance = 175,
        workertime = 900,
        cancloak = true,
        canresurrect = true,
        buildoptions = {
            [1] = "armsolar",
            [2] = "armwin",
            [3] = "armmstor",
            [4] = "armestor",
            [5] = "armmex",
            [6] = "armmakr",
            [7] = "armlab",
            [8] = "armvp",
            [9] = "armap",
            [10] = "armeyes",
            [11] = "armrad",
            [12] = "armdrag",
            [13] = "armllt",
            [14] = "armrl",
            [15] = "armdl",
            [16] = "armtide",
            [17] = "armuwms",
            [18] = "armuwes",
            [20] = "armfmkr",
            [21] = "armsy",
            [22] = "armfdrag",
            [23] = "armtl",
            [24] = "armfrt",
            [25] = "armfrad",
            [26] = "armhp",
            [27] = "armfhp",
            [28] = "armadvsol",
            [29] = "armgeo",
            [30] = "armamex",
            [31] = "armnanotcplat",
            [32] = "armhp",
            [33] = "armnanotc",
            [34] = "armclaw",
            [35] = "armbeamer",
            [36] = "armhlt",
            [37] = "armguard",
            [38] = "armferret",
            [39] = "armcir",
            [40] = "armjamt",
            [41] = "armjuno",
            [42] = "armsy",
            [43] = "armrectr"
        },
        weapondefs = {
            armcomlaser = {
                areaofeffect = 16,
                avoidfeature = false,
                beamtime = 0.1,
                corethickness = 0.1,
                craterareaofeffect = 0,
                craterboost = 0,
                cratermult = 0,
                cylindertargeting = 1,
                edgeeffectiveness = 1,
                explosiongenerator = "custom:laserhit-small-red",
                firestarter = 70,
                impactonly = 1,
                impulseboost = 0,
                impulsefactor = 0,
                laserflaresize = 7.7,
                name = "Light close-quarters g2g/g2a laser",
                noselfdamage = true,
                range = 400,
                reloadtime = 0.4,
                rgbcolor = "0 1 1",
                soundhitdry = "",
                soundhitwet = "sizzle",
                soundstart = "lasrfir1",
                soundtrigger = 1,
                targetmoveerror = 0.05,
                thickness = 4,
                tolerance = 10000,
                turret = true,
                weapontype = "BeamLaser",
                weaponvelocity = 900,
                damage = {
                    bombers = 180,
                default  = 950, fighters = 110
                }
            },
            old_armsnipe_weapon = {
                areaofeffect = 42,
                avoidfeature = true,
                avoidfriendly = true,
                collidefeature = true,
                collidefriendly = false,
                corethickness = 0.75,
                craterareaofeffect = 0,
                craterboost = 0,
                commandfire = true,
                cratermult = 0,
                cegtag = "railgun",
                duration = 0.12,
                edgeeffectiveness = 0.85,
                energypershot = 700,
                explosiongenerator = "custom:laserhit-large-blue",
                firestarter = 100,
                impulseboost = 0.4,
                impulsefactor = 1,
                intensity = 1,
                name = "Long-range g2g armor-piercing rifle",
                range = 700,
                reloadtime = 1,
                rgbcolor = "0.2 0.1 1",
                rgbcolor2 = "0.2 0.1 1",
                soundhit = "sniperhit",
                soundhitwet = "sizzle",
                soundstart = "sniper3",
                soundtrigger = true,
                stockpile = true,
                stockpiletime = 7,
                texture1 = "shot",
                texture2 = "empty",
                thickness = 4,
                tolerance = 1000,
                turret = true,
                weapontype = "LaserCannon",
                weaponvelocity = 3000,
                damage = {
                    commanders = 10,
                default  = 11000
                }
            }
        },
        weapons = {
            [1] = {
                def = "armcomlaser",
                onlytargetcategory = "NOTSUB",
                fastautoretargeting = true
            },
            [3] = {
                def = "old_armsnipe_weapon",
                onlytargetcategory = "NOTSUB"
            }
        }
    },
    legcomt2def = {
        customparams = {
            stockpilelimit = 10
        },
        speed = 71.5,
        workertime = 1500,
        energymake = 2712,
        metalmake = 62,
        health = 10000,
        autoheal = 120,
        cancloak = true,
        canresurrect = true,
        builddistance = 250,
        buildpic = "ARMCOM.DDS",
        buildoptions = {
            [1] = "armanni",
            [2] = "armpb",
            [3] = "armamb",
            [4] = "armmoho",
            [5] = "armuwmme",
            [6] = "armflak",
            [7] = "armgate",
            [8] = "armsd",
            [9] = "armfort",
            [10] = "armtarg",
            [11] = "armarad",
            [12] = "armamd",
            [13] = "armveil",
            [14] = "armuwadvms",
            [15] = "armuwadves",
            [16] = "armmmkr",
            [17] = "armclaw",
            [18] = "armjuno",
            [20] = "armhp",
            [21] = "armsy",
            [22] = "armfdrag",
            [23] = "armtl",
            [24] = "armfrt",
            [25] = "armfrad",
            [26] = "armhp",
            [27] = "armlab",
            [28] = "armvp",
            [29] = "armap",
            [30] = "armsy",
            [31] = "armuwmmm",
            [32] = "armuwfus",
            [33] = "armplat",
            [34] = "armfdrag",
            [35] = "armfhlt",
            [36] = "armfflak",
            [37] = "armatl",
            [38] = "armkraken",
            [39] = "armnanotcplat",
            [40] = "armbrtha",
            [41] = "armannit3",
            [42] = "armlwall",
            [44] = "armnanotct2",
            [45] = "armafus",
            [46] = "armfus",
            [47] = "armckfus",
            [48] = "armraz",
            [49] = "armzeus",
            [50] = "armsnipe",
            [51] = "armvang",
            [52] = "armrectr"
        },
        weapondefs = {
            old_armsnipe_weapon = {
                areaofeffect = 64,
                avoidfeature = true,
                avoidfriendly = true,
                collidefeature = true,
                collidefriendly = false,
                corethickness = 0.75,
                craterareaofeffect = 0,
                craterboost = 0,
                commandfire = true,
                cratermult = 0,
                cegtag = "railgun",
                duration = 0.12,
                edgeeffectiveness = 1,
                energypershot = 2000,
                explosiongenerator = "custom:laserhit-large-blue",
                firestarter = 100,
                impulseboost = 0.4,
                impulsefactor = 1,
                intensity = 1.4,
                name = "Long-range g2g armor-piercing rifle",
                range = 1250,
                reloadtime = .5,
                rgbcolor = "0.4 0.1 0.7",
                rgbcolor2 = "0.4 0.1 0.7",
                soundhit = "sniperhit",
                soundhitwet = "sizzle",
                soundstart = "sniper3",
                soundtrigger = true,
                stockpile = true,
                stockpiletime = 3,
                texture1 = "shot",
                texture2 = "empty",
                thickness = 6,
                tolerance = 1000,
                turret = true,
                weapontype = "LaserCannon",
                weaponvelocity = 3000,
                damage = {
                    commanders = 10,
                default  = 40000
                }
            },
            armcomlaser = {
                areaofeffect = 20,
                avoidfeature = false,
                beamtime = 0.1,
                corethickness = 0.1,
                craterareaofeffect = 0,
                craterboost = 0,
                cratermult = 0,
                cylindertargeting = 1,
                edgeeffectiveness = 1,
                explosiongenerator = "custom:laserhit-small-red",
                firestarter = 70,
                impactonly = 1,
                impulseboost = 0,
                impulsefactor = 0,
                laserflaresize = 7.7,
                name = "Light close-quarters g2g/g2a laser",
                noselfdamage = true,
                range = 500,
                reloadtime = 0.4,
                rgbcolor = "0.1 0 1",
                soundhitdry = "",
                soundhitwet = "sizzle",
                soundstart = "lasrfir1",
                soundtrigger = 1,
                targetmoveerror = 0.05,
                thickness = 6,
                tolerance = 10000,
                turret = true,
                weapontype = "BeamLaser",
                weaponvelocity = 900,
                damage = {
                    bombers = 180,
                default  = 1450, fighters = 110
                }
            }
        },
        weapons = {
            [1] = {
                def = "armcomlaser",
                onlytargetcategory = "NOTSUB",
                fastautoretargeting = true
            },
            [3] = {
                def = "old_armsnipe_weapon",
                onlytargetcategory = "NOTSUB"
            }
        }
    }
}

{
    legcom = {
        energymake = 50,
        metalmake = 5,
        autoheal = 40,
        health = 5000,
        speed = 40,
        buildoptions = {
            [32] = "cornecro"
        },
        customparams = {
            stockpilelimit = 10,
            evolution_condition = "timer",
            evolution_timer = 420,
            combatradius = 0
        },
        weapondefs = {
            armcomlaser = {
                areaofeffect = 12,
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
                range = 320,
                reloadtime = 0.4,
                rgbcolor = "0 2 1",
                soundhitdry = "",
                soundhitwet = "sizzle",
                soundstart = "lasrfir1",
                soundtrigger = 1,
                targetmoveerror = 0.05,
                thickness = 3,
                tolerance = 10000,
                turret = true,
                weapontype = "BeamLaser",
                weaponvelocity = 900,
                damage = {
                    bombers = 180,
                default  = 125, fighters = 110, subs = 5
                }
            },
            shotgun = {
                areaofeffect = 60,
                energypershot = 0,
                avoidfeature = false,
                craterboost = 0,
                cratermult = 0,
                cameraShake = 0,
                edgeeffectiveness = 0.65,
                explosiongenerator = "custom:genericshellexplosion-small",
                impulseboost = 0.2,
                impulsefactor = 0.2,
                intensity = 3,
                name = "6 Gauge Shotgun",
                noselfdamage = true,
                predictboost = 1,
                projectiles = 6,
                range = 320,
                reloadtime = 2,
                rgbcolor = "1 0.75 0.25",
                size = 2,
                soundhit = "xplomed2xs",
                soundhitwet = "splsmed",
                soundstart = "kroggie2xs",
                soundstartvolume = 12,
                sprayangle = 3000,
                turret = true,
                commandfire = true,
                weapontimer = 1,
                weapontype = "Cannon",
                weaponvelocity = 600,
                stockpile = true,
                stockpiletime = 5,
                damage = {
                default  = 1200, commanders = 0
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
                def = "shotgun",
                onlytargetcategory = "SURFACE"
            }
        }
    },
    legcomlvl2 = {
        energymake = 150,
        metalmake = 15,
        speed = 55.5,
        customparams = {
            stockpilelimit = 15,
            combatradius = 0
        },
        buildoptions = {
            [1] = "cornecro",
            [2] = "coradvsol",
            [13] = "corhllt",
            [26] = "corageo",
            [27] = "cornanotc",
            [28] = "corjamt",
            [29] = "legdtf",
            [30] = "legmg",
            [31] = "cormadsam",
            [32] = "legdtl"
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
                range = 470,
                reloadtime = 0.4,
                rgbcolor = "0 0.95 0.05",
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
                default  = 600, fighters = 110, subs = 5
                }
            },
            shotgun = {
                areaofeffect = 65,
                energypershot = 0,
                avoidfeature = false,
                craterboost = 0,
                cratermult = 0,
                cameraShake = 0,
                edgeeffectiveness = 0.65,
                explosiongenerator = "custom:genericshellexplosion-small",
                impulseboost = 0.2,
                impulsefactor = 0.2,
                intensity = 3,
                name = "12 Gauge Shotgun",
                noselfdamage = true,
                predictboost = 1,
                projectiles = 7,
                range = 440,
                reloadtime = 2,
                rgbcolor = "1 0.75 0.25",
                size = 2.5,
                soundhit = "xplomed2xs",
                soundhitwet = "splsmed",
                soundstart = "kroggie2xs",
                soundstartvolume = 12,
                sprayangle = 3250,
                turret = true,
                commandfire = true,
                weapontimer = 1,
                weapontype = "Cannon",
                weaponvelocity = 600,
                stockpile = true,
                stockpiletime = 5,
                damage = {
                default  = 2200, commanders = 0
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
                def = "shotgun",
                onlytargetcategory = "SURFACE"
            }
        }
    },
    legcomlvl3 = {
        energymake = 1280,
        metalmake = 40,
        speed = 70.5,
        workertime = 700,
        customparams = {
            stockpilelimit = 20,
            combatradius = 0
        },
        buildoptions = {
            [1] = "corgate",
            [2] = "corfus",
            [3] = "coruwadvms",
            [4] = "coruwadves",
            [5] = "cormoho",
            [30] = "cormexp",
            [6] = "cormmkr",
            [10] = "corarad",
            [11] = "corshroud",
            [12] = "corscavfort",
            [13] = "corvipe",
            [14] = "cortoast",
            [15] = "legflak",
            [16] = "corfmd",
            [17] = "legbastion",
            [29] = "cornanotc",
            [32] = "cornecro",
            [33] = "legdtl",
            [34] = "legdtf"
        },
        weapondefs = {
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
                range = 650,
                reloadtime = 0.4,
                rgbcolor = "0 0.2 0.8",
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
                default  = 1050, fighters = 110, subs = 5
                }
            },
            shotgun = {
                areaofeffect = 70,
                energypershot = 0,
                avoidfeature = false,
                craterboost = 0,
                cratermult = 0,
                cameraShake = 0,
                edgeeffectiveness = 0.65,
                explosiongenerator = "custom:genericshellexplosion-small",
                impulseboost = 0.2,
                impulsefactor = 0.2,
                intensity = 3,
                name = "24 Gauge Shotgun",
                noselfdamage = true,
                predictboost = 1,
                projectiles = 8,
                range = 500,
                reloadtime = 1.5,
                rgbcolor = "1 0.75 0.25",
                size = 4,
                soundhit = "xplomed2xs",
                soundhitwet = "splsmed",
                soundstart = "kroggie2xs",
                soundstartvolume = 12,
                sprayangle = 3500,
                turret = true,
                commandfire = true,
                weapontimer = 1,
                weapontype = "Cannon",
                weaponvelocity = 600,
                stockpile = true,
                stockpiletime = 5,
                damage = {
                default  = 3600, commanders = 0
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
                def = "shotgun",
                onlytargetcategory = "SURFACE"
            }
        }
    },
    legcomlvl4 = {
        energymake = 1980,
        metalmake = 46,
        speed = 88.5,
        workertime = 1000,
        customparams = {
            stockpilelimit = 20
        },
        buildoptions = {
            [1] = "corgate",
            [2] = "corfus",
            [3] = "coruwadvms",
            [4] = "coruwadves",
            [5] = "cormoho",
            [6] = "cormmkr",
            [10] = "corarad",
            [11] = "corshroud",
            [12] = "corscavfort",
            [13] = "corvipe",
            [14] = "cortoast",
            [15] = "legflak",
            [16] = "corfmd",
            [17] = "legbastion",
            [29] = "cornanotc",
            [30] = "legpede",
            [31] = "corkorg",
            [32] = "corjugg",
            [33] = "cornecro",
            [34] = "corafus",
            [35] = "cormexp",
            [36] = "legdtl",
            [37] = "legdtf"
        },
        weapondefs = {
            armcomlaser = {
                areaofeffect = 26,
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
                range = 900,
                reloadtime = 0.4,
                rgbcolor = "0.45 0 1",
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
                default  = 1550, fighters = 110, subs = 5
                }
            },
            shotgun = {
                areaofeffect = 75,
                energypershot = 0,
                avoidfeature = false,
                craterboost = 0,
                cratermult = 0,
                cameraShake = 0,
                edgeeffectiveness = 0.65,
                explosiongenerator = "custom:genericshellexplosion-small",
                impulseboost = 0.2,
                impulsefactor = 0.2,
                intensity = 3,
                name = "60 Gauge Raptor Popper",
                noselfdamage = true,
                predictboost = 1,
                projectiles = 9,
                range = 550,
                reloadtime = 1,
                rgbcolor = "1 0.75 0.25",
                size = 5,
                soundhit = "xplomed2xs",
                soundhitwet = "splsmed",
                soundstart = "kroggie2xs",
                soundstartvolume = 12,
                sprayangle = 4000,
                turret = true,
                commandfire = true,
                weapontimer = 1,
                weapontype = "Cannon",
                weaponvelocity = 600,
                stockpile = true,
                stockpiletime = 4,
                damage = {
                default  = 4400, commanders = 0
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
                def = "shotgun",
                onlytargetcategory = "SURFACE"
            }
        }
    }
}

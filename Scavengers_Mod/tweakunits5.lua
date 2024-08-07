{
    cortron = {
        energycost = 42000,
        metalcost = 3600,
        buildtime = 120000,
        health = 12000,
        weapondefs = {
            cortron_weapon = {
                energypershot = 51000,
                metalpershot = 600,
                range = 3650,
                damage = {
                default  = 9000
                }
            }
        }
    },
    corfort = {
        repairable = true
    },
    armfort = {
        repairable = true
    },
    corscavfort = {
        repairable = true
    },
    armgate = {
        explodeas = "empblast",
        selfdestructas = "empblast"
    },
    corgate = {
        explodeas = "empblast",
        selfdestructas = "empblast"
    },
    corsat = {
        sightdistance = 3100,
        radardistance = 4080,
        cruisealtitude = 3300,
        energyupkeep = 1250
    },
    armsat = {
        sightdistance = 3100,
        radardistance = 4080,
        cruisealtitude = 3300,
        energyupkeep = 1250
    },
    legstarfall = {
        weapondefs = {
            starfire = {
                energypershot = 270000
            }
        }
    },
    armflak = {
        airsightdistance = 1350,
        energycost = 19000,
        metalcost = 1500,
        health = 4000,
        weapondefs = {
            armflak_gun = {
                range = 1100,
                reloadtime = 0.475,
                intensity = 0.38
            }
        }
    },
    armfflak = {
        airsightdistance = 1350,
        energycost = 25000,
        metalcost = 1500,
        health = 4000,
        weapondefs = {
            armflak_gun = {
                range = 1050,
                reloadtime = 0.475
            }
        }
    },
    corflak = {
        airsightdistance = 1350,
        energycost = 19000,
        metalcost = 1500,
        health = 4000,
        weapondefs = {
            armflak_gun = {
                areaofeffect = 300,
                range = 1350,
                reloadtime = 0.55,
                intensity = 0.38
            }
        }
    },
    corenaa = {
        airsightdistance = 1350,
        energycost = 25000,
        metalcost = 1500,
        health = 4000,
        weapondefs = {
            armflak_gun = {
                areaofeffect = 300,
                range = 1350,
                reloadtime = 0.55
            }
        }
    },
    legflak = {
        airsightdistance = 1350,
        energycost = 19000,
        metalcost = 1500,
        health = 4000,
        weapondefs = {
            legflak_gun = {
                areaofeffect = 100,
                burst = 3,
                range = 1050,
                reloadtime = 0.166,
                intensity = 0.38
            }
        }
    },
    armmercury = {
        airsightdistance = 2200,
        customparams = {
            stockpilelimit = 30
        },
        weapondefs = {
            arm_advsam = {
                areaofeffect = 500,
                energypershot = 2000,
                explosiongenerator = "custom:flak",
                flighttime = 1.5,
                metalpershot = 6,
                name = "Mid-r

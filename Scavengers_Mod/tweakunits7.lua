{
    corfgate = {
        energycost = 89000,
        metalcost = 4650,
    },
    armfgate = {
        energycost = 78000,
        metalcost = 3900,
    },
    armacsub = {
        buildoptions = {
            [16] = "armfgate",
        },
    },
    coracsub = {
        buildoptions = {
            [16] = "corfgate",
        },
    },
    corgate = {
        metalcost = 2800,
    },
    armgate = {
        metalcost = 2680,
    },
    armguard = {
        energycost = 8050,
        metalcost = 920,
        weapondefs = {
            plasma = {
                range = 745,
                reloadtime = 2.35,
            },
            plasma_high = {
                accuracy = 95,
                mygravity = 0.226,
                weaponvelocity = 540,
            },
        },
    },
    corpun = {
        energycost = 8500,
        metalcost = 970,
        weapondefs = {
            plasma = {
                range = 790,
                reloadtime = 2.66667,
            },
            plasma_high = {
                accuracy = 105,
                mygravity = 0.226,
                weaponvelocity = 520,
            },
        },
    },
    corbhmth = {
        weapondefs = {
            corbhmth_weapon = {
                mygravity = 0.1833,
                range = 1800,
                reloadtime = 5.5,
            },
        },
    },
    corint = {
        energycost = 77000,
        metalcost = 6000,
        weapondefs = {
            lrpc = {
                reloadtime = 7,
                accuracy = 750,
                range = 5200,
                energypershot = 7500,
                mygravity = 0.1900,
                areaofeffect = 224,
                weaponvelocity = 1050,
                damage = {
                default  = 1050,
                    shields = 840,
                },
            },
        },
    },
    armbrtha = {
        energycost = 66000,
        metalcost = 5000,
        weapondefs = {
            lrpc = {
                reloadtime = 10.5,
                accuracy = 200,
                range = 4900,
                areaofeffect = 112,
                weaponvelocity = 2050,
                energypershot = 9000,
                damage = {
                default  = 1250,
                    shields = 625,
                },
            },
        },
    },
    armvulc = {
        energycost = 750000,
        metalcost = 60000,
        buildtime = 1800000,
        weapondefs = {
            rflrpc = {
                accuracy = 350,
                areaofeffect = 112,
                energypershot = 12000,
                range = 5300,
                reloadtime = 0.75,
                weaponvelocity = 2500,
                damage = {
                    shields = 625,
                default  = 1250,
                },
            },
        },
    },
    corbuzz = {
        energycost = 860000,
        metalcost = 72000,
        buildtime = 1800000,
        weapondefs = {
            rflrpc = {
                reloadtime = 0.5,
                energypershot = 10000,
                areaofeffect = 224,
                accuracy = 1000,
                range = 5750,
                mygravity = 0.1900,
                weaponvelocity = 1050,
                damage = {
                default  = 1050,
                    shields = 840,
                },
            },
        },
    },
}

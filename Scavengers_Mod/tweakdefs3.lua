local toEvolve = {
    arm={
            {from="armwin", fromDesc="Wind Turbine", to="armsolar", toDesc="Solar Collector", timer=60},
            {from="armsolar", fromDesc="Solar Collector", to="armadvsol", toDesc="Advanced Solar Collector", timer=120},
            {from="armadvsol", fromDesc="Advanced Solar Collector", to="armwint2", toDesc="Advanced Wind Turbine", timer=240},
            {from="armwint2", fromDesc="Fusion Reactor", to="armfus", toDesc="Advanced Fusion Reactor", timer=360},
            {from="armfus", fromDesc="Fusion Reactor", to="armafus", toDesc="Advanced Fusion Reactor", timer=360},
            {from="armgeo", fromDesc="Geothermal Powerplant", to="armfakegeo", toDesc="-Workaround Fake Geo-", timer=360},
            {from="armfakegeo", fromDesc="-Workaround Fake Geo-", to="armageo", toDesc="Advanced Geothermal Powerplant", timer=2},
            {from="armtide", fromDesc="Tidal Generator", to="armuwfus", toDesc="Naval Fusion Reactor", timer=300},
            {from="armmex", fromDesc="Metal Extractor", to="armfakemex", toDesc="-Workaround Fake Mex-", timer=360},
            {from="armfakemex", fromDesc="-Workaround Fake Mex-", to="armmoho", toDesc="Advanced Metal Extractor", timer=2},
            {from="armdrag", fromDesc="Dragon's Teeth", to="armfort", toDesc="Fortification Wall", timer=360},
            {from="armnanotc", fromDesc="Construction Turret", to="armnanotct2", toDesc="Advanced Construction Turret", timer=120},
            {from="armnanotcplat", fromDesc="Naval Construction Turret", to="armnanotc2plat", toDesc="Advanced Naval Construction Turret", timer=120},
            {from="armfasp", fromDesc="Water Air Repair Pad", to="mission_command_tower", toDesc="Mission Command Tower", timer=60, announce=true, anSize=25},
        },
    cor={
            {from="corwin", fromDesc="Wind Turbine", to="corsolar", toDesc="Solar Collector", timer=60},
            {from="corsolar", fromDesc="Solar Collector", to="coradvsol", toDesc="Advanced Solar Collector", timer=120},
            {from="coradvsol", fromDesc="Advanced Solar Collector", to="corwint2", toDesc="Advanced Wind Turbine", timer=240},
            {from="corwint2", fromDesc="Advanced Wind Turbine", to="corfus", toDesc="Fusion Reactor", timer=300},
            {from="corfus", fromDesc="Fusion Reactor", to="corafus", toDesc="Advanced Fusion Reactor", timer=360},
            {from="corgeo", fromDesc="Geothermal Powerplant", to="corfakegeo", toDesc="-Workaround Fake Geo-", timer=360},
            {from="corfakegeo", fromDesc="-Workaround Fake Geo-", to="corageo", toDesc="Advanced Geothermal Powerplant", timer=2},
            {from="cortide", fromDesc="Tidal Generator", to="coruwfus", toDesc="Naval Fusion Reactor", timer=300},
            {from="cormex", fromDesc="Metal Extractor", to="corfakemex", toDesc="-Workaround Fake Mex-", timer=360},
            {from="corfakemex", fromDesc="-Workaround Fake Mex-", to="cormoho", toDesc="Advanced Metal Extractor", timer=2},
            {from="cordrag", fromDesc="Dragon's Teeth", to="corfort", toDesc="Fortification Wall", timer=360},
            {from="cornanotc", fromDesc="Construction Turret", to="cornanotct2", toDesc="Advanced Construction Turret", timer=120},
            {from="cornanotcplat", fromDesc="Naval Construction Turret", to="cornanotc2plat", toDesc="Advanced Naval Construction Turret", timer=120},
            {from="corfasp", fromDesc="Water Air Repair Pad", to="mission_command_tower", toDesc="Mission Command Tower", timer=60, announce=true, anSize=25},
        },
    leg={
            {from="legwin", fromDesc="Wind Turbine", to="legsolar", toDesc="Solar Collector", timer=60},
            {from="legsolar", fromDesc="Solar Collector", to="legadvsol", toDesc="Advanced Solar Collector", timer=120},
            {from="legadvsol", fromDesc="Advanced Solar Collector", to="corwint2", toDesc="Advanced Wind Turbine", timer=240},
            {from="legtide", fromDesc="Tidal Generator", to="coruwfus", toDesc="Naval Fusion Reactor", timer=300},
            {from="legmex", fromDesc="Metal Extractor", to="legfakemex", toDesc="-Workaround Fake Mex-", timer=360},
            {from="legfakemex", fromDesc="-Workaround Fake Mex-", to="legmoho", toDesc="Advanced Metal Extractor", timer=2},
            {from="legdrag", fromDesc="Dragon's Teeth", to="corfort", toDesc="Fortification Wall", timer=360},
        },
}
local description = {
    win="Wind Turbine", solar="Solar Collector", advsol="Advanced Solar Collector", wint2="Advanced Wind Turbine",
    fus="Fusion Reactor", afus="Advanced Fusion Reactor", geo="Geothermal Powerplant", ageo="Advanced Geothermal Powerplant",
    tide="Tidal Generator", uwfus="Naval Fusion Reactor", mex="Metal Extractor", moho="Advanced Metal Extractor",
    drag="Dragon's Teeth", fort="Fortification Wall", nanotc="Construction Turret", nanotct2="Advanced Construction Turret",
    nanotcplat="Naval Construction Turret", nanotc2plat="Advanced Naval Construction Turret",
    fasp="Water Air Repair Pad", mission_command_tower="Mission Command Tower"
}
UnitDefs["armfakemex"] = table.copy(UnitDefs["armmex"])
UnitDefs["armfakemex"].extractsmetal = 0
UnitDefs["armfakegeo"] = table.copy(UnitDefs["armgeo"])
UnitDefs["armfakegeo"].customparams.geothermal = nil
UnitDefs["corfakemex"] = table.copy(UnitDefs["cormex"])
UnitDefs["corfakemex"].extractsmetal = 0
UnitDefs["corfakegeo"] = table.copy(UnitDefs["corgeo"])
UnitDefs["corfakegeo"].customparams.geothermal = nil
UnitDefs["legfakemex"] = table.copy(UnitDefs["legmex"])
UnitDefs["legfakemex"].extractsmetal = 0
for unitName, unitData in pairs(UnitDefs) do
    faction = string.sub(unitName, 1, 3)
    for evoFaction,_ in pairs(toEvolve) do
        if faction == evoFaction then
            for _,evoEntry in ipairs(toEvolve[evoFaction]) do
                if unitName == evoEntry.from then
                    if evoEntry.announce == nil then evoEntry.announce = false end
                    unitData.customparams = unitData.customparams or {}
                    unitData.customparams.evolution_target = evoEntry.to
                    if evoEntry.announce == true then
                        unitData.customparams.evolution_announcement = string.format("%s evolved to %s!", evoEntry.fromDesc, evoEntry.toDesc)
                        unitData.customparams.evolution_announcement_size = evoEntry.anSize or 12.5
                    end
                    unitData.customparams.evolution_condition = "timer"
                    unitData.customparams.evolution_timer = evoEntry.timer or 120
                    unitData.customparams.evolution_health_transfer = "flat"
                end
            end
        end
    end
    if unitName == "mission_command_tower" then
        unitData.weapondefs = unitData.weapondefs or {}
        unitData.weapondefs["repulsor"] = {
            avoidfeature = false,
            texture1 = texture1 or {},
            texture1 = "Flame",
            craterareaofeffect = 0,
            craterboost = 0,
            cratermult = 0,
            edgeeffectiveness = ((unitData.health / 12000) + 0.04),
            name = "PlasmaRepulsor",
            range = 777,
            soundhitwet = "sizzle",
            weapontype = "Shield",
            damage = {default = 420},
            shield = {
                alpha = 0.2,
                armortype = "shields",
                force = (unitData.health / 4200) + 0.42,
                intercepttype = 128,
                power = ((unitData.health * 0.35) + 420),
                powerregen = 117526.5,
                powerregenenergy = 500,
                radius = 777,
                repulser = true,
                smart = true,
                startingpower = (unitData.health * 0.21),
                visible = true,
                visiblerepulse = true,
                badcolor = {[1] = 0.7, [2] = 0.1, [3] = 0.1, [4] = 0.2},
                goodcolor = {[1] = 1.1, [2] = 1.1, [3] = 1.1, [4] = 1}
            }
        }
        unitData.weapons = unitData.weapons or {}
        unitData.weapons[#unitData.weapons + 1] = {def = "REPULSOR", onlytargetcategory = "NOTSUB"}
    end
end

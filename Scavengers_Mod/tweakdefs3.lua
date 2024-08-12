local toEvolve = {
    arm={
            -- Energy
            {from="armwin", fromDesc="Wind Turbine", to="armsolar", toDesc="Solar Collector", timer=60},
            {from="armsolar", fromDesc="Solar Collector", to="armadvsol", toDesc="Advanced Solar Collector", timer=120},
            {from="armadvsol", fromDesc="Advanced Solar Collector", to="armwint2", toDesc="Advanced Wind Turbine", timer=240},
            {from="armwint2", fromDesc="Fusion Reactor", to="armfus", toDesc="Advanced Fusion Reactor", timer=360},
            {from="armfus", fromDesc="Fusion Reactor", to="armafus", toDesc="Advanced Fusion Reactor", timer=360},
            -- sadly geo and mex throws errors, so disabled for fairplay till devs fix this
            --{from="armgeo", fromDesc="Geothermal Powerplant", to="armageo", toDesc="Advanced Geothermal Powerplant", timer=360},
            {from="armtide", fromDesc="Tidal Generator", to="armuwfus", toDesc="Naval Fusion Reactor", timer=300},
            -- Metal
            --{from="armmex", fromDesc="Metal Extractor", to="armmoho", toDesc="Advanced Metal Extractor", timer=360},
            -- Wall
            {from="armdrag", fromDesc="Dragon's Teeth", to="armfort", toDesc="Fortification Wall", timer=360},
            -- other buildings
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
            --{from="corgeo", fromDesc="Geothermal Powerplant", to="corageo", toDesc="Advanced Geothermal Powerplant", timer=360},
            {from="cortide", fromDesc="Tidal Generator", to="coruwfus", toDesc="Naval Fusion Reactor", timer=300},
            --{from="cormex", fromDesc="Metal Extractor", to="cormoho", toDesc="Advanced Metal Extractor", timer=360},
            {from="cordrag", fromDesc="Dragon's Teeth", to="corfort", toDesc="Fortification Wall", timer=360},
            {from="cornanotc", fromDesc="Construction Turret", to="cornanotct2", toDesc="Advanced Construction Turret", timer=120},
            {from="cornanotcplat", fromDesc="Naval Construction Turret", to="cornanotc2plat", toDesc="Advanced Naval Construction Turret", timer=120},
            {from="corfasp", fromDesc="Water Air Repair Pad", to="mission_command_tower", toDesc="Mission Command Tower", timer=60, announce=true, anSize=25},
        },
    leg={
            {from="legwin", fromDesc="Wind Turbine", to="legsolar", toDesc="Solar Collector", timer=60},
            {from="legsolar", fromDesc="Solar Collector", to="legadvsol", toDesc="Advanced Solar Collector", timer=120},
            -- legion uses cortex after legadvsol
            {from="legadvsol", fromDesc="Advanced Solar Collector", to="corwint2", toDesc="Advanced Wind Turbine", timer=240},
            {from="legtide", fromDesc="Tidal Generator", to="coruwfus", toDesc="Naval Fusion Reactor", timer=300},
            --{from="legmex", fromDesc="Metal Extractor", to="armmoho", toDesc="Advanced Metal Extractor", timer=360},
            {from="legdrag", fromDesc="Dragon's Teeth", to="corfort", toDesc="Fortification Wall", timer=360},
        },
}
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
                    --unitData.customparams.combatRadius = 117
                    unitData.customparams.evolution_health_transfer = "flat"
                end
            end
        end
    end
    -- add Shield for Mission Command Tower. just4fun.
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

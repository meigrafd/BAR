local toEvolve = {
    arm={{from="armwin", fromDesc="Wind Turbine", to="armsolar", toDesc="Solar Collector", timer=60, announce=false, anSize=15.5},
            {from="armsolar", fromDesc="Solar Collector", to="armadvsol", toDesc="Advanced Solar Collector", timer=120, announce=false, anSize=12.5},
            {from="armadvsol", fromDesc="Advanced Solar Collector", to="armfus", toDesc="Fusion Reactor", timer=240, announce=false, anSize=12.5},
            {from="armfus", fromDesc="Fusion Reactor", to="armafus", toDesc="Advanced Fusion Reactor", timer=340, announce=false, anSize=15.5},
        },
    cor={{from="corwin", fromDesc="Wind Turbine", to="corsolar", toDesc="Solar Collector", timer=60, announce=false, anSize=15.5},
            {from="corsolar", fromDesc="Solar Collector", to="coradvsol", toDesc="Advanced Solar Collector", timer=120, announce=false, anSize=12.5},
            {from="coradvsol", fromDesc="Advanced Solar Collector", to="corfus", toDesc="Fusion Reactor", timer=240, announce=false, anSize=12.5},
            {from="corfus", fromDesc="Fusion Reactor", to="corafus", toDesc="Advanced Fusion Reactor", timer=340, announce=false, anSize=15.5},
        },
    leg={{from="legwin", fromDesc="Wind Turbine", to="legsolar", toDesc="Solar Collector", timer=60, announce=false, anSize=15.5},
            {from="legsolar", fromDesc="Solar Collector", to="legadvsol", toDesc="Advanced Solar Collector", timer=120, announce=false, anSize=12.5},
            -- legion uses cortex fus and afus
            {from="legadvsol", fromDesc="Advanced Solar Collector", to="corfus", toDesc="Fusion Reactor", timer=240, announce=false, anSize=12.5},
            {from="corfus", fromDesc="Fusion Reactor", to="corafus", toDesc="Advanced Fusion Reactor", timer=340, announce=false, anSize=15.5},
        },
}
for unitName, unitData in pairs(UnitDefs) do
    faction = string.sub(unitName, 1, 3)
    for evoFaction,_ in pairs(toEvolve) do
        if faction == evoFaction then
            for _,evoEntry in ipairs(toEvolve[evoFaction]) do
                if unitName == evoEntry["from"] then
                    unitData.customparams = unitData.customparams or {}
                    unitData.customparams.evolution_target = evoEntry["to"]
                    if evoEntry["announce"] then
                        unitData.customparams.evolution_announcement = string.format("%s evolved to %s!", evoEntry["fromDesc"], evoEntry["toDesc"])
                        unitData.customparams.evolution_announcement_size = evoEntry["anSize"] or 12.5
                    end
                    unitData.customparams.evolution_condition = "timer"
                    unitData.customparams.evolution_timer = evoEntry["timer"]
                    unitData.customparams.combatradius = 117
                    unitData.customparams.evolution_health_transfer = "flat"
                end
            end
        end
    end
end

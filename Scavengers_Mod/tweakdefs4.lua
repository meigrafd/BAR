local limitToEvolve = {
    arm={
            {from="armwin", limit=10},{from="armsolar", limit=10},{from="armadvsol", limit=10},{from="armwint2", limit=10},{from="armfus", limit=10},{from="armgeo", limit=10},
            {from="armtide", limit=10},{from="armmex", limit=10},{from="armdrag", limit=10},{from="armnanotc", limit=10},{from="armnanotcplat", limit=10},{from="armfasp", limit=10},
        },
    cor={
            {from="corwin", limit=10},{from="corsolar", limit=10},{from="coradvsol", limit=10},{from="corwint2", limit=10},{from="corfus", limit=10},{from="corgeo", limit=10},
            {from="cortide", limit=10},{from="cormex", limit=10},{from="cordrag", limit=10},{from="cornanotc", limit=10},{from="cornanotcplat", limit=10},{from="corfasp", limit=10},
        },
    leg={
            {from="legwin", limit=10},{from="legsolar", limit=10},{from="legadvsol", limit=10},{from="legtide", limit=10},{from="legmex", limit=10},{from="legdrag", limit=10},
        },
}
for unitName, unitData in pairs(UnitDefs) do
    faction = string.sub(unitName, 1, 3)
    for evoFaction,_ in pairs(limitToEvolve) do
        if faction == evoFaction then
            for _,evoEntry in ipairs(limitToEvolve[evoFaction]) do
                if unitName == evoEntry.from then
                    if evoEntry.limit ~= nil then unitName.unitrestricted = evoEntry.limit end
                end
            end
        end
    end
end

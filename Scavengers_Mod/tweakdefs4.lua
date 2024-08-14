local limitToEvolve = {
    arm={
            {from="armwin", limit=20},{from="armsolar", limit=20},{from="armadvsol", limit=20},{from="armwint2", limit=20},{from="armfus", limit=20},{from="armtide", limit=20},
        },
    cor={
            {from="corwin", limit=20},{from="corsolar", limit=20},{from="coradvsol", limit=20},{from="corwint2", limit=20},{from="corfus", limit=20},{from="cortide", limit=20},
        },
    leg={
            {from="legwin", limit=20},{from="legsolar", limit=20},{from="legadvsol", limit=20},{from="legtide", limit=20},
        },
}
for unitName, unitData in pairs(UnitDefs) do
    faction = string.sub(unitName, 1, 3)
    for evoFaction,_ in pairs(limitToEvolve) do
        if faction == evoFaction then
            for _,evoEntry in ipairs(limitToEvolve[evoFaction]) do
                if unitName == evoEntry.from then
                    if evoEntry.limit ~= nil then unitData.maxthisunit = evoEntry.limit end
                end
            end
        end
    end
end

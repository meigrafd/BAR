UnitDefs["armrespawn2"] = table.copy(UnitDefs["armrespawn"])
UnitDefs["armrespawn2"].customparams.i18nfromunit = "armrespawn"
UnitDefs["correspawn2"] = table.copy(UnitDefs["correspawn"])
UnitDefs["correspawn2"].customparams.i18nfromunit = "correspawn"
-- legion uses correspawn

local _announcement = "Base Builder: build power and resource boost expired!"

for name, ud in pairs(UnitDefs) do
    if name == "armrespawn" then
        ud.customparams.evolution_announcement = _announcement
        ud.customparams.evolution_announcement_size = 18.5
        ud.customparams.evolution_health_transfer = "percentage"
        ud.customparams.evolution_target = "armrespawn2"
        ud.customparams.evolution_condition = "timer"
        ud.customparams.evolution_timer = 60
        ud.metalmake = 25
        ud.energymake = 5000
        ud.metalstorage = 10000
        ud.energystorage = 10000
        ud.workertime = ud.workertime*5
    end
    if name == "correspawn" then
        ud.customparams.evolution_announcement = _announcement
        ud.customparams.evolution_announcement_size = 18.5
        ud.customparams.evolution_health_transfer = "percentage"
        ud.customparams.evolution_target = "correspawn2"
        ud.customparams.evolution_condition = "timer"
        ud.customparams.evolution_timer = 60
        ud.metalmake = 25
        ud.energymake = 5000
        ud.metalstorage = 10000
        ud.energystorage = 10000
        ud.workertime = ud.workertime*5
    end
end

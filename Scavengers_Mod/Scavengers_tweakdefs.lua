local UnitDefs = UnitDefs or {}
local function a(b, c)
    for d, e in pairs(c) do
        if type(e) == "table" and type(b[d]) == "table" then
            a(b[d], e)
        else
            b[d] = e
        end
    end
end
function deepCopy(c, f)
    f = f or {}
    local g = {}
    f[c] = g
    for d, e in pairs(c) do
        if type(e) == "table" then
            g[d] = f[e] or deepCopy(e, f)
        else
            g[d] = e
        end
    end
    return g
end
function addWeapon(h, i, j)
    UnitDefs[h] = UnitDefs[h] or {}
    UnitDefs[h].weapons = UnitDefs[h].weapons or {}
    UnitDefs[h].weapondefs = UnitDefs[h].weapondefs or {}
    UnitDefs[h].customparams = UnitDefs[h].customparams or {}
    local k = "repulsor"
    table.insert(UnitDefs[h].weapons, {def = k, onlytargetcategory = j or ""})
    UnitDefs[h].weapondefs[k] = i
    if i.shield and i.shield.power > 0 then
        i.range = i.shield.radius
        UnitDefs[h].customparams = UnitDefs[h].customparams or {}
        a(
            UnitDefs[h].customparams,
            {
                off_on_stun = "true",
                shield_color_mult = 0.8,
                shield_power = i.shield.power,
                shield_radius = i.shield.radius
            }
        )
    end
end
local l = {
    avoidfeature = false,
    craterareaofeffect = 0,
    craterboost = 0,
    cratermult = 0,
    edgeeffectiveness = 0.15,
    name = "PlasmaRepulsor",
    range = 50,
    soundhitwet = "sizzle",
    weapontype = "Shield",
    damage = {default = 100},
    shield = {
        alpha = 0.15,
        armortype = "shields",
        energyuse = 1,
        force = 2.5,
        intercepttype = 1,
        power = 500,
        powerregen = 3,
        powerregenenergy = 5,
        radius = 50,
        repulser = true,
        smart = true,
        startingpower = 100,
        visiblerepulse = true,
        badcolor = {1, 0.2, 0.2, 0.2},
        goodcolor = {0.2, 1, 0.2, 0.17}
    }
}
local commanders = {
    "armcom",
    "armcomlvl2",
    "armcomlvl3",
    "armcomlvl4",
    "armcomlvl5",
    "armcomlvl6",
    "armcomlvl7",
    "armcomlvl8",
    "armcomlvl9",
    "armcomlvl10",
    "corcom",
    "corcomlvl2",
    "corcomlvl3",
    "corcomlvl4",
    "corcomlvl5",
    "corcomlvl6",
    "corcomlvl7",
    "corcomlvl8",
    "corcomlvl9",
    "corcomlvl10",
    "legcom",
    "legcomlvl2",
    "legcomlvl3",
    "legcomlvl4",
    "legcomlvl5",
    "legcomlvl6",
    "legcomlvl7",
    "legcomlvl8",
    "legcomlvl9",
    "legcomlvl10"
}
for _, com in ipairs(commanders) do
    local o = deepCopy(l)
    local comN = string.sub(com, 1, 3)
    if comN == "arm" then
        o.shield.alpha = 0.25
    elseif comN == "cor" then
        o.shield.alpha = 0.17
    elseif comN == "leg" then
        o.shield.alpha = 0.15
    end
    o.shield.power = 700
    o.shield.radius = 100
    o.shield.powerregen = 20
    o.shield.powerregenenergy = 0
    if string.sub(com, -4, -2) == "lvl" then
        local n = tonumber(string.sub(com, -1))
        if type(n)=="number" then
            o.shield.power = o.shield.power + (1000*n)
            o.shield.powerregen = o.shield.powerregen + (50*n)
            o.shield.powerregenenergy = o.shield.powerregenenergy + (10*n)
        end
    elseif string.sub(com, -5) == "lvl10" then
        o.shield.power = 30000
        o.shield.powerregen = 500
        o.shield.powerregenenergy = 100
    end
    addWeapon(com, o)
end
if UnitDefs then
    UnitDefs.armcom.featuredefs.dead.reclaimable = false
    UnitDefs.armcom.featuredefs.dead.damage = 57600
    UnitDefs.corcom.featuredefs.dead.reclaimable = false
    UnitDefs.corcom.featuredefs.dead.damage = 57600
    UnitDefs.legcom.featuredefs.dead.reclaimable = false
    UnitDefs.legcom.featuredefs.dead.damage = 57600
end

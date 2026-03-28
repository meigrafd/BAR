function widget:GetInfo()
    return {
        name = "Auto Retreat",
        desc = "Retreats units to a designated location on low HP",
        author = "PureTilt, Yami, meigrafd",
        date = "March 2026",
        version = "1.3",
        license = "GNU GPL, v2 or later",
        layer = 1000,
        enabled = true,
        handler = true,
    }
end

-----------------------------------------------------------------------
--- Changelog
-----------------------------------------------------------------------
--[[

v1.3:
    - Fixed GiveOrderToUnit and Keybinds
    - Improved Performance

v1.2:
    - Added hotkeys to script. No need to modify/create uikeys.txt file. Currently the hotkeys are hardcoded:
        - => Set Retreat Point
        . => Unignore Selected Units
        , => Ignore Selected Units
        while holding LeftAlt:
            - => Return After Retreat
            . => Increase Retreat Threshold
            , => Decrease Retreat Threshold
    - Added support for Legion: units to be ignored.
    - Code cleanups and optimizations.


v1.0:
        Original Script by PureTilt @ BAR-Discord.
        Modified by Yami @ BAR-Discord, who sadly left the discord.

]]--

-- ====================================================================
-- SETTINGS
-- ====================================================================

-- Determines the exact health percentage (0.0 to 1.0) at which a unit is 
-- automatically ordered to retreat to the nearest healing or safe zone.
local retreatHealthThreshold = 0.45

-- Defines whether the auto-retreat functionality is currently active globally.
local autoRetreatEnabled = true

-- If true, units will return to their original position after being fully healed.
local returnAfterRetreatOn = false

-- Radius of the gather/retreat point on the ground.
local markerRadius = 200

-- Keyboard key codes
-- https://github.com/beyond-all-reason/Beyond-All-Reason/blob/master/luaui/Headers/keysym.h.lua
local KEY_MINUS = 45
local KEY_PERIOD = 46
local KEY_COMMA = 44

-- ====================================================================
-- INTERNAL VARIABLES & CACHE
-- ====================================================================

local retreatingUnits = {}
local unitGroup = {}
local probedDefs = {}
local ignoredDefs = {}
local ignoredUnits = {}
local gatherPoint = nil
local myTeam = nil

-- Caching Lua API functions for performance
local glLineWidth       = gl.LineWidth
local glPushMatrix      = gl.PushMatrix
local glPopMatrix       = gl.PopMatrix
local glBlending        = gl.Blending
local glBeginEnd        = gl.BeginEnd
local glColor           = gl.Color
local glVertex          = gl.Vertex
local GL_LINE_LOOP      = GL.LINE_LOOP
local GL_SRC_ALPHA      = GL.SRC_ALPHA
local GL_ONE_MINUS_SRC_ALPHA = GL.ONE_MINUS_SRC_ALPHA
local sin, cos, pi      = math.sin, math.cos, math.pi

local GetSelectedUnits  = Spring.GetSelectedUnits
local GetUnitDefID      = Spring.GetUnitDefID
local GetUnitHealth     = Spring.GetUnitHealth
local GetMouseState     = Spring.GetMouseState
local TraceScreenRay    = Spring.TraceScreenRay
local GetUnitPosition   = Spring.GetUnitPosition
local GetMyTeamID       = Spring.GetMyTeamID
local DeselectUnit      = Spring.DeselectUnit
local GiveOrderToUnit   = Spring.GiveOrderToUnit
local GetUnitGroup      = Spring.GetUnitGroup
local SetUnitGroup      = Spring.SetUnitGroup
local GetSpectatingState = Spring.GetSpectatingState
local Echo              = Spring.Echo

-- List of unit IDs to ignore
local ignoredDefsIDs = {
    "armflea",  -- bot Tick
    "armpw",    -- bot Pawn
    "armfast",  -- bot Sprinter
    "armflash", -- vehicle Blitz
    "armfav",   -- vehicle Rover
    "corak",    -- bot Grunt
    "corfav",   -- vehicle Rascal
    "leggob",   -- bot Goblin
    "leglob",   -- bot Lobber
    "leghades", -- vehicle Alaris
    "legscout"  -- vehicle Wheelie
}

-- ====================================================================
-- INITIALIZATION & UNIT PROBING
-- ====================================================================

function widget:Initialize()
    for _, name in ipairs(ignoredDefsIDs) do ignoredDefs[name] = true end

    for defID, udef in pairs(UnitDefs) do
        if not ignoredDefs[udef.name] then
            local isMobile = (udef.canMove and udef.speed > 0.1) or (udef.name:find("nanotc"))
            local hasBuildOptions = udef.buildOptions and (#udef.buildOptions > 0)
            local isCombat = not (udef.canReclaim or udef.canRepair or hasBuildOptions)
            local tooFat = udef.health ~= nil and udef.health >= 10000
            
            --if isMobile and not udef.canFly and not isCombat and not tooFat then
            if isMobile and not udef.canFly then
                probedDefs[defID] = true
            end
        end
    end
    
    myTeam = GetMyTeamID()
end

-- ====================================================================
-- CORE FUNCTIONS
-- ====================================================================

local function isHealer(unitID)
    local unitDefID = GetUnitDefID(unitID)
    if not unitDefID then return false end
    local unitDef = UnitDefs[unitDefID]
    if not unitDef then return false end
    return unitDef.canRepair and not (unitDef.customParams and unitDef.customParams.iscommander)
end

local function SetRetreatPoint()
    local mouseX, mouseY = GetMouseState()
    local _, pos = TraceScreenRay(mouseX, mouseY, true)
    if not pos then return end

    -- Check if we are clicking near the existing gather point to remove it
    if gatherPoint ~= nil and ((pos[1] - gatherPoint[1])^2 + (pos[3] - gatherPoint[3])^2 <= markerRadius^2) then
        gatherPoint = nil
        for unitID, _ in pairs(retreatingUnits) do
            if unitGroup[unitID] ~= nil then
                SetUnitGroup(unitID, unitGroup[unitID])
            end
            retreatingUnits[unitID] = nil
        end
        Echo("Auto-Retreat: Point cleared.")
    else
        gatherPoint = pos
        Echo("Auto-Retreat: Point set.")
        -- Order healers to the point
        local selectedUnits = GetSelectedUnits()
        for _, unitID in ipairs(selectedUnits) do
            if isHealer(unitID) then
                GiveOrderToUnit(unitID, CMD.REPEAT, { 1 }, {})
                GiveOrderToUnit(unitID, CMD.MOVE, { pos[1], pos[2], pos[3] }, {})
                GiveOrderToUnit(unitID, CMD.REPAIR, { pos[1], pos[2], pos[3], markerRadius + 20 }, { "shift" })
            end
        end
    end
    return true
end

local function ToggleReturnAfterRetreat()
    returnAfterRetreatOn = not returnAfterRetreatOn
    Echo("Return after retreat: " .. (returnAfterRetreatOn and "On" or "Off"))
    return true
end

local function ChangeRetreatThreshold(delta)
    retreatHealthThreshold = math.max(0, math.min(1, retreatHealthThreshold + delta))
    Echo("Retreat Threshold: " .. string.format("%.0f", retreatHealthThreshold * 100) .. "%")
end

-- ====================================================================
-- ENGINE CALLOUTS
-- ====================================================================

function widget:PlayerChanged(playerID)
    if GetSpectatingState() then
        widgetHandler:RemoveWidget()
        return
    end
    myTeam = GetMyTeamID()
end

function widget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer)
    if not unitID or unitID <= 0 then return end
    if not autoRetreatEnabled or not gatherPoint then return end
    if unitTeam ~= myTeam then return end
    if not probedDefs[unitDefID] or ignoredUnits[unitID] then return end
    if retreatingUnits[unitID] then return end
    
    local curHealth, maxHealth = GetUnitHealth(unitID)
    if not curHealth or not maxHealth or maxHealth <= 0 then return end
    
    local hp = curHealth / maxHealth
    if hp < retreatHealthThreshold then
        local x, y, z = GetUnitPosition(unitID)
        if not x then return end

        DeselectUnit(unitID)
        unitGroup[unitID] = GetUnitGroup(unitID)
        retreatingUnits[unitID] = { retreating = true, origPos = {x, y, z} }
        Echo("Auto-Retreat: Unit returning to RepairZone!")
        -- Clean order execution, empty options array instead of invalid "space" string
        GiveOrderToUnit(unitID, CMD.MOVE, { gatherPoint[1], gatherPoint[2], gatherPoint[3] }, {})
        SetUnitGroup(unitID, -1)
    end
end

function widget:UnitDestroyed(unitID)
    if not unitID then return end
    ignoredUnits[unitID] = nil
    retreatingUnits[unitID] = nil
    unitGroup[unitID] = nil
end

function widget:GameFrame(gameFrame)
    if not autoRetreatEnabled or not gatherPoint then return end
    gameFrame = gameFrame or 0
    self.frameCount = (self.frameCount or 0) + 1
    
    -- Run health checks every 10 frames to save performance
    if gameFrame % 10 == 0 and autoRetreatEnabled then
        for unitID, data in pairs(retreatingUnits) do
            if unitID <= 0 then
                retreatingUnits[unitID] = nil
            end
            local curHealth, maxHealth = GetUnitHealth(unitID)
            -- Check if fully healed (using 0.98 to account for decimal rounding)
            if not curHealth or not maxHealth or maxHealth <= 0 then
                retreatingUnits[unitID] = nil
            elseif curHealth / maxHealth >= 0.98 then
                if unitGroup[unitID] ~= nil then
                    SetUnitGroup(unitID, unitGroup[unitID])
                end
                if returnAfterRetreatOn and data.origPos then
                    local origPos = data.origPos
                    GiveOrderToUnit(unitID, CMD.MOVE, { origPos[1], origPos[2], origPos[3] }, {})
                end
                retreatingUnits[unitID] = nil
            elseif curHealth / maxHealth < retreatHealthThreshold then
                local x, y, z = GetUnitPosition(unitID)
                if x then
                    DeselectUnit(unitID)
                    SetUnitGroup(unitID, -1)
                    GiveOrderToUnit(unitID, CMD.MOVE, { gatherPoint[1], gatherPoint[2], gatherPoint[3] }, {})
                    retreatingUnits[unitID].retreating = true
                end
            end
        end
    end
end

-- Monitor retreating units every frame
function widget:IsFinishedLoading()
    self.frameCount = 0
end

-- ====================================================================
-- HOTKEY MANAGEMENT
-- ====================================================================

function widget:KeyPress(key, modifier, isRepeat)
    if isRepeat then return false end
    local alt = modifier and modifier.alt
    local control = modifier and modifier.control
    local shift = modifier and modifier.shift
    
    -- Key '-' (Minus/Dash)
    if key == KEY_MINUS or key == 269 then 
        if alt and not control and not shift then
            ToggleReturnAfterRetreat()
        else
            SetRetreatPoint()
        end
        return true
    -- Key '.' (Dot/Period)
    elseif key == KEY_PERIOD then 
        if alt and not control and not shift then
            ChangeRetreatThreshold(0.1)
        else 
            local selectedUnits = GetSelectedUnits()
            for i=1, #selectedUnits do ignoredUnits[selectedUnits[i]] = false end
            Echo("Auto-Retreat: Units un-ignored.")
        end
        return true
    -- Key ',' (Comma)
    elseif key == KEY_COMMA then
        if alt and not control and not shift then
            ChangeRetreatThreshold(-0.1)
        else
            local selectedUnits = GetSelectedUnits()
            for i=1, #selectedUnits do ignoredUnits[selectedUnits[i]] = true end
            Echo("Auto-Retreat: Units ignored.")
        end
        return true
    end

    return false
end

-- ====================================================================
-- RENDERING
-- ====================================================================

function widget:DrawWorldPreUnit()
    -- Only render if a gather point has been set by the user
    if not gatherPoint or not gatherPoint[1] then return end
    
    -- Blending ensures the circle looks smooth and semi-transparent
    gl.Blending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
    
    -- Greenish color with 60% opacity for better visibility on different maps
    gl.Color(0.3, 1.0, 0.3, 0.6)
    gl.LineWidth(3.0)
    
    -- DrawGroundCircle is the modern, optimized replacement for the old 
    -- manual vertex loops and texture-based backgrounds (bgTexture).
    gl.DrawGroundCircle(gatherPoint[1], gatherPoint[2], gatherPoint[3], markerRadius, 32)
    
    -- Reset color and matrix to prevent leaking styles to other widgets
    -- === CRITICAL: Restore OpenGL state ===
    gl.Color(1.0, 1.0, 1.0, 1.0)
    gl.LineWidth(1.0)
    gl.Blending(false) -- Turns blending off safely
end

function widget:DrawWorldPreUnit_old()
    if not gatherPoint then return end

    gl.Blending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
    gl.Color(0.3, 1.0, 0.3, 0.8)
    gl.LineWidth(3.0)
    
    local function DrawCircle()
        for i = 1, 64 do
            local angle = (i - 1) * 2 * pi / 64
            gl.Vertex(gatherPoint[1] + markerRadius * sin(angle), gatherPoint[2], gatherPoint[3] + markerRadius * cos(angle))
        end
    end
    
    gl.BeginEnd(GL_LINE_LOOP, DrawCircle)
end

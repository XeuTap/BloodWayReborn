modifier_creep_ai = class({})

local AI_STATE_IDLE = 0
local AI_STATE_AGGRESSIVE = 1
local AI_STATE_RETURNING = 2

local AI_THINK_INTERVAL = 0.5

function modifier_creep_ai:OnCreated(params)
    -- Only do AI on server
    if IsServer() then
        -- Set initial state
        self.state = AI_STATE_IDLE

        -- Store parameters from AI creation:
        -- unit:AddNewModifier(caster, ability, "modifier_creep_ai", { aggroRange = X, leashRange = Y })
        self.aggroRange = params.aggroRange
        self.leashRange = params.leashRange
        

        -- Store unit handle so we don't have to call self:GetParent() every time
        self.unit = self:GetParent()


        -- Set state -> action mapping
        self.stateActions = {
            [AI_STATE_IDLE] = self.IdleThink,
            [AI_STATE_AGGRESSIVE] = self.AggressiveThink,
            [AI_STATE_RETURNING] = self.ReturningThink,
        }

        -- Start thinking
        self:StartIntervalThink(AI_THINK_INTERVAL)

    end
end

function modifier_creep_ai:DeclareFunctions()
    local funcs = 
    {
        MODIFIER_EVENT_ON_TAKEDAMAGE,
        MODIFIER_EVENT_ON_UNIT_MOVED,
    }
    return funcs
end

function modifier_creep_ai:OnUnitMoved(data)
    if IsServer() then
        local movedUnit = data.unit
        if self.unit ~= movedUnit then
            return
        end
        if not self.spawnPos then return end
        if (self.spawnPos - self.unit:GetAbsOrigin()):Length() > self.leashRange then
            self.state = AI_STATE_RETURNING
        end
    end
end

function modifier_creep_ai:OnTakeDamage(params)
    local attackedUnit = params.unit
    local hTarget = params.attacker
    if not hTarget then return end
    if IsServer() and self.unit == attackedUnit then
        if self.state == AI_STATE_RETURNING then return end
        self.unit:MoveToTargetToAttack(hTarget)
        self.aggroTarget = hTarget
    end
end

function modifier_creep_ai:OnIntervalThink()
    -- Execute action corresponding to the current state
    self.stateActions[self.state](self)    
end

function modifier_creep_ai:IdleThink()
    if not self.spawnPos then
        print("Set spawn pos")
        self.spawnPos = self.unit:GetAbsOrigin()
    end
    -- Find any enemy units around the AI unit inside the aggroRange
    if self:AcquireTarget() then
        self.unit:MoveToTargetToAttack(self.aggroTarget) --Start attacking
        self.state = AI_STATE_AGGRESSIVE --State transition
        return -- Stop processing this state
    end

    -- Nothing else to do in Idle state
end

function modifier_creep_ai:AcquireTarget()
    local units = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self.unit:GetAbsOrigin(), nil, self.aggroRange,
    DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
      DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, FIND_CLOSEST, true) -- DOTA_TEAM_GOODGUYS поменять на другое
    -- If one or more units were found, start attacking the first one
    if not units then
        return nil
    end
    if #units > 0 then
        for index, unit in pairs(units) do
            if not unit:IsInvisible() then
                self.aggroTarget = unit
                return true
            end
        end
        if self.aggroTarget == nil then 
            return nil
        end
    end
end

function modifier_creep_ai:AggressiveThink()
    -- Check if the unit has walked outside its leash range
    -- Check if the target has died
    if not self.aggroTarget:IsAlive() and not self:AcquireTarget() then
        self.unit:MoveToPosition(self.spawnPos) --Move back to the spawnpoint
        self.state = AI_STATE_RETURNING --Transition the state to the 'Returning' state(!)
        print("Returning")
        return -- Stop processing this state
    end
    
    -- Still in the aggressive state, so do some aggressive stuff.
    self.unit:MoveToTargetToAttack(self.aggroTarget)
end

function modifier_creep_ai:ReturningThink()
    -- Check if the AI unit has reached its spawn location yet
    if (self.spawnPos - self.unit:GetAbsOrigin()):Length() < 10 then
        self.state = AI_STATE_IDLE -- Transition the state to the 'Idle' state(!)
        return -- Stop processing this state
    end

    -- If not at return position yet, try to move there again
    self.unit:MoveToPosition(self.spawnPos)
end

function modifier_creep_ai:IsHidden()
    return true
end
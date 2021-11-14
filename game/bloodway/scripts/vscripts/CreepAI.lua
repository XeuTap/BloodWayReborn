if not CreepAI then CreepAI = class ({})
end

function CreepAI:AddAIModifier(unit)
    unit:AddNewModifier(nil, nil, "modifier_creep_ai", { aggroRange = 600, leashRange = 800 })
end
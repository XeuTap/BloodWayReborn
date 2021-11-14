if cold_ranger_dominance == nil then
    cold_ranger_dominance = class ({})
end

LinkLuaModifier( "cold_ranger_dominance_modifier", "libraries/abilities/cold_ranger/cold_ranger_dominance_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function cold_ranger_dominance:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_AURA + DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function cold_ranger_dominance:GetIntrinsicModifierName()
    return "cold_ranger_dominance_modifier"
end
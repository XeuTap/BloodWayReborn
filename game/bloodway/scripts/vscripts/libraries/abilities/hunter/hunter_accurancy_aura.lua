if hunter_accurancy_aura == nil then
    hunter_accurancy_aura = class ({})
end

LinkLuaModifier( "hunter_accurancy_modifier", "libraries/abilities/hunter/hunter_accurancy_modifier.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "hunter_accurancy_aura_modifier", "libraries/abilities/hunter/hunter_accurancy_aura_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function hunter_accurancy_aura:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_AURA + DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function hunter_accurancy_aura:GetIntrinsicModifierName()
    return "hunter_accurancy_aura_modifier"
end
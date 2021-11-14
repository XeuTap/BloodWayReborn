if patron_armor_aura == nil then
    patron_armor_aura = class ({})
end

LinkLuaModifier( "patron_armor_aura_modifier", "libraries/abilities/patron/patron_armor_aura_modifier.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "patron_armor_modifier", "libraries/abilities/patron/patron_armor_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function patron_armor_aura:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_AURA + DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function patron_armor_aura:GetIntrinsicModifierName()
    return "patron_armor_aura_modifier"
end
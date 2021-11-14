if item_cold_shield == nil then
    item_cold_shield = class ({})
end

LinkLuaModifier( "item_cold_shield_modifier", "items/cold_shield/cold_shield_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_shield:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_shield:GetIntrinsicModifierName()
    return "item_cold_shield_modifier"
end
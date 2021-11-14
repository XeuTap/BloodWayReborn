if item_gnolls_leather == nil then
    item_gnolls_leather = class ({})
end

LinkLuaModifier( "item_gnolls_leather_modifier", "items/gnolls_leather/gnolls_leather_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_gnolls_leather:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_gnolls_leather:GetIntrinsicModifierName()
    return "item_gnolls_leather_modifier"
end
if item_cold_talisman == nil then
    item_cold_talisman = class ({})
end

LinkLuaModifier( "item_cold_talisman_modifier", "items/cold_talisman/cold_talisman_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_talisman:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_talisman:GetIntrinsicModifierName()
    return "item_cold_talisman_modifier"
end
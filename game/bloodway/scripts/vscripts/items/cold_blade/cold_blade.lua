if item_cold_blade == nil then
    item_cold_blade = class ({})
end

LinkLuaModifier( "item_cold_blade_modifier", "items/cold_blade/cold_blade_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_blade:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_blade:GetIntrinsicModifierName()
    return "item_cold_blade_modifier"
end
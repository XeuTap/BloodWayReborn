if item_cold_staff == nil then
    item_cold_staff = class ({})
end

LinkLuaModifier( "item_cold_staff_modifier", "items/cold_staff/cold_staff_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_staff:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_staff:GetIntrinsicModifierName()
    return "item_cold_staff_modifier"
end
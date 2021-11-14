if item_fire_staff == nil then
    item_fire_staff = class ({})
end

LinkLuaModifier( "item_fire_staff_modifier", "items/fire_staff/fire_staff_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_fire_staff:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_fire_staff:GetIntrinsicModifierName()
    return "item_fire_staff_modifier"
end
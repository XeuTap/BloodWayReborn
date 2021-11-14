if item_necromant_staff == nil then
    item_necromant_staff = class ({})
end

LinkLuaModifier( "item_necromant_staff_modifier", "items/necromant_staff/necromant_staff_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_necromant_staff:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_necromant_staff:GetIntrinsicModifierName()
    return "item_necromant_staff_modifier"
end
if item_cold_troll_spear == nil then
    item_cold_troll_spear = class ({})
end

LinkLuaModifier( "item_cold_troll_spear_modifier", "items/cold_troll_spear/cold_troll_spear_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_troll_spear:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_troll_spear:GetIntrinsicModifierName()
    return "item_cold_troll_spear_modifier"
end
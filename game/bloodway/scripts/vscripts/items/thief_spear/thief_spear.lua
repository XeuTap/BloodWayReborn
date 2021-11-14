if item_thief_spear == nil then
    item_thief_spear = class ({})
end

LinkLuaModifier( "item_thief_spear_modifier", "items/thief_spear/thief_spear_modifier.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "item_thief_spear_modifier_debuff", "items/thief_spear/thief_spear_modifier_debuff.lua", LUA_MODIFIER_MOTION_NONE )

function item_thief_spear:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_thief_spear:GetIntrinsicModifierName()
    return "item_thief_spear_modifier"
end
if item_thief_shield == nil then
    item_thief_shield = class ({})
end

LinkLuaModifier( "item_thief_shield_modifier", "items/thief_shield/thief_shield_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_thief_shield:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_thief_shield:GetIntrinsicModifierName()
    return "item_thief_shield_modifier"
end
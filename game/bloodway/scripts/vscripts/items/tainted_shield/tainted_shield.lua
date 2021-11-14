if item_tainted_shield == nil then
    item_tainted_shield = class ({})
end

LinkLuaModifier( "item_tainted_shield_modifier", "items/tainted_shield/tainted_shield_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_tainted_shield:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_tainted_shield:GetIntrinsicModifierName()
    return "item_tainted_shield_modifier"
end
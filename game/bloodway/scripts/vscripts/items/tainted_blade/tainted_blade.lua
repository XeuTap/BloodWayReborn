if item_tainted_blade == nil then
    item_tainted_blade = class ({})
end

LinkLuaModifier( "item_tainted_blade_modifier", "items/tainted_blade/tainted_blade_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_tainted_blade:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_tainted_blade:GetIntrinsicModifierName()
    return "item_tainted_blade_modifier"
end
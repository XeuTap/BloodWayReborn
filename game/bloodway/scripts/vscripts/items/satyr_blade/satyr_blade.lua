if item_satyr_blade == nil then
    item_satyr_blade = class ({})
end

LinkLuaModifier( "item_satyr_blade_modifier", "items/satyr_blade/satyr_blade_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_satyr_blade:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_satyr_blade:GetIntrinsicModifierName()
    return "item_satyr_blade_modifier"
end
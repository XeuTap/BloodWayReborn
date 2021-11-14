if item_crystal_boots == nil then
    item_crystal_boots = class ({})
end

LinkLuaModifier( "item_crystal_boots_modifier", "items/crystal_boots/crystal_boots_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_crystal_boots:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_crystal_boots:GetIntrinsicModifierName()
    return "item_crystal_boots_modifier"
end
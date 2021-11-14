if item_dragon_wings == nil then
    item_dragon_wings = class ({})
end

LinkLuaModifier( "item_dragon_wings_modifier", "items/dragon_wings/dragon_wings_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_dragon_wings:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_dragon_wings:GetIntrinsicModifierName()
    return "item_dragon_wings_modifier"
end
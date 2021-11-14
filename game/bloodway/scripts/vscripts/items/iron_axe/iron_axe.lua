if item_iron_axe == nil then
    item_iron_axe = class ({})
end

LinkLuaModifier( "item_iron_axe_modifier", "items/iron_axe/iron_axe_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_iron_axe:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_iron_axe:GetIntrinsicModifierName()
    return "item_iron_axe_modifier"
end
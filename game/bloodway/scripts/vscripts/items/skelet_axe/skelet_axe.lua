if item_skelet_axe == nil then
    item_skelet_axe = class ({})
end

LinkLuaModifier( "item_skelet_axe_modifier", "items/skelet_axe/skelet_axe_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_skelet_axe:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_skelet_axe:GetIntrinsicModifierName()
    return "item_skelet_axe_modifier"
end
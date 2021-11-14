if item_skelet_helm == nil then
    item_skelet_helm = class ({})
end

LinkLuaModifier( "item_skelet_helm_modifier", "items/skelet_helm/skelet_helm_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_skelet_helm:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_skelet_helm:GetIntrinsicModifierName()
    return "item_skelet_helm_modifier"
end
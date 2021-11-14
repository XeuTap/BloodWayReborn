if item_thief_helm == nil then
    item_thief_helm = class ({})
end

LinkLuaModifier( "item_thief_helm_modifier", "items/thief_helm/thief_helm_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_thief_helm:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_thief_helm:GetIntrinsicModifierName()
    return "item_thief_helm_modifier"
end
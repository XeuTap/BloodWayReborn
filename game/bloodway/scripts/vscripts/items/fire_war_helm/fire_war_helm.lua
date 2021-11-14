if item_fire_war_helm == nil then
    item_fire_war_helm = class ({})
end

LinkLuaModifier( "item_fire_war_helm_modifier", "items/fire_war_helm/fire_war_helm_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_fire_war_helm:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_fire_war_helm:GetIntrinsicModifierName()
    return "item_fire_war_helm_modifier"
end
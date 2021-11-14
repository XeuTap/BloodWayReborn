if item_fire_war_pants == nil then
    item_fire_war_pants = class ({})
end

LinkLuaModifier( "item_fire_war_pants_modifier", "items/fire_war_pants/fire_war_pants_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_fire_war_pants:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_fire_war_pants:GetIntrinsicModifierName()
    return "item_fire_war_pants_modifier"
end
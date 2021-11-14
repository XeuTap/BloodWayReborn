if item_cold_troll_pants == nil then
    item_cold_troll_pants = class ({})
end

LinkLuaModifier( "item_cold_troll_pants_modifier", "items/cold_troll_pants/cold_troll_pants_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_troll_pants:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_troll_pants:GetIntrinsicModifierName()
    return "item_cold_troll_pants_modifier"
end
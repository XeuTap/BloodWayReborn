if item_cold_amulet == nil then
    item_cold_amulet = class ({})
end

LinkLuaModifier( "item_cold_amulet_modifier", "items/cold_amulet/cold_amulet_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_amulet:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_amulet:GetIntrinsicModifierName()
    return "item_cold_amulet_modifier"
end
if item_thief_stolen_ring == nil then
    item_thief_stolen_ring = class ({})
end

LinkLuaModifier( "item_thief_stolen_ring_modifier", "items/thief_stolen_ring/thief_stolen_ring_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_thief_stolen_ring:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_thief_stolen_ring:GetIntrinsicModifierName()
    return "item_thief_stolen_ring_modifier"
end
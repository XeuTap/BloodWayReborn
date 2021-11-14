if item_protectors_ring == nil then
    item_protectors_ring = class ({})
end

LinkLuaModifier( "item_protectors_ring_modifier", "items/protectors_ring/protectors_ring_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_protectors_ring:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_protectors_ring:GetIntrinsicModifierName()
    return "item_protectors_ring_modifier"
end
if item_tainted_ring == nil then
    item_tainted_ring = class ({})
end

LinkLuaModifier( "item_tainted_ring_modifier", "items/tainted_ring/tainted_ring_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_tainted_ring:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_tainted_ring:GetIntrinsicModifierName()
    return "item_tainted_ring_modifier"
end
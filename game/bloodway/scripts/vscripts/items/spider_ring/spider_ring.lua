if item_spider_ring == nil then
    item_spider_ring = class ({})
end

LinkLuaModifier( "item_spider_ring_modifier", "items/spider_ring/spider_ring_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_spider_ring:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_spider_ring:GetIntrinsicModifierName()
    return "item_spider_ring_modifier"
end
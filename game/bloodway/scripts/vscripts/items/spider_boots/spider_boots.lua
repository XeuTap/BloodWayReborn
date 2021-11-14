if item_spider_boots == nil then
    item_spider_boots = class ({})
end

LinkLuaModifier( "item_spider_boots_modifier", "items/spider_boots/spider_boots_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_spider_boots:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_spider_boots:GetIntrinsicModifierName()
    return "item_spider_boots_modifier"
end
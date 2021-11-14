if item_dead_robe == nil then
    item_dead_robe = class ({})
end

LinkLuaModifier( "item_dead_robe_modifier", "items/dead_robe/dead_robe_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_dead_robe:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_dead_robe:GetIntrinsicModifierName()
    return "item_dead_robe_modifier"
end
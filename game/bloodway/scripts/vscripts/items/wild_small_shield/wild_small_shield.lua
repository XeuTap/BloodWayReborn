if item_wild_small_shield == nil then
    item_wild_small_shield = class ({})
end

LinkLuaModifier( "item_wild_small_shield_modifier", "items/wild_small_shield/wild_small_shield_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_wild_small_shield:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_wild_small_shield:GetIntrinsicModifierName()
    return "item_wild_small_shield_modifier"
end
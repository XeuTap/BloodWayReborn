if item_wild_cap == nil then
    item_wild_cap = class ({})
end

LinkLuaModifier( "item_wild_cap_modifier", "items/wild_cap/wild_cap_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_wild_cap:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_wild_cap:GetIntrinsicModifierName()
    return "item_wild_cap_modifier"
end
if item_sea_deadman_helmet == nil then
    item_sea_deadman_helmet = class ({})
end

LinkLuaModifier( "item_sea_deadman_helmet_modifier", "items/sea_deadman_helmet/sea_deadman_helmet_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_sea_deadman_helmet:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_sea_deadman_helmet:GetIntrinsicModifierName()
    return "item_sea_deadman_helmet_modifier"
end
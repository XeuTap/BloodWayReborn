if item_sea_deadman_sword == nil then
    item_sea_deadman_sword = class ({})
end

LinkLuaModifier( "item_sea_deadman_sword_modifier", "items/sea_deadman_sword/sea_deadman_sword_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_sea_deadman_sword:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_sea_deadman_sword:GetIntrinsicModifierName()
    return "item_sea_deadman_sword_modifier"
end
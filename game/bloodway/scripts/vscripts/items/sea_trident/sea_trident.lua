if item_sea_trident == nil then
    item_sea_trident = class ({})
end

LinkLuaModifier( "item_sea_trident_modifier", "items/sea_trident/sea_trident_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_sea_trident:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_sea_trident:GetIntrinsicModifierName()
    return "item_sea_trident_modifier"
end
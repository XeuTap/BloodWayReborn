if item_sea_scaly_armor == nil then
    item_sea_scaly_armor = class ({})
end

LinkLuaModifier( "item_sea_scaly_armor_modifier", "items/sea_scaly_armor/sea_scaly_armor_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_sea_scaly_armor:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_sea_scaly_armor:GetIntrinsicModifierName()
    return "item_sea_scaly_armor_modifier"
end
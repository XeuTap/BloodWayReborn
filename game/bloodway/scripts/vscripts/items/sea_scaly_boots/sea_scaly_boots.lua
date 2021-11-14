if item_sea_scaly_boots == nil then
    item_sea_scaly_boots = class ({})
end

LinkLuaModifier( "item_sea_scaly_boots_modifier", "items/sea_scaly_boots/sea_scaly_boots_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_sea_scaly_boots:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_sea_scaly_boots:GetIntrinsicModifierName()
    return "item_sea_scaly_boots_modifier"
end
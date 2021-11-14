if item_sea_fin == nil then
    item_sea_fin = class ({})
end

LinkLuaModifier( "item_sea_fin_modifier", "items/sea_fin/sea_fin_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_sea_fin:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_sea_fin:GetIntrinsicModifierName()
    return "item_sea_fin_modifier"
end
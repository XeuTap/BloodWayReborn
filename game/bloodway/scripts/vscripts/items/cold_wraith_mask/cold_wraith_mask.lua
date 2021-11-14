if item_cold_wraith_mask == nil then
    item_cold_wraith_mask = class ({})
end

LinkLuaModifier( "item_cold_wraith_mask_modifier", "items/cold_wraith_mask/cold_wraith_mask_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_wraith_mask:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_wraith_mask:GetIntrinsicModifierName()
    return "item_cold_wraith_mask_modifier"
end
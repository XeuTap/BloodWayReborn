if item_cold_knights_mask == nil then
    item_cold_knights_mask = class ({})
end

LinkLuaModifier( "item_cold_knights_mask_modifier", "items/cold_knights_mask/cold_knights_mask_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cold_knights_mask:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cold_knights_mask:GetIntrinsicModifierName()
    return "item_cold_knights_mask_modifier"
end
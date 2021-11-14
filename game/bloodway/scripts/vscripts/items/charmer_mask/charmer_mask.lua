if item_charmer_mask == nil then
    item_charmer_mask = class ({})
end

LinkLuaModifier( "item_charmer_mask_modifier", "items/charmer_mask/charmer_mask_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_charmer_mask:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_charmer_mask:GetIntrinsicModifierName()
    return "item_charmer_mask_modifier"
end
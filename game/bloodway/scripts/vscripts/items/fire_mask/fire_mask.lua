if item_fire_mask == nil then
    item_fire_mask = class ({})
end

LinkLuaModifier( "item_fire_mask_modifier", "items/fire_mask/fire_mask_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_fire_mask:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_fire_mask:GetIntrinsicModifierName()
    return "item_fire_mask_modifier"
end
if item_crystal_mask == nil then
    item_crystal_mask = class ({})
end

LinkLuaModifier( "item_crystal_mask_modifier", "items/crystal_mask/crystal_mask_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_crystal_mask:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_crystal_mask:GetIntrinsicModifierName()
    return "item_crystal_mask_modifier"
end
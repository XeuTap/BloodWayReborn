if item_dragon_tooth_necklace == nil then
    item_dragon_tooth_necklace = class ({})
end

LinkLuaModifier( "item_dragon_tooth_necklace_modifier", "items/dragon_tooth_necklace/dragon_tooth_necklace_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_dragon_tooth_necklace:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_dragon_tooth_necklace:GetIntrinsicModifierName()
    return "item_dragon_tooth_necklace_modifier"
end
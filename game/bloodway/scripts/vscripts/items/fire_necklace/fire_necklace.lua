if item_fire_necklace == nil then
    item_fire_necklace = class ({})
end

LinkLuaModifier( "item_fire_necklace_modifier", "items/fire_necklace/fire_necklace_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_fire_necklace:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_fire_necklace:GetIntrinsicModifierName()
    return "item_fire_necklace_modifier"
end
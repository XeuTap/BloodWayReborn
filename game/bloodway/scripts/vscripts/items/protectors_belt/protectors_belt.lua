if item_protectors_belt == nil then
    item_protectors_belt = class ({})
end

LinkLuaModifier( "item_protectors_belt_modifier", "items/protectors_belt/protectors_belt_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_protectors_belt:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_protectors_belt:GetIntrinsicModifierName()
    return "item_protectors_belt_modifier"
end
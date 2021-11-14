if item_harpy_claws == nil then
    item_harpy_claws = class ({})
end

LinkLuaModifier( "item_harpy_claws_modifier", "items/harpy_claws/harpy_claws_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_harpy_claws:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_harpy_claws:GetIntrinsicModifierName()
    return "item_harpy_claws_modifier"
end
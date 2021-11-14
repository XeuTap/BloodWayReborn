if item_tainted_claws == nil then
    item_tainted_claws = class ({})
end

LinkLuaModifier( "item_tainted_claws_modifier", "items/tainted_claws/tainted_claws_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_tainted_claws:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_tainted_claws:GetIntrinsicModifierName()
    return "item_tainted_claws_modifier"
end

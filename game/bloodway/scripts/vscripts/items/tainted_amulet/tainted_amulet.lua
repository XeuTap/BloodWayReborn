if item_tainted_amulet == nil then
    item_tainted_amulet = class ({})
end

LinkLuaModifier( "item_tainted_amulet_modifier", "items/tainted_amulet/tainted_amulet_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_tainted_amulet:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_tainted_amulet:GetIntrinsicModifierName()
    return "item_tainted_amulet_modifier"
end
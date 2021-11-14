if item_necromant_cap == nil then
    item_necromant_cap = class ({})
end

LinkLuaModifier( "item_necromant_cap_modifier", "items/necromant_cap/necromant_cap_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_necromant_cap:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_necromant_cap:GetIntrinsicModifierName()
    return "item_necromant_cap_modifier"
end
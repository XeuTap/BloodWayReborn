if item_necromant_pants == nil then
    item_necromant_pants = class ({})
end

LinkLuaModifier( "item_necromant_pants_modifier", "items/necromant_pants/necromant_pants_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_necromant_pants:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_necromant_pants:GetIntrinsicModifierName()
    return "item_necromant_pants_modifier"
end
if item_gnolls_mace == nil then
    item_gnolls_mace = class ({})
end

LinkLuaModifier( "item_gnolls_mace_modifier", "items/gnolls_mace/gnolls_mace_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_gnolls_mace:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_gnolls_mace:GetIntrinsicModifierName()
    return "item_gnolls_mace_modifier"
end
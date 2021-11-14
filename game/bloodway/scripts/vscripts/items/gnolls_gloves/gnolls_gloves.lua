if item_gnolls_gloves == nil then
    item_gnolls_gloves = class ({})
end

LinkLuaModifier( "item_gnolls_gloves_modifier", "items/gnolls_gloves/gnolls_gloves_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_gnolls_gloves:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_gnolls_gloves:GetIntrinsicModifierName()
    return "item_gnolls_gloves_modifier"
end
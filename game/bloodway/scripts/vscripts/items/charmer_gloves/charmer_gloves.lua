if item_charmer_gloves == nil then
    item_charmer_gloves = class ({})
end

LinkLuaModifier( "item_charmer_gloves_modifier", "items/charmer_gloves/charmer_gloves_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_charmer_gloves:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_charmer_gloves:GetIntrinsicModifierName()
    return "item_charmer_gloves_modifier"
end
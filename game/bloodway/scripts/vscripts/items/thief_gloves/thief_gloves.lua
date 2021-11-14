if item_thief_gloves == nil then
    item_thief_gloves = class ({})
end

LinkLuaModifier( "item_thief_gloves_modifier", "items/thief_gloves/thief_gloves_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_thief_gloves:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_thief_gloves:GetIntrinsicModifierName()
    return "item_thief_gloves_modifier"
end
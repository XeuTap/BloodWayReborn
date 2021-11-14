if item_wild_gloves == nil then
    item_wild_gloves = class ({})
end

LinkLuaModifier( "item_wild_gloves_modifier", "items/wild_gloves/wild_gloves_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_wild_gloves:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_wild_gloves:GetIntrinsicModifierName()
    return "item_wild_gloves_modifier"
end
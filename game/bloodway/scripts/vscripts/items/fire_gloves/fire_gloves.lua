if item_fire_gloves == nil then
    item_fire_gloves = class ({})
end

LinkLuaModifier( "item_fire_gloves_modifier", "items/fire_gloves/fire_gloves_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_fire_gloves:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_fire_gloves:GetIntrinsicModifierName()
    return "item_fire_gloves_modifier"
end
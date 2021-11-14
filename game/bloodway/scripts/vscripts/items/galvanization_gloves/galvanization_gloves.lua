if item_galvanization_gloves == nil then
    item_galvanization_gloves = class ({})
end

LinkLuaModifier( "item_galvanization_gloves_modifier", "items/galvanization_gloves/galvanization_gloves_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_galvanization_gloves:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_galvanization_gloves:GetIntrinsicModifierName()
    return "item_galvanization_gloves_modifier"
end
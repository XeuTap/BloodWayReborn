if item_owl_knuckles == nil then
    item_owl_knuckles = class ({})
end

LinkLuaModifier( "item_owl_knuckles_modifier", "items/owl_knuckles/owl_knuckles_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_owl_knuckles:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_owl_knuckles:GetIntrinsicModifierName()
    return "item_owl_knuckles_modifier"
end
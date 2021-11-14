if item_gloves_of_shadows == nil then
    item_gloves_of_shadows = class ({})
end

LinkLuaModifier( "item_gloves_of_shadows_modifier", "items/gloves_of_shadows/gloves_of_shadows_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_gloves_of_shadows:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_gloves_of_shadows:GetIntrinsicModifierName()
    return "item_gloves_of_shadows_modifier"
end
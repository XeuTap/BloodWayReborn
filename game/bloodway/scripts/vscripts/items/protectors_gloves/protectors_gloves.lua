if item_protectors_gloves == nil then
    item_protectors_gloves = class ({})
end

LinkLuaModifier( "item_protectors_gloves_modifier", "items/protectors_gloves/protectors_gloves_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_protectors_gloves:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_protectors_gloves:GetIntrinsicModifierName()
    return "item_protectors_gloves_modifier"
end
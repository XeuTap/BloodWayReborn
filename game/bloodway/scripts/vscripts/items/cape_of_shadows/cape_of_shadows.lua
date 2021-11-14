if item_cape_of_shadows == nil then
    item_cape_of_shadows = class ({})
end

LinkLuaModifier( "item_cape_of_shadows_modifier", "items/cape_of_shadows/cape_of_shadows_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_cape_of_shadows:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_cape_of_shadows:GetIntrinsicModifierName()
    return "item_cape_of_shadows_modifier"
end
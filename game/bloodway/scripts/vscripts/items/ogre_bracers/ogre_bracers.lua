if item_ogre_bracers == nil then
    item_ogre_bracers = class ({})
end

LinkLuaModifier( "item_ogre_bracers_modifier", "items/ogre_bracers/ogre_bracers_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_ogre_bracers:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_ogre_bracers:GetIntrinsicModifierName()
    return "item_ogre_bracers_modifier"
end
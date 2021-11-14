if item_ogre_pants == nil then
    item_ogre_pants = class ({})
end

LinkLuaModifier( "item_ogre_pants_modifier", "items/ogre_pants/ogre_pants_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_ogre_pants:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_ogre_pants:GetIntrinsicModifierName()
    return "item_ogre_pants_modifier"
end
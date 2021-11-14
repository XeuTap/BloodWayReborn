if item_centaur_axe == nil then
    item_centaur_axe = class ({})
end

LinkLuaModifier( "item_centaur_axe_modifier", "items/centaur_axe/centaur_axe_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_centaur_axe:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_centaur_axe:GetIntrinsicModifierName()
    return "item_centaur_axe_modifier"
end
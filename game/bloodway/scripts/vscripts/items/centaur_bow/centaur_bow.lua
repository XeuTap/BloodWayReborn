if item_centaur_bow == nil then
    item_centaur_bow = class ({})
end

LinkLuaModifier( "item_centaur_bow_modifier", "items/centaur_bow/centaur_bow_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_centaur_bow:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_centaur_bow:GetIntrinsicModifierName()
    return "item_centaur_bow_modifier"
end
if item_fire_bow == nil then
    item_fire_bow = class ({})
end

LinkLuaModifier( "item_fire_bow_modifier", "items/fire_bow/fire_bow_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_fire_bow:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_fire_bow:GetIntrinsicModifierName()
    return "item_fire_bow_modifier"
end
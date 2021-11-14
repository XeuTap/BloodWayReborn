if item_skelet_bones == nil then
    item_skelet_bones = class ({})
end

LinkLuaModifier( "item_skelet_bones_modifier", "items/skelet_bones/skelet_bones_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_skelet_bones:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_skelet_bones:GetIntrinsicModifierName()
    return "item_skelet_bones_modifier"
end
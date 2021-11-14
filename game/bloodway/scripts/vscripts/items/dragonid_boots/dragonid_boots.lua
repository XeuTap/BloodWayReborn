if item_dragonid_boots == nil then
    item_dragonid_boots = class ({})
end

LinkLuaModifier( "item_dragonid_boots_modifier", "items/dragonid_boots/dragonid_boots_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_dragonid_boots:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_dragonid_boots:GetIntrinsicModifierName()
    return "item_dragonid_boots_modifier"
end
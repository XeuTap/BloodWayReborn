if item_dragonid_sword == nil then
    item_dragonid_sword = class ({})
end

LinkLuaModifier( "item_dragonid_sword_modifier", "items/dragonid_sword/dragonid_sword_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_dragonid_sword:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_dragonid_sword:GetIntrinsicModifierName()
    return "item_dragonid_sword_modifier"
end
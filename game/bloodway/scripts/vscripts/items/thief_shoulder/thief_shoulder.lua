if item_thief_shoulder == nil then
    item_thief_shoulder = class ({})
end

LinkLuaModifier( "item_thief_shoulder_modifier", "items/thief_shoulder/thief_shoulder_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_thief_shoulder:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_thief_shoulder:GetIntrinsicModifierName()
    return "item_thief_shoulder_modifier"
end
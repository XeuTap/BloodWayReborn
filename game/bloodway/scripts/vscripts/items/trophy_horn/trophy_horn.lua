if item_trophy_horn == nil then
    item_trophy_horn = class ({})
end

LinkLuaModifier( "item_trophy_horn_modifier", "items/trophy_horn/trophy_horn_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_trophy_horn:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_trophy_horn:GetIntrinsicModifierName()
    return "item_trophy_horn_modifier"
end
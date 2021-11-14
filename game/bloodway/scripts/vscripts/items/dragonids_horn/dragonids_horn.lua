if item_dragonids_horn == nil then
    item_dragonids_horn = class ({})
end

LinkLuaModifier( "item_dragonids_horn_modifier", "items/dragonids_horn/dragonids_horn_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_dragonids_horn:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_dragonids_horn:GetIntrinsicModifierName()
    return "item_dragonids_horn_modifier"
end
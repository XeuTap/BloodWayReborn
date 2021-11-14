if item_thief_cape == nil then
    item_thief_cape = class ({})
end

LinkLuaModifier( "item_thief_cape_modifier", "items/thief_cape/thief_cape_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_thief_cape:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_thief_cape:GetIntrinsicModifierName()
    return "item_thief_cape_modifier"
end
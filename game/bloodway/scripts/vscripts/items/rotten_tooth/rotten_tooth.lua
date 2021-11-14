if item_rotten_tooth == nil then
    item_rotten_tooth = class ({})
end

LinkLuaModifier( "item_rotten_tooth_modifier", "items/rotten_tooth/rotten_tooth_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_rotten_tooth:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_rotten_tooth:GetIntrinsicModifierName()
    return "item_rotten_tooth_modifier"
end
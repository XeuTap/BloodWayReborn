if item_shadow_dancer_cape == nil then
    item_shadow_dancer_cape = class ({})
end

LinkLuaModifier( "item_shadow_dancer_cape_modifier", "items/shadow_dancer_cape/shadow_dancer_cape_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_shadow_dancer_cape:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_shadow_dancer_cape:GetIntrinsicModifierName()
    return "item_shadow_dancer_cape_modifier"
end
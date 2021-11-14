if item_battle_drum == nil then
    item_battle_drum = class ({})
end

LinkLuaModifier( "item_battle_drum_modifier", "items/battle_drum/battle_drum_modifier.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "item_battle_drum_aura_modifier", "items/battle_drum/battle_drum_aura_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_battle_drum:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_AURA
end

function item_battle_drum:GetIntrinsicModifierName()
    return "item_battle_drum_aura_modifier"
end
if item_centaur_hoof == nil then
    item_centaur_hoof = class ({})
end

LinkLuaModifier( "item_centaur_hoof_modifier", "items/centaur_hoof/centaur_hoof_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_centaur_hoof:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_centaur_hoof:GetIntrinsicModifierName()
    return "item_centaur_hoof_modifier"
end
if item_ankh_of_rebirth == nil then
    item_ankh_of_rebirth = class ({})
end

LinkLuaModifier( "item_ankh_of_rebirth_modifier", "items/ankh_of_rebirth/ankh_of_rebirth_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_ankh_of_rebirth:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_ankh_of_rebirth:GetIntrinsicModifierName()
    return "item_ankh_of_rebirth_modifier"
end
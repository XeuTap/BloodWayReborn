if item_wolf_skin == nil then
    item_wolf_skin = class ({})
end

LinkLuaModifier( "item_wolf_skin_modifier", "items/wolf_skin/wolf_skin_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_wolf_skin:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_PASSIVE
end

function item_wolf_skin:GetIntrinsicModifierName()
    return "item_wolf_skin_modifier"
end
gain_agility = class ({})
LinkLuaModifier("modifier_gain_agility", "libraries/abilities/modifier_gain_agility", LUA_MODIFIER_MOTION_NONE)

function gain_agility:GetIntrinsicModifierName()
	return "modifier_gain_agility"
end
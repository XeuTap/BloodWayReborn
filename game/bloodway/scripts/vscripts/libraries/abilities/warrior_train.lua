warrior_train = class ({})
LinkLuaModifier("modifier_warrior_train", "libraries/abilities/modifier_warrior_train", LUA_MODIFIER_MOTION_NONE)

function warrior_train:GetIntrinsicModifierName()
	return "modifier_warrior_train"
end
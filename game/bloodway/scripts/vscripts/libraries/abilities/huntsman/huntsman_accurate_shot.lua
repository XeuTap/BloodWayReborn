huntsman_accurate_shot = class ({})
LinkLuaModifier("modifier_huntsman_accurate_shot", "libraries/abilities/huntsman/modifier_huntsman_accurate_shot", LUA_MODIFIER_MOTION_NONE)

function huntsman_accurate_shot:GetIntrinsicModifierName()
	return "modifier_huntsman_accurate_shot"
end
druid_nature_origin = class ({})
LinkLuaModifier("modifier_druid_nature_origin", "libraries/abilities/modifier_druid_nature_origin", LUA_MODIFIER_MOTION_NONE)

function druid_nature_origin:GetIntrinsicModifierName()
	return "modifier_druid_nature_origin"
end
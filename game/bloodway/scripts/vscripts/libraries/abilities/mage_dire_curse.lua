mage_dire_curse = class ({})
LinkLuaModifier("modifier_mage_dire_curse", "libraries/abilities/modifier_mage_dire_curse", LUA_MODIFIER_MOTION_NONE)


function mage_dire_curse:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function mage_dire_curse:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function mage_dire_curse:OnSpellStart()
	local _caster = self:GetCaster()
	local _target = self:GetCursorTarget()
	local _duration = self:GetSpecialValueFor("time_duration")
	if _target ~= nil and ( not _target:IsInvulnerable() ) and ( not _target:TriggerSpellAbsorb( self ) ) and ( not _target:IsMagicImmune() ) then
		EmitSoundOn("Hero_Warlock.FatalBonds", _caster)
		_target:AddNewModifier(_caster, self, "modifier_mage_dire_curse", { duration = _duration })
	end
	return true
end
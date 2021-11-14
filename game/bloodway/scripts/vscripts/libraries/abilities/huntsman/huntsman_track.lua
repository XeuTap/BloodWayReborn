huntsman_track = class ({})
LinkLuaModifier("modifier_huntsman_track", "libraries/abilities/huntsman/modifier_huntsman_track", LUA_MODIFIER_MOTION_NONE)


function huntsman_track:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end


function huntsman_track:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function huntsman_track:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function huntsman_track:OnSpellStart()
	local _caster = self:GetCaster()
	local _target = self:GetCursorTarget()
	self.track_duration = self:GetSpecialValueFor("debuff_duration")
	EmitSoundOn( "Hero_BountyHunter.Target", self:GetCaster() )
	--EmitSoundOn( "Ability.Powershot", self:GetCaster() )
	_target:AddNewModifier( self:GetCaster(), self, "modifier_huntsman_track", { duration = self.track_duration } )
end
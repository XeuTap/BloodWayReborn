priest_revenge = class ({})

function priest_revenge:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function priest_revenge:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function priest_revenge:OnSpellStart()
	local _caster = self:GetCaster()
	local _target = self:GetCursorTarget()
	local _damage = self:GetSpecialValueFor("damage_dealt")

		local damage = {
		victim = _target,
		attacker = _caster,
		damage = _damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self
		}
	
	EmitSoundOn("Hero_Antimage.ManaVoid", _target)
	ApplyDamage( damage )
	local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_keeper_of_the_light/keeper_cast02.vpcf", PATTACH_CUSTOMORIGIN, nil)
	ParticleManager:SetParticleControlEnt( nFXIndex, 0, _target, PATTACH_POINT_FOLLOW, "attach_attack1", _target:GetOrigin(), true )
	ParticleManager:ReleaseParticleIndex( nFXIndex )
end
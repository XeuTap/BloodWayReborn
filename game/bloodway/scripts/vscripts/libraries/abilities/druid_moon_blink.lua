druid_moon_blink = class ({})


function druid_moon_blink:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function druid_moon_blink:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function druid_moon_blink:OnSpellStart()
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
	
	EmitSoundOn("Hero_Luna.LucentBeam.Target", _target)
	ApplyDamage( damage )


	local nFXIndex4  = ParticleManager:CreateParticle( "particles/units/heroes/hero_luna/luna_lucent_beam.vpcf", PATTACH_CUSTOMORIGIN, _target )
	ParticleManager:SetParticleControl( nFXIndex4, 0, _caster:GetOrigin() )
	ParticleManager:SetParticleControlEnt( nFXIndex4, 1, _target, PATTACH_OVERHEAD_FOLLOW, "attach_hitloc", _target:GetOrigin(), true )
	ParticleManager:SetParticleControl( nFXIndex4, 2, Vector( 100, 0, 0 ) )
	ParticleManager:SetParticleControlEnt( nFXIndex4, 3, _target, PATTACH_ABSORIGIN_FOLLOW, nil, _target:GetOrigin(), true )
	ParticleManager:ReleaseParticleIndex( nFXIndex4 )
end
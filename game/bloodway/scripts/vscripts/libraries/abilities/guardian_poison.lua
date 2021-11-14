guardian_poison = class ({})
LinkLuaModifier("modifier_guardian_poison", "libraries/abilities/modifier_guardian_poison", LUA_MODIFIER_MOTION_NONE)

function guardian_poison:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function guardian_poison:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end


function guardian_poison:OnSpellStart()
	local _caster = self:GetCaster()
	local hTarget = self:GetCursorTarget()
	self.duration = self:GetSpecialValueFor("debuff_duration")
	local targets_counts = self:GetSpecialValueFor("target_count")
	local radius = self:GetSpecialValueFor("targets_aoe")

	local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, hTarget:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, FIND_CLOSEST, true )

	for index, _current_target in pairs(targets) do
		if index > targets_counts then break end
		local projectile_info = {
				EffectName = "particles/units/heroes/hero_venomancer/venomancer_base_attack.vpcf",
				Ability = self,
				iMoveSpeed =  900,
				Source = _caster,
				Target = _current_target,
				vSpawnOrigin = _caster:GetAbsOrigin(),
				bDodgeable = true,
    	 	 	bProvidesVision = false,
				iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
			}
	
		ProjectileManager:CreateTrackingProjectile(projectile_info)
	end

	EmitSoundOn("Hero_VenomancerWard.Attack", _caster)
end

function guardian_poison:OnProjectileHit( hTarget, vLocation )
	local _caster = self:GetCaster()

	hTarget:AddNewModifier(_caster, self, "modifier_guardian_poison", { duration = self.duration })
end
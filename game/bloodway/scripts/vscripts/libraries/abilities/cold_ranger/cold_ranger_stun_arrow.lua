cold_ranger_stun_arrow = class ({})
LinkLuaModifier("modifier_cold_ranger_stun_arrow", "libraries/abilities/cold_ranger/modifier_cold_ranger_stun_arrow", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_cold_ranger_stun_arrow_slow", "libraries/abilities/cold_ranger/modifier_cold_ranger_stun_arrow_slow", LUA_MODIFIER_MOTION_NONE)


function cold_ranger_stun_arrow:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end

function cold_ranger_stun_arrow:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function cold_ranger_stun_arrow:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function cold_ranger_stun_arrow:OnSpellStart()
	local caster = self:GetCaster()
	local info = {
			EffectName = "particles/econ/items/drow/drow_ti9_immortal/drow_ti9_marksman.vpcf",
			Ability = self,
			iMoveSpeed = self:GetSpecialValueFor( "missile_speed" ),
			Source = caster,
			Target = self:GetCursorTarget(),
			vSpawnOrigin = caster:GetAbsOrigin(),
			bDodgeable = true,
     	 	bProvidesVision = false,
			iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
		}

	ProjectileManager:CreateTrackingProjectile( info )
	EmitSoundOn( "Hero_DrowRanger.FrostArrows", self:GetCaster() )
end

function cold_ranger_stun_arrow:OnProjectileHit(hTarget, vLocation)
	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then
		local caster = self:GetCaster()
		EmitSoundOn( "Hero_VengefulSpirit.MagicMissileImpact", hTarget )
		local stun_duration = self:GetSpecialValueFor( "stun_duration" )
		local stun_damage
		local dmg_multiplier = self:GetSpecialValueFor("stun_dmg_multiplier")
		local slow_duration = self:GetSpecialValueFor( "slow_duration" )
		local slow_radius = self:GetSpecialValueFor( "slow_radius" )

		local heroAgility = caster:GetAgility()
		local heroIntellegence = caster:GetIntellect()
		if heroAgility > heroIntellegence then
			stun_damage = heroAgility * dmg_multiplier
		else
			stun_damage = heroIntellegence * dmg_multiplier
		end

		local damage = {
			victim = hTarget,
			attacker = self:GetCaster(),
			damage = stun_damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self
		}

		ApplyDamage( damage )
		hTarget:AddNewModifier( self:GetCaster(), self, "modifier_cold_ranger_stun_arrow", { duration = stun_duration } )
		local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, hTarget:GetAbsOrigin(), nil, slow_radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, true )
		for index, target in pairs(targets) do
			target:AddNewModifier( self:GetCaster(), self, "modifier_cold_ranger_stun_arrow_slow", { duration = slow_duration } )
		end
	end

	return true
end


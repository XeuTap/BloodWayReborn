hunter_stun_arrow = class ({})
LinkLuaModifier("modifier_ranger_stun_arrow", "libraries/abilities/modifier_ranger_stun_arrow", LUA_MODIFIER_MOTION_NONE)


function hunter_stun_arrow:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end

function hunter_stun_arrow:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function hunter_stun_arrow:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function hunter_stun_arrow:OnSpellStart()
	local caster = self:GetCaster()
	local info = {
			EffectName = "particles/units/heroes/hero_drow/drow_frost_arrow.vpcf",
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

function hunter_stun_arrow:OnProjectileHit(hTarget, vLocation)
	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then
		EmitSoundOn( "Hero_VengefulSpirit.MagicMissileImpact", hTarget )
		local stun_duration = self:GetSpecialValueFor( "stun_duration" )
		local stun_damage = self:GetSpecialValueFor( "stun_damage" )

		local damage = {
			victim = hTarget,
			attacker = self:GetCaster(),
			damage = stun_damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self
		}

		ApplyDamage( damage )
		hTarget:AddNewModifier( self:GetCaster(), self, "modifier_ranger_stun_arrow", { duration = stun_duration } )
	end

	return true
end


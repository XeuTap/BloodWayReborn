huntsman_wind_arrow = class ({})
LinkLuaModifier("modifier_ranger_stun_arrow", "libraries/abilities/modifier_ranger_stun_arrow", LUA_MODIFIER_MOTION_NONE)


function huntsman_wind_arrow:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end

function huntsman_wind_arrow:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function huntsman_wind_arrow:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function huntsman_wind_arrow:OnAbilityPhaseStart()
	EmitSoundOn( "Hero_Mirana.Attack", self:GetCaster() )
end

function huntsman_wind_arrow:OnSpellStart()
	local caster = self:GetCaster()
	local projectile_speed = self:GetSpecialValueFor("missile_speed")
	local startPoint = caster:GetAttachmentOrigin( caster:ScriptLookupAttachment( "bow_mid1" ) )
	local point = self:GetCursorTarget():GetAbsOrigin()
	startPoint.z = point.z

	local direction = point-startPoint
    direction.z = 0
	local projectile_direction = direction:Normalized() * projectile_speed
	PrintTable(projectile_direction)

	self.nfxIndex1 = ParticleManager:CreateParticle("particles/basic_projectile/sacred_arrow_fixed.vpcf", PATTACH_CUSTOMORIGIN , nil)
	ParticleManager:SetParticleControl(self.nfxIndex1, 0 , startPoint)
	ParticleManager:SetParticleControl(self.nfxIndex1, 1 , projectile_direction)
	--ParticleManager:SetParticleControl(self.nfxIndex1, 4, Vector(projectile_speed, projectile_speed, 0) )
	--ParticleManager:SetParticleControl(self.nfxIndex1, 3, projectile_direction )

	local caster = self:GetCaster()
	local info = {
			EffectName = nil,
			Ability = self,
			iMoveSpeed = projectile_speed,
			Source = caster,
			Target = self:GetCursorTarget(),
			vSpawnOrigin = startPoint,
			bDodgeable = true,
     	 	bProvidesVision = false,
			iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
		}

	ProjectileManager:CreateTrackingProjectile( info )
	EmitSoundOn( "Hero_Mirana.Arrow", self:GetCaster() )
end

function huntsman_wind_arrow:OnProjectileHit(hTarget, vLocation)
	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then
		local stun_duration = self:GetSpecialValueFor( "stun_duration" )
		local agi = self:GetCaster():GetAgility()
        local agi_dmg_multiplier = self:GetSpecialValueFor("agi_multiplier")
        local stun_damage = agi * agi_dmg_multiplier
		print(stun_damage)

		local damage = {
			victim = hTarget,
			attacker = self:GetCaster(),
			damage = stun_damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self
		}

		ApplyDamage( damage )
		hTarget:AddNewModifier( self:GetCaster(), self, "modifier_ranger_stun_arrow", { duration = stun_duration } )
		self:GetCaster():StopSound("Hero_Mirana.Arrow")
        EmitSoundOn("Hero_Mirana.ArrowImpact", hTarget)
	end
	ParticleManager:DestroyParticle(self.nfxIndex1, false)

	return true
end


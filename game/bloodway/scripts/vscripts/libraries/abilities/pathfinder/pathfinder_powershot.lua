pathfinder_powershot = class ({})
LinkLuaModifier("modifier_ranger_stun_arrow", "libraries/abilities/modifier_ranger_stun_arrow", LUA_MODIFIER_MOTION_NONE)


function pathfinder_powershot:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end

function pathfinder_powershot:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function pathfinder_powershot:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function pathfinder_powershot:OnSpellStart()
	local caster = self:GetCaster()
	local info = {
			EffectName = "particles/units/heroes/hero_sniper/sniper_assassinate.vpcf",
			Ability = self,
			iMoveSpeed = self:GetSpecialValueFor( "missile_speed" ),
			Source = caster,
			Target = self:GetCursorTarget(),
			vSpawnOrigin = caster:GetAttachmentOrigin( caster:ScriptLookupAttachment( "bow_mid1" ) ),
			bDodgeable = true,
     	 	bProvidesVision = false,
			iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
		}

	ProjectileManager:CreateTrackingProjectile( info )
	EmitSoundOn( "Ability.Powershot", self:GetCaster() )
end

function pathfinder_powershot:OnProjectileHit(hTarget, vLocation)
	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then
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
        EmitSoundOn("Hero_Sniper.AssassinateDamage", hTarget)
	end

	return true
end


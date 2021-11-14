mage_fireblast = class ({})
LinkLuaModifier("modifier_mage_fireblast", "libraries/abilities/modifier_mage_fireblast", LUA_MODIFIER_MOTION_NONE)


function mage_fireblast:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end

function mage_fireblast:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function mage_fireblast:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function mage_fireblast:OnSpellStart()
	local caster = self:GetCaster()
	local info = {
			EffectName = "particles/units/heroes/hero_lina/lina_base_attack.vpcf",
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
	EmitSoundOn( "Hero_EmberSpirit.SleightOfFist.Cast", self:GetCaster() )
end

function mage_fireblast:OnProjectileHit(hTarget, vLocation)
	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then
		EmitSoundOn( "Hero_OgreMagi.Fireblast.Target", hTarget )
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
		hTarget:AddNewModifier( self:GetCaster(), self, "modifier_mage_fireblast", { duration = stun_duration } )
	end

	return true
end


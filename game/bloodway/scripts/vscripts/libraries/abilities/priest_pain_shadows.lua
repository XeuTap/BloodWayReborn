priest_pain_shadows = class ({})
LinkLuaModifier("modifier_priest_pain_shadows", "libraries/abilities/modifier_priest_pain_shadows", LUA_MODIFIER_MOTION_NONE)

function priest_pain_shadows:OnSpellStart()
	self.caster = self:GetCaster()
	self.target = self:GetCursorTarget()
	self.duration = self:GetSpecialValueFor("time_duration")
	EmitSoundOn("Hero_Spectre.DaggerCast", self.caster)

	local info = {
		EffectName = "particles/units/heroes/hero_riki/riki_shard_sleeping_dart.vpcf",
		Ability = self,
		iMoveSpeed = 1100,
		Source = self.caster,
		Target = self.target,
		vSpawnOrigin = self.caster:GetAbsOrigin(),
		bDodgeable = true,
      	bProvidesVision = false,
		iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
	}

	ProjectileManager:CreateTrackingProjectile( info )

end

function priest_pain_shadows:OnProjectileHit(hTarget, vLocation)
	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then


		EmitSoundOn("Hero_Spectre.Desolate", self.target)
		self.target:AddNewModifier(self.caster, self, "modifier_priest_pain_shadows", { duration = self.duration })
	end
	return true
end
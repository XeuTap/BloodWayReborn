minotaur_earth_crack = class ({})
LinkLuaModifier("modifier_minotaur_earth_crack", "libraries/abilities/modifier_minotaur_earth_crack", LUA_MODIFIER_MOTION_NONE)


function minotaur_earth_crack:CastFilterResultTarget( hTarget )
	if self:GetCaster() == hTarget then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function minotaur_earth_crack:GetCustomCastErrorTarget( hTarget )
	if self:GetCaster() == hTarget then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function minotaur_earth_crack:OnSpellStart()
	--self:GetCaster():ForcePlayActivityOnce(ACT_RUN)
	local hTarget = self:GetCursorTarget()
	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then
		--EmitSoundOn( "Hero_OgreMagi.Fireblast.Target", hTarget )
		local stun_damage = self:GetSpecialValueFor( "impact_damage" )

		local damage = {
			victim = hTarget,
			attacker = self:GetCaster(),
			damage = stun_damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self
		}

		ApplyDamage( damage )

		self.nFXIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_tailthump_decal.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)
		self.nFXIndex2 = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_tailthump_ring.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)
		self.nFXIndex3 = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_tailthump_debris.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)
		--ParticleManager:SetParticleControl(self.nFXIndex1, 0, Vector(50, 0, 0))

		ParticleManager:ReleaseParticleIndex(self.nFXIndex1)
		ParticleManager:ReleaseParticleIndex(self.nFXIndex2)
		ParticleManager:ReleaseParticleIndex(self.nFXIndex3)

		EmitSoundOn("Hero_EarthShaker.Totem.Attack", self:GetCaster())
	end
end
minotaur_heal = class ({})
LinkLuaModifier("modifier_minotaur_heal", "libraries/abilities/modifier_minotaur_heal", LUA_MODIFIER_MOTION_NONE)

function minotaur_heal:CastFilterResultTarget( hTarget )

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function minotaur_heal:GetCustomCastErrorTarget( hTarget )
	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function minotaur_heal:OnSpellStart()
	local _caster = self:GetCaster()
	local hTarget = self:GetCursorTarget()

	local heal_amount = self:GetSpecialValueFor("heal_amount")

	local cursor_target = hTarget

	hTarget:Heal(heal_amount , self)

	-- Play sound
	EmitSoundOn("Hero_Oracle.PurifyingFlames.Damage", _caster)
	--self.nFXIndex1 = ParticleManager:CreateParticle("particles/econ/items/undying/fall20_undying_head/fall20_undying_soul_rip_heal_ground_source.vpcf", PATTACH_OVERHEAD_FOLLOW, hTarget)
	self.nFXIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_medusa/medusa_mana_shield_oldbase.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)

	--self.nFXIndex2 = ParticleManager:CreateParticle("particles/econ/items/undying/fall20_undying_head/fall20_undying_soul_rip_heal_ground_source.vpcf", PATTACH_OVERHEAD_FOLLOW, hTarget)
	--ParticleManager:SetParticleControlEnt( self.nFXIndex1, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_attack2", self:GetCaster():GetOrigin(), true );
	--ParticleManager:SetParticleControlEnt( self.nFXIndex1, 1, hTarget, PATTACH_ABSORIGIN_FOLLOW, nil, hTarget:GetOrigin(), true );
	--ParticleManager:ReleaseParticleIndex(self.nFXIndex1)
	Timers:CreateTimer(2, function()
      ParticleManager:DestroyParticle(self.nFXIndex1, false)
      ParticleManager:ReleaseParticleIndex(self.nFXIndex1)
      print("Particle destroyed")
      return
    end
  	)


end
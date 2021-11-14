druid_heal = class ({})
LinkLuaModifier("modifier_druid_heal", "libraries/abilities/modifier_druid_heal", LUA_MODIFIER_MOTION_NONE)

function druid_heal:CastFilterResultTarget( hTarget )

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function druid_heal:GetCustomCastErrorTarget( hTarget )
	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function druid_heal:OnSpellStart()
	local _caster = self:GetCaster()
	local hTarget = self:GetCursorTarget()

	local heal_amount = self:GetSpecialValueFor("heal_amount")

	local cursor_target = hTarget

	hTarget:Heal(heal_amount , self)

	-- Play sound
	EmitSoundOn("Hero_Treant.LivingArmor.Target", _caster)
	self.nFXIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_treant/treant_livingarmor.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)
	--ParticleManager:SetParticleControlEnt( self.nFXIndex1, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_attack2", self:GetCaster():GetOrigin(), true );
	ParticleManager:SetParticleControlEnt( self.nFXIndex1, 1, hTarget, PATTACH_ABSORIGIN_FOLLOW, nil, hTarget:GetOrigin(), true );
	
	Timers:CreateTimer(2, function()
      ParticleManager:DestroyParticle(self.nFXIndex1, false)
      print("Particle destroyed")
      return
    end
  	)


end

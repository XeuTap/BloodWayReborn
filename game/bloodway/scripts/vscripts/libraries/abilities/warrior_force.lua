warrior_force = class ({})
LinkLuaModifier("modifier_warrior_force", "libraries/abilities/modifier_warrior_force", LUA_MODIFIER_MOTION_NONE)

function warrior_force:OnSpellStart()
	local _caster = self:GetCaster()
	self.duration = self:GetSpecialValueFor("buff_duration")
	self.attackSpeed = _caster:GetAttackSpeed()
	local nFXIndex1 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
	local nFXIndex2 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness_b.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
	EmitSoundOn("DOTA_Item.MaskOfMadness.Activate", _caster)

	_caster:AddNewModifier(_caster, self, "modifier_warrior_force", { duration = self.duration, attackSpeed = self.attackSpeed })
	  Timers:CreateTimer(self.duration, function()
      ParticleManager:DestroyParticle( nFXIndex1, false)
      ParticleManager:DestroyParticle( nFXIndex2, false)
      local nFXIndex3 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness_d.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
      ParticleManager:DestroyParticle( nFXIndex3, false)
      return
    end
    )
end

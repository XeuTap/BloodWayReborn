pathfinder_sniper_mode = class ({})

LinkLuaModifier("modifier_pathfinder_sniper_mode", "libraries/abilities/pathfinder/modifier_pathfinder_sniper_mode", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_pathfinder_sniper_mode_debuff", "libraries/abilities/pathfinder/modifier_pathfinder_sniper_mode_debuff", LUA_MODIFIER_MOTION_NONE)

function pathfinder_sniper_mode:OnSpellStart()
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("buff_duration")

    caster:AddNewModifier(caster, self, "modifier_pathfinder_sniper_mode", { duration = duration })

    local nFXIndex1 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
	local nFXIndex2 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness_b.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
    local nFXIndex4 = ParticleManager:CreateParticle("particles/units/heroes/hero_marci/marci_sidekick_buff.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetCaster())
	EmitSoundOn("Hero_Marci.Guardian.Applied", caster)

	Timers:CreateTimer(duration, function()
      ParticleManager:DestroyParticle( nFXIndex1, false)
      ParticleManager:DestroyParticle( nFXIndex2, false)
      ParticleManager:DestroyParticle( nFXIndex4, false)
      local nFXIndex3 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness_d.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
      ParticleManager:DestroyParticle( nFXIndex3, false)
      return
    end
    )
end
sun_warrior_blessing = class ({})
LinkLuaModifier( "modifier_sun_warrior_blessing", "libraries/abilities/sun_warrior/modifier_sun_warrior_blessing", LUA_MODIFIER_MOTION_NONE )

function sun_warrior_blessing:OnSpellStart()
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    self.duration = self:GetSpecialValueFor("duration")

    target:AddNewModifier(caster, self, "modifier_sun_warrior_blessing", { duration = self.duration })
    
    EmitSoundOn("Hero_Omniknight.Repel", target)

    local nfxIndex1 = ParticleManager:CreateParticle("particles/econ/generic/generic_buff_1/generic_buff_1.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControlEnt(nfxIndex1, 0, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetOrigin(), true)
    ParticleManager:SetParticleControlEnt(nfxIndex1, 14, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetOrigin(), true)

    Timers:CreateTimer(self.duration, function()
        ParticleManager:DestroyParticle(nfxIndex1, false)
      end
    )
    
end
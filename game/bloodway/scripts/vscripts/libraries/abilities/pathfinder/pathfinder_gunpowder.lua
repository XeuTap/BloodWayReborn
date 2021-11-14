pathfinder_gunpowder = class ({})

LinkLuaModifier( "modifier_pathfinder_gunpowder_debuff", "libraries/abilities/pathfinder/modifier_pathfinder_gunpowder_debuff", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier( "modifier_pathfinder_gunpowder_debuff_ignite", "libraries/abilities/pathfinder/modifier_pathfinder_gunpowder_debuff_ignite", LUA_MODIFIER_MOTION_NONE)

function pathfinder_gunpowder:OnSpellStart()
    if IsServer() then
        local debuff_duration = self:GetSpecialValueFor("debuff_duration")
        local caster = self:GetCaster()
        local target = self:GetCursorTarget()
        target:AddNewModifier(caster, self, "modifier_pathfinder_gunpowder_debuff", { duration = debuff_duration })
        target:AddNewModifier(caster, self, "modifier_pathfinder_gunpowder_debuff_ignite", { duration = debuff_duration })
        local nfxIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_batrider/batrider_stickynapalm_impact.vpcf", PATTACH_ABSORIGIN, target)
        ParticleManager:ReleaseParticleIndex(nfxIndex1)
        EmitSoundOn("Hero_Batrider.StickyNapalm.Impact", caster)
    end 
end
cold_ranger_cold_touch = class ({})
LinkLuaModifier("modifier_cold_ranger_cold_touch", "libraries/abilities/cold_ranger/modifier_cold_ranger_cold_touch", LUA_MODIFIER_MOTION_NONE)

function cold_ranger_cold_touch:OnSpellStart()
    if IsServer() then
        local caster = self:GetCaster()
        local hTarget = self:GetCursorTarget()
        local debuff_duration = self:GetSpecialValueFor("debuff_duration")

        hTarget:AddNewModifier(caster, self, "modifier_cold_ranger_cold_touch", { duration = debuff_duration })
        local nfcIndex = ParticleManager:CreateParticle("particles/econ/items/lich/frozen_chains_ti6/lich_frozenchains_frostnova.vpcf", PATTACH_ABSORIGIN, hTarget)
        ParticleManager:ReleaseParticleIndex(nfcIndex)
        hTarget:EmitSound("Hero_Lich.SinisterGaze.Target")
    end
end
modifier_pathfinder_gunpowder_debuff = class ({})

function modifier_pathfinder_gunpowder_debuff:OnCreated()
    self:OnRefresh()
end

function modifier_pathfinder_gunpowder_debuff:OnRefresh()
    self.miss_chance = self:GetAbility():GetSpecialValueFor("blind_chance")
end

function modifier_pathfinder_gunpowder_debuff:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MISS_PERCENTAGE,
    }
    return funcs
end

function modifier_pathfinder_gunpowder_debuff:GetModifierMiss_Percentage()
    return self.miss_chance
end

function modifier_pathfinder_gunpowder_debuff:IsDebuff()
    return true
end

function modifier_pathfinder_gunpowder_debuff:IsHidden()
    return false
end

function modifier_pathfinder_gunpowder_debuff:GetStatusEffectName()
    return "particles/status_fx/status_effect_stickynapalm.vpcf"
end

function modifier_pathfinder_gunpowder_debuff:StatusEffectPriority()
    return MODIFIER_PRIORITY_SUPER_ULTRA
end

function modifier_pathfinder_gunpowder_debuff:GetEffectName()
    return "particles/units/heroes/hero_batrider/batrider_stickynapalm_debuff.vpcf"
end

function modifier_pathfinder_gunpowder_debuff:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end

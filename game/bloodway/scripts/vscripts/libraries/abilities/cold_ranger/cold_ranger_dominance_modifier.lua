cold_ranger_dominance_modifier = class ({})

function cold_ranger_dominance_modifier:OnCreated()
    self:OnRefresh()
end

function cold_ranger_dominance_modifier:OnRefresh()
    self.as_bonus_perc = self:GetAbility():GetSpecialValueFor("as_bonus_perc")
    self.m_resist_bonus_perc = self:GetAbility():GetSpecialValueFor("m_resist_bonus_perc")
end

function cold_ranger_dominance_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
    }
end

function cold_ranger_dominance_modifier:GetModifierAttackSpeedPercentage()
    return self.as_bonus_perc
end

function cold_ranger_dominance_modifier:GetModifierMagicalResistanceBonus()
    return self.m_resist_bonus_perc
end
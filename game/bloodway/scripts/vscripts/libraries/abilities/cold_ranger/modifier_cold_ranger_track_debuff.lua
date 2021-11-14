modifier_cold_ranger_track_debuff = class ({})

function modifier_cold_ranger_track_debuff:IsHidden()
return false
end

function modifier_cold_ranger_track_debuff:IsDebuff()
    return true
end
function modifier_cold_ranger_track_debuff:OnCreated()
    self:OnRefresh()
end
function modifier_cold_ranger_track_debuff:OnRefresh()
    self.slow_perc = self:GetAbility():GetSpecialValueFor("debuff_slow")
end

function modifier_cold_ranger_track_debuff:DeclareFunctions()
    local funcs =
    {
        MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_PROVIDES_FOW_POSITION
    }
    return funcs
end

function modifier_cold_ranger_track_debuff:GetEffectAttachType()
    return PATTACH_OVERHEAD_FOLLOW
end

function modifier_cold_ranger_track_debuff:GetEffectName()
    return "particles/units/heroes/hero_bounty_hunter/bounty_hunter_track_scroll.vpcf"
end

function modifier_cold_ranger_track_debuff:GetModifierAttackSpeedPercentage()
    return self.slow_perc
end

function modifier_cold_ranger_track_debuff:GetModifierMoveSpeedBonus_Percentage()
    return self.slow_perc
end

function modifier_cold_ranger_track_debuff:GetModifierProvidesFOWVision()
    return 1
end

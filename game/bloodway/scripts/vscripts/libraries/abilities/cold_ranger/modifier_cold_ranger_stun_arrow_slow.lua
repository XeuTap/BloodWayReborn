modifier_cold_ranger_stun_arrow_slow = class ({})

function modifier_cold_ranger_stun_arrow_slow:OnCreated()
    self:OnRefresh()
end

function modifier_cold_ranger_stun_arrow_slow:OnRefresh()
    self.slow_amount_perc = self:GetAbility():GetSpecialValueFor("slow_perc")
end

function modifier_cold_ranger_stun_arrow_slow:IsDebuff()
	return true
end

function modifier_cold_ranger_stun_arrow_slow:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
    }
    return funcs
end

function modifier_cold_ranger_stun_arrow_slow:GetModifierAttackSpeedPercentage()
	return self.slow_amount_perc
end

function modifier_cold_ranger_stun_arrow_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.slow_amount_perc
end

function modifier_cold_ranger_stun_arrow_slow:GetEffectName()
	return "particles/generic_gameplay/generic_slowed_cold.vpcf"
end

function modifier_cold_ranger_stun_arrow_slow:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
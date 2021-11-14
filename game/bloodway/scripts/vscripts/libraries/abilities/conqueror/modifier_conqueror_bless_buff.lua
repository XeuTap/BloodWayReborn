modifier_conqueror_bless_buff = class ({})

function modifier_conqueror_bless_buff:OnCreated()
    return self:OnRefresh()
end

function modifier_conqueror_bless_buff:OnRefresh()
    self.bonus_as_perc = self:GetAbility():GetSpecialValueFor("bonus_as_perc")
end

function modifier_conqueror_bless_buff:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
    }
    return funcs
end

function modifier_conqueror_bless_buff:GetModifierAttackSpeedPercentage()
    return self.bonus_as_perc
end
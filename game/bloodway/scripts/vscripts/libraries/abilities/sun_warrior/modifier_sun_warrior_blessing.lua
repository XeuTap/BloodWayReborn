modifier_sun_warrior_blessing = class ({})

function modifier_sun_warrior_blessing:OnCreated()
    self:OnRefresh()
end

function modifier_sun_warrior_blessing:OnRefresh()
    self.bonus_dmg_perc = self:GetAbility():GetSpecialValueFor("bonus_damage")
    self.bonus_hp_regen = self:GetAbility():GetSpecialValueFor("bonus_hp_regen")
end

function modifier_sun_warrior_blessing:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
    }
    return funcs
end

function modifier_sun_warrior_blessing:GetModifierBaseDamageOutgoing_Percentage()
    return self.bonus_dmg_perc
end

function modifier_sun_warrior_blessing:GetModifierConstantHealthRegen()
    return self.bonus_hp_regen
end

function modifier_sun_warrior_blessing:GetEffectName()
    return "particles/econ/generic/generic_buff_1/generic_buff_1.vpcf"
end

function modifier_sun_warrior_blessing:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end
patron_invicibility_modifier = class ({})

function patron_invicibility_modifier:OnCreated()
    self:OnRefresh()
end

function patron_invicibility_modifier:OnRefresh()
    self.invicibility = self:GetAbility():GetSpecialValueFor("resistance")
end

function patron_invicibility_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
    }
    return funcs
end

function patron_invicibility_modifier:GetModifierPhysicalArmorBonus()
    return 9999
end

function patron_invicibility_modifier:GetModifierMagicalResistanceBonus()
    return self.invicibility
end

function patron_invicibility_modifier:GetStatusEffectName()
    return "particles/status_fx/status_effect_guardian_angel.vpcf"
end

function patron_invicibility_modifier:GetEffectName()
    return "particles/units/heroes/hero_omniknight/omniknight_guardian_angel_ally.vpcf"
end

function patron_invicibility_modifier:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end
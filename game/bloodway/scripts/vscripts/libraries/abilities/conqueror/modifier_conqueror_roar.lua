modifier_conqueror_roar = class ({})

function modifier_conqueror_roar:OnCreated()
    self:OnRefresh()
end

function modifier_conqueror_roar:OnRefresh()
    self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
    self.bonus_damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
end

function modifier_conqueror_roar:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS

    }
    return funcs
end

function modifier_conqueror_roar:GetModifierPreAttack_BonusDamage()
    return self.bonus_damage
end

function modifier_conqueror_roar:GetModifierPhysicalArmorBonus()
    return self.bonus_armor
end

function modifier_conqueror_roar:GetStatusEffectName()
    return "particles/units/heroes/hero_sven/sven_warcry_buff.vpcf"
end

function modifier_conqueror_roar:GetEffectName()
    return "particles/units/heroes/hero_sven/sven_warcry_buff.vpcf"
end

function modifier_conqueror_roar:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end
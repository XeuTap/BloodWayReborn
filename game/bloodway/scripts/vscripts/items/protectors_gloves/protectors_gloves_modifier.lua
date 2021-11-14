item_protectors_gloves_modifier = class ({})


function item_protectors_gloves_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
    }
    return funcs
end

function item_protectors_gloves_modifier:OnCreated()
    self:OnRefresh()
end

function item_protectors_gloves_modifier:IsHidden()
    return true
end

function item_protectors_gloves_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_protectors_gloves_modifier:OnRefresh( data )
    self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
    self.bonus_as_percentage = self:GetAbility():GetSpecialValueFor("bonus_as_percent")
end

function item_protectors_gloves_modifier:GetModifierPreAttack_BonusDamage()
    return self.bonus_dmg
end

function item_protectors_gloves_modifier:GetModifierAttackSpeedPercentage()
    return self.bonus_as_percentage
end


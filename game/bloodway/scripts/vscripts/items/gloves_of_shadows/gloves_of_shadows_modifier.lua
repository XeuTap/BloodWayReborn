item_gloves_of_shadows_modifier = class ({})


function item_gloves_of_shadows_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
    }
    return funcs
end

function item_gloves_of_shadows_modifier:OnCreated()
    self:OnRefresh()
end

function item_gloves_of_shadows_modifier:IsHidden()
    return true
end

function item_gloves_of_shadows_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_gloves_of_shadows_modifier:OnRefresh( data )
    self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
    self.bonus_as_percent = self:GetAbility():GetSpecialValueFor("bonus_as_percent")
end

function item_gloves_of_shadows_modifier:GetModifierPreAttack_BonusDamage()
    return self.bonus_dmg
end

function item_gloves_of_shadows_modifier:GetModifierAttackSpeedPercentage()
    return self.bonus_as_percent
end

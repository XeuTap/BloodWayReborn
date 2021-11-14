item_shadow_dancer_cape_modifier = class ({})


function item_shadow_dancer_cape_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_EVASION_CONSTANT,
    }
    return funcs
end

function item_shadow_dancer_cape_modifier:OnCreated()
    self:OnRefresh()
end

function item_shadow_dancer_cape_modifier:IsHidden()
    return true
end

function item_shadow_dancer_cape_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_shadow_dancer_cape_modifier:OnRefresh( data )
    self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
    self.bonus_evasion_percent = self:GetAbility():GetSpecialValueFor("bonus_evasion_percent")
end

function item_shadow_dancer_cape_modifier:GetModifierBonusStats_Agility()
    return self.bonus_agi
end

function item_shadow_dancer_cape_modifier:GetModifierEvasion_Constant()
    return self.bonus_evasion_percent
end

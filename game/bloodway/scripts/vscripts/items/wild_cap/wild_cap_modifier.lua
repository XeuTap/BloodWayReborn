item_wild_cap_modifier = class ({})


function item_wild_cap_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS 
    }
    return funcs
end

function item_wild_cap_modifier:OnCreated()
    self:OnRefresh()
end

function item_wild_cap_modifier:IsHidden()
    return true
end

function item_wild_cap_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_wild_cap_modifier:OnRefresh( data )
    self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
    self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
end

function item_wild_cap_modifier:GetModifierBonusStats_Intellect()
    return self.bonus_int
end

function item_wild_cap_modifier:GetModifierBonusStats_Agility()
    return self.bonus_agi
end


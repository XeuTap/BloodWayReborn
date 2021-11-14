item_gnolls_gloves_modifier = class ({})


function item_gnolls_gloves_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
    }
    return funcs
end

function item_gnolls_gloves_modifier:OnCreated()
    self:OnRefresh()
end

function item_gnolls_gloves_modifier:IsHidden()
    return true
end

function item_gnolls_gloves_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_gnolls_gloves_modifier:OnRefresh( data )
    self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
end

function item_gnolls_gloves_modifier:GetModifierBonusStats_Strength()
    return self.bonus_str
end


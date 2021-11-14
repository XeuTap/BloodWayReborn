item_crystal_mask_modifier = class ({})


function item_crystal_mask_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_MANA_REGEN_PERCENTAGE 
    }
    return funcs
end

function item_crystal_mask_modifier:OnCreated()
    self:OnRefresh()
end

function item_crystal_mask_modifier:IsHidden()
    return true
end

function item_crystal_mask_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_crystal_mask_modifier:OnRefresh( data )
    self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
    self.mana_regen_perc = self:GetAbility():GetSpecialValueFor("mana_regen_percent")
end

function item_crystal_mask_modifier:GetModifierBonusStats_Intellect()
    return self.bonus_int
end

function item_crystal_mask_modifier:GetModifierPercentageManaRegen()
    return self.mana_regen_perc
end


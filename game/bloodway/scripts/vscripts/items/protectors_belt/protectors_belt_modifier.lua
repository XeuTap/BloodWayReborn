item_protectors_belt_modifier = class ({})


function item_protectors_belt_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        MODIFIER_PROPERTY_EXTRA_STRENGTH_BONUS
    }
    return funcs
end

function item_protectors_belt_modifier:OnCreated()
    self:OnRefresh()
end

function item_protectors_belt_modifier:IsHidden()
    return true
end

function item_protectors_belt_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_protectors_belt_modifier:OnRefresh( data )
    self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
    self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
end

function item_protectors_belt_modifier:GetModifierPhysicalArmorBonus()
    return self.bonus_armor
end

function item_protectors_belt_modifier:GetModifierExtraStrengthBonus()
    return self.bonus_str
end


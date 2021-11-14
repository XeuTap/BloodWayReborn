item_protectors_ring_modifier = class ({})


function item_protectors_ring_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    }
    return funcs
end

function item_protectors_ring_modifier:OnCreated()
    self:OnRefresh()
end

function item_protectors_ring_modifier:IsHidden()
    return true
end

function item_protectors_ring_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_protectors_ring_modifier:OnRefresh( data )
    self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
end

function item_protectors_ring_modifier:GetModifierPhysicalArmorBonus()
    return self.bonus_armor
end


item_wild_small_shield_modifier = class ({})


function item_wild_small_shield_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS ,
        MODIFIER_PROPERTY_PHYSICAL_CONSTANT_BLOCK  
    }
    return funcs
end

function item_wild_small_shield_modifier:OnCreated()
    self:OnRefresh()
end

function item_wild_small_shield_modifier:IsHidden()
    return true
end

function item_wild_small_shield_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_wild_small_shield_modifier:OnRefresh( data )
    self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
    self.damage_block = self:GetAbility():GetSpecialValueFor("bonus_dmg_reduction")
end

function item_wild_small_shield_modifier:GetModifierPhysicalArmorBonus()
    return self.bonus_armor
end

function item_wild_small_shield_modifier:GetModifierPhysical_ConstantBlock()
    return self.damage_block
end


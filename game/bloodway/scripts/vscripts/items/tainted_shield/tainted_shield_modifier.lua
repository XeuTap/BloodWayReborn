item_tainted_shield_modifier = class ({})
function item_tainted_shield_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_CONSTANT_BLOCK,
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
   }
   return funcs
end

function item_tainted_shield_modifier:OnCreated()
   self:OnRefresh()
end

function item_tainted_shield_modifier:IsHidden()
   return true
end

function item_tainted_shield_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_tainted_shield_modifier:OnRefresh( data )
   self.bonus_block = self:GetAbility():GetSpecialValueFor("bonus_block")
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
end

function item_tainted_shield_modifier:GetModifierPhysical_ConstantBlock()
   return self.bonus_block
end

function item_tainted_shield_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_tainted_shield_modifier:GetModifierBonusStats_Strength()
   return self.bonus_str
end
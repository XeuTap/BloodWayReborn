item_sea_fin_modifier = class ({})
function item_sea_fin_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
    MODIFIER_PROPERTY_EVASION_CONSTANT,
   }
   return funcs
end

function item_sea_fin_modifier:OnCreated()
   self:OnRefresh()
end

function item_sea_fin_modifier:IsHidden()
   return true
end

function item_sea_fin_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_sea_fin_modifier:OnRefresh( data )
   self.bonus_magic_armor = self:GetAbility():GetSpecialValueFor("bonus_magic_armor")
   self.bonus_evasion = self:GetAbility():GetSpecialValueFor("bonus_evasion")
end

function item_sea_fin_modifier:GetModifierMagicalResistanceBonus()
   return self.bonus_magic_armor
end

function item_sea_fin_modifier:GetModifierEvasion_Constant()
   return self.bonus_evasion
end
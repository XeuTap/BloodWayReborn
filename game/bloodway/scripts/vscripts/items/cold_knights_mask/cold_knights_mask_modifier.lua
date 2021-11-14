item_cold_knights_mask_modifier = class ({})
function item_cold_knights_mask_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
   }
   return funcs
end

function item_cold_knights_mask_modifier:OnCreated()
   self:OnRefresh()
end

function item_cold_knights_mask_modifier:IsHidden()
   return true
end

function item_cold_knights_mask_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_cold_knights_mask_modifier:OnRefresh( data )
   self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
end

function item_cold_knights_mask_modifier:GetModifierBonusStats_Agility()
   return self.bonus_agi
end

function item_cold_knights_mask_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end
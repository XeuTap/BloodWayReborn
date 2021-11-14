item_cold_wraith_mask_modifier = class ({})
function item_cold_wraith_mask_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_MANA_REGEN_PERCENTAGE,
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
   }
   return funcs
end

function item_cold_wraith_mask_modifier:OnCreated()
   self:OnRefresh()
end

function item_cold_wraith_mask_modifier:IsHidden()
   return true
end

function item_cold_wraith_mask_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_cold_wraith_mask_modifier:OnRefresh( data )
   self.bonus_mana_regen = self:GetAbility():GetSpecialValueFor("bonus_mana_regen")
   self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
end

function item_cold_wraith_mask_modifier:GetModifierPercentageManaRegen()
   return self.bonus_mana_regen
end

function item_cold_wraith_mask_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_int
end
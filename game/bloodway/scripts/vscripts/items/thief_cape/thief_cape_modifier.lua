item_thief_cape_modifier = class ({})
function item_thief_cape_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_EVASION_CONSTANT,
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
   }
   return funcs
end

function item_thief_cape_modifier:OnCreated()
   self:OnRefresh()
end

function item_thief_cape_modifier:IsHidden()
   return true
end

function item_thief_cape_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_thief_cape_modifier:OnRefresh( data )
   self.bonus_evasion = self:GetAbility():GetSpecialValueFor("bonus_evasion")
   self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
end

function item_thief_cape_modifier:GetModifierEvasion_Constant()
   return self.bonus_evasion
end

function item_thief_cape_modifier:GetModifierBonusStats_Agility()
   return self.bonus_agi
end
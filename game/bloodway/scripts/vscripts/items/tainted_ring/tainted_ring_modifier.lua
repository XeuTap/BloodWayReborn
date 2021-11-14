item_tainted_ring_modifier = class ({})
function item_tainted_ring_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    MODIFIER_PROPERTY_MANA_REGEN_PERCENTAGE,
   }
   return funcs
end

function item_tainted_ring_modifier:OnCreated()
   self:OnRefresh()
end

function item_tainted_ring_modifier:IsHidden()
   return true
end

function item_tainted_ring_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_tainted_ring_modifier:OnRefresh( data )
   self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
   self.bonus_mp_regen_perc = self:GetAbility():GetSpecialValueFor("bonus_mp_regen_perc")
end

function item_tainted_ring_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_int
end

function item_tainted_ring_modifier:GetModifierPercentageManaRegen()
   return self.bonus_mp_regen_perc
end
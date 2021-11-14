item_necromant_cap_modifier = class ({})
function item_necromant_cap_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
   }
   return funcs
end

function item_necromant_cap_modifier:OnCreated()
   self:OnRefresh()
end

function item_necromant_cap_modifier:IsHidden()
   return true
end

function item_necromant_cap_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_necromant_cap_modifier:OnRefresh( data )
   self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
   self.mp_regen_perc = self:GetAbility():GetSpecialValueFor("mp_regen_perc")
end

function item_necromant_cap_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_int
end

function item_necromant_cap_modifier:GetModifierMPRegenAmplify_Percentage()
   return self.mp_regen_perc
end
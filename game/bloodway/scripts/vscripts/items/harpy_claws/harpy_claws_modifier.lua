item_harpy_claws_modifier = class ({})
function item_harpy_claws_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
   }
   return funcs
end

function item_harpy_claws_modifier:OnCreated()
   self:OnRefresh()
end

function item_harpy_claws_modifier:IsHidden()
   return true
end

function item_harpy_claws_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_harpy_claws_modifier:OnRefresh( data )
   self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
   self.bonus_as_perc = self:GetAbility():GetSpecialValueFor("bonus_as_perc")
end

function item_harpy_claws_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_int
end

function item_harpy_claws_modifier:GetModifierAttackSpeedPercentage()
   return self.bonus_as_perc
end
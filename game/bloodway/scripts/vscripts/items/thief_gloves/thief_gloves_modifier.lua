item_thief_gloves_modifier = class ({})
function item_thief_gloves_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
   }
   return funcs
end

function item_thief_gloves_modifier:OnCreated()
   self:OnRefresh()
end

function item_thief_gloves_modifier:IsHidden()
   return true
end

function item_thief_gloves_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_thief_gloves_modifier:OnRefresh( data )
   self.bonus_as_perc = self:GetAbility():GetSpecialValueFor("bonus_as_perc")
   self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
end

function item_thief_gloves_modifier:GetModifierAttackSpeedPercentage()
   return self.bonus_as_perc
end

function item_thief_gloves_modifier:GetModifierBonusStats_Agility()
   return self.bonus_agi
end
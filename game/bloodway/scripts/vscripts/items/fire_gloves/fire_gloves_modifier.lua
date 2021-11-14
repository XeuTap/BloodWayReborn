item_fire_gloves_modifier = class ({})
function item_fire_gloves_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
   }
   return funcs
end

function item_fire_gloves_modifier:OnCreated()
   self:OnRefresh()
end

function item_fire_gloves_modifier:IsHidden()
   return true
end

function item_fire_gloves_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_fire_gloves_modifier:OnRefresh( data )
   self.bonus_attrs = self:GetAbility():GetSpecialValueFor("bonus_attrs")
   self.bonus_as_perc = self:GetAbility():GetSpecialValueFor("bonus_as_perc")
end

function item_fire_gloves_modifier:GetModifierBonusStats_Strength()
   return self.bonus_attrs
end
function item_fire_gloves_modifier:GetModifierBonusStats_Agility()
   return self.bonus_attrs
end
function item_fire_gloves_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_attrs
end

function item_fire_gloves_modifier:GetModifierAttackSpeedPercentage()
   return self.bonus_as_perc
end
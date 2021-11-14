item_dragon_wings_modifier = class ({})
function item_dragon_wings_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_EVASION_CONSTANT,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
   }
   return funcs
end

function item_dragon_wings_modifier:OnCreated()
   self:OnRefresh()
end

function item_dragon_wings_modifier:IsHidden()
   return true
end

function item_dragon_wings_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_dragon_wings_modifier:OnRefresh( data )
   self.bonus_attrs = self:GetAbility():GetSpecialValueFor("bonus_attrs")
   self.bonus_evasion = self:GetAbility():GetSpecialValueFor("bonus_evasion")
end

function item_dragon_wings_modifier:GetModifierBonusStats_Agility()
   return self.bonus_attrs
end
function item_dragon_wings_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_attrs
end
function item_dragon_wings_modifier:GetModifierBonusStats_Strength()
   return self.bonus_attrs
end

function item_dragon_wings_modifier:GetModifierEvasion_Constant()
   return self.bonus_evasion
end
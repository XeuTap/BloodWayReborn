item_skelet_helm_modifier = class ({})
function item_skelet_helm_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
   }
   return funcs
end

function item_skelet_helm_modifier:OnCreated()
   self:OnRefresh()
end

function item_skelet_helm_modifier:IsHidden()
   return true
end

function item_skelet_helm_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_skelet_helm_modifier:OnRefresh( data )
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
   self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
end

function item_skelet_helm_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_skelet_helm_modifier:GetModifierBonusStats_Agility()
   return self.bonus_agi
end

function item_skelet_helm_modifier:GetModifierBonusStats_Strength()
   return self.bonus_str
end
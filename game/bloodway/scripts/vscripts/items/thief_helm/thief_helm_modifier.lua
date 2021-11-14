item_thief_helm_modifier = class ({})
function item_thief_helm_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_MANA_REGEN_PERCENTAGE,
   }
   return funcs
end

function item_thief_helm_modifier:OnCreated()
   self:OnRefresh()
end

function item_thief_helm_modifier:IsHidden()
   return true
end

function item_thief_helm_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_thief_helm_modifier:OnRefresh( data )
   self.bonus_attrs = self:GetAbility():GetSpecialValueFor("bonus_attrs")
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_mp_regen_perc = self:GetAbility():GetSpecialValueFor("bonus_mp_regen_perc")
end

function item_thief_helm_modifier:GetModifierBonusStats_Agility()
   return self.bonus_attrs
end
function item_thief_helm_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_attrs
end
function item_thief_helm_modifier:GetModifierBonusStats_Strength()
   return self.bonus_attrs
end

function item_thief_helm_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_thief_helm_modifier:GetModifierPercentageManaRegen()
   return self.bonus_mp_regen_perc
end
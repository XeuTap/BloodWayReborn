item_cold_amulet_modifier = class ({})
function item_cold_amulet_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
   }
   return funcs
end

function item_cold_amulet_modifier:OnCreated()
   self:OnRefresh()
end

function item_cold_amulet_modifier:IsHidden()
   return true
end

function item_cold_amulet_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_cold_amulet_modifier:OnRefresh( data )
   self.bonus_attrs = self:GetAbility():GetSpecialValueFor("bonus_attrs")
end

function item_cold_amulet_modifier:GetModifierBonusStats_Agility()
   return self.bonus_attrs
end

function item_cold_amulet_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_attrs
end

function item_cold_amulet_modifier:GetModifierBonusStats_Strength()
   return self.bonus_attrs
end
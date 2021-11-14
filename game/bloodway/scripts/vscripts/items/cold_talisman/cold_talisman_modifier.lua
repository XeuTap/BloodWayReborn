item_cold_talisman_modifier = class ({})
function item_cold_talisman_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_MANA_BONUS,
   }
   return funcs
end

function item_cold_talisman_modifier:OnCreated()
   self:OnRefresh()
end

function item_cold_talisman_modifier:IsHidden()
   return true
end

function item_cold_talisman_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_cold_talisman_modifier:OnRefresh( data )
   self.bonus_mana = self:GetAbility():GetSpecialValueFor("bonus_mana")
end

function item_cold_talisman_modifier:GetModifierManaBonus()
   return self.bonus_mana
end
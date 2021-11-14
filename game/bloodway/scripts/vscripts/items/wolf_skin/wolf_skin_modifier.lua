item_wolf_skin_modifier = class ({})
function item_wolf_skin_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_MANA_REGEN_PERCENTAGE,
   }
   return funcs
end

function item_wolf_skin_modifier:OnCreated()
   self:OnRefresh()
end

function item_wolf_skin_modifier:IsHidden()
   return true
end

function item_wolf_skin_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_wolf_skin_modifier:OnRefresh( data )
   self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
   self.bonus_mp_regen = self:GetAbility():GetSpecialValueFor("bonus_mp_regen")
end

function item_wolf_skin_modifier:GetModifierBonusStats_Agility()
   return self.bonus_agi
end

function item_wolf_skin_modifier:GetModifierPercentageManaRegen()
   return self.bonus_mp_regen
end
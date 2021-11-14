item_sea_trident_modifier = class ({})
function item_sea_trident_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
   }
   return funcs
end

function item_sea_trident_modifier:OnCreated()
   self:OnRefresh()
end

function item_sea_trident_modifier:IsHidden()
   return true
end

function item_sea_trident_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_sea_trident_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
   self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
   self.bonus_as_perc = self:GetAbility():GetSpecialValueFor("bonus_as_perc")
end

function item_sea_trident_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_dmg
end

function item_sea_trident_modifier:GetModifierBonusStats_Agility()
   return self.bonus_agi
end

function item_sea_trident_modifier:GetModifierAttackSpeedPercentage()
   return self.bonus_as_perc
end
item_tainted_blade_modifier = class ({})
function item_tainted_blade_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
    MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
   }
   return funcs
end

function item_tainted_blade_modifier:OnCreated()
   self:OnRefresh()
end

function item_tainted_blade_modifier:IsHidden()
   return true
end

function item_tainted_blade_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_tainted_blade_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
   self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
   self.bonus_as_perc = self:GetAbility():GetSpecialValueFor("bonus_as_perc")
end

function item_tainted_blade_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_dmg
end

function item_tainted_blade_modifier:GetModifierBonusStats_Strength()
   return self.bonus_str
end

function item_tainted_blade_modifier:GetModifierAttackSpeedPercentage()
   return self.bonus_as_perc
end
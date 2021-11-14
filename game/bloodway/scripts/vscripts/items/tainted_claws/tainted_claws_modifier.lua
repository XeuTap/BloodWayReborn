item_tainted_claws_modifier = class ({})
function item_tainted_claws_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
   }
   return funcs
end

function item_tainted_claws_modifier:OnCreated()
   self:OnRefresh()
end

function item_tainted_claws_modifier:IsHidden()
   return true
end

function item_tainted_claws_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_tainted_claws_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
   self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
end

function item_tainted_claws_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_dmg
end

function item_tainted_claws_modifier:GetModifierBonusStats_Strength()
   return self.bonus_str
end
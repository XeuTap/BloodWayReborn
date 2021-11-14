item_owl_knuckles_modifier = class ({})
function item_owl_knuckles_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
    MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
   }
   return funcs
end

function item_owl_knuckles_modifier:OnCreated()
   self:OnRefresh()
end

function item_owl_knuckles_modifier:IsHidden()
   return true
end

function item_owl_knuckles_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_owl_knuckles_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
   self.bonus_dmg_perc = self:GetAbility():GetSpecialValueFor("bonus_dmg_perc")
   self.bonus_as_perc = self:GetAbility():GetSpecialValueFor("bonus_as_perc")
end

function item_owl_knuckles_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_dmg
end

function item_owl_knuckles_modifier:GetModifierBaseDamageOutgoing_Percentage()
   return self.bonus_dmg_perc
end

function item_owl_knuckles_modifier:GetModifierAttackSpeedPercentage()
   return self.bonus_as_perc
end
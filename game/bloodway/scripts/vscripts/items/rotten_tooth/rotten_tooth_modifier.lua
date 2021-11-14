item_rotten_tooth_modifier = class ({})
function item_rotten_tooth_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
   }
   return funcs
end

function item_rotten_tooth_modifier:OnCreated()
   self:OnRefresh()
end

function item_rotten_tooth_modifier:IsHidden()
   return true
end

function item_rotten_tooth_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_rotten_tooth_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
end

function item_rotten_tooth_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_dmg
end
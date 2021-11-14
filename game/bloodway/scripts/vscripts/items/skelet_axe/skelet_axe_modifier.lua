item_skelet_axe_modifier = class ({})
function item_skelet_axe_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
   }
   return funcs
end

function item_skelet_axe_modifier:OnCreated()
   self:OnRefresh()
end

function item_skelet_axe_modifier:IsHidden()
   return true
end

function item_skelet_axe_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_skelet_axe_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
end

function item_skelet_axe_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_dmg
end
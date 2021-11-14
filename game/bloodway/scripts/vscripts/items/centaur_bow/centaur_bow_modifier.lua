item_centaur_bow_modifier = class ({})
function item_centaur_bow_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
   }
   return funcs
end

function item_centaur_bow_modifier:OnCreated()
   self:OnRefresh()
end

function item_centaur_bow_modifier:IsHidden()
   return true
end

function item_centaur_bow_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_centaur_bow_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
end

function item_centaur_bow_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_dmg
end
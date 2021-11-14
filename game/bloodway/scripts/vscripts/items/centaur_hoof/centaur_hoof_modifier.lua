item_centaur_hoof_modifier = class ({})
function item_centaur_hoof_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
   }
   return funcs
end

function item_centaur_hoof_modifier:OnCreated()
   self:OnRefresh()
end

function item_centaur_hoof_modifier:IsHidden()
   return true
end

function item_centaur_hoof_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_centaur_hoof_modifier:OnRefresh( data )
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_ms = self:GetAbility():GetSpecialValueFor("bonus_ms")
end

function item_centaur_hoof_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_centaur_hoof_modifier:GetModifierMoveSpeedBonus_Constant()
   return self.bonus_ms
end
item_skelet_bones_modifier = class ({})
function item_skelet_bones_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
   }
   return funcs
end

function item_skelet_bones_modifier:OnCreated()
   self:OnRefresh()
end

function item_skelet_bones_modifier:IsHidden()
   return true
end

function item_skelet_bones_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_skelet_bones_modifier:OnRefresh( data )
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_regen = self:GetAbility():GetSpecialValueFor("bonus_regen")
end

function item_skelet_bones_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_skelet_bones_modifier:GetModifierHealthRegenPercentage()
   return self.bonus_regen
end
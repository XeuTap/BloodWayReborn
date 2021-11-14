item_necromant_pants_modifier = class ({})
function item_necromant_pants_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
   }
   return funcs
end

function item_necromant_pants_modifier:OnCreated()
   self:OnRefresh()
end

function item_necromant_pants_modifier:IsHidden()
   return true
end

function item_necromant_pants_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_necromant_pants_modifier:OnRefresh( data )
   self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
end

function item_necromant_pants_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_int
end

function item_necromant_pants_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end
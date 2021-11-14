item_thief_shoulder_modifier = class ({})
function item_thief_shoulder_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
   }
   return funcs
end

function item_thief_shoulder_modifier:OnCreated()
   self:OnRefresh()
end

function item_thief_shoulder_modifier:IsHidden()
   return true
end

function item_thief_shoulder_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_thief_shoulder_modifier:OnRefresh( data )
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
end

function item_thief_shoulder_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_thief_shoulder_modifier:GetModifierBonusStats_Agility()
   return self.bonus_agi
end
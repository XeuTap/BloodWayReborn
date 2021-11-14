item_sea_scaly_armor_modifier = class ({})
function item_sea_scaly_armor_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_HEALTH_BONUS,
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
   }
   return funcs
end

function item_sea_scaly_armor_modifier:OnCreated()
   self:OnRefresh()
end

function item_sea_scaly_armor_modifier:IsHidden()
   return true
end

function item_sea_scaly_armor_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_sea_scaly_armor_modifier:OnRefresh( data )
   self.bonus_hp = self:GetAbility():GetSpecialValueFor("bonus_hp")
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
end

function item_sea_scaly_armor_modifier:GetModifierHealthBonus()
   return self.bonus_hp
end

function item_sea_scaly_armor_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_sea_scaly_armor_modifier:GetModifierBonusStats_Strength()
   return self.bonus_str
end
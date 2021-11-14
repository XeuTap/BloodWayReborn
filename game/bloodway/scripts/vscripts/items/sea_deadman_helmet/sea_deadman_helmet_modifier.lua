item_sea_deadman_helmet_modifier = class ({})
function item_sea_deadman_helmet_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
    MODIFIER_PROPERTY_MANA_REGEN_PERCENTAGE,
   }
   return funcs
end

function item_sea_deadman_helmet_modifier:OnCreated()
   self:OnRefresh()
end

function item_sea_deadman_helmet_modifier:IsHidden()
   return true
end

function item_sea_deadman_helmet_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_sea_deadman_helmet_modifier:OnRefresh( data )
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_regen = self:GetAbility():GetSpecialValueFor("bonus_regen")
   self.bonus_mp_regen_perc = self:GetAbility():GetSpecialValueFor("bonus_mp_regen_perc")
end

function item_sea_deadman_helmet_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_sea_deadman_helmet_modifier:GetModifierConstantHealthRegen()
   return self.bonus_regen
end

function item_sea_deadman_helmet_modifier:GetModifierPercentageManaRegen()
   return self.bonus_mp_regen_perc
end
patron_armor_modifier = class ({})

function patron_armor_modifier:OnCreated(data)
    self:OnRefresh()
end

function patron_armor_modifier:OnRefresh()
end

patron_armor_modifier = class ({})
function patron_armor_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
   }
   return funcs
end

function patron_armor_modifier:IsHidden()
   return false
end

function patron_armor_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function patron_armor_modifier:GetModifierPhysicalArmorBonus()
    local targetUnit = self:GetParent()
    self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
    return self.bonus_armor
end

function patron_armor_modifier:GetEffectName()
   return "particles/units/heroes/hero_sven/sven_warcry_buff.vpcf"
end

function patron_armor_modifier:GetEffectAttachType()
   return PATTACH_ABSORIGIN_FOLLOW 
end
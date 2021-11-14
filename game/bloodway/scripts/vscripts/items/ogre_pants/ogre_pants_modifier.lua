item_ogre_pants_modifier = class ({})
function item_ogre_pants_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
    MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
   }
   return funcs
end

function item_ogre_pants_modifier:OnCreated()
   self:OnRefresh()
end

function item_ogre_pants_modifier:IsHidden()
   return true
end

function item_ogre_pants_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_ogre_pants_modifier:OnRefresh( data )
   self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
   self.bonus_attrs = self:GetAbility():GetSpecialValueFor("bonus_attrs")
   self.bonus_magic_armor = self:GetAbility():GetSpecialValueFor("bonus_magic_armor")
end

function item_ogre_pants_modifier:GetModifierPhysicalArmorBonus()
   return self.bonus_armor
end

function item_ogre_pants_modifier:GetModifierBonusStats_Agility()
   return self.bonus_attrs
end

function item_ogre_pants_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_attrs
end

function item_ogre_pants_modifier:GetModifierBonusStats_Strength()
   return self.bonus_attrs
end

function item_ogre_pants_modifier:GetModifierMagicalResistanceBonus()
   return self.bonus_magic_armor
end
item_dragonids_horn_modifier = class ({})
function item_dragonids_horn_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
   }
   return funcs
end

function item_dragonids_horn_modifier:OnCreated()
   self:OnRefresh()
end

function item_dragonids_horn_modifier:IsHidden()
   return true
end

function item_dragonids_horn_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_dragonids_horn_modifier:OnRefresh( data )
   self.bonus_mp_resist = self:GetAbility():GetSpecialValueFor("bonus_mp_resist_perc")
end

function item_dragonids_horn_modifier:GetModifierMagicalResistanceBonus()
   return self.bonus_mp_resist
end
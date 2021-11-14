item_trophy_horn_modifier = class ({})
function item_trophy_horn_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
   }
   return funcs
end

function item_trophy_horn_modifier:OnCreated()
   self:OnRefresh()
end

function item_trophy_horn_modifier:IsHidden()
   return true
end

function item_trophy_horn_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_trophy_horn_modifier:OnRefresh( data )
   self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
end

function item_trophy_horn_modifier:GetModifierBonusStats_Intellect()
   return self.bonus_int
end
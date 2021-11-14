item_battle_drum_modifier = class ({})
function item_battle_drum_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
   }
   return funcs
end

function item_battle_drum_modifier:OnCreated()
   self:OnRefresh()
end

function item_battle_drum_modifier:IsHidden()
   return false
end

function item_battle_drum_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_battle_drum_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
end

function item_battle_drum_modifier:GetModifierBaseDamageOutgoing_Percentage()
   return self.bonus_dmg
end
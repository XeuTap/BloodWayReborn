item_dragonid_sword_modifier = class ({})
function item_dragonid_sword_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
   }
   return funcs
end

function item_dragonid_sword_modifier:OnCreated()
   self:OnRefresh()
end

function item_dragonid_sword_modifier:IsHidden()
   return true
end

function item_dragonid_sword_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_dragonid_sword_modifier:OnRefresh( data )
   self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
end

function item_dragonid_sword_modifier:GetModifierBonusStats_Agility()
   return self.bonus_agi
end
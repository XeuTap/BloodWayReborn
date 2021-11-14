item_dragonid_boots_modifier = class ({})
function item_dragonid_boots_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_HEALTH_BONUS,
    MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
   }
   return funcs
end

function item_dragonid_boots_modifier:OnCreated()
   self:OnRefresh()
end

function item_dragonid_boots_modifier:IsHidden()
   return true
end

function item_dragonid_boots_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_dragonid_boots_modifier:OnRefresh( data )
   self.bonus_hp = self:GetAbility():GetSpecialValueFor("bonus_hp")
   self.bonus_ms = self:GetAbility():GetSpecialValueFor("bonus_ms")
end

function item_dragonid_boots_modifier:GetModifierHealthBonus()
   return self.bonus_hp
end

function item_dragonid_boots_modifier:GetModifierMoveSpeedBonus_Constant()
   return self.bonus_ms
end
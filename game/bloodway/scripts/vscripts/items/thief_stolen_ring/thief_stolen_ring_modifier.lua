item_thief_stolen_ring_modifier = class ({})
function item_thief_stolen_ring_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_HEALTH_BONUS,
    MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
   }
   return funcs
end

function item_thief_stolen_ring_modifier:OnCreated()
   self:OnRefresh()
end

function item_thief_stolen_ring_modifier:IsHidden()
   return true
end

function item_thief_stolen_ring_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_thief_stolen_ring_modifier:OnRefresh( data )
   self.bonus_hp = self:GetAbility():GetSpecialValueFor("bonus_hp")
   self.bonus_hp_regen = self:GetAbility():GetSpecialValueFor("bonus_regen")
end

function item_thief_stolen_ring_modifier:GetModifierHealthBonus()
   return self.bonus_hp
end

function item_thief_stolen_ring_modifier:GetModifierConstantHealthRegen()
   return self.bonus_hp_regen
end
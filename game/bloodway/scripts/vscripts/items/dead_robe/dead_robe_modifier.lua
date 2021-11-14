item_dead_robe_modifier = class ({})
function item_dead_robe_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_HEALTH_BONUS,
    MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
   }
   return funcs
end

function item_dead_robe_modifier:OnCreated()
   self:OnRefresh()
end

function item_dead_robe_modifier:IsHidden()
   return true
end

function item_dead_robe_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_dead_robe_modifier:OnRefresh( data )
   self.bonus_hp = self:GetAbility():GetSpecialValueFor("bonus_hp")
   self.bonus_regen = self:GetAbility():GetSpecialValueFor("bonus_regen")
end

function item_dead_robe_modifier:GetModifierHealthBonus()
   return self.bonus_hp
end

function item_dead_robe_modifier:GetModifierConstantHealthRegen()
   return self.bonus_regen
end
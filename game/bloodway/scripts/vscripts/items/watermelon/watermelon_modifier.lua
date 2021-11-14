item_watermelon_modifier = class ({})
function item_watermelon_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_MANA_REGEN_CONSTANT_UNIQUE,
    MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
   }
   return funcs
end

function item_watermelon_modifier:OnCreated()
   self:OnRefresh()
end

function item_watermelon_modifier:IsHidden()
   return false
end

function item_watermelon_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_NONE
end

function item_watermelon_modifier:OnRefresh( data )
   self.total_heal = self:GetAbility():GetSpecialValueFor("bonus_regen")
   self._duration = self:GetAbility():GetSpecialValueFor("buff_duration")
end

function item_watermelon_modifier:GetModifierConstantManaRegenUnique()
   return self.total_heal / self._duration
end

function item_watermelon_modifier:GetModifierConstantHealthRegen()
   return self.total_heal / self._duration
end


function item_watermelon_modifier:GetEffectName()
	return "particles/items_fx/healing_flask.vpcf"
end

--------------------------------------------------------------------------------

function item_watermelon_modifier:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
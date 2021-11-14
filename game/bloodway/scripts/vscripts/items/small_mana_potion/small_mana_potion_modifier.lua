item_small_mana_potion_modifier = class ({})
function item_small_mana_potion_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_MANA_REGEN_CONSTANT_UNIQUE,
   }
   return funcs
end

function item_small_mana_potion_modifier:OnCreated()
   self:OnRefresh()
end

function item_small_mana_potion_modifier:IsHidden()
   return false
end

function item_small_mana_potion_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_NONE
end

function item_small_mana_potion_modifier:OnRefresh( data )
   self.total_mp = self:GetAbility():GetSpecialValueFor("total_mp")
   self._duration = self:GetAbility():GetSpecialValueFor("buff_duration")
end

function item_small_mana_potion_modifier:GetModifierConstantManaRegenUnique()
   return self.total_mp / self._duration
end



function item_small_mana_potion_modifier:GetEffectName()
	return "particles/items_fx/healing_clarity.vpcf"
end

--------------------------------------------------------------------------------

function item_small_mana_potion_modifier:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
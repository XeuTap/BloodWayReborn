modifier_huntsman_track = class ({})

function modifier_huntsman_track:IsHidden()
	return false
end

function modifier_huntsman_track:IsDebuff()
	return true
end

function modifier_huntsman_track:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_PROVIDES_FOW_POSITION
	}
	return funcs
end

function modifier_huntsman_track:GetModifierPhysicalArmorBonus()
	local armor_value = self:GetAbility():GetSpecialValueFor("armor_reduction")
	return -armor_value
end

function modifier_huntsman_track:GetModifierProvidesFOWVision()
	return 1
end
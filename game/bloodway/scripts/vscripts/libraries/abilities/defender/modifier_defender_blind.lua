modifier_defender_blind = class ({})

function modifier_defender_blind:IsHidden()
	return false
end

function modifier_defender_blind:IsDebuff()
	return true
end

function modifier_defender_blind:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MISS_PERCENTAGE,
		MODIFIER_PROPERTY_PROVIDES_FOW_POSITION,
	}
	return funcs
end

function modifier_defender_blind:GetModifierMiss_Percentage()
	local miss_chance = self:GetAbility():GetSpecialValueFor("miss_chance")
	return miss_chance
end

function modifier_defender_blind:GetModifierProvidesFOWVision()
	return 1
end

function modifier_defender_blind:GetEffectName()
    return "particles/units/heroes/hero_keeper_of_the_light/keeper_of_the_light_blinding_light_debuff.vpcf"
end

function modifier_defender_blind:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end
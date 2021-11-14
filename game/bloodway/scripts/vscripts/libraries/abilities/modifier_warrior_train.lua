modifier_warrior_train = class ({})

function modifier_warrior_train:IsHidden()
	return false
end

function modifier_warrior_train:OnCreated(_kv)
	self.bonus_regen = self:GetAbility():GetSpecialValueFor("additional_regen")
	if IsServer() then
		self:GetParent():CalculateStatBonus(false)
	end
end

function modifier_warrior_train:OnRefresh(_kv)
	self.bonus_regen = self:GetAbility():GetSpecialValueFor("additional_regen")
	if IsServer() then
		self:GetParent():CalculateStatBonus(false)
	end
end

function modifier_warrior_train:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
	}
	return funcs
end

function modifier_warrior_train:GetModifierConstantHealthRegen()
	return self.bonus_regen + .0
end
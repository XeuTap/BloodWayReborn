modifier_druid_beast_rage = class ({})

function modifier_druid_beast_rage:IsHidden()
	return false
end

function modifier_druid_beast_rage:OnCreated()
	self:OnRefresh()
end

function modifier_druid_beast_rage:OnRefresh()
	self.slow_percent = self:GetAbility():GetSpecialValueFor("debuff_slow_percent")
end

function modifier_druid_beast_rage:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
	}
	return funcs
end

function modifier_druid_beast_rage:GetModifierMoveSpeedBonus_Percentage()
	return self.slow_percent
end

function modifier_druid_beast_rage:GetModifierAttackSpeedPercentage()
	return self.slow_percent
end
modifier_mage_stat_gain = class ({})

function modifier_mage_stat_gain:IsHidden()
	return true
end

function modifier_mage_stat_gain:OnCreated(_kv)
	self:OnRefresh()
end

function modifier_mage_stat_gain:OnRefresh(_kv)
	self.bonus_int = self:GetAbility():GetSpecialValueFor( "int_bonus" )
	if IsServer() then
		self:GetParent():CalculateStatBonus(false)
	end
end

function modifier_mage_stat_gain:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS
	}
	return funcs
end

function modifier_mage_stat_gain:GetModifierBonusStats_Intellect( params )
	return self.bonus_int
end
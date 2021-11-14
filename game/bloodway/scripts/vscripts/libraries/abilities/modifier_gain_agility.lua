modifier_gain_agility = class ({})

function modifier_gain_agility:IsHidden()
	return true
end

function modifier_gain_agility:OnCreated(_kv)
	self.bonus_agi = self:GetAbility():GetSpecialValueFor( "agility_bonus" )
	if IsServer() then
		self:GetParent():CalculateStatBonus(false)
	end
end

function modifier_gain_agility:OnRefresh(_kv)
	self.bonus_agi = self:GetAbility():GetSpecialValueFor( "agility_bonus" )
	if IsServer() then
		self:GetParent():CalculateStatBonus(false)
	end
end

function modifier_gain_agility:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS
	}
	return funcs
end

function modifier_gain_agility:GetModifierBonusStats_Agility( params )
	return self.bonus_agi
end
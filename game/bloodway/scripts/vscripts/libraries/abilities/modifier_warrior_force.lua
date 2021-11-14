modifier_warrior_force = class ({})

function modifier_warrior_force:IsHidden()
	return false
end

function modifier_warrior_force:OnCreated( _kv )
	self:OnRefresh( _kv )
end

function modifier_warrior_force:OnRefresh( _kv )
	local _ability = self:GetAbility()
	self.bonus_percentage = self:GetAbility():GetSpecialValueFor("bonus_percentage")
end

function modifier_warrior_force:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
	}
	--MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	return funcs
end

function modifier_warrior_force:GetModifierMoveSpeedBonus_Percentage()
	return self.bonus_percentage
end

--function modifier_warrior_force:GetModifierAttackSpeedBonus_Constant()
--	local _ability = self:GetAbility()
--	local _caster = _ability:GetCaster()
--	local agi = _caster:GetAgility()
--	--GetDisplayAttackSpeed() еще один вариант получить скорость атаки
--	-- получить ловкость (1 ловкость - 1 скорость атаки)
--	-- получить базовую атаку героя
--	-- вычислить 40% от этого числа
--	-- вернуть значение
--
--	--MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
--	--GetModifierAttackSpeedPercentage
--	
--	--return 100
--	return 40
--end

function modifier_warrior_force:GetModifierAttackSpeedPercentage()
	return self.bonus_percentage
end
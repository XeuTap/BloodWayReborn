modifier_mage_ice_star = class ({})

function modifier_mage_ice_star:IsHidden()
	return false
end

function modifier_mage_ice_star:OnCreated()
	self:OnRefresh()
	if IsServer() then
		self.nFXIndex10 = ParticleManager:CreateParticle('particles/units/heroes/hero_lich/lich_slowed_cold.vpcf', PATTACH_RENDERORIGIN_FOLLOW, self:GetParent())
	end
end

function modifier_mage_ice_star:IsDebuff()
	return true
end

function modifier_mage_ice_star:OnRefresh()
	self.bonus_percentage = self:GetAbility():GetSpecialValueFor("slow_value")
end

function modifier_mage_ice_star:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
	}
	--MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	return funcs
end

function modifier_mage_ice_star:GetModifierMoveSpeedBonus_Percentage()
	return -self.bonus_percentage
end

--function modifier_mage_ice_star:GetModifierAttackSpeedBonus_Constant()
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

function modifier_mage_ice_star:GetModifierAttackSpeedPercentage()
	return -self.bonus_percentage
end
modifier_guardian_armor = class ({})

function modifier_guardian_armor:IsHidden()
	return true
end

function modifier_guardian_armor:OnCreated()
	self:OnRefresh()
end

function modifier_guardian_armor:OnRefresh()
	self.ranged_dmg_reduction = self:GetAbility():GetSpecialValueFor("ranged_damage_reduction")
	self.spell_dmg_reduction = self:GetAbility():GetSpecialValueFor("spell_damage_reduction")
end

function modifier_guardian_armor:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MAGICAL_CONSTANT_BLOCK,
		MODIFIER_PROPERTY_INCOMING_PHYSICAL_DAMAGE_PERCENTAGE
	}
	return funcs
end

function modifier_guardian_armor:GetModifierMagical_ConstantBlock()
	return self.spell_dmg_reduction
end

function modifier_guardian_armor:GetModifierIncomingPhysicalDamage_Percentage( params )
	if IsServer() and (not self:GetParent():PassivesDisabled()) then
		local parent = self:GetParent()
		local attacker = params.attacker
		local reduction = 0

		if attacker:IsTower() then
			return 0
		end

		if attacker:IsRangedAttacker() then
			reduction = self.ranged_dmg_reduction
		end

		return -reduction
	end
end

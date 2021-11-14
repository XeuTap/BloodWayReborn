modifier_guardian_posion_dagger = class ({})

function modifier_guardian_posion_dagger:IsHidden()
	return true
end

function modifier_guardian_posion_dagger:OnCreated()
	self:OnRefresh()
end

function modifier_guardian_posion_dagger:OnRefresh()
	self.debuff_duration = self:GetAbility():GetSpecialValueFor("debuff_duration")
	self.parent = self:GetParent()
end

function modifier_guardian_posion_dagger:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
	return funcs
end


function modifier_guardian_posion_dagger:OnAttackLanded( params )
	if self.parent == params.target then return end
	local target = params.target
	target:AddNewModifier(self.parent, self:GetAbility(), "modifier_guardian_posion_dagger_debuff", { duration = self.debuff_duration })
end
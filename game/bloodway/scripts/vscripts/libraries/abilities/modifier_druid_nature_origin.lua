modifier_druid_nature_origin = class ({})

function modifier_druid_nature_origin:IsHidden()
	return true
end

function modifier_druid_nature_origin:OnCreated()
	self:OnRefresh()
end

function modifier_druid_nature_origin:OnRefresh()
	self.proc_chance = self:GetAbility():GetSpecialValueFor("proc_chance")
	self.pseudoseed = RandomInt( 1, 100 )
	self.parent = self:GetParent()
	self.bonus_damage = self:GetAbility():GetSpecialValueFor("additional_damage")
end

function modifier_druid_nature_origin:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
		MODIFIER_PROPERTY_EVASION_CONSTANT
	}
	return funcs
end

function modifier_druid_nature_origin:GetModifierProcAttack_Feedback( params )
	if not IsServer() then return end
	if not RollPseudoRandomPercentage( self.proc_chance, self.pseudoseed, self.parent ) then return end


	local info = {
				victim = params.target,
				attacker = self.parent,
				damage = self.bonus_damage + .0,
				damage_type = DAMAGE_TYPE_PHYSICAL,
				ability = self.parent
			}

	ApplyDamage(info)
end

function modifier_druid_nature_origin:GetModifierEvasion_Constant()
	return self.proc_chance
end
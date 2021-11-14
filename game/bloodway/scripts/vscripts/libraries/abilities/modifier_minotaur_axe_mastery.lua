modifier_minotaur_axe_mastery = class ({})

function modifier_minotaur_axe_mastery:IsHidden()
	return true
end

function modifier_minotaur_axe_mastery:OnCreated()
	self:OnRefresh()
end

function modifier_minotaur_axe_mastery:OnRefresh()
	self.pseudoseed = RandomInt( 1, 100 )
	self.parent = self:GetParent()
	self.proc_chance = self:GetAbility():GetSpecialValueFor("proc_chance")
	self.additional_damage = self:GetAbility():GetSpecialValueFor("additional_damage")
	self.closest_aoe = self:GetAbility():GetSpecialValueFor("close_distance")
	self.farer_aoe = self:GetAbility():GetSpecialValueFor("farer_distance")
	self.far_dmg_percent = self:GetAbility():GetSpecialValueFor("far_damage_percent")
end

function modifier_minotaur_axe_mastery:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
	}
	return funcs
end

function modifier_minotaur_axe_mastery:GetModifierProcAttack_Feedback( params )
	if not IsServer() then return end
	if not RollPseudoRandomPercentage( self.proc_chance, self.pseudoseed, self.parent ) then return end

	local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, params.target:GetAbsOrigin(), nil, self.closest_aoe, DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, true )
	local was_attacked = {}

	for index, _current_target in pairs(targets) do
		local info = {
				victim = _current_target,
				attacker = self.parent,
				damage = self.additional_damage + .0,
				damage_type = DAMAGE_TYPE_PHYSICAL,
				ability = self.parent
			}
		table.insert(was_attacked, _current_target)

		ApplyDamage(info)

	end

	local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, params.target:GetAbsOrigin(), nil, self.farer_aoe, DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, true )

	for index, _current_target in pairs(targets) do
		local info = {
				victim = _current_target,
				attacker = self.parent,
				damage = self.additional_damage / 100 * self.far_dmg_percent + .0,
				damage_type = DAMAGE_TYPE_PHYSICAL,
				ability = self.parent
			}
		print(self.additional_damage / 100 * self.far_dmg_percent + .0)
		if not hasValue(was_attacked, _current_target) then
			ApplyDamage(info)
		end
	end

	EmitSoundOn("Hero_EarthShaker.Totem.Attack", self.parent)
end
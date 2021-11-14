modifier_guardian_posion_dagger_debuff = class ({})

function modifier_guardian_posion_dagger_debuff:IsHidden()
	return false
end

function modifier_guardian_posion_dagger_debuff:IsDebuff()
	return true
end

function modifier_guardian_posion_dagger_debuff:OnCreated()
	self:OnRefresh()
	self:StartIntervalThink(1)
end

function modifier_guardian_posion_dagger_debuff:OnRefresh()
	self.parent = self:GetParent()
	self.movespeed_slow = self:GetAbility():GetSpecialValueFor("ms_slow")
	self.attackspeed_slow = self:GetAbility():GetSpecialValueFor("as_slow")
	self.thinker_damage = self:GetAbility():GetSpecialValueFor("pereodical_damage")
end

function modifier_guardian_posion_dagger_debuff:OnIntervalThink()
	if self:GetRemainingTime() < 0 then
		self:StartIntervalThink(-1)
	end
	if IsServer() then
		local damage = {
			victim = self.parent,
			attacker = self:GetAbility():GetCaster(),
			damage = self.thinker_damage,
			damage_type = DAMAGE_TYPE_PHYSICAL,
			damage_flag = DOTA_DAMAGE_FLAG_IGNORES_PHYSICAL_ARMOR,
			ability = self:GetAbility()
		}
		ApplyDamage(damage)
	end
end

function modifier_guardian_posion_dagger_debuff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
	}
	return funcs
end

function modifier_guardian_posion_dagger_debuff:GetModifierAttackSpeedPercentage()
	return self.attackspeed_slow
end

function modifier_guardian_posion_dagger_debuff:GetModifierMoveSpeedBonus_Percentage()
	return self.movespeed_slow
end

function modifier_guardian_posion_dagger_debuff:GetEffectName()
	return "particles/units/heroes/hero_viper/viper_corrosive_debuff.vpcf"
end

function modifier_guardian_posion_dagger_debuff:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
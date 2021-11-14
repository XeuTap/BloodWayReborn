modifier_guardian_poison = class ({})

function modifier_guardian_poison:IsHidden()
	return false
end

function modifier_guardian_poison:IsDebuff()
	return true
end

function modifier_guardian_poison:OnCreated()
	self:OnRefresh()
	self:StartIntervalThink(1)
end

function modifier_guardian_poison:OnRefresh()
	self.damage = self:GetAbility():GetSpecialValueFor("pereodical_damage")
end

function modifier_guardian_poison:OnIntervalThink()
	if self:GetRemainingTime() < 0 then
		self:StartIntervalThink(-1)
	end
	if IsServer() then
		local damage = {
			victim = self:GetParent(),
			attacker = self:GetAbility():GetCaster(),
			damage = self.damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage_flag = DOTA_DAMAGE_FLAG_NONE,
			ability = self:GetAbility()
		}
		ApplyDamage(damage)
	end
end

function modifier_guardian_poison:GetEffectName()
	return "particles/units/heroes/hero_viper/viper_corrosive_debuff.vpcf"
end

function modifier_guardian_poison:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
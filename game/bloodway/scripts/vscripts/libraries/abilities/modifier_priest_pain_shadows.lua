modifier_priest_pain_shadows = class ({})



function modifier_priest_pain_shadows:OnCreated()
	self:OnRefresh()
	if IsServer() then
		if self.nFXIndex1 == nil then
			self.nFXIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_bane/bane_enfeeble.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
		end
	end
	self:StartIntervalThink(1)
end

function modifier_priest_pain_shadows:IsStackable()
	return false
end

function modifier_priest_pain_shadows:OnRefresh()
	self.time_duration = self:GetAbility():GetSpecialValueFor("time_duration")
	self.damage = self:GetAbility():GetSpecialValueFor("damage_dealt")
end

function modifier_priest_pain_shadows:DeclareFunctions()
	local funcs = {	
	}
	return funcs
end

function modifier_priest_pain_shadows:IsHidden()
	return false
end

function modifier_priest_pain_shadows:IsDebuff()
	return true
end

function modifier_priest_pain_shadows:OnDestroy()
	ParticleManager:DestroyParticle( self.nFXIndex1, false)
end

function modifier_priest_pain_shadows:DealDamage( target )
	if IsServer() then
		local damage = {
			victim = target,
			attacker = self:GetAbility():GetCaster(),
			damage = self.damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility()
		}
	
		ApplyDamage(damage)
	end
end

function modifier_priest_pain_shadows:OnIntervalThink()
	if self:GetRemainingTime() < 0 then
		self:StartIntervalThink(-1)
	end
    self:DealDamage(self:GetParent())
end

modifier_mage_dire_curse = class ({})


function modifier_mage_dire_curse:OnCreated()
	self:OnRefresh()
	if IsServer() then
		if self.nFXIndex1 == nil then
			self.nFXIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_warlock/warlock_fatal_bonds_icon.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
		end
	end
	self.impact_damage = true
	self:StartIntervalThink(1)
end

function modifier_mage_dire_curse:IsStackable()
	return false
end

function modifier_mage_dire_curse:OnRefresh()
	self.time_duration = self:GetAbility():GetSpecialValueFor("time_duration")
	self.damage = self:GetAbility():GetSpecialValueFor("damage_dealt")
end

function modifier_mage_dire_curse:DeclareFunctions()
	local funcs = {	
	}
	return funcs
end

function modifier_mage_dire_curse:IsHidden()
	return false
end

function modifier_mage_dire_curse:IsDebuff()
	return true
end

function modifier_mage_dire_curse:OnDestroy()
	if self.nFXIndex1 ~= nil then
		ParticleManager:DestroyParticle( self.nFXIndex1, false)
	end
end

function modifier_mage_dire_curse:DealDamage( target )
	if IsServer() then
		local damage = {
			victim = target,
			attacker = self:GetAbility():GetCaster(),
			damage = self.damage / 2,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility()
		}
		if self.impact_damage == true then
			damage['damage'] = self.damage
			self.impact_damage = false
		end
	
		ApplyDamage(damage)
	end
end

function modifier_mage_dire_curse:OnIntervalThink()
	if self:GetRemainingTime() < 0 then
		self:StartIntervalThink(-1)
	end
    self:DealDamage(self:GetParent())
end

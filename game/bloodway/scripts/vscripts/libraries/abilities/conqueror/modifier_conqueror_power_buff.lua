modifier_conqueror_power_buff = class({})

function modifier_conqueror_power_buff:OnCreated()
    self:OnRefresh()
end

function modifier_conqueror_power_buff:OnRefresh()
    self.cleave_damage = self:GetAbility():GetSpecialValueFor("splash_damage")
    self.cleave_radius = self:GetAbility():GetSpecialValueFor("cleave_radius")
end

function modifier_conqueror_power_buff:DeclareFunctions()
    local funcs = {
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
    return funcs
end


function modifier_conqueror_power_buff:OnAttackLanded( params )
	if IsServer() then
		if params.attacker == self:GetParent() and ( not self:GetParent():IsIllusion() ) then
			if self:GetParent():PassivesDisabled() then
				return 0
			end

			local target = params.target
			if target ~= nil and target:GetTeamNumber() ~= self:GetParent():GetTeamNumber() then
				local cleaveDamage = ( self.cleave_damage * params.damage ) / 100.0
				DoCleaveAttack( self:GetParent(), target, self:GetAbility(), cleaveDamage, self.cleave_radius,self.cleave_radius,  self.cleave_radius, "particles/units/heroes/hero_sven/sven_spell_great_cleave.vpcf" )
			end
		end
	end
	
	return 0
end
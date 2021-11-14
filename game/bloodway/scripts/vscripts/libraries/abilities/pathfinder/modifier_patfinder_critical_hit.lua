modifier_patfinder_critical_hit = class ({})

function modifier_patfinder_critical_hit:IsHidden()
	return true
end

function modifier_patfinder_critical_hit:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE
	}
	return funcs
end

function modifier_patfinder_critical_hit:OnCreated( _kv )
	self:OnRefresh( _kv )
end

function modifier_patfinder_critical_hit:OnRefresh( _kv )
	local ability = self:GetAbility()
	self.crit_chance = ability:GetSpecialValueFor("crit_chance")
	self.dmg_multiplier = ability:GetSpecialValueFor("crit_damage")
	self.is_crit = false
end

function modifier_patfinder_critical_hit:GetModifierPreAttack_CriticalStrike( params )
	if IsServer() then
		local _attacker = params.attacker
		local _target = params.target
		if _target and ( _target:IsBuilding() == false ) 
				and _attacker and ( _attacker == self:GetParent() )
				and ( _attacker:GetTeamNumber() ~= _target:GetTeamNumber() ) then
			if RollPseudoRandomPercentage( self.crit_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, _attacker ) == true then
			   	self.is_crit = true
			   	return self.dmg_multiplier * 100
			end
		end
	end
	return 0.0
end

function modifier_patfinder_critical_hit:OnAttackLanded( params )
	if IsServer() then
		if params.attacker == self:GetParent() then
			local _target = params.target
			if _target ~= nil and self.is_crit then
				local vDir = ( self:GetParent():GetAbsOrigin() - _target:GetAbsOrigin() ):Normalized()

				local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact.vpcf", PATTACH_CUSTOMORIGIN, self:GetParent() )
				ParticleManager:SetParticleControlEnt( nFXIndex, 0, _target, PATTACH_POINT_FOLLOW, "attach_hitloc", _target:GetAbsOrigin(), true )
				ParticleManager:SetParticleControl( nFXIndex, 1, _target:GetAbsOrigin() )
				ParticleManager:SetParticleControlForward( nFXIndex, 1, vDir )
				ParticleManager:SetParticleControlEnt( nFXIndex, 10, _target, PATTACH_ABSORIGIN_FOLLOW, nil, _target:GetAbsOrigin(), true )
				ParticleManager:ReleaseParticleIndex( nFXIndex )

				EmitSoundOn( "Hero_PhantomAssassin.CoupDeGrace", self:GetParent() )
				self.is_crit = false
			end
		end
	end
	return 0
end
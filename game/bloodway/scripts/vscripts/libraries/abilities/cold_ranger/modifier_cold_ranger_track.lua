modifier_cold_ranger_track = class ({})

function modifier_cold_ranger_track:IsHidden()
	return true
end

function modifier_cold_ranger_track:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
	}
	return funcs
end

function modifier_cold_ranger_track:OnCreated( _kv )
	self:OnRefresh( _kv )
end

function modifier_cold_ranger_track:OnRefresh( _kv )
	local ability = self:GetAbility()
	self.crit_chance = ability:GetSpecialValueFor("crit_chance")
	self.dmg_multiplier = ability:GetSpecialValueFor("crit_dmg_multiplier")
end


function modifier_cold_ranger_track:OnAttackLanded( params )
	if IsServer() then
		if params.attacker == self:GetParent() then
			local _target = params.target
            local _attacker = params.attacker
            local debuff_modifier = _target:FindModifierByName("modifier_cold_ranger_track_debuff")
			if _target ~= nil and debuff_modifier then
                if RollPseudoRandomPercentage( self.crit_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, _attacker ) == true then
                    local ability = self:GetAbility()
                    local caster = self:GetAbility():GetCaster()
                    local int_multiplier = ability:GetSpecialValueFor("int_dmg_multiplier")
                    local agi_multiplier =  ability:GetSpecialValueFor("agi_dmg_multiplier")
                    local heroAgility = caster:GetAgility()
                    local heroIntellegence = caster:GetIntellect()
                    local damage = ( heroAgility * agi_multiplier ) + (heroIntellegence * int_multiplier)
                    local info = 
                    {
                        victim = _target,
                        attacker = params.attacker,
                        damage = damage,
                        damage_type = DAMAGE_TYPE_MAGICAL,
                        damage_flags = DOTA_DAMAGE_FLAG_NONE,
                        ability = ability,
                    }
                    ApplyDamage( info )
				    local vDir = ( self:GetParent():GetAbsOrigin() - _target:GetAbsOrigin() ):Normalized()

				    local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact.vpcf", PATTACH_CUSTOMORIGIN, self:GetParent() )
				    ParticleManager:SetParticleControlEnt( nFXIndex, 0, _target, PATTACH_POINT_FOLLOW, "attach_hitloc", _target:GetAbsOrigin(), true )
				    ParticleManager:SetParticleControl( nFXIndex, 1, _target:GetAbsOrigin() )
				    ParticleManager:SetParticleControlForward( nFXIndex, 1, vDir )
				    ParticleManager:SetParticleControlEnt( nFXIndex, 10, _target, PATTACH_ABSORIGIN_FOLLOW, nil, _target:GetAbsOrigin(), true )
				    ParticleManager:ReleaseParticleIndex( nFXIndex )

				    EmitSoundOn( "Hero_PhantomAssassin.CoupDeGrace", self:GetParent() )
                end
			end
		end
	end
	return 0
end
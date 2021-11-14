modifier_guardian_invis = class ({})


function modifier_guardian_invis:OnCreated()
	self:OnRefresh()
end

function modifier_guardian_invis:OnRefresh()
	self._isHidden = true
	self._additional_damage = self:GetAbility():GetSpecialValueFor("impact_damage")
end

function modifier_guardian_invis:IsHidden()
	return false
end

function modifier_guardian_invis:IsDebuff()
	return false
end


function modifier_guardian_invis:CheckState()
	local state = {
		[MODIFIER_STATE_INVISIBLE] = true,
	}

	return state
end

function modifier_guardian_invis:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_INVISIBILITY_LEVEL,
		MODIFIER_EVENT_ON_BREAK_INVISIBILITY,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
	}
	return funcs
end

function modifier_guardian_invis:OnAttackLanded( params )
	local damage = {
		victim = params.target,
		attacker = self:GetParent(),
		damage = self._additional_damage + .0,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		damage_flags = DOTA_DAMAGE_FLAG_NONE,
		ability = self:GetAbility()
	}	
	ApplyDamage(damage)
	self:Destroy()
end

function modifier_guardian_invis:OnDestroy()
	EmitSoundOn("Hero_PhantomAssassin.Strike.End", self:GetParent())
end

function modifier_guardian_invis:GetModifierInvisibilityLevel( params )
    return 0.49
end

--function modifier_guardian_invis:GetEffectName()
--	return "particles/units/heroes/hero_phantom_assassin/phantom_assassin_blur.vpcf"
--	--return "particles/units/heroes/hero_phantom_assassin/phantom_assassin_active_blur.vpcf"
--end

--function modifier_guardian_invis:GetEffectAttachType()
--	return PATTACH_ABSORIGIN_FOLLOW
--end
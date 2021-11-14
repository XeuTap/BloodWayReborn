modifier_cold_ranger_stun_arrow = class ({})

function modifier_cold_ranger_stun_arrow:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_cold_ranger_stun_arrow:IsStunDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_cold_ranger_stun_arrow:GetEffectName()
	return "particles/generic_gameplay/generic_stunned.vpcf"
end

--------------------------------------------------------------------------------

function modifier_cold_ranger_stun_arrow:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_cold_ranger_stun_arrow:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}

	return funcs
end

--------------------------------------------------------------------------------

function modifier_cold_ranger_stun_arrow:GetOverrideAnimation( params )
	return ACT_DOTA_DISABLED
end

--------------------------------------------------------------------------------

function modifier_cold_ranger_stun_arrow:CheckState()
	local state = {
	[MODIFIER_STATE_STUNNED] = true,
	}

	return state
end
modifier_minotaur_heal = class ({})

function modifier_minotaur_heal:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION
	}
	return funcs
end

function modifier_minotaur_heal:GetOverrideAnimation()
	return ACT_DOTA_ATTACK
end
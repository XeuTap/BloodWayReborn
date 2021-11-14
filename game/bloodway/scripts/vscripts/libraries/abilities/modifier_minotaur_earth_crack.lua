modifier_minotaur_earth_crack = class ({})

function modifier_minotaur_earth_crack:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION
	}
	return funcs
end

function modifier_minotaur_earth_crack:GetOverrideAnimation()
	return ACT_DOTA_CAST_ABILITY_4_END
end
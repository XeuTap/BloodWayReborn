modifier_druid_heal = class ({})

function modifier_druid_heal:IsHidden()
	return false
end

function modifier_druid_heal:GetStatusEffectName()
	--return "particles/units/heroes/hero_treant/treant_living_armor_colorbuff.vpcf"
	return "particles/status_fx/status_effect_frost_lich.vpcf"
end
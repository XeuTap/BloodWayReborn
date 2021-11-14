priest_spawn_shadow = class ({})

function priest_spawn_shadow:CastFilterResultLocation( hLocation )

	return UF_SUCCESS
end

function priest_spawn_shadow:GetCustomCastErrorTarget( hTarget )
	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function priest_spawn_shadow:OnSpellStart()
	local _caster = self:GetCaster()
	local _point = self:GetCursorPosition()
	local min_dmg = self:GetSpecialValueFor("creature_min_damage")
	local max_dmg = self:GetSpecialValueFor("creature_max_damage")
	local health = self:GetSpecialValueFor("creature_health")
	local armor = self:GetSpecialValueFor("creature_armor")
	local lifespan = self:GetSpecialValueFor("spawn_duration")

	local unit = CreateUnitByName("spawn_creature_1", _point, true, _caster, nil, DOTA_TEAM_GOODGUYS)
	unit:SetControllableByPlayer(_caster:GetPlayerID(), true)
	unit:SetBaseDamageMin(min_dmg)
	unit:SetBaseDamageMax(max_dmg)
	unit:SetHealth(health + .0)
	unit:SetMaxHealth(health + .0)
	unit:SetPhysicalArmorBaseValue(armor)

	unit:AddNewModifier(_caster, nil, "modifier_kill", {duration = lifespan})
	EmitSoundOn("Hero_Enigma.Demonic_Conversion", unit)
end
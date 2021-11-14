minotaur_zipper_chain = class ({})

function minotaur_zipper_chain:OnSpellStart()
	local _caster = self:GetCaster()
	local _target = self:GetCursorTarget()
	local impact_damage = self:GetSpecialValueFor("impact_damage")
	local decrement_per_target = self:GetSpecialValueFor("damage_decrement_percent")
	local distance = self:GetSpecialValueFor("leap_distance")
	local leap_count = self:GetSpecialValueFor("targets_count")


	local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, _target:GetAbsOrigin(), nil, distance, DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, true )
	local prev_target = _caster

	EmitSoundOn("Hero_Zuus.ArcLightning.Cast", _target)

	for index, _current_target in pairs(targets) do
		if index > leap_count then break end
		local info = {
				victim = _current_target,
				attacker = _caster,
				damage = impact_damage + .0,
				damage_type = DAMAGE_TYPE_MAGICAL,
				ability = self
			}
		impact_damage = impact_damage / 100 * (100 - decrement_per_target)
		ApplyDamage(info)
		local nFXIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_arc_lightning.vpcf", PATTACH_POINT_FOLLOW, _current_target)
		ParticleManager:SetParticleControlEnt(nFXIndex1, 1, prev_target, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), false)
		ParticleManager:ReleaseParticleIndex(nFXIndex1)
		prev_target = _current_target
		EmitSoundOn("Hero_Zuus.ArcLightning.Target", _current_target)
	end
end
druid_beast_rage = class ({})
LinkLuaModifier("modifier_druid_beast_rage", "libraries/abilities/modifier_druid_beast_rage", LUA_MODIFIER_MOTION_NONE)

function druid_beast_rage:OnSpellStart()
	local _caster = self:GetCaster()
	local radius = self:GetSpecialValueFor("damage_radius")
	local _damage = self:GetSpecialValueFor("damage_dealt")
	local debuff_duration = self:GetSpecialValueFor("debuff_duration")

	local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, _caster:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, FIND_ANY_ORDER, true )
	for index, _target in pairs(targets) do
		local damage_info = {
			victim = _target,
			attacker = _caster,
			damage = _damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self
		}
		ApplyDamage(damage_info)
		_target:AddNewModifier(_caster, self, "modifier_druid_beast_rage", { duration = debuff_duration })
	end
	local nFXIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp.vpcf", PATTACH_POINT, _caster)
	ParticleManager:SetParticleControlEnt(nFXIndex1, 1, _caster, PATTACH_POINT, "attach_hitloc", _caster:GetOrigin(), false)
	ParticleManager:ReleaseParticleIndex(nFXIndex1)
	EmitSoundOn("Hero_EarthShaker.Totem", _caster)
end
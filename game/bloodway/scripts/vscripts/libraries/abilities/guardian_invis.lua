guardian_invis = class ({})
LinkLuaModifier("modifier_guardian_invis", "libraries/abilities/modifier_guardian_invis", LUA_MODIFIER_MOTION_NONE)

function guardian_invis:OnSpellStart()
	local _caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("invis_duration")
	_caster:AddNewModifier(_caster, self, "modifier_guardian_invis", { duration = duration })
	local nFXIndex1 = ParticleManager:CreateParticle("particles/generic_hero_status/status_invisibility_start.vpcf", PATTACH_ABSORIGIN_FOLLOW, _caster)
	ParticleManager:ReleaseParticleIndex(nFXIndex1)
	EmitSoundOn("Hero_PhantomAssassin.Strike.Start", _caster)
end
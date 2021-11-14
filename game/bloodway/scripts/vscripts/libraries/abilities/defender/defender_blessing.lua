defender_blessing = class({})
LinkLuaModifier( "modifier_defender_blessing", "libraries/abilities/defender/modifier_defender_blessing", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Ability Start
function defender_blessing:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()

	-- load data
	local buffDuration = self:GetSpecialValueFor("duration")

	-- Add modifier
	target:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_defender_blessing", -- modifier name
		{ duration = buffDuration } -- kv
	)

	-- Play Effects
	self:PlayEffects()
end

function defender_blessing:PlayEffects()
	local particle_cast = "particles/units/heroes/hero_chen/chen_divine_favor.vpcf"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		0,
		self:GetCaster(),
		PATTACH_ABSORIGIN_FOLLOW,
		"attach_hitloc",
		self:GetCaster():GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:ReleaseParticleIndex( effect_cast )
end
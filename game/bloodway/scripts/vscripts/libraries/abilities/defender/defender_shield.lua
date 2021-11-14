defender_shield = class({})
LinkLuaModifier( "modifier_defender_shield", "libraries/abilities/defender/modifier_defender_shield", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function defender_shield:OnToggle()
	if self:GetToggleState() then
		self:ToggleOn()
	else
		self:ToggleOff()
	end
	return
end

function defender_shield:ToggleOn()
	local caster = self:GetCaster()
	caster:AddNewModifier(caster, self, "modifier_defender_shield", {} )
	self.shieldParticle = ParticleManager:CreateParticle("particles/econ/items/dragon_knight/dk_aurora_warrior/dk_aurora_warrior_shield_ambient_shield.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
	ParticleManager:SetParticleControlEnt(self.shieldParticle, 0, caster, PATTACH_POINT_FOLLOW, "attach_shield", caster.shield:GetAbsOrigin(), true)
end

function defender_shield:ToggleOff()
	local caster = self:GetCaster()
	local shieldModifier = caster:FindModifierByName("modifier_defender_shield")
	shieldModifier:Destroy()
	print("Modifier Destroyed")
	ParticleManager:DestroyParticle(self.shieldParticle, true)
end
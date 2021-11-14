patron_shield = class({})
LinkLuaModifier( "modifier_patron_shield", "libraries/abilities/patron/modifier_patron_shield", LUA_MODIFIER_MOTION_NONE )

function patron_shield:OnToggle()
	if self:GetToggleState() then
		self:ToggleOn()
	else
		self:ToggleOff()
	end
	return
end

function patron_shield:ToggleOn()
	local caster = self:GetCaster()
	caster:AddNewModifier(caster, self, "modifier_patron_shield", {} )
	self.shieldParticle = ParticleManager:CreateParticle("particles/econ/items/dragon_knight/dk_aurora_warrior/dk_aurora_warrior_shield_ambient_shield.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
	ParticleManager:SetParticleControlEnt(self.shieldParticle, 0, caster, PATTACH_POINT_FOLLOW, "attach_shield", caster.shield:GetAbsOrigin(), true)
end

function patron_shield:ToggleOff()
	local caster = self:GetCaster()
	local shieldModifier = caster:FindModifierByName("modifier_patron_shield")
	shieldModifier:Destroy()
	ParticleManager:DestroyParticle(self.shieldParticle, true)
end
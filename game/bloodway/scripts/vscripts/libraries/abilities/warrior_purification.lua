warrior_purification = class ({})
LinkLuaModifier("modifier_warrior_purification", "libraries/abilities/modifier_warrior_purification", LUA_MODIFIER_MOTION_NONE)

function warrior_purification:OnSpellStart( params )
	local heal_amount = self:GetSpecialValueFor("heal_amount")

	local hTarget = self:GetCaster()

	local nFXIndex1 = ParticleManager:CreateParticle( "particles/units/heroes/hero_omniknight/omniknight_purification.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControlEnt( nFXIndex1, 0, hTarget, PATTACH_ABSORIGIN_FOLLOW, nil, hTarget:GetOrigin(), true  );
	ParticleManager:SetParticleControl( nFXIndex1, 1, Vector( radius, radius, radius ) );
	ParticleManager:ReleaseParticleIndex( nFXIndex1 );
	local nFXIndex2 = ParticleManager:CreateParticle( "particles/units/heroes/hero_omniknight/omniknight_purification_cast.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControlEnt( nFXIndex2, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_attack2", self:GetCaster():GetOrigin(), true );
	ParticleManager:SetParticleControlEnt( nFXIndex2, 1, hTarget, PATTACH_ABSORIGIN_FOLLOW, nil, hTarget:GetOrigin(), true );
	ParticleManager:ReleaseParticleIndex( nFXIndex2 );
	EmitSoundOn("Hero_Chen.PenitenceImpact", hTarget)

	hTarget:Heal(heal_amount, self)
end
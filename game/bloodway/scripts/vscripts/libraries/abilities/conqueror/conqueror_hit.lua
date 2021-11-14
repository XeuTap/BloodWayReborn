conqueror_hit = class ({})

function conqueror_hit:OnSpellStart()
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local dmg = self:GetSpecialValueFor("impact_damage")

    local damageInfo = {
        victim = target,
        attacker = caster,
        damage = dmg,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        ability = self
    }

    ApplyDamage(damageInfo)

    local particle_cast = "particles/units/heroes/hero_doom_bringer/doom_infernal_blade_impact.vpcf"

    EmitSoundOn("Hero_DoomBringer.InfernalBlade.Target", caster)
	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
	ParticleManager:ReleaseParticleIndex( effect_cast )
    ParticleManager:DestroyParticle(self.nfxIndex1, true)
end

function conqueror_hit:OnAbilityPhaseStart()
    local caster = self:GetCaster()
    EmitSoundOn("Hero_DoomBringer.InfernalBlade.PreAttack", caster)

    self.nfxIndex1 = ParticleManager:CreateParticle("particles/econ/items/doom/doom_the_fallen/doom_the_fallen_weapon.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(self.nfxIndex1, 1, caster, PATTACH_POINT_FOLLOW, "attach_weapon", caster:GetOrigin(), true)
    return true
end

function conqueror_hit:OnAbilityPhaseInterrupted()
    if self.nfxIndex1 then
    ParticleManager:DestroyParticle(self.nfxIndex1, true)
    end
end
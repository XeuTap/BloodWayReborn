paladin_divinity_flare = class ({})

function paladin_divinity_flare:OnSpellStart()
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local heroIntellect = caster:GetIntellect()
    local heroStrength = caster:GetStrength()
    local intellectMultiplier = self:GetSpecialValueFor("int_heal_multipiler")
    local strengthMultiplier = self:GetSpecialValueFor("str_dmg_multiplier")
    local heal_radius = self:GetSpecialValueFor("heal_radius")
    local healAmount = heroIntellect * intellectMultiplier

    local allies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, target:GetAbsOrigin(), nil, heal_radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_CREEP + DOTA_UNIT_TARGET_HERO,  DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, true)

    local dmgInfo = {
        victim = target,
        attacker = caster,
        damage = heroStrength * strengthMultiplier,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        ability = self
    }
    local nfxIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_chen/chen_hand_of_god.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:ReleaseParticleIndex(nfxIndex1)
    ApplyDamage(dmgInfo)
    EmitSoundOn("Hero_Chen.PenitenceImpact", target)

    for index, friendlyUnit in pairs(allies) do
        friendlyUnit:Heal(healAmount, self)
        local nfxIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_chen/chen_cast_4.vpcf", PATTACH_ABSORIGIN_FOLLOW, friendlyUnit)
        ParticleManager:ReleaseParticleIndex(nfxIndex1)
    end


end

function paladin_divinity_flare:OnAbilityPhaseStart()
    local caster = self:GetCaster()
    EmitSoundOn("Hero_Chen.PenitenceCast", caster)
    return true
end
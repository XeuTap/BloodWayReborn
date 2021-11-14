patron_hammer = class ({})
LinkLuaModifier( "patron_hammer_modifier", "libraries/abilities/patron/patron_hammer_modifier", LUA_MODIFIER_MOTION_NONE )

function patron_hammer:OnSpellStart()
    local caster = self:GetCaster()
    local hTarget = self:GetCursorTarget()
    local projectile_speed = self:GetSpecialValueFor("missile_speed")
    local cast_effect = "particles/units/heroes/hero_sven/sven_spell_storm_bolt.vpcf"

    --caster:AddNewModifier(caster, self, "patron_hammer_modifier", { duration = 1})

    EmitSoundOn("Hero_Sven.StormBolt", caster)

    local projectileInfo = {
        vSpawnOrigin = caster:GetAbsOrigin(),
        Target = hTarget,
        iMoveSpeed = projectile_speed,
        bDodgeable = true,
        bProvidesVision = true,
        EffectName = cast_effect,
        Ability = self,
        Source = caster,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
    }

    ProjectileManager:CreateTrackingProjectile(projectileInfo)
end

function patron_hammer:OnProjectileHit(hTarget, vLocation)
    local caster = self:GetCaster()
    local dmg_multiplier = self:GetSpecialValueFor("str_dmg_multiplier")
    local hero_str = caster:GetStrength()
    local dmg = dmg_multiplier * hero_str

    local dmgInfo  =
    {
        victim = hTarget,
        attacker = caster,
        damage = dmg,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        ability = self,
    }

    ApplyDamage(dmgInfo)

    EmitSoundOn("Hero_Sven.StormBoltImpact", hTarget)
end

function patron_hammer:OnAbilityPhaseStart()
    local caster = self:GetCaster()
    caster:StopAnimation()
    StartAnimation(caster, {duration=0.5, activity=ACT_DOTA_VERSUS, rate=0.25})
    return true
end
sun_warrior_justice_hammer = class ({})
LinkLuaModifier( "modifier_sun_warrior_justice_hammer_debuff", "libraries/abilities/sun_warrior/modifier_sun_warrior_justice_hammer_debuff", LUA_MODIFIER_MOTION_NONE )

function sun_warrior_justice_hammer:OnSpellStart()
    local caster = self:GetCaster()
    local radius = self:GetSpecialValueFor("radius")
    local duration = self:GetSpecialValueFor("debuff_duration")
    local damage = self:GetSpecialValueFor("damage")

    local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, caster:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP + DOTA_UNIT_TARGET_HERO,  DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, true)

    --local nfxIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp.vpcf", PATTACH_ABSORIGIN , caster)
    local hitloc = self:GetCaster():GetAttachmentOrigin( self:GetCaster():ScriptLookupAttachment( "attach_attack1" ) )
    local nfxIndex2 = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp_projected.vpcf", PATTACH_ABSORIGIN , caster)
    ParticleManager:SetParticleControlEnt(nfxIndex2, 0, caster, PATTACH_POINT, "attach_attack1", hitloc, true)
    local nfxIndex4 = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp_shockwave.vpcf", PATTACH_ABSORIGIN , caster)
    ParticleManager:SetParticleControlEnt(nfxIndex4, 0, caster, PATTACH_POINT, "attach_attack1", hitloc, true)
    local nfxIndex5 = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp_embers.vpcf", PATTACH_ABSORIGIN , caster)
    ParticleManager:SetParticleControlEnt(nfxIndex5, 0, caster, PATTACH_POINT, "attach_attack1", hitloc, true)
    local nfxIndex6 = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp_ring.vpcf", PATTACH_ABSORIGIN , caster)
    ParticleManager:SetParticleControlEnt(nfxIndex6, 0, caster, PATTACH_POINT, "attach_attack1", hitloc, true)
    local nfxIndex7 = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp_ring_progressive.vpcf", PATTACH_ABSORIGIN , caster)
    ParticleManager:SetParticleControlEnt(nfxIndex7, 0, caster, PATTACH_POINT, "attach_attack1", hitloc, true)
    ParticleManager:SetParticleControlOrientation(nfxIndex7, 0, Vector(0, 0, 0), Vector(0, 0, 0), Vector(0, 0, 0))
    --local nfxIndex3 = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp_dust.vpcf", PATTACH_ABSORIGIN , caster)
    --ParticleManager:SetParticleControlEnt(nfxIndex3, 0, caster, PATTACH_POINT, "attach_attack1", hitloc, true)
    --ParticleManager:SetParticleControlOrientation(nfxIndex3, 0, Vector(0, 0, 0), Vector(0, 0, 0), Vector(0, 0, 0))
    --ParticleManager:SetParticleControl( nfxIndex3, 1, Vector(radius, radius, radius) )
    --local casterOrigin = caster:GetOrigin()
    --hitloc.z = casterOrigin.z
    --ParticleManager:SetParticleControlEnt(nfxIndex1, 0, caster, PATTACH_POINT, "attach_attack1", hitloc, true)
    --ParticleManager:SetParticleControl( nfxIndex1, 1, Vector(radius, radius, radius) )
    --ParticleManager:SetParticleControlEnt(nfxIndex1, 2, caster, PATTACH_POINT, "attach_attack1", hitloc, true)
    --ParticleManager:ReleaseParticleIndex(nfxIndex1)

    for index, target in pairs(enemies) do
        target:AddNewModifier(caster, self, "modifier_sun_warrior_justice_hammer_debuff", { duration = duration })
        local damageTable = {
            victim = target,
            attacker = caster,
            damage = damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            ability = self
        }
        ApplyDamage(damageTable)
    end

    EmitSoundOn("Hero_Dawnbreaker.Celestial_Hammer.Impact", caster)
end

function sun_warrior_justice_hammer:OnAbilityPhaseStart()
    local caster = self:GetCaster()
    caster:AddActivityModifier("light")
    caster:StartGestureWithPlaybackRate(ACT_DOTA_CAST_ABILITY_1, 1.1)
    caster:ClearActivityModifiers()
    EmitSoundOn("Hero_Omniknight.PreAttack", caster)
    return true
end
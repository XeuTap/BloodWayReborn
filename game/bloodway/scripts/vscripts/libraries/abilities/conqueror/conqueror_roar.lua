conqueror_roar = class ({})
LinkLuaModifier( "modifier_conqueror_roar", "libraries/abilities/conqueror/modifier_conqueror_roar", LUA_MODIFIER_MOTION_NONE )

function conqueror_roar:OnSpellStart()
    local caster = self:GetCaster()
    local buff_radius = self:GetSpecialValueFor("radius")
    local buff_duration = self:GetSpecialValueFor("duration")
    EmitSoundOn("Hero_Sven.WarCry", caster)
    local allies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, caster:GetAbsOrigin(), nil, buff_radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_CREEP + DOTA_UNIT_TARGET_HERO,  DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, true)

    local nfxIndex1 = ParticleManager:CreateParticle("particles/units/heroes/hero_sven/sven_spell_warcry.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(nfxIndex1, 1, caster, PATTACH_OVERHEAD_FOLLOW, "attach_hitloc", caster:GetOrigin(), true)
    ParticleManager:SetParticleControlEnt(nfxIndex1, 2, caster, PATTACH_POINT_FOLLOW, "attach_eyes", caster:GetOrigin(), true)

    Timers:CreateTimer(buff_duration, function()
        ParticleManager:DestroyParticle(nfxIndex1, false)
      end
    )

    for index, ally in pairs(allies) do 
        ally:AddNewModifier(caster, self, "modifier_conqueror_roar", { duration = buff_duration })
        --local nfxIndex2 = ParticleManager:CreateParticle("particles/units/heroes/hero_sven/sven_warcry_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW, ally)
        --ParticleManager:SetParticleControlEnt(nfxIndex2, 1, ally, PATTACH_OVERHEAD_FOLLOW, "attach_hitloc", ally:GetOrigin(), true)
        --ParticleManager:SetParticleControlEnt(nfxIndex2, 2, ally, PATTACH_POINT_FOLLOW, "attach_eyes", ally:GetOrigin(), true)
    --
        --Timers:CreateTimer(buff_duration, function()
        --    ParticleManager:DestroyParticle(nfxIndex2, false)
        --  end
        --)
    end
    EmitSoundOn("Hero_Sven.WarCry.Shield", caster)
end
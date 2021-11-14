if not Cosmetics then Cosmetics = class ({})
end

function Cosmetics:Initialize()
    Cosmetics.initialized = true;
    Cosmetics.CosmeticTable = LoadKeyValues("scripts/kv/attach_cosmetics.kv")
end

function Cosmetics:ApplyCosmetic(hero)
    local heroCosmetic = Cosmetics.CosmeticTable[hero:GetUnitName()]
    if heroCosmetic then
        for attachment,model in pairs(heroCosmetic.models) do
                hero[attachment] = SpawnEntityFromTableSynchronous("prop_dynamic", {model = model})
                hero[attachment]:FollowEntity(hero, true)
        end
        for attachment in pairs(heroCosmetic.particles) do
            if attachment == "weapon" then
                local attachTable = heroCosmetic.particles[attachment]
                local attachPoint = attachTable.attach_point
                local attachmentBone = attachTable.attachment
                local particle = attachTable.particle_effect
                if attachPoint == "PATTACH_POINT_FOLLOW" then
                    attachPoint = PATTACH_POINT_FOLLOW
                end
                local heroParticle = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, hero)
                ParticleManager:SetParticleControlEnt(heroParticle, 0, hero[attachment], attachPoint, attachmentBone, hero[attachment]:GetAbsOrigin(), true)
            elseif attachment == "dk_sword" then
                local attachTable = heroCosmetic.particles[attachment]
                local attachPoint = attachTable.attach_point
                local attachmentBone = attachTable.attachment
                local particle = attachTable.particle_effect
                if attachPoint == "PATTACH_POINT_FOLLOW" then
                    attachPoint = PATTACH_POINT_FOLLOW
                end
                local heroParticle = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, hero)
                ParticleManager:SetParticleControlEnt(heroParticle, 1, hero.weapon, attachPoint, attachmentBone, hero.weapon:GetAbsOrigin(), true)
                ParticleManager:SetParticleControlEnt(heroParticle, 2, hero.weapon, attachPoint, attachmentBone, hero.weapon:GetAbsOrigin(), true)
                ParticleManager:SetParticleControlEnt(heroParticle, 3, hero.weapon, attachPoint, attachmentBone, hero.weapon:GetAbsOrigin(), true)
                ParticleManager:SetParticleControlEnt(heroParticle, 4, hero.weapon, attachPoint, attachmentBone, hero.weapon:GetAbsOrigin(), true)
            elseif attachment == "shoulder" then
                local attachTable = heroCosmetic.particles[attachment]
                local attachPoint = attachTable.attach_point
                local attachmentBone = attachTable.attachment
                local particle = attachTable.particle_effect
                if attachPoint == "PATTACH_POINT_FOLLOW" then
                    attachPoint = PATTACH_POINT_FOLLOW
                end
                local heroParticle = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, hero)
                ParticleManager:SetParticleControlEnt(heroParticle, 1, hero[attachment], attachPoint, attachmentBone, hero[attachment]:GetAbsOrigin(), true)
            elseif attachment == "cape" then
                local attachTable = heroCosmetic.particles[attachment]
                local attachPoint = attachTable.attach_point
                local attachmentBone = attachTable.attachment
                local particle = attachTable.particle_effect
                if attachPoint == "PATTACH_POINT_FOLLOW" then
                    attachPoint = PATTACH_POINT_FOLLOW
                end
                local heroParticle = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, hero)
                ParticleManager:SetParticleControlEnt(heroParticle, 0, hero[attachment], attachPoint, attachmentBone, hero[attachment]:GetAbsOrigin(), true)
            elseif attachment == "bow_string" then
                local attachTable = heroCosmetic.particles[attachment]
                local attachPoint = attachTable.attach_point
                local attachmentBot = attachTable.attachment1
                local attachmentMid = attachTable.attachment2
                local attachmentTop = attachTable.attachment3
                local particle = attachTable.particle_effect
                if attachPoint == "PATTACH_POINT_FOLLOW" then
                    attachPoint = PATTACH_POINT_FOLLOW
                end
                local heroParticle = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, hero)
                ParticleManager:SetParticleControlEnt(heroParticle, 0, hero.weapon, attachPoint, attachmentBot, hero.weapon:GetAbsOrigin(), true)
                if attachmentMid then
                    ParticleManager:SetParticleControlEnt(heroParticle, 1, hero.weapon, attachPoint, attachmentMid, hero.weapon:GetAbsOrigin(), true)
                end
                ParticleManager:SetParticleControlEnt(heroParticle, 2, hero.weapon, attachPoint, attachmentTop, hero.weapon:GetAbsOrigin(), true)
            elseif attachment == "dk_shield" then
                local attachTable = heroCosmetic.particles[attachment]
                local attachPoint = attachTable.attach_point
                local attachmentEyeL = attachTable.attachment1
                local attachmentEyeR = attachTable.attachment2
                local attachmentMouth = attachTable.attachment3
                local particle = attachTable.particle_effect
                if attachPoint == "PATTACH_POINT_FOLLOW" then
                    attachPoint = PATTACH_POINT_FOLLOW
                end
                local heroParticle = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, hero)
                ParticleManager:SetParticleControlEnt(heroParticle, 1, hero.shield, attachPoint, attachmentEyeL, hero.weapon:GetAbsOrigin(), true)
                ParticleManager:SetParticleControlEnt(heroParticle, 2, hero.shield, attachPoint, attachmentEyeR, hero.weapon:GetAbsOrigin(), true)
                ParticleManager:SetParticleControlEnt(heroParticle, 3, hero.shield, attachPoint, attachmentMouth, hero.weapon:GetAbsOrigin(), true)
                ParticleManager:SetParticleControlEnt(heroParticle, 0, hero.shield, attachPoint, attachmentMouth, hero.weapon:GetAbsOrigin(), true)
            elseif attachment == "weapon_fx" then
                local attachTable = heroCosmetic.particles[attachment]
                local attachPoint = attachTable.attach_point
                local attachmentBot = attachTable.attachment1
                local attachmentTop = attachTable.attachment2
                local particle = attachTable.particle_effect
                if attachPoint == "PATTACH_POINT_FOLLOW" then
                    attachPoint = PATTACH_POINT_FOLLOW
                end
                local fxParticle1 = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, hero)
                ParticleManager:SetParticleControlEnt(fxParticle1, 1, hero.weapon, attachPoint, attachmentBot, hero.weapon:GetAbsOrigin(), true)
                local fxParticle2 = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, hero)
                ParticleManager:SetParticleControlEnt(fxParticle2, 1, hero.weapon, attachPoint, attachmentTop, hero.weapon:GetAbsOrigin(), true)
            end
        end
    end
    hero:AddActivityModifier('run')
    hero:AddActivityModifier('aggressive')
    hero:AddActivityModifier('windrun')
    hero:AddActivityModifier('fast')
end

function Cosmetics:CleanCosmetic(hero)
    print("Cosmetics Cleaning")
    for index, cosmetics in pairs(hero) do
        if type(cosmetics) == "boolean" then 
        elseif type(cosmetics) == "userdata" then
        else 
            print(type(cosmetics));
            cosmetics:RemoveSelf()
        end
    end
end

if not Cosmetics.initialized then
    Cosmetics:Initialize()
end
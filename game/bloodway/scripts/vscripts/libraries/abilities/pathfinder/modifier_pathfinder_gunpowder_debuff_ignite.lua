modifier_pathfinder_gunpowder_debuff_ignite = class ({})

function modifier_pathfinder_gunpowder_debuff_ignite:OnCreated()
    self:OnRefresh()
    self.damage_dealt = 0
end

function modifier_pathfinder_gunpowder_debuff_ignite:OnRefresh()
    self.int_multiplier = self:GetAbility():GetSpecialValueFor("int_multiplier")
    self.self_agi_multiplier = self:GetAbility():GetSpecialValueFor("self_agi_multiplier")
    self.caster = self:GetAbility():GetCaster()
    self.parent = self:GetParent()
end

function modifier_pathfinder_gunpowder_debuff_ignite:DeclareFunctions()
    local funcs = 
    {
        MODIFIER_EVENT_ON_TAKEDAMAGE
    }
    return funcs
end
function modifier_pathfinder_gunpowder_debuff_ignite:OnTakeDamage(params)
    local damageType = params.damage_type
    local attackedUnit = params.unit
    local attacker = params.attacker
    if damageType ~= DAMAGE_TYPE_MAGICAL then return end
    if IsServer() and attackedUnit == self.parent and attacker:IsHero() and self.damage_dealt == 0 then
        self.damage_dealt = 1
        local agi = attacker:GetAgility()
        local int = attacker:GetIntellect()

        if attacker == self.caster then
           agi_multiplier = self.self_agi_multiplier 
        else
            agi_multiplier = 0

        end

        local totalDamage = (agi * agi_multiplier) + (int * self.int_multiplier)
        print(totalDamage)

        local info = {
            victim = attackedUnit,
            attacker = attacker,
            damage = totalDamage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            ability = self:GetAbility()

        }
        ApplyDamage(info)
        self:PlayEffects()
    end
end

function modifier_pathfinder_gunpowder_debuff_ignite:IsDebuff()
    return true
end

function modifier_pathfinder_gunpowder_debuff_ignite:IsHidden()
    return false
end

function modifier_pathfinder_gunpowder_debuff_ignite:PlayEffects()
    local particle = "particles/units/heroes/hero_batrider/batrider_napalm_damage_debuff.vpcf"

    local nfxIndex1 = ParticleManager:CreateParticle(particle, PATTACH_ABSORIGIN_FOLLOW, self.parent)
    ParticleManager:ReleaseParticleIndex(nfxIndex1)
end
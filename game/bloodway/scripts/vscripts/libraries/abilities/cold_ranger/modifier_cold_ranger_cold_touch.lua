modifier_cold_ranger_cold_touch = class ({})

function modifier_cold_ranger_cold_touch:OnCreated()
    self:OnRefresh()
    self:StartIntervalThink(1)
    self:DealDamage()
end

function modifier_cold_ranger_cold_touch:OnRefresh()
    self.slow_dmg = self:GetAbility():GetSpecialValueFor("debuff_dmg")
end

function modifier_cold_ranger_cold_touch:DeclareFunctions()
    local funcs = {

    }
end

function modifier_cold_ranger_cold_touch:OnIntervalThink()
    self:DealDamage()
end

function modifier_cold_ranger_cold_touch:GetEffectName()
	return "particles/generic_gameplay/generic_slowed_cold.vpcf"
end

function modifier_cold_ranger_cold_touch:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

function modifier_cold_ranger_cold_touch:DealDamage()
    if IsServer() then
        local target = self:GetParent()
        if target:IsAlive() then
            local target = target
            local caster = self:GetCaster()
            local info = {
                victim = target,
                attacker = caster,
                damage = self.slow_dmg,
                damage_type = DAMAGE_TYPE_MAGICAL,
                damage_flags = DOTA_DAMAGE_FLAG_NONE,
                ability = self:GetAbility()
            }
            ApplyDamage(info)
        end
    end
end
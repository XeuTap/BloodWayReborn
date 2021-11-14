modifier_paladin_holy_buff = class({})

function modifier_paladin_holy_buff:OnCreated()
    self:OnRefresh()
    if IsServer() then
        self.parent = self:GetParent()
        self:AddParticles()
    end
end

function modifier_paladin_holy_buff:OnRefresh()
    self.bonus_hp_regen = self:GetAbility():GetSpecialValueFor("bonus_hp_regen")
    self.bonus_mp_regen = self:GetAbility():GetSpecialValueFor("bonus_mp_regen")
    self.bonus_damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
end

function modifier_paladin_holy_buff:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT
    }
    return funcs
end

function modifier_paladin_holy_buff:GetModifierBaseAttack_BonusDamage()
    return self.bonus_damage
end

function modifier_paladin_holy_buff:GetModifierConstantHealthRegen()
    return self.bonus_hp_regen
end

function modifier_paladin_holy_buff:GetModifierConstantManaRegen()
    return self.bonus_mp_regen
end

function modifier_paladin_holy_buff:AddParticles()

    --local particle_cast = "particles/units/heroes/hero_omniknight/omniknight_guardian_angel_ally.vpcf"
	--if self:GetParent()==self:GetCaster() then
	particle_cast = "particles/units/heroes/hero_omniknight/omniknight_guardian_angel_omni.vpcf"
	--end

    self.nfxIndex1 = ParticleManager:CreateParticle(particle_cast, PATTACH_ABSORIGIN_FOLLOW, self.parent)
    ParticleManager:SetParticleControlEnt(self.nfxIndex1, 5, self.parent, PATTACH_ROOTBONE_FOLLOW, "attach_hitloc", self:GetParent():GetOrigin(), true)

    self:AddParticle(
		self.nfxIndex1,
		false,
		false,
		-1,
		false,
		false
	)
end

function modifier_paladin_holy_buff:OnDestroy()
    if self.nfxIndex1 then
        ParticleManager:DestroyParticle(self.nfxIndex1, false)
    end
end
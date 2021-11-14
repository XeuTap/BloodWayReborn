modifier_paladin_bless_buff = class({})

function modifier_paladin_bless_buff:OnCreated()
    self:OnRefresh()
end

function modifier_paladin_bless_buff:OnRefresh()
    self.spell_amp = self:GetAbility():GetSpecialValueFor("spell_amplification")
    self.hp_regen = self:GetAbility():GetSpecialValueFor("hp_regen")
end

function modifier_paladin_bless_buff:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
    }
    return funcs
end

function modifier_paladin_bless_buff:GetModifierConstantHealthRegen()
    return self.hp_regen
end

function modifier_paladin_bless_buff:GetModifierSpellAmplify_Percentage()
    return self.spell_amp
end
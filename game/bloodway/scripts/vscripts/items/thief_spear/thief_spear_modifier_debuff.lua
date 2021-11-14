item_thief_spear_modifier_debuff = class ({})

function item_thief_spear_modifier_debuff:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_ATTACKSPEED_REDUCTION_PERCENTAGE,
        MODIFIER_PROPERTY_MOVESPEED_REDUCTION_PERCENTAGE
    }
    return funcs
end
function item_thief_spear_modifier_debuff:IsHidden()
    return false
end

function item_thief_spear_modifier_debuff:IsDebuff()
    return true
end

function item_thief_spear_modifier_debuff:OnCreated()
    self:OnRefresh()
    self:StartIntervalThink(1)
end

function item_thief_spear_modifier_debuff:GetModifierMoveSpeedReductionPercentage()
    return self.slow_perc
end

function item_thief_spear_modifier_debuff:GetModifierAttackSpeedReductionPercentage()
    return self.slow_perc
end


function item_thief_spear_modifier_debuff:OnRefresh()
    self.interval_dmg = self:GetAbility():GetSpecialValueFor("poison_dmg")
    self.slow_perc = self:GetAbility():GetSpecialValueFor("slow_perc")
end

function item_thief_spear_modifier_debuff:OnIntervalThink()
    if IsServer() then
        data = {
            victim = self:GetParent(),
            attacker = self:GetAbility():GetCaster(),
            damage = self.interval_dmg,
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            ability = self:GetAbility()
        }

        ApplyDamage(data)
    end
end

function item_thief_spear_modifier_debuff:GetEffectName()
	return "particles/units/heroes/hero_viper/viper_corrosive_debuff.vpcf"
end

function item_thief_spear_modifier_debuff:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
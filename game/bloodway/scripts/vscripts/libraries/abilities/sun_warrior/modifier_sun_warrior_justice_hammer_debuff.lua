modifier_sun_warrior_justice_hammer_debuff = class({})

function modifier_sun_warrior_justice_hammer_debuff:OnCreated()
    self:OnRefresh()
end

function modifier_sun_warrior_justice_hammer_debuff:OnRefresh()
    self.slow = self:GetAbility():GetSpecialValueFor("slow_perc")
end

function modifier_sun_warrior_justice_hammer_debuff:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
    return funcs
end

function modifier_sun_warrior_justice_hammer_debuff:GetModifierAttackSpeedPercentage()
    return self.slow
end

function modifier_sun_warrior_justice_hammer_debuff:GetModifierMoveSpeedBonus_Percentage()
    return self.slow
end

function modifier_sun_warrior_justice_hammer_debuff:GetStatusEffectName()
    return "particles/units/heroes/hero_monkey_king/monkey_king_spring_slow.vpcf"
end
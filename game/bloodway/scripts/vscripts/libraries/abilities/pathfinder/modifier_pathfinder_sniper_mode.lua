modifier_pathfinder_sniper_mode = class ({})

function modifier_pathfinder_sniper_mode:OnCreated()
    self:OnRefresh()
end

function modifier_pathfinder_sniper_mode:OnRefresh()
    self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
    self.aura_radius = self:GetAbility():GetSpecialValueFor("aura_radius")
end

function modifier_pathfinder_sniper_mode:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
    }
    return funcs
end

function modifier_pathfinder_sniper_mode:GetModifierBaseAttack_BonusDamage()
    return self.bonus_dmg
end

function modifier_pathfinder_sniper_mode:IsDebuff()
    return false
end

function modifier_pathfinder_sniper_mode:IsHidden()
    return false
end

function modifier_pathfinder_sniper_mode:GetAttributes()
    return MODIFIER_ATTRIBUTE_AURA_PRIORITY
 end

 function modifier_pathfinder_sniper_mode:GetAuraRadius()
    return self.aura_radius
end

function modifier_pathfinder_sniper_mode:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

function modifier_pathfinder_sniper_mode:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_pathfinder_sniper_mode:GetAuraSearchType()
    return DOTA_UNIT_TARGET_ALL
end

function modifier_pathfinder_sniper_mode:GetModifierAura()
    return "modifier_pathfinder_sniper_mode_debuff"
end

function modifier_pathfinder_sniper_mode:IsAura()
    return true
end
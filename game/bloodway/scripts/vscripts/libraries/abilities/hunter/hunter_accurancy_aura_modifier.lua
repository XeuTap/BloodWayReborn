hunter_accurancy_aura_modifier = class ({})

function hunter_accurancy_aura_modifier:DeclareFunctions()
   local funcs = {
   }
   return funcs
end

function hunter_accurancy_aura_modifier:OnCreated()
   self:OnRefresh()
end

function hunter_accurancy_aura_modifier:IsHidden()
   return true
end

function hunter_accurancy_aura_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_AURA_PRIORITY
end

function hunter_accurancy_aura_modifier:OnRefresh( data )
    self.aura_radius = self:GetAbility():GetSpecialValueFor("aura_radius")
    self.aura_bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg_perc")
end

function hunter_accurancy_aura_modifier:GetAuraRadius()
    return self.aura_radius
end

function hunter_accurancy_aura_modifier:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

function hunter_accurancy_aura_modifier:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function hunter_accurancy_aura_modifier:GetAuraSearchType()
    return DOTA_UNIT_TARGET_ALL
end

function hunter_accurancy_aura_modifier:GetModifierAura()
    return "hunter_accurancy_modifier"
end

function hunter_accurancy_aura_modifier:IsAura()
    return true
end
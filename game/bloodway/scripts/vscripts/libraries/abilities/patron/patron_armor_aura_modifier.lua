patron_armor_aura_modifier = class ({})


function patron_armor_aura_modifier:DeclareFunctions()
   local funcs = {
   }
   return funcs
end

function patron_armor_aura_modifier:OnCreated()
   self:OnRefresh()
end

function patron_armor_aura_modifier:IsHidden()
   return true
end

function patron_armor_aura_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_AURA_PRIORITY
end

function patron_armor_aura_modifier:OnRefresh( data )
    self.aura_radius = self:GetAbility():GetSpecialValueFor("aura_radius")
end

function patron_armor_aura_modifier:GetAuraRadius()
    return self.aura_radius
end

function patron_armor_aura_modifier:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

function patron_armor_aura_modifier:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function patron_armor_aura_modifier:GetAuraSearchType()
    return DOTA_UNIT_TARGET_ALL
end

function patron_armor_aura_modifier:GetModifierAura()
    return "patron_armor_modifier"
end

function patron_armor_aura_modifier:IsAura()
    return true
end
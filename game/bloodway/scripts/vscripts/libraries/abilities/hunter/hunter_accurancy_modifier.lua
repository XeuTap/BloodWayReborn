hunter_accurancy_modifier = class ({})

function hunter_accurancy_modifier:OnCreated(data)
    self:OnRefresh()
end

function hunter_accurancy_modifier:OnRefresh()
end

hunter_accurancy_modifier = class ({})
function hunter_accurancy_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
   }
   return funcs
end

function hunter_accurancy_modifier:IsHidden()
   return false
end

function hunter_accurancy_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function hunter_accurancy_modifier:GetModifierBaseDamageOutgoing_Percentage()
    local targetUnit = self:GetParent()
    self.aura_bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg_perc")
    if targetUnit:IsRangedAttacker() then
        return self.aura_bonus_dmg
    end
    return 0
end
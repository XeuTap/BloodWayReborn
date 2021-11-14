modifier_pathfinder_sniper_mode_debuff = class ({})

function modifier_pathfinder_sniper_mode_debuff:OnCreated(data)
    self:OnRefresh()
end

function modifier_pathfinder_sniper_mode_debuff:OnRefresh()
end

modifier_pathfinder_sniper_mode_debuff = class ({})
function modifier_pathfinder_sniper_mode_debuff:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
   }
   return funcs
end

function modifier_pathfinder_sniper_mode_debuff:IsHidden()
   return false
end

function modifier_pathfinder_sniper_mode_debuff:IsDebuff()
   return true
end

function modifier_pathfinder_sniper_mode_debuff:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_pathfinder_sniper_mode_debuff:GetModifierPhysicalArmorBonus()
    local targetUnit = self:GetParent()
    self.aura_armor_reduction = self:GetAbility():GetSpecialValueFor("aura_armor_reduction")
    return self.aura_armor_reduction
end
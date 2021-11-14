item_crystal_boots_modifier = class ({})


function item_crystal_boots_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT  
    }
    return funcs
end

function item_crystal_boots_modifier:OnCreated()
    self:OnRefresh()
end

function item_crystal_boots_modifier:IsHidden()
    return true
end

function item_crystal_boots_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_crystal_boots_modifier:OnRefresh( data )
    self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
    self.bonus_ms = self:GetAbility():GetSpecialValueFor("bonus_msent")
end

function item_crystal_boots_modifier:GetModifierBonusStats_Agility()
    return self.bonus_agi
end

function item_crystal_boots_modifier:GetModifierMoveSpeedBonus_Constant()
    return self.bonus_ms
end


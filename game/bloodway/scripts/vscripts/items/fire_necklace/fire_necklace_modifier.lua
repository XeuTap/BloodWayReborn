item_fire_necklace_modifier = class ({})


function item_fire_necklace_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS
    }
    return funcs
end

function item_fire_necklace_modifier:OnCreated()
    self:OnRefresh()
end

function item_fire_necklace_modifier:IsHidden()
    return true
end

function item_fire_necklace_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_fire_necklace_modifier:OnRefresh( data )
    self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
end

function item_fire_necklace_modifier:GetModifierBonusStats_Intellect()
    return self.bonus_int
end


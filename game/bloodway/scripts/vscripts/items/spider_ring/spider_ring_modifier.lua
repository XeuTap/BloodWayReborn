item_spider_ring_modifier = class ({})


function item_spider_ring_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    }
    return funcs
end

function item_spider_ring_modifier:OnCreated()
    self:OnRefresh()
end

function item_spider_ring_modifier:IsHidden()
    return true
end

function item_spider_ring_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_spider_ring_modifier:OnRefresh( data )
    self.bonus_agi = self:GetAbility():GetSpecialValueFor("bonus_agi")
    self.bonus_int = self:GetAbility():GetSpecialValueFor("bonus_int")
end

function item_spider_ring_modifier:GetModifierBonusStats_Agility()
    return self.bonus_agi
end

function item_spider_ring_modifier:GetModifierBonusStats_Intellect()
    return self.bonus_int
end
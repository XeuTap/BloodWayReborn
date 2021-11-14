item_spider_boots_modifier = class ({})


function item_spider_boots_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
    }
    return funcs
end

function item_spider_boots_modifier:OnCreated()
    self:OnRefresh()
end

function item_spider_boots_modifier:IsHidden()
    return true
end

function item_spider_boots_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_spider_boots_modifier:OnRefresh( data )
    self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
end

function item_spider_boots_modifier:GetModifierBonusStats_Strength()
    return self.bonus_str
end

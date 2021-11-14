item_wild_gloves_modifier = class ({})


function item_wild_gloves_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE
    }
    return funcs
end

function item_wild_gloves_modifier:OnCreated()
    self:OnRefresh()
end

function item_wild_gloves_modifier:IsHidden()
    return true
end

function item_wild_gloves_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_wild_gloves_modifier:OnRefresh( data )
    self.bonus_as_percent = self:GetAbility():GetSpecialValueFor("bonus_as_percent")
end

function item_wild_gloves_modifier:GetModifierAttackSpeedPercentage()
    return self.bonus_as_percent
end



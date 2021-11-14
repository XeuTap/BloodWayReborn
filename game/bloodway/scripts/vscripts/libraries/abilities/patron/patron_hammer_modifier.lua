patron_hammer_modifier = class ({})

function patron_hammer_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION
    }
    return funcs
end

function patron_hammer_modifier:GetOverrideAnimation()
    print("OVVERIDE ANIMATION")
    return ACT_IDLE
end
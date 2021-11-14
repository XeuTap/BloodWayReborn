item_tainted_amulet_modifier = class ({})
function item_tainted_amulet_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    MODIFIER_PROPERTY_ABSORB_SPELL
   }
   return funcs
end

function item_tainted_amulet_modifier:OnCreated()
   self:OnRefresh()
end

function item_tainted_amulet_modifier:IsHidden()
   return true
end

function item_tainted_amulet_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_tainted_amulet_modifier:OnRefresh( data )
   self.bonus_str = self:GetAbility():GetSpecialValueFor("bonus_str")
end

function item_tainted_amulet_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_str
end

function item_tainted_amulet_modifier:GetAbsorbSpell(keys)
    local hAbility = self:GetAbility()
    if hAbility:IsCooldownReady() then
    --your cool effect here.
        hAbility:StartCooldown(hAbility:GetCooldown(hAbility:GetLevel()))
        return 1
    end
    return false
end

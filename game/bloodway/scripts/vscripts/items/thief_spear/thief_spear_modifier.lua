item_thief_spear_modifier = class ({})
function item_thief_spear_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    MODIFIER_EVENT_ON_ATTACK_LANDED
   }
   return funcs
end

function item_thief_spear_modifier:OnCreated()
   self:OnRefresh()
end

function item_thief_spear_modifier:IsHidden()
   return true
end

function item_thief_spear_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_thief_spear_modifier:OnRefresh( data )
   self.bonus_dmg = self:GetAbility():GetSpecialValueFor("bonus_dmg")
   self.debuff_duration = self:GetAbility():GetSpecialValueFor("buff_duration")
   self.parent = self:GetParent()
end

function item_thief_spear_modifier:GetModifierPreAttack_BonusDamage()
   return self.bonus_dmg
end

function item_thief_spear_modifier:OnAttackLanded( params )
    if self.parent == params.target then return end
	local target = params.target
    target:AddNewModifier(self.parent, self:GetAbility(), "item_thief_spear_modifier_debuff", { duration = self.debuff_duration })
end
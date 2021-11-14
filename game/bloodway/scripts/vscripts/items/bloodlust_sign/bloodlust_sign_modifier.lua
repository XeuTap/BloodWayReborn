item_bloodlust_sign_modifier = class ({})
function item_bloodlust_sign_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
   }
   return funcs
end

function item_bloodlust_sign_modifier:OnCreated()
   self:OnRefresh()
end

function item_bloodlust_sign_modifier:IsHidden()
   return false
end

function item_bloodlust_sign_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_bloodlust_sign_modifier:OnRefresh( data )
    if IsServer() then 
        self.bonus_as_perc = self:GetAbility():GetSpecialValueFor("bonus_as_perc")
    end
end

function item_bloodlust_sign_modifier:GetModifierAttackSpeedPercentage()
   return self.bonus_as_perc
end

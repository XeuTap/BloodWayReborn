item_battle_drum_aura_modifier = class ({})

LinkLuaModifier( "item_battle_drum_modifier", "items/battle_drum/battle_drum_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_battle_drum_aura_modifier:DeclareFunctions()
   local funcs = {
   }
   return funcs
end

function item_battle_drum_aura_modifier:OnCreated()
   self:OnRefresh()
end

function item_battle_drum_aura_modifier:IsHidden()
   return true
end

function item_battle_drum_aura_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_AURA_PRIORITY
end

function item_battle_drum_aura_modifier:OnRefresh( data )
    self.aura_radius = self:GetAbility():GetSpecialValueFor("aura_radius")
end

function item_battle_drum_aura_modifier:GetAuraRadius()
    return self.aura_radius
end

function item_battle_drum_aura_modifier:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

function item_battle_drum_aura_modifier:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function item_battle_drum_aura_modifier:GetAuraSearchType()
    return DOTA_UNIT_TARGET_ALL
end

function item_battle_drum_aura_modifier:GetModifierAura()
    return "item_battle_drum_modifier"
end

function item_battle_drum_aura_modifier:IsAura()
    return true
end
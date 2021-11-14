patron_invicibility = class ({})

LinkLuaModifier( "patron_invicibility_modifier", "libraries/abilities/patron/patron_invicibility_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function patron_invicibility:OnSpellStart()
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("duration")
    EmitSoundOn("Hero_Omniknight.GuardianAngel.Cast", caster)
    caster:AddNewModifier(caster, self, "patron_invicibility_modifier", { duration = duration })
    EmitSoundOn("Hero_Omniknight.GuardianAngel", caster)
end
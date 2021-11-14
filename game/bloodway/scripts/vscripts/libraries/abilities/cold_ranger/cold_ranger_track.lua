cold_ranger_track = class ({})

LinkLuaModifier("modifier_cold_ranger_track", "libraries/abilities/cold_ranger/modifier_cold_ranger_track", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_cold_ranger_track_debuff", "libraries/abilities/cold_ranger/modifier_cold_ranger_track_debuff", LUA_MODIFIER_MOTION_NONE)

function cold_ranger_track:OnSpellStart()
    local caster = self:GetCaster()
    local hTarget = self:GetCursorTarget()
    local modifier_duration = self:GetSpecialValueFor("debuff_duration")

    caster:AddNewModifier(caster, self, "modifier_cold_ranger_track", { duration = modifier_duration })
    hTarget:AddNewModifier(caster, self, "modifier_cold_ranger_track_debuff", { duration = modifier_duration })
    EmitSoundOn("Hero_BountyHunter.Target", caster)
end
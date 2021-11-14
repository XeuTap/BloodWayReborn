paladin_holy_buff = class ({})
LinkLuaModifier( "modifier_paladin_holy_buff", "libraries/abilities/paladin/modifier_paladin_holy_buff", LUA_MODIFIER_MOTION_NONE )

function paladin_holy_buff:OnSpellStart()
    local caster = self:GetCaster()
    local buff_radius = self:GetSpecialValueFor("radius")
    local duration = self:GetSpecialValueFor("buff_duration")

    local allies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, caster:GetAbsOrigin(), nil, buff_radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_CREEP + DOTA_UNIT_TARGET_HERO,  DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, true)

    for index, ally in pairs(allies) do
        ally:AddNewModifier(caster, self, "modifier_paladin_holy_buff", { duration = duration})
    end

    EmitSoundOn("Hero_Omniknight.GuardianAngel.Cast", caster)
end
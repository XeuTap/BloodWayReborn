pathfinder_rain_of_fire_arrows = class ({})
LinkLuaModifier( "pathfinder_rain_of_fire_arrows_modifier", "libraries/abilities/pathfinder/pathfinder_rain_of_fire_arrows_modifier.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ranger_stun_arrow", "libraries/abilities/modifier_ranger_stun_arrow", LUA_MODIFIER_MOTION_NONE)

function pathfinder_rain_of_fire_arrows:OnSpellStart()
    self.caster = self:GetCaster()
    self.point = self:GetCursorPosition()
    self.duration = self:GetSpecialValueFor("channel_time")
    CreateModifierThinker(
		self.caster, -- player source
		self, -- ability source
		"pathfinder_rain_of_fire_arrows_modifier", -- modifier name
		{ duration = self.duration }, -- kv
		self.point,
		self.caster:GetTeamNumber(),
		false
	)
end

function pathfinder_rain_of_fire_arrows:CastFilterResultLocation(location)
    return UF_SUCCESS
end

function pathfinder_rain_of_fire_arrows:OnChannelFinish( bInterrupted )
    local radius = self:GetAOERadius()
    local stun_duration = self:GetSpecialValueFor("stun_duration")
    if not bInterrupted then
        local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, self.point, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, FIND_ANY_ORDER, true )
        for index, hTarget in pairs(targets) do 
            hTarget:AddNewModifier(self.caster, self, "modifier_ranger_stun_arrow", { duration = stun_duration })
        end
    end
end

function pathfinder_rain_of_fire_arrows:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_POINT + DOTA_ABILITY_BEHAVIOR_AOE
end

function pathfinder_rain_of_fire_arrows:GetAOERadius()
    return self:GetSpecialValueFor("aoe_radius")
end
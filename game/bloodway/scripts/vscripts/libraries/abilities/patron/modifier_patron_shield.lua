-- Created by Elfansoer
--[[
Ability checklist (erase if done/checked):
- Scepter Upgrade
- Break behavior
- Linken/Reflect behavior
- Spell Immune/Invulnerable/Invisible behavior
- Illusion behavior
- Stolen behavior
]]
--------------------------------------------------------------------------------
modifier_patron_shield = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_patron_shield:IsHidden()
	return false
end

function modifier_patron_shield:IsDebuff()
	return false
end

function modifier_patron_shield:IsStunDebuff()
	return false
end

function modifier_patron_shield:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_patron_shield:OnCreated( kv )
	-- references
	self:OnRefresh()

	if IsServer() then
		print("Created")
		self.parent = self:GetParent()
	end
end

function modifier_patron_shield:OnRefresh( kv )
	-- references
	self.reduction_front = self:GetAbility():GetSpecialValueFor( "physical_damage_reduction" )
	self.angle_front = self:GetAbility():GetSpecialValueFor( "forward_angle" )/2
	self.slow_ms_perc = self:GetAbility():GetSpecialValueFor("slow_ms_perc")
	self.dodge_chance = self:GetAbility():GetSpecialValueFor("dodge_chance")
end

function modifier_patron_shield:OnRemoved()
end

function modifier_patron_shield:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_patron_shield:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_CONSTANT_BLOCK,
		MODIFIER_EVENT_ON_RESPAWN,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
	}

	return funcs
end

function modifier_patron_shield:GetModifierMoveSpeedBonus_Percentage()
	return self.slow_ms_perc
end

function modifier_patron_shield:GetModifierPhysical_ConstantBlock( params )
	-- cancel if from ability
	if params.inflictor then return 0 end

	-- cancel if break
	if params.target:PassivesDisabled() then return 0 end

	-- get data
	local parent = params.target
	local attacker = params.attacker
	local reduction = 0

	-- Check target position
	local facing_direction = parent:GetAnglesAsVector().y
	local attacker_vector = (attacker:GetOrigin() - parent:GetOrigin())
	local attacker_direction = VectorToAngles( attacker_vector ).y
	local angle_diff = math.abs( AngleDiff( facing_direction, attacker_direction ) )

	-- calculate damage reduction
	if angle_diff < self.angle_front then
		reduction = self.reduction_front
		self:PlayEffects( true, attacker_vector )
    end

	if RollPseudoRandomPercentage( self.dodge_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, self.parent ) == true then
		return params.damage
	end
	return reduction*params.damage/100
end
--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_patron_shield:PlayEffects( front )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_mars/mars_shield_of_mars.vpcf"
	local sound_cast = "Hero_Mars.Shield.Block"

	if not front then
		particle_cast = "particles/units/heroes/hero_mars/mars_shield_of_mars_small.vpcf"
		sound_cast = "Hero_Mars.Shield.BlockSmall"
	end

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetParent() )
end

function modifier_patron_shield:OnRespawn(data)
	local respawnedUnit = data.unit
	local modifierParent = self:GetParent()
	if respawnedUnit == modifierParent then
		self:Destroy()
	end
end
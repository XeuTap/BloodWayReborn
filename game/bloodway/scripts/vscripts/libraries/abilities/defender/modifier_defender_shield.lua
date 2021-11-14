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
modifier_defender_shield = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_defender_shield:IsHidden()
	return false
end

function modifier_defender_shield:IsDebuff()
	return false
end

function modifier_defender_shield:IsStunDebuff()
	return false
end

function modifier_defender_shield:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_defender_shield:OnCreated( kv )
	-- references
	self.reduction_front = self:GetAbility():GetSpecialValueFor( "physical_damage_reduction" )
	self.reduction_side = self:GetAbility():GetSpecialValueFor( "physical_damage_reduction_side" )
	self.angle_front = self:GetAbility():GetSpecialValueFor( "forward_angle" )/2

	if IsServer() then
		print("Created")
		self.parent = self:GetParent()
	end
end

function modifier_defender_shield:OnRefresh( kv )
	-- references
	self.reduction_front = self:GetAbility():GetSpecialValueFor( "physical_damage_reduction" )
	self.reduction_side = self:GetAbility():GetSpecialValueFor( "physical_damage_reduction_side" )
	self.angle_front = self:GetAbility():GetSpecialValueFor( "forward_angle" )/2
end

function modifier_defender_shield:OnRemoved()
end

function modifier_defender_shield:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_defender_shield:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_CONSTANT_BLOCK,
		MODIFIER_EVENT_ON_RESPAWN,
	}

	return funcs
end

function modifier_defender_shield:GetModifierPhysical_ConstantBlock( params )
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

	return reduction*params.damage/100
end
--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_defender_shield:PlayEffects( front )
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

function modifier_defender_shield:OnRespawn(data)
	local respawnedUnit = data.unit
	local modifierParent = self:GetParent()
	if respawnedUnit == modifierParent then
		self:Destroy()
	end
end
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
cold_ranger_multishot = class({})

--------------------------------------------------------------------------------
-- Ability Start
cold_ranger_multishot.targets = {}
function cold_ranger_multishot:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()
	local point = self:GetCursorPosition()

	local heroAgility = caster:GetAgility()
	local heroIntellegence = caster:GetIntellect()

	-- load data
	local duration = self:GetChannelTime()

	self.targets = {}

	local count = self:GetSpecialValueFor( "arrow_count" )
	local range = self:GetSpecialValueFor( "arrow_range_multiplier" )
	local width = self:GetSpecialValueFor( "arrow_width" )
	self.speed = self:GetSpecialValueFor( "arrow_speed" )
	self.damage_multiplier = self:GetSpecialValueFor( "dmg_multiplier" )
	self.damage = (heroAgility + heroIntellegence) * self.damage_multiplier
	self.angle = 33.33

	if not IsServer() then return end

	-- none provided in kv file. shame on you volvo
	local vision = 100

	-- get projectile main direction
	self.direction = point-self:GetCaster():GetOrigin()
	self.direction.z = 0
	self.direction = self.direction:Normalized()

	-- precache projectile
	local caster = self:GetCaster()
	local projectile_name
	--projectile_name = "particles/units/heroes/hero_tiny/tiny_tree_linear_proj.vpcf"
	projectile_name = "particles/units/heroes/hero_drow/drow_multishot_proj_linear_proj.vpcf"
	self.info = {
		Source = caster,
		Ability = self,
		vSpawnOrigin = caster:GetAttachmentOrigin( caster:ScriptLookupAttachment( "attach_attack1" ) ),
		
	    bDeleteOnHit = true,
	    
	    iUnitTargetTeam = self:GetAbilityTargetTeam(),
	    iUnitTargetType = self:GetAbilityTargetType(),
	    iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,

	    EffectName = projectile_name,
	    fDistance = caster:Script_GetAttackRange() * range,
	    fStartRadius = width,
	    fEndRadius = width,
		-- vVelocity = projectile_direction * self.speed,
	
		bProvidesVision = true,
		iVisionRadius = vision,
		iVisionTeamNumber = caster:GetTeamNumber()
	}
	-- play effects
	local sound_cast = "Hero_DrowRanger.Multishot.Channel"
	EmitSoundOn( sound_cast, caster )

	-- count arrows
	self.current_arrows = 0

	for i = 1, count do 
	-- calculate relative angle of current arrow against cast direction
		local step = self.angle/(count-1)
		local angle = -self.angle/2 + self.current_arrows*step

		-- calculate actual direction
		local projectile_direction = RotatePosition( Vector(0,0,0), QAngle( 0, angle, 0 ), self.direction )

		-- launch projectile
		self.info.vVelocity = projectile_direction * self.speed
		self.info.ExtraData = {
			arrow = self.current_arrows,
			frost = self.frost,
		}
		ProjectileManager:CreateLinearProjectile(self.info)


		self.current_arrows = self.current_arrows+1
	end

	self:PlayEffects()

end
--------------------------------------------------------------------------------
-- Projectile
function cold_ranger_multishot:OnProjectileHit( target, location )
	if not target then return end
	-- check if already attacked on this wave
	if self.targets[target] ~= nill then return false end
	self.targets[target] = 1
	-- get value
	local damage = self:GetSpecialValueFor( "impact_damage" )

	-- damage
	local damageTable = {
		victim = target,
		attacker = self:GetCaster(),
		damage = self.damage,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		ability = self, --Optional.
		-- damage_flags = DOTA_DAMAGE_FLAG_NONE, --Optional.
	}
	ApplyDamage(damageTable)

	-- play effects
	local sound_cast = "Hero_DrowRanger.ProjectileImpact"
	EmitSoundOn( sound_cast, target )

	return true
end


function cold_ranger_multishot:PlayEffects()
	-- Get Resources
	local sound_cast
	if self.frost then
		sound_cast = "Hero_DrowRanger.Multishot.FrostArrows"
	else
		sound_cast = "Hero_DrowRanger.Multishot.Attack"
	end

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetCaster() )
end
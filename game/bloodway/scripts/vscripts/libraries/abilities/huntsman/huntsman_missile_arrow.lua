huntsman_missile_arrow = class ({})

function huntsman_missile_arrow:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end

function huntsman_missile_arrow:OnAbilityPhaseStart()
    EmitSoundOn( "Ability.PowershotPull", self:GetCaster() )
    return true
end

function huntsman_missile_arrow:OnSpellStart()

    local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local point = self:GetCursorPosition()
    local startPoint = self:GetCaster():GetAttachmentOrigin( self:GetCaster():ScriptLookupAttachment( "attach_hitloc" ) )
    point.z = startPoint.z

	if target then
		point = target:GetOrigin()
	end

    local projectile_name = "particles/units/heroes/hero_lina/lina_spell_dragon_slave.vpcf"
	local projectile_distance = self:GetSpecialValueFor( "missile_distance" )
	local projectile_speed = self:GetSpecialValueFor( "missile_speed" )
	local projectile_start_radius = 75
	local projectile_end_radius = 75

	-- get direction
	local direction = point-startPoint
    direction.z = 0
    local len = direction:Length2D()
	local projectile_direction = direction:Normalized() * projectile_speed

	-- create projectile
	local info = {
		Source = caster,
		Ability = self,
		vSpawnOrigin = caster:GetAbsOrigin(),
		
	    bDeleteOnHit = false,
	    
	    iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
	    iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
	    iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	    
	    EffectName = "particles/units/heroes/hero_windrunner/windrunner_spell_powershot.vpcf",
	    fDistance = projectile_distance,
	    fStartRadius = projectile_start_radius,
	    fEndRadius = projectile_end_radius,
		vVelocity = projectile_direction,

		bProvidesVision = false,
	}
	ProjectileManager:CreateLinearProjectile(info)
	EmitSoundOn( "Ability.Powershot", self:GetCaster() )
end

function huntsman_missile_arrow:OnProjectileHitHandle( target, location, projectile )
	if not target then 
        if IsServer() then

        end
    end
    local damage = self:GetSpecialValueFor( "impact_damage" )
	-- apply damage
	local damageTable = {
		victim = target,
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = self:GetAbilityDamageType(),
		ability = self, --Optional.
	}
	ApplyDamage( damageTable )
    EmitSoundOn("Hero_Windrunner.PowershotDamage", target)

	-- play effects
end


--function huntsman_missile_arrow:OnProjectileHitHandle(hTarget, vLocation, projectile)
--	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then
--		EmitSoundOn( "Hero_VengefulSpirit.MagicMissileImpact", hTarget )
--		local stun_duration = self:GetSpecialValueFor( "stun_duration" )
--		local stun_damage = self:GetSpecialValueFor( "stun_damage" )
--
--		local damage = {
--			victim = hTarget,
--			attacker = self:GetCaster(),
--			damage = stun_damage,
--			damage_type = DAMAGE_TYPE_MAGICAL,
--			ability = self
--		}
--
--		ApplyDamage( damage )
--		hTarget:AddNewModifier( self:GetCaster(), self, "modifier_huntsman_missile_arrow", { duration = stun_duration } )
--	end
--
--	return true
--end


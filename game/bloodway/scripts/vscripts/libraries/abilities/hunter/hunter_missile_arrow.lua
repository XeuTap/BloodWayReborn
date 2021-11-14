hunter_missile_arrow = class ({})

function hunter_missile_arrow:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end

function hunter_missile_arrow:OnSpellStart()
	--local caster = self:GetCaster()
--
    --local vLocation = self:GetCursorPosition() 
    --local vStartPos = self:GetCaster():GetAbsOrigin()
    --local vDirection = vLocation - caster:GetOrigin()
	--	vDirection.z = 0.0
	--local vNewDirection = vDirection
	--vNewDirection = vNewDirection:Normalized()
    --local flLength = self:GetSpecialValueFor( "missile_distance" )
    --local vVel = vNewDirection * self:GetSpecialValueFor( "missile_speed" )
	--vVel.z = 0.0
--
    ----local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_drow/drow_frost_arrow.vpcf", PATTACH_CUSTOMORIGIN, nil )
	----ParticleManager:SetParticleControl( nFXIndex, 0, vStartPos );
	----ParticleManager:SetParticleControl( nFXIndex, 1, vVel );
	----ParticleManager:SetParticleControl( nFXIndex, 2, vLocation );
	----ParticleManager:SetParticleControl( nFXIndex, 3, Vector( self:GetSpecialValueFor( "missile_speed" ), self:GetSpecialValueFor( "missile_speed" ), self:GetSpecialValueFor( "missile_speed" ) ) );
--
    --local info =
    --{
    --    Ability = self,
    --    EffectName = "particles/units/heroes/hero_lina/lina_spell_dragon_slave.vpcf",
    --    vSpawnOrigin = vStartPos,
    --    bDeleteOnHit = false,
    --    iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
	--    iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
	--    iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
    --    vVelocity = vNewDirection * self:GetSpecialValueFor( "missile_speed" ),
    --    fDistance = flLength,
    --    fStartRadius = 50,
    --    fEndRadius = 50,
    --    Source = self:GetCaster(),
    --}
	--	
--
	--ProjectileManager:CreateLinearProjectile(info)
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
	local projectile_start_radius = 40
	local projectile_end_radius = 40

	-- get direction
	local direction = point-startPoint
    direction.z = 0
    local len = direction:Length2D()
	local projectile_direction = direction:Normalized() * projectile_speed

    self.nFXIndex = ParticleManager:CreateParticle( "particles/econ/items/drow/drow_ti9_immortal/drow_ti9_frost_arrow.vpcf", PATTACH_CUSTOMORIGIN, nil )
    ParticleManager:SetParticleControl( self.nFXIndex, 0, startPoint );
    --ParticleManager:SetParticleControl( nFXIndex, 1, projectile_direction );
    ParticleManager:SetParticleControl( self.nFXIndex, 1, point );
    ParticleManager:SetParticleControl( self.nFXIndex, 2, Vector(projectile_speed, projectile_speed, 0) );
    ParticleManager:SetParticleControl( self.nFXIndex, 3, projectile_direction );

	-- create projectile
	local info = {
		Source = caster,
		Ability = self,
		vSpawnOrigin = caster:GetAbsOrigin(),
		
	    bDeleteOnHit = false,
	    
	    iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
	    iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
	    iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	    
	    EffectName = nil,
	    fDistance = len,
	    fStartRadius = projectile_start_radius,
	    fEndRadius = projectile_end_radius,
		vVelocity = projectile_direction,

		bProvidesVision = false,
	}
	ProjectileManager:CreateLinearProjectile(info)
	EmitSoundOn( "Hero_DrowRanger.FrostArrows", self:GetCaster() )
end

function hunter_missile_arrow:OnProjectileHitHandle( target, location, projectile )
	if not target then 
        if IsServer() then
            ParticleManager:DestroyParticle( self.nFXIndex, true )
            local nfxIndex1 = ParticleManager:CreateParticle( "particles/econ/items/drow/drow_ti9_immortal/drow_ti9_frost_arrow_explosion_flash.vpcf", PATTACH_CUSTOMORIGIN, nil )
            ParticleManager:SetParticleControl( nfxIndex1, 3, location )
	        ParticleManager:ReleaseParticleIndex( nfxIndex1 )
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

    local nfxIndex1 = ParticleManager:CreateParticle( "particles/econ/items/drow/drow_ti9_immortal/drow_ti9_frost_arrow_explosion_flek.vpcf", PATTACH_CUSTOMORIGIN, target )
    ParticleManager:SetParticleControl( nfxIndex1, 3, location )
	ParticleManager:ReleaseParticleIndex( nfxIndex1 )

	-- play effects
end


--function hunter_missile_arrow:OnProjectileHitHandle(hTarget, vLocation, projectile)
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
--		hTarget:AddNewModifier( self:GetCaster(), self, "modifier_hunter_missile_arrow", { duration = stun_duration } )
--	end
--
--	return true
--end


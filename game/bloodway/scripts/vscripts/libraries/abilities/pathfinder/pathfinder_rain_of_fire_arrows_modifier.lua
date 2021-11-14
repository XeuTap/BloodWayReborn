pathfinder_rain_of_fire_arrows_modifier = class ({})

function pathfinder_rain_of_fire_arrows_modifier:OnCreated(params)
    self:OnRefresh()
    if not IsServer() then return end
    self.particle_cast = "particles/econ/items/drow/drow_ti9_immortal/drow_ti9_frost_arrow.vpcf"
	self.sound_cast = "Ability.Starfall"
    self.projectile_speed = self:GetAbility():GetSpecialValueFor("arrow_speed")
    self.point = self.parent:GetOrigin()
    self.startPoint = Vector(self.point.x - 100, self.point.y - 100, 1200)
    self.radius = self.ability:GetSpecialValueFor("aoe_radius")
    self.arrows = self.arrows_count

    self.particles = {}
	-- Create Particle
    self:StartIntervalThink(0)
	EmitSoundOn( self.sound_cast, self.parent )

end

function pathfinder_rain_of_fire_arrows_modifier:OnRefresh()
    self.caster = self:GetCaster()
	self.parent = self:GetParent()
	self.ability = self:GetAbility()
    self.origin = self.parent:GetAbsOrigin()
    self.arrows_count = self:GetAbility():GetSpecialValueFor("arrow_count")
    self.radius = self.ability:GetSpecialValueFor( "aoe_radius" )
    local dmg_multiplier = self.ability:GetSpecialValueFor("dmg_multiplier")
    local agi_multiplier = self.ability:GetSpecialValueFor("agi_multiplier")
    local heroAgi = self.caster:GetAgility()
    local damage = agi_multiplier * heroAgi * dmg_multiplier
    self.damage = damage / self.arrows_count

    self.dmg_info = {
        attacker = self.caster,
        damage_type = DAMAGE_TYPE_MAGICAL,
        ability = self.ability,
        damage = self.damage,
        }
end

function pathfinder_rain_of_fire_arrows_modifier:DestroyParticle(particle, immediate)
    ParticleManager:DestroyParticle( particle, immediate );
end

function pathfinder_rain_of_fire_arrows_modifier:CreateGroundParticle(point)
    local nfxIndex1 = ParticleManager:CreateParticle("particles/econ/items/earthshaker/earthshaker_arcana/earthshaker_arcana_totem_marker.vpcf", PATTACH_CUSTOMORIGIN, nil)
    ParticleManager:SetParticleControl(nfxIndex1, 0, point)
    return nfxIndex1

end

function pathfinder_rain_of_fire_arrows_modifier:DealDamage()
    local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, self.point, nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, FIND_ANY_ORDER, true )
    for index, hTarget in pairs(targets) do
        self.dmg_info["victim"] = hTarget
        ApplyDamage(self.dmg_info)
    end
end

function pathfinder_rain_of_fire_arrows_modifier:OnIntervalThink()
    if self.arrows == 0 then 
        self:StartIntervalThink(-1)
        return
    end

    if not self.ability:IsChanneling() then
        self:StartIntervalThink(-1)
        return
    end

    local duration = self:GetDuration()
    local max_interval = duration / self.arrows
    local random_interval = RandomFloat(0.05, max_interval)
    
    local random_seed_x = RandomInt(-250, 250)
    local random_seed_y = RandomInt(-250, 250)
    local random_startPoint = self.startPoint + Vector(random_seed_x, random_seed_y, 0)
    local random_point = self.point + Vector(random_seed_x, random_seed_y, 0)
    
    local direction = random_point-random_startPoint
    local projectile_direction = direction:Normalized() * self.projectile_speed

	self.effect_cast = ParticleManager:CreateParticle( self.particle_cast, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( self.effect_cast, 0, random_startPoint )
	--ParticleManager:SetParticleControl( effect_cast, 4, Vector( self.radius, 0, 0 ) )
    ParticleManager:SetParticleControl( self.effect_cast, 1, random_point )
	ParticleManager:SetParticleControl( self.effect_cast, 2, Vector( self.projectile_speed, self.projectile_speed, self.projectile_speed ) )
    ParticleManager:SetParticleControl( self.effect_cast, 3, projectile_direction );


    Timers:CreateTimer(0.95, function()
        self:DealDamage()
        EmitSoundOn("Hero_Mirana.ArrowImpact", self.caster)
        local particle = self.particles[1]
        table.remove(self.particles, 1)
        self:DestroyParticle(particle, false)
        local ground_particle = self:CreateGroundParticle(random_point)
        self:DestroyParticle(ground_particle, false)
      end
    )

    table.insert(self.particles, self.effect_cast)
    self.arrows = self.arrows - 1


    self:StartIntervalThink(random_interval)

end
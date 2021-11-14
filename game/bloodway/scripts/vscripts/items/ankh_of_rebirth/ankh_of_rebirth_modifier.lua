item_ankh_of_rebirth_modifier = class ({})
function item_ankh_of_rebirth_modifier:DeclareFunctions()
   local funcs = {
    MODIFIER_PROPERTY_REINCARNATION,
    MODIFIER_EVENT_ON_RESPAWN
   }
   return funcs
end

function item_ankh_of_rebirth_modifier:OnCreated()
   self:OnRefresh()
end

function item_ankh_of_rebirth_modifier:IsHidden()
   return true
end

function item_ankh_of_rebirth_modifier:GetAttributes()
   return MODIFIER_ATTRIBUTE_MULTIPLE
end

function item_ankh_of_rebirth_modifier:OnRefresh( data )
   self.respawn_time = self:GetAbility():GetSpecialValueFor("respawn_time")
   self.initial_hp = self:GetAbility():GetSpecialValueFor("initial_hp")
end

function item_ankh_of_rebirth_modifier:ReincarnateTime()
    if IsServer() then
        if self:GetAbility():IsFullyCastable() then
            self:Reincarnate()
            return self.respawn_time
        end
        return 0
    end
end

function item_ankh_of_rebirth_modifier:Reincarnate()
    self:GetAbility():UseResources(true, false, true)
    self:PlayEffects()
    local caster = self:GetAbility():GetCaster()
    caster:SetUnitCanRespawn(false)
end

function item_ankh_of_rebirth_modifier:OnRespawn()
    local caster = self:GetAbility():GetCaster()
        if caster:UnitCanRespawn() then
            return
        end
        caster:SetHealth(self.initial_hp)
        caster:SetUnitCanRespawn(true)
end

function item_ankh_of_rebirth_modifier:PlayEffects()
	-- get resources
	local particle_cast = "particles/units/heroes/hero_skeletonking/wraith_king_reincarnate.vpcf"
	local sound_cast = "Hero_SkeletonKing.Reincarnate"

	-- play particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.reincarnate_time, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- play sound
	EmitSoundOn( sound_cast, self:GetParent() )
end
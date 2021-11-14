mage_arcane_explosion = class ({})


function mage_arcane_explosion:GetCooldown( nLevel )
	return self.BaseClass.GetCooldown( self, nLevel )
end

function mage_arcane_explosion:CastFilterResultTarget( _target )
	if self:GetCaster() == _target then
		return UF_FAIL_CUSTOM
	end

	local nResult = UnitFilter( _target, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function mage_arcane_explosion:GetCustomCastErrorTarget( _target )
	if self:GetCaster() == _target then
		return "#dota_hud_error_cant_cast_on_self"
	end

	if _target:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function mage_arcane_explosion:OnSpellStart()
	local _target = self:GetCursorTarget()
	if _target ~= nil and ( not _target:IsInvulnerable() ) and ( not _target:TriggerSpellAbsorb( self ) ) and ( not _target:IsMagicImmune() ) then
		local _caster = self:GetCaster()
		local area = self:GetSpecialValueFor("spell_aoe")
		local _damage = self:GetSpecialValueFor("impact_damage")


		local targets = FindUnitsInRadius(DOTA_TEAM_BADGUYS + DOTA_TEAM_NEUTRALS, _target:GetAbsOrigin(), nil, area, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, FIND_ANY_ORDER, true )
		for index, _current_target in pairs(targets) do
			local info = 
			{
				victim = _current_target,
				attacker = _caster,
				damage = _damage,
				damage_type = DAMAGE_TYPE_MAGICAL,
				damage_flags = DOTA_DAMAGE_FLAG_NONE,
				ability = self
			}
			ApplyDamage(info)
			local nFX1 = ParticleManager:CreateParticle("particles/units/heroes/hero_keeper_of_the_light/keeper_chakra_magic.vpcf", PATTACH_CUSTOMORIGIN , _current_target)
			ParticleManager:SetParticleControlEnt( nFX1, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_attack2", self:GetCaster():GetOrigin(), true );
			ParticleManager:SetParticleControlEnt( nFX1, 1, _current_target, PATTACH_ABSORIGIN_FOLLOW, nil, _current_target:GetOrigin(), true );
			ParticleManager:ReleaseParticleIndex( nFX1 );
		end


		--Timers:CreateTimer(0.2, function()
    	--EmitSoundOn("Hero_Invoker.EMP.Discharge", _caster)
    	--return
  		--end
  		--)

  		EmitSoundOn("Hero_Invoker.EMP.Discharge", _caster)
	end
end
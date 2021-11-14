priest_heal = class ({})

function priest_heal:CastFilterResultTarget( hTarget )

	local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, self:GetCaster():GetTeamNumber() )
	if nResult ~= UF_SUCCESS then
		return nResult
	end

	return UF_SUCCESS
end

function priest_heal:GetCustomCastErrorTarget( hTarget )
	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function priest_heal:OnSpellStart()
	local _caster = self:GetCaster()
	local hTarget = self:GetCursorTarget()

	local heal_amount = self:GetSpecialValueFor("heal_amount")
	local target_amount = self:GetSpecialValueFor("target_amount")
	local cast_range = self:GetSpecialValueFor("cast_range")

	local cursor_target = hTarget

	if hTarget == self:GetCaster() then
		cursor_target = _caster
	end

	--cursor_target:Heal(heal_amount , self)

	-- Play sound
	EmitSoundOn("Hero_Dazzle.Shadow_Wave", _caster)

	local targets = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, cursor_target:GetAbsOrigin(), nil, cast_range, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, FIND_CLOSEST, true)
	local target = targets[1]
	local already_was_targeted = {}
	local i = 0
	while (i < target_amount) do
		table.insert(already_was_targeted, target)
		target:Heal(heal_amount, self)
		local nFXIndex4  = ParticleManager:CreateParticle( "particles/custom_shadow_wave.vpcf", PATTACH_CUSTOMORIGIN, target )
		ParticleManager:SetParticleControl( nFXIndex4, 0, _caster:GetOrigin() )
		ParticleManager:SetParticleControlEnt( nFXIndex4, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetOrigin(), true )
		ParticleManager:SetParticleControl( nFXIndex4, 2, Vector( 100, 0, 0 ) )
		ParticleManager:SetParticleControlEnt( nFXIndex4, 3, target, PATTACH_ABSORIGIN_FOLLOW, nil, target:GetOrigin(), true )
		ParticleManager:ReleaseParticleIndex( nFXIndex4 )
		local new_targets = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, target:GetOrigin(), nil, cast_range, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, FIND_CLOSEST, true)
		local has_new_target = false
		for index, new_target in pairs(new_targets) do
			DebugPrintTable(new_targets)
			if hasValue(already_was_targeted, new_target) ~= true then
				target = new_target
				has_new_target = true
				break
			end
		end
		if has_new_target == true then
			i = i + 1
		else
			if hasValue(already_was_targeted, _caster) ~= true then
				target = _caster
				target:Heal(heal_amount, self)
				local nFXIndex4  = ParticleManager:CreateParticle( "particles/custom_shadow_wave.vpcf", PATTACH_CUSTOMORIGIN, target )
				ParticleManager:SetParticleControl( nFXIndex4, 0, _caster:GetOrigin() )
				ParticleManager:SetParticleControlEnt( nFXIndex4, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetOrigin(), true )
				ParticleManager:SetParticleControl( nFXIndex4, 2, Vector( 100, 0, 0 ) )
				ParticleManager:SetParticleControlEnt( nFXIndex4, 3, target, PATTACH_ABSORIGIN_FOLLOW, nil, target:GetOrigin(), true )
				ParticleManager:ReleaseParticleIndex( nFXIndex4 )
			end
			break
		end
	end
end


	--for index, target in pairs(targets) do
	--	if index < target_amount+1 then
	--		target:Heal(heal_amount, self)
	--		local nFXIndex4  = ParticleManager:CreateParticle( "particles/custom_shadow_wave.vpcf", PATTACH_CUSTOMORIGIN, target )
	--				ParticleManager:SetParticleControl( nFXIndex4, 0, _caster:GetOrigin() )
	--				ParticleManager:SetParticleControlEnt( nFXIndex4, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetOrigin(), true )
	--				ParticleManager:SetParticleControl( nFXIndex4, 2, Vector( 100, 0, 0 ) )
	--				ParticleManager:SetParticleControlEnt( nFXIndex4, 3, target, PATTACH_ABSORIGIN_FOLLOW, nil, target:GetOrigin(), true )
	--				ParticleManager:ReleaseParticleIndex( nFXIndex4 )
	--	end
	--end
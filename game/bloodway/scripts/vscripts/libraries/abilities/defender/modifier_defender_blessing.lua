modifier_defender_blessing = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_defender_blessing:IsHidden()
	return false
end

function modifier_defender_blessing:IsDebuff()
	return false
end

function modifier_defender_blessing:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_defender_blessing:OnCreated( kv )
	if IsServer() then
		-- Play Effects
		self.sound_cast = "Hero_Omniknight.Repel"
		EmitSoundOn( self.sound_cast, self:GetParent() )
	end
end

function modifier_defender_blessing:OnRefresh( kv )
	
end

function modifier_defender_blessing:OnDestroy( kv )
	if IsServer() then
		StopSoundOn( self.sound_cast, self:GetParent() )
	end
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_defender_blessing:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_MAGICAL,
	}

	return funcs
end

function modifier_defender_blessing:GetAbsoluteNoDamageMagical()
	return 1
end
--------------------------------------------------------------------------------
-- Status Effects
function modifier_defender_blessing:CheckState()
	local state = {
	[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}

	return state
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_defender_blessing:GetEffectName()
	return "particles/units/heroes/hero_chen/chen_divine_favor_buff.vpcf"
end

function modifier_defender_blessing:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
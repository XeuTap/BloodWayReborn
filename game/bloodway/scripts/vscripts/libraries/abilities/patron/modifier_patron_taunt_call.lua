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
modifier_patron_taunt_call = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_patron_taunt_call:IsHidden()
	return false
end

function modifier_patron_taunt_call:IsDebuff()
	return false
end

function modifier_patron_taunt_call:IsPurgable()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_patron_taunt_call:OnCreated( kv )
	-- references
	self:OnRefresh()
end

function modifier_patron_taunt_call:OnRefresh( kv )
	-- references
end

function modifier_patron_taunt_call:OnRemoved()
end

function modifier_patron_taunt_call:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_patron_taunt_call:DeclareFunctions()
	local funcs = {
	}

	return funcs
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_patron_taunt_call:GetEffectName()
	return "particles/units/heroes/hero_axe/axe_beserkers_call.vpcf"
end

function modifier_patron_taunt_call:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
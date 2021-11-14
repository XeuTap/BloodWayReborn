if item_small_health_potion == nil then
    item_small_health_potion = class ({})
end

LinkLuaModifier( "item_small_health_potion_modifier", "items/small_health_potion/small_health_potion_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_small_health_potion:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_SUPPRESS_ASSOCIATED_CONSUMABLE + DOTA_ABILITY_BEHAVIOR_CAN_SELF_CAST
end

function item_small_health_potion:CastFilterResultTarget(hTarget)

    local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, self:GetCaster():GetTeamNumber() )
    if nResult ~= UF_SUCCESS then 
        return nResult
    end
    return UF_SUCCESS
end

function item_small_health_potion:GetCustomCastErrorTarget( hTarget )
	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function item_small_health_potion:IsStackable()
    return true
end

function item_small_health_potion:IsPermanent()
    return false
end


function item_small_health_potion:OnSpellStart()
    local duration = self:GetSpecialValueFor("buff_duration")
    target = self:GetCursorTarget()
    target:AddNewModifier(self:GetCaster(), self, "item_small_health_potion_modifier", { duration = duration })
    self:SpendCharge()
end
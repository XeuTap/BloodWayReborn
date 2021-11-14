if item_watermelon == nil then
    item_watermelon = class ({})
end

LinkLuaModifier( "item_watermelon_modifier", "items/watermelon/watermelon_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_watermelon:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_UNIT_TARGET + DOTA_ABILITY_BEHAVIOR_SUPPRESS_ASSOCIATED_CONSUMABLE + DOTA_ABILITY_BEHAVIOR_CAN_SELF_CAST
end

function item_watermelon:CastFilterResultTarget(hTarget)

    local nResult = UnitFilter( hTarget, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_MAGIC_IMMUNE_ALLIES, self:GetCaster():GetTeamNumber() )
    if nResult ~= UF_SUCCESS then 
        return nResult
    end
    return UF_SUCCESS
end

function item_watermelon:GetCustomCastErrorTarget( hTarget )
	if hTarget:IsAncient() then
		return "#dota_hud_error_cant_cast_on_ancient"
	end

	return ""
end

function item_watermelon:IsStackable()
    return true
end

function item_watermelon:IsPermanent()
    return false
end


function item_watermelon:OnSpellStart()
    local duration = self:GetSpecialValueFor("buff_duration")
    target = self:GetCursorTarget()
    target:AddNewModifier(self:GetCaster(), self, "item_watermelon_modifier", { duration = duration })
    self:SpendCharge()
end
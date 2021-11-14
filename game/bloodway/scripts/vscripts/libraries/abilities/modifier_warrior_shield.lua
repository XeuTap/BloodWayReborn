modifier_warrior_shield = class ({})

function modifier_warrior_shield:IsHidden()
	return false
end


function modifier_warrior_shield:OnCreated( _kv )
	self:OnRefresh( _kv )
end

function modifier_warrior_shield:OnRefresh( _kv )
	self.block_chance = self:GetAbility():GetSpecialValueFor("block_chance")
	self.block_amount = self:GetAbility():GetSpecialValueFor("block_amount")
end

function modifier_warrior_shield:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_CONSTANT_BLOCK
	}

	return funcs
end

function modifier_warrior_shield:GetModifierPhysical_ConstantBlock()
	if RollPseudoRandomPercentage( self.block_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, self:GetCaster() ) == true then
		return self.block_amount
	end
	return 0
end
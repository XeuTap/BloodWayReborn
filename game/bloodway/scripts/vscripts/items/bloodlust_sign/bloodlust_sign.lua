if item_bloodlust_sign == nil then
    item_bloodlust_sign = class ({})
end

LinkLuaModifier( "item_bloodlust_sign_modifier", "items/bloodlust_sign/bloodlust_sign_modifier.lua", LUA_MODIFIER_MOTION_NONE )

function item_bloodlust_sign:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_IMMEDIATE
end

function item_bloodlust_sign:OnSpellStart()
    self.duration = self:GetSpecialValueFor("buff_duration")
    local caster = self:GetCaster()
    caster:AddNewModifier(caster, self, "item_bloodlust_sign_modifier", { duration = _duration })

    local nFXIndex1 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
	local nFXIndex2 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness_b.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
	EmitSoundOn("DOTA_Item.MaskOfMadness.Activate", caster)

	Timers:CreateTimer(self.duration, function()
        ParticleManager:DestroyParticle( nFXIndex1, false)
        ParticleManager:DestroyParticle( nFXIndex2, false)
        local nFXIndex3 = ParticleManager:CreateParticle("particles/items2_fx/mask_of_madness_d.vpcf", PATTACH_EYES_FOLLOW, self:GetCaster())
        ParticleManager:DestroyParticle( nFXIndex3, false)
    return
    end
    )
end
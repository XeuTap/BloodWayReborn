if not Spawner then Spawner = class ({})
end

function Spawner:DelayedRespawn(data)
	DebugPrint("Delayed Respawn")
	local VisionArea
	if GameRules:IsDaytime() then
		VisionArea = 1830
	else
		VisionArea = 830
	end
	--local heroInArea = Entities:FindByClassnameNearest('npc_dota_hero_windrunner', data.cords, VisionArea)
	local heroInArea = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, data.cords, nil, VisionArea, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_PLAYER_CONTROLLED, FIND_ANY_ORDER, true)
	if tablelength(heroInArea) ~= 0 then
		return Timers:CreateTimer(1, function()
				Spawner:DelayedRespawn{unitName=data.unitName, cords=data.cords, team=data.team, killerEntity=data.killerEntity, entityName = data.entityName, entityColor = data.entityColor}
			end)
	else
		DebugPrint("Spawning Unit")
		local unit = CreateUnitByName(data.unitName,
		 							  data.cords,
		 							  false,
		 							  nil,
		 							  nil,
		 							  data.team)
		Timers:CreateTimer(function() unit:SetAbsOrigin(data.cords) end)
		unit:SetInitialGoalPosition(data.cords)
		unit:SetRenderColor(data.entityColor.x, data.entityColor.y, data.entityColor.z)
		unit:SetEntityName(data.entityName)
		--unit:SetAcquisitionRange(800)
		--unit:SetEntityName(name)

	end
end

function TriggerContainsHero(trigger)
	print("Player leaves the area")
end
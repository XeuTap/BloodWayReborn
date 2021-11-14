if not CustomXPManager then CustomXPManager = class ({})
end


function CustomXPManager:AddExpToUnit(data)
    local sharedExpArea = 1000
    local killedUnitLevel = data.killedUnit:GetLevel()
    UNIT_TYPE_MULTIPLIER = CustomXPManager:GetUnitTypeMultiplier(data.killedUnit)
    --if data.killerEntity:IsRealHero()
    if data.killedUnit:GetTeam() == DOTA_TEAM_NEUTRALS then
        local heroInArea = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, data.killedUnit:GetAbsOrigin(), nil, sharedExpArea, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, true)
        --print(#heroInArea)
        for index, hero in pairs(heroInArea) do
            local heroLevel = hero:GetLevel()
            if abs(heroLevel - killedUnitLevel) < 10 then
                local expValue = (sqrt(heroLevel) * ((1.25 + (0.30 * #heroInArea)) * (10.00 - abs(heroLevel - killedUnitLevel)))) * UNIT_TYPE_MULTIPLIER
                hero:AddExperience(expValue, DOTA_ModifyXP_CreepKill , false, true)
                print(expValue)
            end
        end
    end
end

function CustomXPManager:GetUnitTypeMultiplier(unit)
    local unitType = TableManager:GetUnitType(unit)
    if unitType == "Boss" then
        return 3
    elseif unitType == "Elite" then
        return 2.5
    else
        return 2
    end
end
if not TableManager then TableManager = class ({})
end



function TableManager:Init()
    TableManager.boss_list = {"boss_fairy_dragon"}
    TableManager.elite_list = {"creep_2"}
    data = {}
    local ent_table = Entities:FindAllByClassname("npc_dota_creature")
		for index, entity in pairs(ent_table) do
            print(entity:GetUnitName())
            entity_info = { entIndex = entity:GetEntityIndex(), unitName = entity:GetUnitName(), unitType = TableManager:GetUnitType(entity)}
			table.insert(data, entity_info)
		end
    TableManager.table = {entities = data}
    TableManager.hero_table = LoadKeyValues("scripts/npc/npc_heroes_custom.txt")
end

function TableManager:GetHeroAbilities(heroName)
    abilityList = {}
    for index=1, 16 do
        ability = TableManager:GetHeroAbility(heroName, index)
        if ability then
            table.insert(abilityList, ability)
        end
    end
    return abilityList
end

function TableManager:GetHeroAbility(heroName, index)
    local heroTable = TableManager.hero_table[heroName]
    local abilityName = heroTable['Ability' .. index]
    if not abilityName or #abilityName == 0 then
        return nil
    end
    local ability = GetAbilityKeyValuesByName(abilityName)
    ability.AbilityName = abilityName
    return ability
end

function TableManager:GetUnitType(unit)
    if TableManager:IsBoss(unit) then
        return "Boss"
    elseif TableManager:IsElite(unit) then
        return "Elite"
    else 
        return  "Normal"
    end
end

function TableManager:GetEntTable()
    return TableManager.table['entities']
end

function TableManager:IsBoss(unit)
    if hasValue(TableManager.boss_list, unit:GetUnitName()) then
        return true
    else 
        return false
    end
end

function TableManager:IsElite(unit)
    if hasValue(TableManager.elite_list, unit:GetUnitName()) then
        return true
    else 
        return false
    end
end

function TableManager:GetEntitiesByName(entityName)
    local entList = TableManager.table["entities"]
    local result = {}
    for index, entity in pairs(entList) do
        if entity.unitName == entityName then
            table.insert(result, entity.entIndex)
        end
    end
    return result
end

function TableManager:GetEntityByIndex(entityIndex)
    local entList = TableManager.table["entities"]
    for index, entity in pairs(entList) do
        if entity.entIndex == entityIndex then
            return entity
        end
    end
end

function TableManager:GetEntityIndex(entityIndex)
    local entList = TableManager.table["entities"]
    for index, entity in pairs(entList) do
        if entity.entIndex == entityIndex then
            return index
        end
    end
end

function TableManager:RemoveEntityFromTable(entityIndex)
    local entList = TableManager.table["entities"]
    local tableIndex = TableManager:GetEntityIndex(entityIndex)
    table.remove(entList, tableIndex)
    TableManager.table['entities'] = entList
    return
end

function TableManager:AddEntityToTable(entityIndex)
    local entList = TableManager.table["entities"]
    local entity = EntIndexToHScript(entityIndex)
    if entity then
        entity_info = { entIndex = entityIndex, unitName = entity:GetUnitName()}
        table.insert(entList, entity_info)
        TableManager.table['entities'] = entList
    end
    return
end



--function TableManager:InitEntityTables()
--    TableManager:InitBossTable()
--    TableManager:InitEliteTable()
--end
--
--function TableManager:InitBossTable()
--    local boss_puck = Entities:FindByName(nil, "boss_puck")
--    local boss_troll = Entities:FindByName(nil, "boss_troll")
--    local boss_centaur = Entities:FindByName(nil, "boss_centaur")
--    local data = { boss_puck:GetEntityIndex(), boss_troll:GetEntityIndex(), boss_centaur:GetEntityIndex() }
--    CustomNetTables:SetTableValue("units", "boss_list", data)
--end
--
--function TableManager:InitEliteTable()
--    local data = { }
--    local creep = Entities:FindAllByName("creep_2")
--    for index, entity in pairs(creep) do
--        table.insert(data, entity:GetEntityIndex())
--    end
--    CustomNetTables:SetTableValue("units", "elite_list", data)
--end
--
--function TableManager:GetEliteTable()
--    local eliteList = CustomNetTables:GetTableValue("units", "elite_list")
--    return eliteList
--end
--
--function TableManager:GetBossTable()
--    local bossList = CustomNetTables:GetTableValue("units", "boss_list")
--    return bossList
--end
if not ReincarnationManager then ReincarnationManager = class ({})
end

function ReincarnationManager:Initialize()
    ReincarnationManager.initialized = true;
    ReincarnationManager.proffesion1 = {
        npc_dota_hero_windrunner = {"npc_dota_hero_hunter"},
        npc_dota_hero_hunter = {"npc_dota_hero_cold_ranger", "npc_dota_hero_pathfinder", "npc_dota_hero_huntsman"},
        npc_dota_hero_dragon_knight = {"npc_dota_hero_defender", "npc_dota_hero_sun_warrior"},
        npc_dota_hero_sun_warrior = { "npc_dota_hero_paladin" },
        npc_dota_hero_defender =  { "npc_dota_hero_patron" }
    }

    CustomGameEventManager:RegisterListener("reincarnate", Dynamic_Wrap(ReincarnationManager, 'Reincarnate'))
end

function ReincarnationManager:GetProffesionsTable()
    return ReincarnationManager.proffesion1
end

function ReincarnationManager:Reincarnate(data)
    local player = PlayerResource:GetPlayer(data.playerID)
    local playerHero = player:GetAssignedHero()
    local absOrigin = playerHero:GetAbsOrigin()
    local currentGold = playerHero:GetGold()
    Cosmetics:CleanCosmetic(playerHero)
    local hero = PlayerResource:ReplaceHeroWith(data.playerID, data.newHero, currentGold, 0)
end


function ReincarnationManager:SendReincarnationPortraits(playerID)
    local player = PlayerResource:GetPlayer(playerID)
    local hero = player:GetAssignedHero()
    local heroNameTable = ReincarnationManager.proffesion1[hero:GetUnitName()]
    if not heroNameTable then return end
    heroTable = {}
    for index, heroName in pairs(heroNameTable) do
        local heroAbilities = TableManager:GetHeroAbilities(heroName)
        local heroData = DOTAGameManager:GetHeroDataByName_Script(heroName)
        local heroInfo = { heroName = heroName, heroAbilities = heroAbilities, heroAttribute = heroData["AttributePrimary"]}
        table.insert(heroTable, heroInfo)
    end
    print(#heroTable)
    CustomGameEventManager:Send_ServerToPlayer(player, "load_reincarnation_portraits", heroTable)
end

if not ReincarnationManager.initialized then
    ReincarnationManager:Initialize()
end
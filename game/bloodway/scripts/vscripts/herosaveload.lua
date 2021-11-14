if HeroSaveLoadManager == nil then HeroSaveLoadManager = class ({})

    HeroSaveLoadManager.AUTH_KEY = "DB_Testing"
    if IsDedicatedServer() then
        HeroSaveLoadManager.AUTH_KEY = GetDedicatedServerKeyV2("bloodwayrpgreborn")
    end

    print(HeroSaveLoadManager.AUTH_KEY)

    HeroSaveLoadManager.SERVER_LOCATION = "https://dota-2bloodway-reborn-default-rtdb.europe-west1.firebasedatabase.app/" .. HeroSaveLoadManager.AUTH_KEY .. "/"
end

function HeroSaveLoadManager:initialize()
    self.initialized = true
    --ListenToGameEvent("save_request", Dynamic_Wrap(HeroSaveLoadManager, 'OnPlayerRequestSave'), self)
    local listener = CustomGameEventManager:RegisterListener("save_request", Dynamic_Wrap(HeroSaveLoadManager, 'OnPlayerRequestSave'))
    print("HeroSaveLoadManager initialized")
end

function HeroSaveLoadManager:OnPlayerRequestSave( hero )
    print("Event fired, got table ")
    local heroname = hero:GetUnitName()
    local steamid = PlayerResource:GetSteamID(hero:GetPlayerID())
    self:SaveHeroData(steamid, hero)
end

function HeroSaveLoadManager:SaveHeroData(steamid, hero)

    -- Get the hero's position and convert it to a string
    putData = {}
    putData.level = hero:GetLevel()
    putData.unitName = hero:GetUnitName()
    putData.items = {}
    for i = 0, 8, 1 do
        local item = hero:GetItemInSlot(i)
        if item ~= nil then
            table.insert(putData.items, item:GetAbilityName())
        end
    end

    local encoded = json.encode(putData)

    local request = CreateHTTPRequestScriptVM( 
        "PUT",
        HeroSaveLoadManager.SERVER_LOCATION..tostring(steamid)..'.json'
    )
    
    request:SetHTTPRequestRawPostBody("application/json", encoded)

    request:Send( 
        function( result )
            -- Do nothing
        end
    )
end

function HeroSaveLoadManager:OnPlayerRequestLoad( player )
    print("Event fired, got table ")
    local steamid = PlayerResource:GetSteamID(player:GetPlayerID())
    self:LoadHeroData(steamid, player)
end

function HeroSaveLoadManager:LoadHeroData(steamid, player)

    local request = CreateHTTPRequestScriptVM( "GET", HeroSaveLoadManager.SERVER_LOCATION..tostring(steamid)..'.json')

    request:Send( function( result )
        
        if not (result.StatusCode == 200) then
            print("HeroSaveLoadManager | Load Failed - Unable to contact server")
            return false
        end

        local data, pos, err = json.decode(result.Body, 1, nil)

        -- Were we able to retrieve data?
        if not data then
            print("HeroSaveLoadManager | Load Failed - Could not find any data")
            return false
        end

        local level = data.level
        local unitName = data.unitName
        local items = data.items
        local currentGold = PlayerResource:GetGold(player:GetPlayerID())

        local newHero = PlayerResource:ReplaceHeroWith(player:GetPlayerID(), unitName , currentGold , 0)
        for i = 1, level-1, 1 do
            newHero:HeroLevelUp(true)
        end

        if items ~= nil then
            for index, itemName in pairs(items) do
                newHero:AddItemByName(itemName)
            end
        end
        
    end )
end



if not HeroSaveLoadManager.initialized then
    HeroSaveLoadManager:initialize()
end
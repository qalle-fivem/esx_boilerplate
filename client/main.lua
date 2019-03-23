ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        -- <> Fetch ESX Library <> --
        TriggerEvent("esx:getSharedObject", function(library) 
            ESX = library 
        end)

		Citizen.Wait(0)
    end
    
    -- <> Restart Script Fetch Information <> --
    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

-- <> On Player Load <> --
RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
    ESX.PlayerData = playerData   
end)

-- <> On Player Change Job <> --
RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    ESX.PlayerData["job"] = job
end)

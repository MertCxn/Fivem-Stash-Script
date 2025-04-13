QBCore = nil
Citizen.CreateThread(function() 
    while QBCore == nil do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
        Citizen.Wait(200)
    end
end)

QBCore = exports['qb-core']:GetCoreObject() 

KisiselDepolar = { #Get the vector3 position of the place you want to add here
    vector3(265.89, -999.36, -99.01),
},

CreateThread(function()
    while true do
        sleep = 100
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed)
        
        for k, v in pairs(KisiselDepolar) do
            local dist = #(plyCoords - v)

            if dist < 2.5 then
                sleep = 3
                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "[E] Kisisel Depo")
                if IsControlJustPressed(0, 38) then
                    local cid = QBCore.Functions.GetPlayerData().citizenid
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Kişisel Depo - "..cid,  {
                        maxweight = 5000000000,
                        slots = 10000,
                        owner = cid
                    })
                end
            end
        end
        Wait(sleep)
    end
end)

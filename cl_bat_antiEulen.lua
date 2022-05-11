local EventIsHere = true

for i = 1, #BatOP.Events, 1 do
    RegisterNetEvent(BatOP.Events[i])
    AddEventHandler(BatOP.Events[i], function()
        EventIsHere = true
    end)
end

CheckingEventIsAlive = function()
    if not EventIsHere then
        return TriggerServerEvent("bat:banEulen")
    end
end

SendHeartBeatToServer = function()
    TriggerServerEvent('bat:__sendHeartbeat__', GetPlayerServerId(PlayerId()))
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        for i = 1, #BatOP.Events, 1 do
            TriggerEvent(BatOP.Events[i])
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        CheckingEventIsAlive()
        SendHeartBeatToServer()
        EventIsHere = false
    end
end)
local spawned = false

AddEventHandler('playerSpawned', function()
    Wait(3000)
    TriggerServerEvent('bat:spawned')
    spawned = true
end)

CreateThread(function()
    while true do
        Wait(10000)
        local player = PlayerPedId()
        if DoesEntityExist(player) then
            if not spawned then
                return TriggerServerEvent("bat:banEulen")
            end
        end
    end
end)

AddEventHandler('onClientResourceStart', function()
    local playerID = PlayerPedId()
    local coords = GetEntityCoords(playerID)
    if DoesEntityExist(playerID) then
        TriggerEvent('playerSpawned')
    else
        Wait(5000)
        TriggerEvent('playerSpawned')
    end
end)

-- Mettez ceci dans une ressource aléatoire comme un client je n’ai pas eu le temps de faire pour vous un mini installateur

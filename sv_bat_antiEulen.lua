local Here = {}
local Spawned = {}

RegisterServerEvent("bat:__sendHeartbeat__")
AddEventHandler("bat:__sendHeartbeat__", function(id)
    if Here[tonumber(id)] == nil then
        Here[tonumber(id)] = 1
    else
        Here[tonumber(id)] = 1
    end
    Wait(20)
    StartHeartbeat(tonumber(id))    
end)

RegisterServerEvent('bat:spawned')
AddEventHandler('bat:spawned', function()
    local id = source
    if Spawned[id] == nil then
        Spawned[id] = 1
    end
end)

RegisterServerEvent("bat:banEulen")
AddEventHandler("bat:banEulen", function()
    local src = source
    Ban(src, 'ANTI EULEN] Stop Being moron ( Event annuler )')
end)

StartHeartbeat = function(id)
    if Here[tonumber(id)] == nil or Here[tonumber(id)] == 0 then
       Ban(id, '[ANTI EULEN] Stop Being moron ( Heartbeat non stable ).')
    end
    Wait(20)

    Here[tonumber(id)] = 0
end

ServerHeartbeat = function()
    print('Serveur Heartbeat est stable')
    for f, g in ipairs(GetPlayers()) do
        if Here[tonumber(g)] == nil then
            if Spawned[tonumber(g)] == 1 then
                Ban(tonumber(g), 'Le player na pas charger.')           
            end
        end
    end
    SetTimeout(10000, ServerHeartbeat)
end

Citizen.CreateThread(function()
    Wait(10000)
    ServerHeartbeat()
end)

Ban = function(id, args) 
    DropPlayer(id, args) -- VOUS DEVEZ METTRE VOTRE SYSTEM DE BAN
end
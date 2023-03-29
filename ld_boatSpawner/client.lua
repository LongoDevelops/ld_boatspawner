Citizen.CreateThread(function()
    local boatMarker = Config.Marker
    while true do
        Citizen.Wait(2)
        DrawMarker(35, Config.Marker.x, Config.Marker.y, Config.Marker.z, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 255, false, false, 2, true, nil, nil, false)

        if Vdist(GetEntityCoords(PlayerPedId()), Config.Marker) < Config.Distance then
            DisplayText("Press ~INPUT_PICKUP~ to spawn a boat!", true)

            if IsControlJustReleased(0, 38) then
                CreateVehicle(GetHashKey("Dinghy"), Config.spawn.x, Config.spawn.y, Config.spawn.z, Config.heading, true, true)
            end
        end
    end
end)

Citizen.CreateThread(function()
    if not HasModelLoaded(GetHashKey("Dinghy")) then
        RequestModel(GetHashKey("Dinghy"))
        while not HasModelLoaded(GetHashKey("Dinghy")) do
            Citizen.Wait(10)
        end
    end
end)

-- Display Text
function DisplayText(message, beep, duration)
    AddTextEntry('LD_ALERT', message)
    BeginTextCommandDisplayHelp('LD_ALERT')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

RegisterCommand('tpmenu', function()
    TriggerServerEvent('dxn-tpmenu:requestLocations')
end, false)

RegisterNetEvent('dxn-tpmenu:receiveLocations', function(locations)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'toggleMenu',
        locations = locations
    })
end)

RegisterNUICallback('teleport', function(data, cb)
    local ped = PlayerPedId()
    
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        SetEntityCoords(vehicle, data.x, data.y, data.z)
    else
        SetEntityCoords(ped, data.x, data.y, data.z)
    end
    
    SetNuiFocus(false, false)
    lib.notify({
        title = 'Teleport Menu',
        description = 'Teleported to location',
        type = 'success',
				position = 'center-right'
    })
    
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

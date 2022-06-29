ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)
    
local VehUni = false

local Index = {
    List1 = 1,
}

local vehMenu = RageUI.CreateMenu('', 'Véhicule du Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
vehMenu.Closed = function()
    VehUni = false
end

function OpenVehMenuUni()
    if VehUni then
        VehUni = false
    else
        VehUni = true
    RageUI.Visible(vehMenu, true)
        CreateThread(function()
            while VehUni do
                Wait(1)
                RageUI.IsVisible(vehMenu, function()
                    RageUI.Button("~r~→~s~ Ranger le Véhicule", nil, {RightLabel = "→→"}, true, { 
                        onSelected = function()
                            local veh, dist = ESX.Game.GetClosestVehicle(playerCoords)
                            if dist < 4 then
                                DeleteEntity(veh)
                            end
                        end
                    })

                    RageUI.List('~r~→~s~ Sortir un Véhicule', {'~b~T20~s~', '~b~Bisson~s~', '~b~Limousine~s~'}, Index.List1, nil, {}, true, {
                        onListChange = function(i, Item)
                            Index.List1 = i;
                        end,
                        onSelected = function()
                            if Index.List1 == 1 then
                                spawnCar('t20', vector3(143.30, -1285.27, 29.33), vector3(300.00), 'Unicorn')
                            elseif Index.List1 == 2 then
                                spawnCar('bison', vector3(140.56, -1280.25, 29.33), vector3(300.00), 'Unicorn')
                            elseif Index.List1 == 3 then
                                spawnCar('stretch', vector3(143.83, -1273.34, 28.99), vector3(200.00), 'Unicorn')
                            end
                        end
                    })
                end)
            end
        end)
    end
end

function spawnCar(model, pos, hending, plate)
    local modelVeh = model
    RequestModel(modelVeh)
    while not HasModelLoaded(modelVeh) do
        Wait(10)
    end
    posSpawn = pos
    sens = hending
    local vehicle = CreateVehicle(model, posSpawn, sens, true, false)
    local  plaque = plate
    SetVehicleNumberPlateText(vehicle, plaque) 
end
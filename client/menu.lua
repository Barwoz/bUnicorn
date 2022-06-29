ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)
    
print("^0| ^1UNICORN JOB^7 | ^0CREATED BY^7 ^2BARWOZ^7 | ^3FOR B SHOP^7")
print("^0| ^1OUR SHOP^7 | ^4https://memory-s.fr/^7")

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

function RefreshPlayerDataUni()
    CreateThread(function()
        Wait(10000)
        ESX.PlayerData = ESX.GetPlayerData()
    end)
end

local labelService = ' ~b~Prendre~s~ son service'

local MenuUni = false

local uniF6 = RageUI.CreateMenu('', 'Menu Intéraction :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
local annonce = RageUI.CreateSubMenu(uniF6, '', 'Annonce Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
local farm = RageUI.CreateSubMenu(uniF6, '', 'Point de Farm Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
uniF6.Closed = function()
    MenuUni = false
end

function OpenMenuUniF6()
    if MenuUni then
        MenuUni = false
    else 
        MenuUni = true
    RageUI.Visible(uniF6, true)
        CreateThread(function()
            while MenuUni do
                Wait(1)
                RageUI.IsVisible(uniF6, function()
                    RageUI.Checkbox('~r~→~s~'..labelService, nil, OnService, {}, {
                        onChecked = function()
                            OnService = true
                            labelService = ' ~r~Terminer~s~ son service'
                        end,
                        onUnChecked = function()
                            OnService = false
                            labelService = ' ~b~Prendre~s~ son service'
                        end
                    })

                    if OnService then
                        RageUI.Button('~r~→~s~ Annonces', nil, {}, true, {}, annonce)
                        RageUI.Button('~r~→~s~ Points de Farms', nil, {}, true, {}, farm)
                        RageUI.Button('~r~→~s~ Faire une Facture', nil, {}, true, {
                            onSelected = function()
                                billingUni()
                            end
                        })
                    end
                end)

                RageUI.IsVisible(annonce, function()
                    RageUI.Button('~r~→~s~ Anonce ~g~Ouverture~s~', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('Barwoz:annonceUni', 'Le ~p~Unicorn~s~ est désormais ~g~OUVERT~s~ !')
                        end
                    })
                    RageUI.Button('~r~→~s~ Anonce ~r~Fermeture~s~', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('Barwoz:annonceUni', 'Le ~p~Unicorn~s~ est désormais ~r~FERMER~s~ !')
                        end
                    })
                    RageUI.Button('~r~→~s~ Anonce ~o~Personalisé~s~', nil, {}, true, {
                        onSelected = function()
                            local txtperso = KeyboardInput('Ecrire un Message si-dessou :', '', 99)
                            TriggerServerEvent('Barwoz:annonceUni', txtperso)
                        end
                    })
                end)

                RageUI.IsVisible(farm, function()
                
                    RageUI.Button('~r~→~s~ Point de Récolte', nil, {}, true, {
                        onSelected = function()
                            SetNewWaypoint(137.90, -3110.81, 5.89)
                        end
                    })

                    RageUI.Button('~r~→~s~ Point de Traitement', nil, {}, true, {
                        onSelected = function()
                            SetNewWaypoint(-51.05, 1901.11, 195.36)
                        end
                    })

                    RageUI.Button('~r~→~s~ Point de Vente', nil, {}, true, {
                        onSelected = function()
                            SetNewWaypoint(-708.36, -904.75, 19.21)
                        end
                    })

                    RageUI.Button('~r~→~s~ Points des Courses', nil, {}, true, {
                        onSelected = function()
                            SetNewWaypoint(1085.19, -2289.46, 30.22)
                        end
                    })
                end)
            end
        end)
    end
end

Keys.Register(Config.Control, Config.Control, 'Ouvrir Menu F6 Unicorn', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unicorn' then
        if MenuUni == false then
            OpenMenuUniF6()
        end
    end
end)

CreateThread(function()
    for _, info in pairs(Config.blipsUnicorn) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

CreateThread(function()
    Wait(10)
    while true do 
        local interval = 250
        local coord = GetEntityCoords(PlayerPedId())
        RefreshPlayerDataUni()
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unicorn' then
            for k, v in pairs(Config.MarkerUni) do
                    local dist = GetDistanceBetweenCoords(coord, v.position, true)
                    if dist < 5 then 
                        interval = 1
                        if v.marker then 
                            DrawMarker(22, v.position.x, v.position.y, v.position.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.4, 0.4, 0.4, v.color.r, v.color.g, v.color.b, v.color.a, 55555, false, true, 2, false, false, false, false)
                        end
                        if dist < 1.5 then 
                            Visual.Subtitle(v.help)
                            if IsControlJustPressed(1,51) then 
                                RefreshPlayerDataUni()
                                v.interact()
                            end 
                        end 
                    end 
                end
            end
        Wait(interval)
    end 
end)
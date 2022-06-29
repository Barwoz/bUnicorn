ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)
    
local cloakUni = false

local cloak = RageUI.CreateMenu('', 'Vestiaire Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
cloak.Closed = function()
    cloakUni = false
end

function OpenCloakMenuUni()
    if cloakUni then
        cloakUni = false
    else
        cloakUni = true
    RageUI.Visible(cloak, true)
        CreateThread(function()
            while cloakUni do
                Wait(1)
                RageUI.IsVisible(cloak, function()

                    RageUI.Button('~r~→~s~ Reprendre sa ~p~Tenue~s~', nil, {}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end
                    })
                    RageUI.Separator('_________________')
                    RageUI.Button('~r~→~s~ Prendre tenue ~p~Barman~s~', nil, {}, true, {
                        onSelected = function()
                            SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0) -- (T-shirt)
                            SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0) -- (Torse)
                            SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0) -- (Badge)
                            SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0) -- (Bras)
                            SetPedComponentVariation(GetPlayerPed(-1), 4, 59, 9) -- (Pantalon)
                            SetPedComponentVariation(GetPlayerPed(-1), 6, 60, 0) -- (Chaussure)
                            SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0) -- (Chaine)
                            SetPedPropIndex(GetPlayerPed(-1), 0, -1, 0) -- (Chapeau)
                            SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0) -- (Lunette)
                            SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0) -- (Yeux)
                            SetPedPropIndex(GetPlayerPed(-1), 6, 2, 0) -- (Montre)
                        end
                    })
                    RageUI.Button('~r~→~s~ Prendre tenue ~p~Danseur~s~', nil, {}, true, {
                        onSelected = function()
                            SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0) -- (T-shirt)
                            SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0) -- (Torse)
                            SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0) -- (Badge)
                            SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0) -- (Bras)
                            SetPedComponentVariation(GetPlayerPed(-1), 4, 59, 9) -- (Pantalon)
                            SetPedComponentVariation(GetPlayerPed(-1), 6, 60, 0) -- (Chaussure)
                            SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0) -- (Chaine)
                            SetPedPropIndex(GetPlayerPed(-1), 0, -1, 0) -- (Chapeau)
                            SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0) -- (Lunette)
                            SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0) -- (Yeux)
                            SetPedPropIndex(GetPlayerPed(-1), 6, 2, 0) -- (Montre)
                        end
                    })
                end)
            end
        end)
    end
end

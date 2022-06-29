ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

-----Récoltes

local RecolteUni = false

local unireco = RageUI.CreateMenu('', 'Récolter du Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
unireco.Closed = function() 
    RecolteUni = false
end

function OpenMenuRecolteUni()
    if RecolteUni then
        RecolteUni = false
    else
        RecolteUni = true
    RageUI.Visible(unireco, true)
        CreateThread(function()
            while RecolteUni do
                Wait(1)
                RageUI.IsVisible(unireco, function()
                    RageUI.Button('~r~→~s~ Commencer la Récolte', nil, {}, not cooldawn, {
                        onSelected = function()
                            cooldawn = true
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            startrecolte()
                            SetTimeout(1000, function()
                                cooldawn = false
                            end)
                        end
                    })
                    RageUI.Button('~r~→~s~ Arrêter la Récolte', nil, {}, true, {
                        onSelected = function()
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            stoprecolte()
                        end
                    })
                end)
            end
        end)
    end
end

-----Traitements

local TraiteUni = false

local unitrai = RageUI.CreateMenu('', 'Traitement du Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
unitrai.Closed = function() 
    TraiteUni = false
end

function OpenMenuTraitementUni()
    if TraiteUni then
        TraiteUni = false
    else
        TraiteUni = true
    RageUI.Visible(unitrai, true)
        CreateThread(function()
            while TraiteUni do
                Wait(1)
                RageUI.IsVisible(unitrai, function()
                    RageUI.Button('~r~→~s~ Commencer le Traitement', nil, {}, not cooldawn, {
                        onSelected = function()
                            cooldawn = true
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            starttraitement()
                            SetTimeout(1000, function()
                                cooldawn = false
                            end)
                        end
                    })
                    RageUI.Button('~r~→~s~ Arrêter le Traitement', nil, {}, true, {
                        onSelected = function()
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            stoptraitement()
                        end
                    })
                end)
            end
        end)
    end
end

-----Ventes

local VenteUni = false

local univente = RageUI.CreateMenu('', 'Vente du Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
univente.Closed = function() 
    VenteUni = false
end

function OpenMenuVenteUni()
    if VenteUni then
        VenteUni = false
    else
        VenteUni = true
    RageUI.Visible(univente, true)
        CreateThread(function()
            while VenteUni do
                Wait(1)
                RageUI.IsVisible(univente, function()
                    RageUI.Button('~r~→~s~ Commencer la Vente', nil, {}, not cooldawn, {
                        onSelected = function()
                            cooldawn = true
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            startvente()
                            SetTimeout(1000, function()
                                cooldawn = false
                            end)
                        end
                    })
                    RageUI.Button('~r~→~s~ Arrêter la Vente', nil, {}, true, {
                        onSelected = function()
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            stopvente()
                        end
                    })
                end)
            end
        end)
    end
end

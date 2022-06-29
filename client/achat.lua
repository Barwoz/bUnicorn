ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

local AchatUni = false

local UniBuy = RageUI.CreateMenu('', 'Faire les Courses pour le Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
UniBuy.Closed = function()
    AchatUni = false
end

function OpenMenuAchatUni()
    if AchatUni then
        AchatUni = false
    else
        AchatUni = true
    RageUI.Visible(UniBuy, true)
        CreateThread(function()
            while AchatUni do
                Wait(1)
                RageUI.IsVisible(UniBuy, function()
                    for k,v in pairs(Config.Courses) do
                        RageUI.Button('~r~→~s~ '..v.label, nil, {RightLabel = '~g~'..v.price..'~s~ $'}, true, {
                            onSelected = function()
                                local nbitem = KeyboardInput('Combien veux tu en acheter ?', '', 2)
                                TriggerServerEvent('barwoz:buyUni', v.name, v.price, nbitem)
                            end
                        })
                    end
                end)
            end
        end)
    end
end
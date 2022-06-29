ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

local melangeUni = false

local UniCokt = RageUI.CreateMenu('', 'Faire un coktail Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
UniCokt.Closed = function()
    melangeUni = false
end

function OpenMenuCocktailUni()
    if melangeUni then
        melangeUni = false
    else
        melangeUni = true
    RageUI.Visible(UniCokt, true)
        CreateThread(function()
            while melangeUni do
                Wait(1)
                RageUI.IsVisible(UniCokt, function()
                    for k,v in pairs(Config.Cocktail) do
                        RageUI.Button('~r~→~s~ '..v.label, ''..v.desc, {RightLabel = '~g~'..v.price..'~s~ $'}, true, {
                            onSelected = function()
                                TriggerServerEvent('barwoz:MakedUni', v.name, v.i1, v.i2, v.i3, v.i4, v.i5)
                            end
                        })
                    end
                end)
            end
        end)
    end
end
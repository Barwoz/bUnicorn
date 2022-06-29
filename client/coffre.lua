ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

local CoffreUni = false

all_items = {}

local trunk = RageUI.CreateMenu('', 'Coffre du Unicorn', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
local stockplayer = RageUI.CreateSubMenu(trunk, "", "Voici votre ~y~inventaire", 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
local stockunicorn = RageUI.CreateSubMenu(trunk, "", "Voici ~y~l'inventaire~s~ du Unicorn", 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
trunk.Closed = function() 
    CoffreUni = false 
end

function OpenMenuTrunkUnicorn()
    if CoffreUni then
        CoffreUni = false
    else
        CoffreUni = true

        RageUI.Visible(trunk, true)
            CreateThread(function()
                while CoffreUni do 
                    Wait(1)
                    RageUI.IsVisible(trunk, function()

                        RageUI.Separator('↓ ~p~Déposer~s~ ↓')
                        RageUI.Button("~r~→~s~ Déposer Objets !", nil, {RightLabel = ""}, true, {}, stockplayer)
                        RageUI.Separator('↓ ~p~Prendre~s~ ↓')
                        RageUI.Button("~r~→~s~ Prendre Objets !", nil, {RightLabel = ""}, true, {
                            onSelected = function()
                                getStockUni()
                            end
                        }, stockunicorn)

                end)

                RageUI.IsVisible(stockplayer, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    for k, v in pairs(ESX.PlayerData.inventory) do
                        if v.count >= 1 then
                                    RageUI.Button("~o~→~s~ "..v.label, nil, {RightLabel = v.count}, true, {
                                        onSelected = function()
                                                local cbDeposer = KeyboardInput("Combien ?", '' , 15)
                                                TriggerServerEvent('barwoz:putStockItems', v.name, tonumber(cbDeposer), societe)
                                        end
                                    })
                        end
                    end
                end)

                RageUI.IsVisible(stockunicorn, function()
                    for k,v in pairs(all_items) do

                        RageUI.Button(v.label, nil, {RightLabel = "~g~x"..v.nb}, true, {
                            onSelected = function()
                                local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                                count = tonumber(count)
                                if count <= v.nb then
                                    TriggerServerEvent("barwoz:takeStockItems",v.item, count)
                                else
                                    ESX.ShowNotification("~r~Vous n'en avez pas assez sur vous")
                                end
                                getStockUni()
                            end
                        })
                    end
                end)
            end
        end)
    end
end

function getStockUni()
    ESX.TriggerServerCallback('barwoz:getStockItems', function(inventory)               
        all_items = inventory        
    end)
end
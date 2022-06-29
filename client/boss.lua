ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)
    
local bossUni = false

local boss = RageUI.CreateMenu('', 'Vestiaire Unicorn :', 10, 10, 'bUnicorn_Banniere', 'bUnicorn')
boss.Closed = function()
    bossUni = false
end

local societymoney = {}

function RefreshSocietyMoney()
	if ESX.PlayerData.job.name == 'unicorn' then
		ESX.TriggerServerCallback("barwoz:argentUni", function(money)
			societymoney = money
		end, "society_unicorn")
	end
end

function OpenBossMenuUni()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unicorn' and ESX.PlayerData.job.grade_name == 'boss' then 
        if bossUni then
            bossUni = false
        else
            bossUni = true
        RageUI.Visible(boss, true)
            CreateThread(function()
                while bossUni do
                    Wait(1)
                    RageUI.IsVisible(boss, function()

                        RefreshSocietyMoney()

                        RageUI.Separator('Argent du ~p~Unicorn~s~ : '..tostring(societymoney)..' $')
                        RageUI.Separator('_________________')
                        RageUI.Button('~r~→~s~ Déposer de l\'Argent', nil, {}, true, {
                            onSelected = function()
                                local amount = KeyboardInput('Quelle somme souhaitez vous déposer ?', '', 6)
                                    TriggerServerEvent('barwoz:DéposerMoneyUni', amount)
                                    RefreshSocietyMoney()
                            end
                        })
                        RageUI.Button('~r~→~s~ Retirer de l\'Argent', nil, {}, true, {
                            onSelected = function()
                                local amount = KeyboardInput('Quelle sommes souhaitez vous retirer ?', '', 6)
                                    TriggerServerEvent('barwoz:RetirerMoneyUni', amount)
                                    RefreshSocietyMoney()
                            end
                        })
                        RageUI.Separator('_________________')
                        RageUI.Button('~r~→~s~ Recruter un Employé', nil, {}, true, {
                            onSelected = function()
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('~r~Aucun joueur proche')
                                else
                                    TriggerServerEvent('barwoz:recruterUni', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0)
                                end
                            end
                        })
                        RageUI.Button('~r~→~s~ Virer un Employé', nil, {}, true, {
                            onSelected = function()
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('~r~Aucun joueur proche')
                                else
                                    TriggerServerEvent('barwoz:virerUni', GetPlayerServerId(closestPlayer))
                                end
                            end
                        })
                        RageUI.Button('~r~→~s~ Promouvoir un Employé', nil, {}, true, {
                            onSelected = function()
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('~r~Aucun joueur proche')
                                else
                                    TriggerServerEvent('barwoz:promouvoirUni', GetPlayerServerId(closestPlayer))
                                end
                            end
                        })
                    end)
                end
            end)
        end
    else
        ESX.ShowNotification('~r~Vous ne pouvez pas accèder à cette espace !')
    end
end
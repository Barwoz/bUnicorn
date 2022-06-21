ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

print("^0| ^1UNICORN JOB^7 | ^0CREATED BY^7 ^2BARWOZ^7 | ^3FOR B SHOP^7")
print("^0| ^1OUR SHOP^7 | ^4https://memorys-fivem.tebex.io/^7")

----------------------MenuF6
-----Annonce

RegisterServerEvent('Barwoz:annonceUni')
AddEventHandler('Barwoz:annonceUni', function(announce)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
        local xPlayers = ESX.GetPlayers()
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent("esx:showAdvancedNotification", xPlayers[i], 'UNICORN', '~p~Annonce :', announce, 'CHAR_STRIPPER_CHEETAH', 8)
        end
end)

----------------------MenuBoss
-----Argent

ESX.RegisterServerCallback("barwoz:argentUni", function(source, cb, Society)
	local info = MySQL.Sync.fetchAll('SELECT * FROM addon_account_data WHERE account_name = @account_name', {
        ['@account_name'] = Society
    })
    cb(info[1].money)
end)

-----Déposer Argent

RegisterNetEvent("barwoz:DéposerMoneyUni")
AddEventHandler("barwoz:DéposerMoneyUni", function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = ESX.Math.Round(tonumber(amount))
  
	if amount > 0 and xPlayer.getMoney() >= amount then
  
	  TriggerEvent('esx_addonaccount:getSharedAccount', "society_unicorn", function(account)
		xPlayer.removeMoney(amount)
		account.addMoney(amount)
	  end)
	  TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez déposé ~p~'..amount..' ~s~$ dans vôtre société')
  
	else
	  TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~Vous ne pouvez pas déposer cette somme !')
	end
end)

-----Retirer Argent

RegisterNetEvent("barwoz:RetirerMoneyUni")
AddEventHandler("barwoz:RetirerMoneyUni", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
  	amount = ESX.Math.Round(tonumber(amount))

  	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)

    	if amount > 0 and account.money >= amount then

			account.removeMoney(amount)
			xPlayer.addMoney(amount)
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retirer ~p~'..amount..' ~s~$ de vôtre société')

		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~Vous ne pouvez pas retirer cette somme !')
		end
	end)
end)

-----Recruter

RegisterServerEvent('barwoz:recruterUni')
AddEventHandler('barwoz:recruterUni', function(target, grade2)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)

		targetXPlayer.setJob(sourceJob.name, 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~g~recruté %s~w~.'):format(targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~g~embauché par %s~w~.'):format(sourceXPlayer.name))
	end
end)

-----Virer

RegisterServerEvent('barwoz:virerUni')
AddEventHandler('barwoz:virerUni', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
		targetXPlayer.setJob('unemployed', 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end)

-----Promouvoir

RegisterServerEvent('barwoz:promouvoirUni')
AddEventHandler('barwoz:promouvoirUni', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	if (targetXPlayer.job.grade == tonumber(getMaximumGrade(sourceXPlayer.job.name)) - 1) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~r~Gouvernement~w~.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) + 1)
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

----------------------Farms
-----Récoltes

RegisterServerEvent('barwoz:recolteUnicorn')
AddEventHandler('barwoz:recolteUnicorn', function()
	local item = 'bottle'
	local limititem = 30
	local xPlayer = ESX.GetPlayerFromId(source)
	local nbiteminventory = xPlayer.getInventoryItem(item).count

	if nbiteminventory >= limititem then
		TriggerClientEvent('esx:showNotification', source, "~r~Tu n'as plus de place dans ton inventaire !")
	else
		xPlayer.addInventoryItem(item, 1)
		TriggerClientEvent('esx:showNotification', source, "Récolte de ~p~Bouteilles Vides~s~ en cours...")
	end
end)

-----Traitement

RegisterServerEvent('barwoz:traitementUnicorn')
AddEventHandler('barwoz:traitementUnicorn', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local bouteil = xPlayer.getInventoryItem('bottle').count
    local bouteil_pleine = xPlayer.getInventoryItem('ginmonkey').count

	if bouteil_pleine >= 30 then
		TriggerClientEvent('esx:showNotification', source, "~r~Tu n'as plus de place dans ton inventaire !")
	elseif bouteil < 2 then
		TriggerClientEvent('esx:showNotification', source, "~r~Tu n'as plus assez de bouteilles pour les remplir d'Alcool!")
	else
		xPlayer.removeInventoryItem('bottle', 2)
		xPlayer.addInventoryItem('ginmonkey', 1)
		TriggerClientEvent('esx:showNotification', source, "Remplissage des ~p~Bouteilles~s~ en cours...")
	end
end)

-----Vente

RegisterServerEvent('barwoz:venteUnicorn')
AddEventHandler('barwoz:venteUnicorn', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local bouteil_pleine = xPlayer.getInventoryItem('ginmonkey').count

	if bouteil_pleine < 0 then
		TriggerClientEvent('esx:showNotification', source, "~r~Tu n'as plus assez de bouteilles à Vendre !")
	else
		xPlayer.removeInventoryItem('ginmonkey', 1)
		TriggerEvent('esx_addonaccount:getSharedAccount', "society_unicorn", function(account)
			account.addMoney("200")
		  end)
		xPlayer.addMoney('50')
		TriggerClientEvent('esx:showNotification', source, "Vente d'~p~Eau~s~ en cours...")
	end
end)

----------------------Bar
-----Buy

RegisterServerEvent('barwoz:buyUni')
AddEventHandler('barwoz:buyUni', function(object, money, nbitem)
	local item = object
	local price = money
	local count = nbitem

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)
		account_unicorn = account
	end)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		inventory_unicorn = inventory
	end)
		if account_unicorn.money >= price then
			inventory_unicorn.addItem(item, count)
			account_unicorn.removeMoney(price*count)
			TriggerClientEvent('esx:showNotification', source, '~b~Achat en Cours ...')
		else
			TriggerClientEvent('esx:shownotification', source, '~r~L\'entreprise n\'a pas assez d\'argent pour acheter ce-ci !')
		end
end)

-----Maked

RegisterServerEvent('barwoz:MakedUni')
AddEventHandler('barwoz:MakedUni', function(object, object1, object2, object3, object4, object5)
	local item_donnate = object
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		inventory_unicorn = inventory
	end)

	local item1 = inventory_unicorn.getItem(object1)
	local item2 = inventory_unicorn.getItem(object2)
	local item3 = inventory_unicorn.getItem(object3)
	local item4 = inventory_unicorn.getItem(object4)
	local item5 = inventory_unicorn.getItem(object5)

		if item1.count >= 1 then 
			if item2.count >= 1 then 
				if item3.count >= 1 then 
					if item4.count >= 1 then 
						if item5.count >= 1 then 
							xPlayer.addInventoryItem(item_donnate, 1)
							inventory_unicorn.removeItem(object1, 1)
							inventory_unicorn.removeItem(object2, 1)
							inventory_unicorn.removeItem(object3, 1)
							inventory_unicorn.removeItem(object4, 1)
							inventory_unicorn.removeItem(object5, 1)
							TriggerClientEvent('esx:showNotification', source, '~b~Préparation en Cours ...')
						else
							TriggerClientEvent('esx:showNotification', source, '~r~L\'entreprise n\'a plus assez de ~b~'..object5..'~s~ !')
						end
					else
						TriggerClientEvent('esx:showNotification', source, '~r~L\'entreprise n\'a plus assez de ~b~'..object4..'~s~ !')
					end
				else
					TriggerClientEvent('esx:showNotification', source, '~r~L\'entreprise n\'a plus assez de ~b~'..object3..'~s~ !')
				end
			else
				TriggerClientEvent('esx:showNotification', source, '~r~L\'entreprise n\'a plus assez de ~b~'..object2..'~s~ !')
			end
		else
			TriggerClientEvent('esx:showNotification', source, '~r~L\'entreprise n\'a plus assez de ~b~'..object1..'~s~ !')
		end
end)

----------------------Coffre
-----Get Unicorn

ESX.RegisterServerCallback('barwoz:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label, item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

-----Prendre

RegisterServerEvent('barwoz:takeStockItems')
AddEventHandler('barwoz:takeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
	end)
end)

-----Déposer

RegisterNetEvent('barwoz:putStockItems')
AddEventHandler('barwoz:putStockItems', function(itemName, count, society)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showAdvancedNotification', _src, 'Coffre', '~o~Informations~s~', 'Vous avez déposé ~g~'..inventoryItem.label.." x"..count, 'CHAR_MP_FM_CONTACT', 8)
		else
			TriggerClientEvent('esx:showAdvancedNotification', _src, 'Coffre', '~o~Informations~s~', "Quantité ~r~invalide", 'CHAR_MP_FM_CONTACT', 9)
		end
	end)
end)
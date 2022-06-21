------------------------FUNCTIONS------------------------

-----KeyboardInput

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(500) 
		return result
	else
		Wait(500) 
		return nil 
	end
end

-----Billing

function billingUni()
	local amount = KeyboardInput("Montant de la Facture", "", 5)
	local player, distance = ESX.Game.GetClosestPlayer()

	if player ~= -1 and distance <= 3.0 then
		if amount == nil then
			ESX.ShowNotification("~r~Problèmes~s~: Montant invalide")
		else
			TriggerServerEvent('esx_billing:sendBill1', GetPlayerServerId(player), 'society_unicorn', ('unicorn'), amount)
			Wait(100)
			ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
		end
	else
		ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
	end
end

-----StartRécolteUni

function startrecolte()
	if not recoltuni then
        recoltuni = true
    while recoltuni do
		Wait(6000)
		TriggerServerEvent('barwoz:recolteUnicorn')
	end
    else
        recoltuni = false
    end
end

-----StopRécolteUni

function stoprecolte()
    if recoltuni then
    	recoltuni = false
    end
end

-----StartTraitementUni

function starttraitement()
	if not traituni then
        traituni = true
    while traituni do
		Wait(6000)
		TriggerServerEvent('barwoz:traitementUnicorn')
	end
    else
        traituni = false
    end
end

-----StopVenteUni

function stoptraitement()
    if venteuni then
    	venteuni = false
    end
end

-----StartVenteUni

function startvente()
	if not venteuni then
        venteuni = true
    while venteuni do
		Wait(6000)
		TriggerServerEvent('barwoz:venteUnicorn')
	end
    else
        venteuni = false
    end
end

-----StopTraitementUni

function stopvente()
    if venteuni then
    	venteuni = false
    end
end

-----PlayAnim

function PlayAnim(ped, animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(0) end
    TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, duration, 1, 1, false, false, false)
    RemoveAnimDict(animDict)
end

-----Peds

if Config.EnabledPeds == true then
	for k,v in pairs(Config.Peds) do
		CreateThread(function()
			local hash = GetHashKey(v.ped)
			while not HasModelLoaded(hash) do
			RequestModel(hash)
			Wait(40)
			end
			local coords = v.pos
			local ped = CreatePed(4, hash, coords, false, false)
			local heading = 165.0
			PlayAnim(ped, v.d1, v.d2, 99999999999999999999)
			SetEntityInvincible(ped, true)
			SetEntityHeading(ped, heading)
			SetEntityAsMissionEntity(ped, true, true)
			SetPedHearingRange(ped, 0.0)
			SetPedSeeingRange(ped, 0.0)
			SetPedAlertness(ped, 0.0)
			SetPedFleeAttributes(ped, 0, 0)
			SetBlockingOfNonTemporaryEvents(ped, true)
			SetPedCombatAttributes(ped, 46, true)
			SetPedFleeAttributes(ped, 0, 0)
		end)
	end
end
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end
	if not quiet then
		ESX.ShowNotification('Tu a était soigner')
	end
end)

RegisterNetEvent('esx_ambulancejob:useItem')
AddEventHandler('esx_ambulancejob:useItem', function(itemName)
	if itemName == 'doliprane' then
		local playerPed = PlayerPedId()
		ExecuteCommand('e drink')
			TriggerEvent('esx_ambulancejob:heal', 'small', true)
			ESX.ShowNotification('Tu va un peut mieux')
			ESX.ShowNotification(_U('used_doliprane'))
		end
	end)

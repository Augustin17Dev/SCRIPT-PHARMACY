TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local playersHealing, deadPlayers = {}, {}

--pharmacie achat

RegisterNetEvent('pharmacieachat:doliprane')
AddEventHandler('pharmacieachat:doliprane', function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local itemplayeritem = xPlayer.getInventoryItem('doliprane').count
    local _price = 50
    local limititem = 2
    local playermoney = xPlayer.getMoney()

    if tonumber(playermoney) >= tonumber(_price) then
        if tonumber(itemplayeritem) >= tonumber(limititem) then
            TriggerClientEvent('esx:showNotification', _src, "~r~Vous n'avez plus de place dans votre inventaire")
        else 
            xPlayer.removeMoney(_price)
            xPlayer.addInventoryItem('doliprane', 1)
        end
    else 
        TriggerClientEvent('esx:showNotification', _src, "~r~Vous n'avez pas assez d'argent")
    end 
end)

print('Créate bye Augustin#4159 17-DEV https://discord.gg/AxxC7xT3eG')


ESX.RegisterUsableItem('doliprane', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('doliprane', 1)
		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'doliprane')
		Citizen.Wait(7000)
		playersHealing[source] = nil
	end
end)
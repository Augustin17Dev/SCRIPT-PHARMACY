print('Créate bye Augustin#4159 17-DEV https://discord.gg/AxxC7xT3eG')

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

local open = false 
local pharmacie = RageUI.CreateMenu("~g~Pharmacie", "")
pharmacie.Display.Header = true 
pharmacie.Closed = function()
	open = false
end

function OpenMenuPharmacie()
     if open then 
         open = false
         RageUI.Visible(pharmacie, false)
         return
     else
         open = true 
         RageUI.Visible(pharmacie, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(pharmacie,function() 

                RageUI.Separator("↓ ~g~Pharmacie ↓")

				RageUI.Button("Doliprane", nil, {RightLabel = "~g~50$"}, true , {
					onSelected = function()
						TriggerServerEvent('pharmacieachat:doliprane')
					end
				})                      
            end)
            Wait(0)
           end
        end)
     end
  end

  --Ped
Citizen.CreateThread(function()
    local hash = GetHashKey("cs_tom")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_tom", 318.2, -1078.34, 28.48, 353.3, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    end)

    --Blip
    local blips = {
        {title="Pharmacy", colour=2, id=51, x = 318.2, y = -1078.34, z = 28.48}
       }
     Citizen.CreateThread(function()
         for _, info in pairs(blips) do
           info.blip = AddBlipForCoord(info.x, info.y, info.z)
           SetBlipSprite(info.blip, info.id)
           SetBlipDisplay(info.blip, 4)
           SetBlipScale(info.blip, 0.6)
           SetBlipColour(info.blip, info.colour)
           SetBlipAsShortRange(info.blip, true)
           BeginTextCommandSetBlipName("STRING")
           AddTextComponentString(info.title)
           EndTextCommandSetBlipName(info.blip)
         end
     end)

local position = {
	{x = 318.24, y = -1077.06, z = 29.48}  
}
Citizen.CreateThread(function()
    while true do
      local wait = 750
        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
            if dist <= 6.0 then
            wait = 0
            DrawMarker(22, 318.24, -1077.06, 29.48, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 222, 224, 70, 255, false, false, p19, false)  
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyez sur [~g~E] pour accéder a la pharmacie", 1) 
                if IsControlJustPressed(1,51) then
                    OpenMenuPharmacie()
            end
        end
    end
end
    Citizen.Wait(wait)
    end
end)
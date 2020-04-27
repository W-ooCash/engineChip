ESX = nil
local ped = PlayerPedId()
local checkFalse = false

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

local IsVehicleSpeededUP = false	

RegisterNetEvent('chipWooCash:setactive')
AddEventHandler('chipWooCash:setactive', function()
		local vehPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()))
		if IsVehicleSpeededUP == false then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), false),  12.0)
			SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(PlayerPedId(), false), 12.0)
			ESX.ShowNotification('Chip zalozony!!!')
			checkPlate = vehPlate			
			IsVehicleSpeededUP = true
		elseif IsVehicleSpeededUP == true and vehPlate == checkPlate then
			SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), false), 1.0)
			SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(PlayerPedId(), false), 1.0)
			ESX.ShowNotification('Sciagnieto chip!!!')
			IsVehicleSpeededUP = false
		else
			ESX.ShowNotification('Nie wyciagnales chipa z poprzedniego samochodu!')
			return
		end
end)

RegisterNetEvent('chipWooCash:isInVehicleCheck')
AddEventHandler('chipWooCash:isInVehicleCheck', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TriggerEvent('chipWooCash:setactive', source)
	else
		ESX.ShowNotification('Musisz byc w pojezdzie, zeby zalozyc chip!')
	end
return
end)

ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterUsableItem('enginechip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('chipWooCash:isInVehicleCheck', source)
end)



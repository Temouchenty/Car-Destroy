QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local xPlayer = QBCore.Functions.GetPlayer(source)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000)
        Citizen.Wait((1000 * 60) * 60)
    end
end)


RegisterServerEvent('scrapyard:server:ScrapVehicle')
AddEventHandler('scrapyard:server:ScrapVehicle', function(listKey)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
	for i = 1, math.random(Config.ItemsAmountMin, Config.ItemsAmountMax), 1 do
		local item = Config.Items[math.random(1, #Config.Items)]
		Player.Functions.AddItem(item, math.random(Config.RandomAmountMin, Config.RandomAmountMax))
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
		Citizen.Wait(500)
	end
	local Luck = math.random(1, 8)
	local Odd = math.random(1, 8)
	if Luck == Odd then
		local random = math.random(10, 20)
		Player.Functions.AddItem("rubber", random)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rubber"], 'add')
	end
end)
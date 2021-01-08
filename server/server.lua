--discord : https://discord.gg/MYb6TcHmq9
--Sotek#1234
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{gbnfujqig}:::azerty')
AddEventHandler('::{gbnfujqig}:::azerty', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeMoney(100)
end)

RegisterServerEvent('::{gbnfujqig}:::nhFFbe')
AddEventHandler('::{gbnfujqig}:::nhFFbe', function(skin)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_datastore:getDataStore', 'user_helmet', xPlayer.identifier, function(store)
        store.set('hasHelmet', true)
        store.set('skin', {
            helmet_1 = skin.helmet_1,
            helmet_2 = skin.helmet_2
        })
    end)
end)

RegisterServerEvent('::{gbnfujqig}:::gnqrgnre')
AddEventHandler('::{gbnfujqig}:::gnqrgnre', function(skin)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_datastore:getDataStore', 'user_glasses', xPlayer.identifier, function(store)
        store.set('hasGlasses', true)
        store.set('skin', {
            glasses_1 = skin.glasses_1,
            glasses_2 = skin.glasses_2
        })
    end)
end)

RegisterServerEvent('::{gbnfujqig}:::bgunirez')
AddEventHandler('::{gbnfujqig}:::bgunirez', function(skin)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_datastore:getDataStore', 'user_ears', xPlayer.identifier, function(store)
        store.set('hasEars', true)
        store.set('skin', {
            ears_1 = skin.ears_1,
            ears_2 = skin.ears_2
        })
    end)
end)

RegisterServerEvent('::{gbnfujqig}:::bngjir')
AddEventHandler('::{gbnfujqig}:::bngjir', function(skin)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_datastore:getDataStore', 'user_mask', xPlayer.identifier, function(store)
        store.set('hasMask', true)
        store.set('skin', {
            mask_1 = skin.mask_1,
            mask_2 = skin.mask_2
        })
    end)
end)

RegisterServerEvent('::{gbnfujqig}::: gnjfipgred')
AddEventHandler('::{gbnfujqig}::: gnjfipgred', function(label, skin)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)

		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end


        table.insert(dressing, { label = label, skin = skin })

		store.set('dressing', dressing)

	end)

end)


ESX.RegisterServerCallback('::{gbnfujqig}::: Sotektropchaud', function(source, cb)

    local xPlayer  = ESX.GetPlayerFromId(source)
  
    TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
  
      local count    = store.count('dressing')
      local labels   = {}
  
      for i=1, count, 1 do
        local entry = store.get('dressing', i)
        table.insert(labels, entry.label)
      end
  
      cb(labels)
  
    end)
  
end)
  
ESX.RegisterServerCallback('::{gbnfujqig}:::eztripleez', function(source, cb, num)

    local xPlayer  = ESX.GetPlayerFromId(source)
  
    TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
      local outfit = store.get('dressing', num)
      cb(outfit.skin)
    end)
  
end)
RegisterServerEvent('::{gbnfujqig}:::mmmcharal')
AddEventHandler('::{gbnfujqig}:::mmmcharal', function(label)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)

		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		label = label
		
		table.remove(dressing, label)

		store.set('dressing', dressing)

	end)

end)

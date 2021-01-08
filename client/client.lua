--discord : https://discord.gg/MYb6TcHmq9
--Sotek#1234

ESX = nil
local HasLoadCloth			  = false
local antispam = true
Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(5000)
    end
end)
function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
  
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
      Citizen.Wait(0)
    end
  
    if UpdateOnscreenKeyboard() ~= 2 then
      local result = GetOnscreenKeyboardResult()
      Citizen.Wait(500)
      return result
    else
      Citizen.Wait(500)
      return nil
    end
end
function SavePlayerSkin()
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
        TriggerServerEvent('::{gbnfujqig}:::nhFFbe', skin)
        TriggerServerEvent('::{gbnfujqig}:::gnqrgnre', skin)
        TriggerServerEvent('::{gbnfujqig}:::bgunirez', skin)
        TriggerServerEvent('::{gbnfujqig}:::bngjir', skin)
    end)
end

local catvet = {
    'Hauts',
    'T-shirts',
    'Bas',
    'Bras',
    'Chaussures',    
}

local access = {
    'Chapeaux',
    'Lunettes',
    "Oreillettes",
    "Chaînes", 
    'Montres',
    "Bracelets",
    "Sacs"

}


clothshopv2 = {
	Base = { Header = {"shopui_title_lowendfashion2", "shopui_title_lowendfashion2"}, Color = {color_black}, Title = "issou" },
	Data = { currentMenu = "Magasin de vetement", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)


        if btn == "Vêtements" then 
            clothshopv2.Menu["Vêtements"].b = {}
            for k,v in pairs(catvet) do
                table.insert(clothshopv2.Menu["Vêtements"].b, {name = v, ask = ">", askX = true})
            end
            OpenMenu('Vêtements')
        end
        if btn == "T-shirts" then 
            clothshopv2.Menu["T-shirts"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.tshirt_1, 1 do
                    table.insert(clothshopv2.Menu["T-shirts"].b, { name = "T-shirt - " .. i , slidemax = 15, iterator = i })
                end
            end)
            OpenMenu("T-shirts")
        end
        if btn == "Hauts" then
            clothshopv2.Menu["Hauts"].b = {}
 
            TriggerEvent('skinchanger:getData', function(components,maxVals)
                for i=0, maxVals.torso_1, 1 do
                    table.insert(clothshopv2.Menu["Hauts"].b, {name = "Haut - ".. i ,price = 15 , slidemax = 15, iterator = i})
                end
            end)
            OpenMenu('Hauts')
        end
        if btn == "Bas" then 
            clothshopv2.Menu["Bas"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.pants_1, 1 do
                    table.insert(clothshopv2.Menu["Bas"].b, {name = "Bas - ".. i ,  price = 15,  slidemax = 15, iterator = i})
                end
            end)
         OpenMenu("Bas")
        end
        if btn == "Bras" then 
            clothshopv2.Menu["Bras"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.arms, 1 do
                    table.insert(clothshopv2.Menu["Bras"].b, {name = "Bras - ".. i ,  price = 15,  slidemax = 5, iterator = i})
                end
            end)
            OpenMenu('Bras')
        end
        if btn == "Chaussures" then 
            clothshopv2.Menu["Chaussures"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.shoes_1, 1 do
                    table.insert(clothshopv2.Menu["Chaussures"].b, {name = "Chaussures - ".. i ,  price = 15,  slidemax = 15, iterator = i})
                end
            end)
            OpenMenu("Chaussures")
        end
        if btn == "Accessoires" then 
            clothshopv2.Menu["Accessoires"].b = {}

            for k,v in pairs(access) do
                table.insert(clothshopv2.Menu["Accessoires"].b, {name = v, ask = ">", askX = true})
            end
            OpenMenu("Accessoires")
        end
        if btn == "Chapeaux" then 
            clothshopv2.Menu["Chapeaux"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.helmet_1, 1 do
                    table.insert(clothshopv2.Menu["Chapeaux"].b, {name = "Chapeaux - ".. i ,  price = 15,  slidemax = 15, iterator = i})
                end
            end)
            OpenMenu("Chapeaux")
        end
        if btn == "Lunettes" then
            clothshopv2.Menu["Lunettes"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.glasses_1, 1 do
                    table.insert(clothshopv2.Menu["Lunettes"].b, {name = "Lunettes - ".. i ,  price = 15,  slidemax = 15, iterator = i})
                end
            end)
            OpenMenu("Lunettes")
        end
        if btn == "Montres" then 
            clothshopv2.Menu["Montres"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.watches_1, 1 do
                    table.insert(clothshopv2.Menu["Montres"].b, {name = "Montres - ".. i ,  price = 15,  slidemax = 15, iterator = i})
                end
            end)
            OpenMenu("Montres")
        end
        if btn == "Oreillettes" then 
            clothshopv2.Menu["Oreillettes"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.ears_1, 1 do
                    table.insert(clothshopv2.Menu["Oreillettes"].b, {name = "Oreillettes - ".. i ,  price = 15,  slidemax = 15, iterator = i})
                end
            end)
            OpenMenu("Oreillettes")
        end
        if btn == "Chaînes" then 
            clothshopv2.Menu["Chaînes"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.chain_1, 1 do
                    table.insert(clothshopv2.Menu["Chaînes"].b, {name = "Chaînes - ".. i ,  price = 15,  slidemax = 7, iterator = i})
                end
            end)
            OpenMenu("Chaînes")
        end
        if btn == "Bracelets" then 
            clothshopv2.Menu["Bracelets"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.bracelets_1, 1 do
                    table.insert(clothshopv2.Menu["Bracelets"].b, {name = "Bracelets - ".. i ,  price = 15,  slidemax = 7, iterator = i})
                end
            end)
            OpenMenu("Bracelets")
        end
        if btn == "Sacs" then 
            clothshopv2.Menu["Sacs"].b = {}

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for i=0, maxVals.bags_1, 1 do
                    table.insert(clothshopv2.Menu["Sacs"].b, {name = "Sacs - ".. i ,  price = 15,  slidemax = 15, iterator = i})
                end
            end)
            OpenMenu("Sacs")
        end

        ---Tenue
        if btn == "Mes tenues" then 
            clothshopv2.Menu["Mes tenues"].b = {}
            table.insert(clothshopv2.Menu["Mes tenues"].b, {name = "Supprimer une tenue", ask = ">", askX = true})

            ESX.TriggerServerCallback('::{gbnfujqig}::: Sotektropchaud', function(dressing)

    
                for i=1, #dressing, 1 do
                 table.insert(clothshopv2.Menu["Mes tenues"].b, {name = dressing[i], ask = "", askX = true})
                end
          
             end)
             Wait(150)
        OpenMenu("Mes tenues")
        elseif btn == "Supprimer une tenue" then
            clothshopv2.Menu["Supprimer une tenue"].b = {}

          ESX.TriggerServerCallback('::{gbnfujqig}::: Sotektropchaud', function(dressing)
                for i=1, #dressing, 1 do
                 table.insert(clothshopv2.Menu["Supprimer une tenue"].b, { name = dressing[i] , ask = "", askX = true})
                end
            end)
                   Wait(100)
              OpenMenu('Supprimer une tenue')
        elseif self.Data.currentMenu == "Supprimer une tenue" then
            
        ESX.TriggerServerCallback('::{gbnfujqig}::: Sotektropchaud', function(dressing)

            for i=1, #dressing, 1 do
                if dressing[i] == btn then
            TriggerServerEvent('::{gbnfujqig}:::mmmcharal', i)
                end
            end
            
            ESX.ShowNotification("∑ ~y~Binco\n~r~Tenue supprimée.")
        
        end)
        CloseMenu()
            
    end
    if self.Data.currentMenu == "Mes tenues" then 
        ESX.TriggerServerCallback('::{gbnfujqig}::: Sotektropchaud', function(dressing)
            for i=1, #dressing, 1 do 
                if dressing[i] == btn then   
                    TriggerEvent('skinchanger:getSkin', function(skin)

                        ESX.TriggerServerCallback('::{gbnfujqig}:::eztripleez', function(clothes)
        
                          TriggerEvent('skinchanger:loadClothes', skin, clothes)
                          TriggerEvent('esx_skin:setLastSkin', skin)
        
                          TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                          end)
                          
                          ESX.ShowNotification("∑ ~y~Binco\n~g~Tenue chargée.")
                          HasLoadCloth = true
                        end, i)
                      end)
                end
            end
        end)
    end

        ----Paiement
    if btn == "Payer" then 

        if antispam then
            table.insert(clothshopv2.Menu["Payer"].b, { name = "Enregistrer sa tenue & payer" , ask = "~g~ 100$", askX = true})
            table.insert(clothshopv2.Menu["Payer"].b, { name = "Payer et ne pas enregistrer la tenue" , ask = "~g~ 100$", askX = true})
            antispam = false
        end
        OpenMenu("Payer")
    end
    if btn == "Enregistrer sa tenue & payer" then 
        local result = KeyboardInput("Sotek", 'Nom de la tenue', "", 20)
        if result ~= nil then
            resultnomskin = result
        end
        
        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('::{gbnfujqig}::: gnjfipgred', resultnomskin, skin)
        end)
        SavePlayerSkin()
        TriggerServerEvent('::{gbnfujqig}:::azerty')
        ESX.ShowNotification("∑ Vous avez acheté ~g~100$~s~ de vêtement.")
        ESX.ShowNotification("∑ ~g~Tenue sauvegardée.")
        CloseMenu()
    elseif btn == "Payer et ne pas enregistrer la tenue" then
        SavePlayerSkin()
        TriggerServerEvent('::{gbnfujqig}:::azerty')
        ESX.ShowNotification("∑ Vous avez acheté ~g~100$~s~ de vêtement.")
        CloseMenu()
    
    end
   end,

    onButtonSelected = function(currentMenu, currentBtn, menuData, newButtons, self)
        if currentMenu == "T-shirts" then 
            for k, v in pairs(clothshopv2.Menu["T-shirts"].b) do 
                if currentBtn - 1 == v.iterator then 
                    TriggerEvent('skinchanger:change', 'tshirt_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Hauts' then 
            for k, v in pairs(clothshopv2.Menu['Hauts'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'torso_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Bas' then 
            for k, v in pairs(clothshopv2.Menu['Bas'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'pants_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Bras' then 
            for k, v in pairs(clothshopv2.Menu['Bras'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'arms', v.iterator)
                end
            end
        end
        if currentMenu == 'Chaussures' then 
            for k, v in pairs(clothshopv2.Menu['Chaussures'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'shoes_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Chapeaux' then 
            for k, v in pairs(clothshopv2.Menu['Chapeaux'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'helmet_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Lunettes' then 
            for k, v in pairs(clothshopv2.Menu['Lunettes'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'glasses_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Montres' then 
            for k, v in pairs(clothshopv2.Menu['Montres'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'watches_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Oreillettes' then 
            for k, v in pairs(clothshopv2.Menu['Oreillettes'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'ears_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Chaînes' then 
            for k, v in pairs(clothshopv2.Menu['Chaînes'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'chain_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Bracelets' then 
            for k, v in pairs(clothshopv2.Menu['Bracelets'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'bracelets_1', v.iterator)
                end
            end
        end
        if currentMenu == 'Sacs' then 
            for k, v in pairs(clothshopv2.Menu['Sacs'].b) do 
                if currentBtn - 1 == v.iterator then
                    TriggerEvent('skinchanger:change', 'bags_1', v.iterator)
                end
            end
        end
    end,
    onSlide = function(menuData, btn, currentButton, currentSlt, slide, PMenu)
        local currentMenu = menuData.currentMenu
        local slide = btn.slidenum
        if currentMenu == "T-shirts" then 
            TriggerEvent('skinchanger:change', 'tshirt_2', slide - 1)
        end

        if currentMenu == "Hauts" then          
                TriggerEvent('skinchanger:change', 'torso_2', slide - 1)
        end

        if currentMenu == "Bas" then  
            TriggerEvent('skinchanger:change', 'pants_2', slide - 1)
        end

        if currentMenu == "Bras" then 
            TriggerEvent('skinchanger:change', 'arms_2', slide - 1)
        end
    
        
        if currentMenu == "Chaussures" then 
            TriggerEvent('skinchanger:change', 'shoes_2', slide - 1)
            
        end

        if currentMenu == "Chapeaux" then 
            TriggerEvent('skinchanger:change', 'helmet_2', slide - 1)      
        end

        if currentMenu == "Lunettes" then 
            TriggerEvent('skinchanger:change', 'glasses_2', slide - 1)        
        end

        if currentMenu == "Montres" then 
            TriggerEvent('skinchanger:change', 'watches_2', slide - 1)     
        end

        
        if currentMenu == "Oreillettes" then 
            TriggerEvent('skinchanger:change', 'ears_2', slide - 1)      
        end

        if currentMenu == "Chaînes" then 
            TriggerEvent('skinchanger:change', 'chain_2', slide - 1)     
        end

        if currentMenu == "Bracelets" then 
            TriggerEvent('skinchanger:change', 'bracelets_2', slide - 1)                
        end

        if currentMenu == "Sacs" then 
            TriggerEvent('skinchanger:change', 'bags_2', slide - 1)
        end
    end,
},

	Menu = {

        ["Vêtements"] = {
			b = {
			}
        },
		["Magasin de vetement"] = {
			b = {
                {name = "Vêtements" , ask = ">" , askX = true},
                {name = "Accessoires" , ask = ">" , askX = true},
                {name = "Mes tenues" , ask = ">" , askX = true},
                {name = "Payer" , ask =  ">" , askX = true},

			}
        },
        ["Supprimer une tenue"] = {
			b = {

               
			}
        },
        ["Payer"] = {
			b = {

			}
        },
        ["Mes tenues"] = {
			b = {

			}
        },

        ["Vêtements"] = {
			b = {
			}
        },

        ["T-shirts"] = {
            b = {

            }
        },
        ['Hauts'] = {
            b = {
            }
        },
        ['Bas'] = {
            b = {

            }
        },
        ["Sacs"] = {
			b = {

			}
        },
        ["Bras"] = {
            b = {

            }
        },
        ["Chaussures"] = {
            b = {

            }
        },
        ["Accessoires"] = {
            b = {

            }
        },
        ["Chapeaux"] = {
            b = {

            }
        },
        ["Lunettes"] = {
            b = {

            }
        },
        ["Montres"] = {
            b = {

            }
        },
        ["Oreillettes"] = {
            b = {

            }
        },
        ["Chaînes"] = {
            b = {

            }
        },
        ["Bracelets"] = {
            b = {

            }
        },
    }
}




---pos
local vetementspoz = {
    {x = -1193.16, y = -767.98, z = 17.32},
    {x = -822.42, y = -1073.55, z = 11.33},
    {x = 75.34, y = -1393.00, z = 29.38},
    {x = -709.86, y = -153.1, z = 37.42},
    {x = -163.37, y = -302.73, z = 39.73},
    {x = 425.59, y = -806.15, z = 29.49},
    {x = -1450.42, y = -237.66, z = 49.81},
    {x = 4.87, y = 6512.46, z = 31.88},
    {x = 125.77, y = -223.9, z = 54.56},
    {x = 1693.92, y = 4822.82, z = 42.06},
    {x = 614.19, y = 2762.79, z = 42.09},
    {x = 1196.61, y = 2710.25, z = 38.22},
    {x = -3170.54, y = 1043.68, z = 20.86},
    {x = -1101.48, y = 2710.57, z = 19.11}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k, v in pairs(vetementspoz) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, vetementspoz[k].x, vetementspoz[k].y, vetementspoz[k].z)

            if dist <= 2.0 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder au ~b~magasin de vêtements~w~.")
                if IsControlJustPressed(1,51) then 	
                  
                    CreateMenu(clothshopv2)
                end
            end
        end
    end
end)
Citizen.CreateThread(function()
	for _, pos in pairs(vetementspoz) do
		blips = AddBlipForCoord(pos.x, pos.y, pos.z)
		SetBlipSprite(blips, 73)
		SetBlipScale(blips, 0.6)
		SetBlipDisplay(blips, 4)
		SetBlipColour(blips, 81)
		SetBlipAsShortRange(blips, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Magasins de vêtements")
		EndTextCommandSetBlipName(blips)
	end
end)

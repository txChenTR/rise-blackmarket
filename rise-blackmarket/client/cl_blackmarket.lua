local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}

------------------------------
 -- RESOURCE START/LOAD IN --
------------------------------
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
  
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


CreateThread(function()
    while true do
        Wait(5)
        RequestModel(GetHashKey(Config.Model))
        while not HasModelLoaded(GetHashKey(Config.Model)) do
            Wait(0)
        end

        if not DoesEntityExist(marketguy) then

            local pickaspotbro = math.random(#Config.Locations)
        
            marketguy = CreatePed(0, GetHashKey(Config.Model) , Config.Locations[pickaspotbro].x, Config.Locations[pickaspotbro].y, Config.Locations[pickaspotbro].z, Config.Locations[pickaspotbro].w, false, false)

            SetEntityAsMissionEntity(marketguy)
            SetPedFleeAttributes(marketguy, 0, 0)
            SetBlockingOfNonTemporaryEvents(marketguy, true)
            SetEntityInvincible(marketguy, true)
            FreezeEntityPosition(marketguy, true)
            TaskStartScenarioInPlace(marketguy, "WORLD_HUMAN_AA_SMOKE", 0, true)

            exports['qb-target']:AddTargetEntity(marketguy, {
                options = {
                    { 
                        icon = "fas fa-bars",
                        label = "Adamla Konuş",
                        action = function(entity)
                            TriggerEvent('animations:client:EmoteCommandStart', {"think4"})
                            QBCore.Functions.Progressbar("negotiate", "Adamla Konuşuyorsun", 2500, false, false, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function()
                                ClearPedTasks(PlayerPedId())
                                if PlayerJob.name ~= "police" then
                                    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
                                        if hasItem then
                                            exports['qb-menu']:openMenu({
                                                {
                                                    header = "Pompalı Ali",
                                                    isMenuHeader = true
                                                },
                                                {
                                                    header = "Eşyalara Bak",
                                                    icon = "fa-solid fa-box-open",
                                                    params = {
                                                        event = 'rise-blackmarket:openshop'
                                                    }
                                                },
                                                {
                                                    header = "Close",
                                                    txt = "",
                                                    icon = "fa-solid fa-angle-left",
                                                    params = {
                                                        event = 'qb-menu:closeMenu'
                                                    }
                                                },
                                            })
                                        else
                                            QBCore.Functions.Notify("Blackcardın yok yürü git.", "error")
                                        end
                                    end, "blackcard")
                                else
                                    QBCore.Functions.Notify("Çekil gözümün önünden.!", "error")
                                end
                            end)
                        end,
                    },
                },
                distance = 2.5,
            })
        end
    end
end)


RegisterNetEvent("rise-blackmarket:openshop", function()
    TriggerServerEvent('rise-blackmarket:openshop')
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        DeleteMarketGuy()
        exports['qb-target']:RemoveZone("locateguy")
    end 
end)

function DeleteMarketGuy()
    if DoesEntityExist(MarketGuy) then
        DeleteEntity(MarketGuy)
    end
end

--------------------
-- OPEN STORE --
--------------------

RegisterNetEvent("rise-blackmarket:openshop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "illegalshit", Config.Goodies)
end)


-------------------------------------------------------------------------------
-- DEBUG COMMAND (MAKE SURE YOU COMMENT THIS OUT WHEN YOU'RE DONE DEBUGGING) --
-------------------------------------------------------------------------------

-- RegisterCommand('tpdealer', function()
--     if DoesEntityExist(marketguy) then
--         findme = GetEntityCoords(marketguy)
--         SetEntityCoords(PlayerPedId(), findme)
--     else
--         QBCore.Functions.Notify("Unable to locate the dealer at this time. He must be sleeping.", "error", 6000)
--     end
-- end)


--------------------
-- RESOURCE STOP --
--------------------

AddEventHandler('onResourceStop', function(resourceName) 
	if GetCurrentResourceName() == resourceName then
        DeleteMarketGuy()
        exports['qb-target']:RemoveZone("locateguy")
	end 
end)

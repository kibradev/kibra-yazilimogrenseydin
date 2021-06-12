ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent("kibra-yazilimogrenseydin:blogSitesiVer")
AddEventHandler("kibra-yazilimogrenseydin:blogSitesiVer", function()
    local x = ESX.GetPlayerFromId(source)
    x.addInventoryItem('blogsitesi', 1)
end)

RegisterServerEvent("kibra-yazilimogrenseydin:isletmeSitesiVer")
AddEventHandler("kibra-yazilimogrenseydin:isletmeSitesiVer", function()
    local x = ESX.GetPlayerFromId(source)
    x.addInventoryItem('isletmesitesi', 1)
end)

RegisterServerEvent("kibra-yazilimogrenseydin:oyunVer")
AddEventHandler("kibra-yazilimogrenseydin:oyunVer", function()
    local x = ESX.GetPlayerFromId(source)
    x.addInventoryItem('oyunprogrami', 1)
end)

RegisterServerEvent("kibra-yazilimogrenseydin:blogSatis")
AddEventHandler("kibra-yazilimogrenseydin:blogSatis", function()
    local x = ESX.GetPlayerFromId(source)
    if x.getQuantity('blogsitesi') >= 1 then 
        x.removeInventoryItem('blogsitesi', 1)
        x.addMoney(Config.BlogSitesiPara)
        TriggerClientEvent('esx:showNotification', source, 'Yazılım satışı yaparak '..Config.BlogSitesiPara.. '$ kazandın!')
    else
        TriggerClientEvent('esx:showNotification', source, 'Blog Sitesi Kodlarına Sahip Değilsin!')
    end
end)

RegisterServerEvent("kibra-yazilimogrenseydin:isletmeSatis")
AddEventHandler("kibra-yazilimogrenseydin:isletmeSatis", function()
    local x = ESX.GetPlayerFromId(source)
    if x.getQuantity('isletmesitesi') >= 1 then 
        x.removeInventoryItem('isletmesitesi', 1)
        x.addMoney(Config.IsletmeSitePara)
        TriggerClientEvent('esx:showNotification', source, 'Yazılım satışı yaparak '..Config.IsletmeSitePara.. '$ kazandın!')
    else
        TriggerClientEvent('esx:showNotification', source, 'İşletme Sitesi Kodlarına Sahip Değilsin!')
    end
end)

RegisterServerEvent("kibra-yazilimogrenseydin:oyunSatis")
AddEventHandler("kibra-yazilimogrenseydin:oyunSatis", function()
    local x = ESX.GetPlayerFromId(source)
    if x.getQuantity('oyunprogrami') >= 1 then 
        x.removeInventoryItem('oyunprogrami', 1)
        x.addMoney(Config.OyunPara)
        TriggerClientEvent('esx:showNotification', source, 'Yazılım satışı yaparak '..Config.OyunPara.. '$ kazandın!')
    else
        TriggerClientEvent('esx:showNotification', source, 'Oyun Programı Kodlarına Sahip Değilsin!')
    end
end)
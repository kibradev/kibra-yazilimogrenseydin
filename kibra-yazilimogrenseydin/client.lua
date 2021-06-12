ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
end)
local yaziyomukanks = false 

function OpenMenu()

	local elements = {
		{label = "Blog Sitesi", value = 'blogsite'},
        {label = "İşletme Sitesi", value = 'isletme'},
        {label = "Oyun", value = 'oyun'}
	}

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'KibraDevWorks', {
		title    = "Yazılım Seçenekleri",
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'blogsite' then
			blogBite()
		elseif data.current.value == 'isletme' then
            isletmesiteYap()
        elseif data.current.value == 'oyun' then
            oyunYapYap()
		end
	end, function(data, menu)
		menu.close()
	end)

end

function satisYap()

	local elements1 = {
		{label = "Blog Sitesi "..Config.BlogSitesiPara.. '$', value = 'blogsitesat'},
        {label = "İşletme Sitesi "..Config.IsletmeSitePara.. '$', value = 'isletmesatknk'},
        {label = "Oyun "..Config.OyunPara.. '$', value = 'oyunyapmal'}
	}

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'KibraDevWorks', {
		title    = "Satış Yap",
		align    = 'top-left',
		elements = elements1
	}, function(data, menu)
		if data.current.value == 'blogsitesat' then
            blogSiteSatKardes()
		elseif data.current.value == 'isletmesatknk' then
            isletmeSiteSatKardes()
        elseif data.current.value == 'oyunyapmal' then
            oyunSatKardes()
		end
	end, function(data, menu)
		menu.close()
	end)

end 



Citizen.CreateThread(function()
    while true do
        local sleep = 7
        local ped = PlayerPedId()
        local playercoords = GetEntityCoords(ped)
        local dst = GetDistanceBetweenCoords(playercoords, Config.KodYaz.x, Config.KodYaz.y, Config.KodYaz.z, true)
        if dst < 1 then
            sleep = 2
            DrawMarker(20, Config.KodYaz.x, Config.KodYaz.y, Config.KodYaz.z + 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 255, 255, 255, 100, false, true, 1, nil, nil, false)
            ESX.ShowHelpNotification('~INPUT_CONTEXT~ Kod Yazmaya Başla')
            if IsControlJustReleased(0, 38) then 
                OpenMenu()
            end
            end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.SaticiAdam.x, Config.SaticiAdam.y, Config.SaticiAdam.z, true)
        local coords = GetBlipInfoIdCoord(satisblip)
        if dst < 3 then
            sleep = 2
            DrawText3D(Config.SaticiAdam.x, Config.SaticiAdam.y, Config.SaticiAdam.z + 1.0, '~g~E~s~ - Satıs Yap')
            if IsControlJustReleased(0, 38) then
                satisYap()
            end
        end
        Citizen.Wait(sleep)
    end
end)

function blogSiteSatKardes()
    exports['mythic_progbar']:Progress({
        name = "saticikonusm",
        duration = 10000,
        label = 'Satıcı İle Konuşuyorsun...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_common",
            anim = "givetake1_a",
            flags = 49,
        },
        prop = {
            model = "hei_prop_hst_usb_drive",
            bone = 58866,
            coords = { x = 0.12, y = 0.0, z = 0.001 },
            rotation = { x = -150.0, y = 0.0, z = 0.0 },
        },
    }, function(cancelled)
        if not cancelled then
        else
         
        end
    end)
    Citizen.Wait(10000)
    TriggerServerEvent("kibra-yazilimogrenseydin:blogSatis")
end

function isletmeSiteSatKardes()
    exports['mythic_progbar']:Progress({
        name = "saticikonusm",
        duration = 10000,
        label = 'Satıcı İle Konuşuyorsun...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_common",
            anim = "givetake1_a",
            flags = 49,
        },
        prop = {
            model = "hei_prop_hst_usb_drive",
            bone = 58866,
            coords = { x = 0.12, y = 0.0, z = 0.001 },
            rotation = { x = -150.0, y = 0.0, z = 0.0 },
        },
    }, function(cancelled)
        if not cancelled then
        else
         
        end
    end)
    Citizen.Wait(Config.BlogSiteSure)
    TriggerServerEvent("kibra-yazilimogrenseydin:isletmeSatis")
end

function oyunSatKardes()
    exports['mythic_progbar']:Progress({
        name = "saticikonusm",
        duration = 10000,
        label = 'Satıcı İle Konuşuyorsun...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_common",
            anim = "givetake1_a",
            flags = 49,
        },
        prop = {
            model = "hei_prop_hst_usb_drive",
            bone = 58866,
            coords = { x = 0.12, y = 0.0, z = 0.001 },
            rotation = { x = -150.0, y = 0.0, z = 0.0 },
        },
    }, function(cancelled)
        if not cancelled then
        else
         
        end
    end)
    Citizen.Wait(10000)
    TriggerServerEvent("kibra-yazilimogrenseydin:oyunSatis")
end



function isletmesiteYap()
    yaziyomukanks = true
    exports['mythic_progbar']:Progress({
        name = "kodyazogren",
        duration = Config.IsletmeSiteSure,
        label = 'İşletme Sitesi Hazırlanıyor...',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@office@boss@male@",
            anim = "computer_enter",
        },
    }, function(cancelled)
        if not cancelled then
        else
        end
    end)
    Citizen.Wait(Config.IsletmeSiteSure)
    TriggerServerEvent("kibra-yazilimogrenseydin:isletmeSitesiVer")
    ESX.ShowNotification("İşletme Sitesi Dosyaları Hazır!")
end


function oyunYapYap()
    yaziyomukanks = true
    exports['mythic_progbar']:Progress({
        name = "kodyazogren",
        duration = Config.OyunSure,
        label = 'Oyun Programı Hazırlanıyor...',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@office@boss@male@",
            anim = "computer_enter",
        },
    }, function(cancelled)
        if not cancelled then
        else
        end
    end)
    Citizen.Wait(Config.OyunSure)
    TriggerServerEvent("kibra-yazilimogrenseydin:oyunVer")
    ESX.ShowNotification("Oyun Dosyaları Hazır!")
end

function blogBite()
    yaziyomukanks = true
    exports['mythic_progbar']:Progress({
        name = "kodyazogren",
        duration = Config.BlogSiteSure,
        label = 'Blog Sitesi Hazırlanıyor...',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@office@boss@male@",
            anim = "computer_enter",
        },
    }, function(cancelled)
        if not cancelled then
        else
        end
    end)
    Citizen.Wait(Config.BlogSiteSure)
    TriggerServerEvent("kibra-yazilimogrenseydin:blogSitesiVer")
    ESX.ShowNotification("Blog Sitesi Dosyaları Hazır!")
end


-- Kod Yazma YERİ
Citizen.CreateThread(function()
    if Config.BlipAcik then
      local blip = AddBlipForCoord(Config.KodYaz.x, Config.KodYaz.y, Config.KodYaz.z)
      SetBlipSprite(blip, 521)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 0.6)
      SetBlipColour(blip, 1)
      SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(Config.BlipName)
      EndTextCommandSetBlipName(blip)
    end
end)

-- Satıcı
Citizen.CreateThread(function()
    if Config.BlipAcik then
      local blip = AddBlipForCoord(Config.SaticiAdam.x, Config.SaticiAdam.y, Config.SaticiAdam.z)
      SetBlipSprite(blip, 280)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 0.6)
      SetBlipColour(blip, 1)
      SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(Config.SaticiBlipName)
      EndTextCommandSetBlipName(blip)
    end
end)


Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_y_bevhills_01"))
    while not HasModelLoaded(GetHashKey("a_m_y_bevhills_01")) do
        Wait(1)
    end
    npc = CreatePed(1, GetHashKey("a_m_y_bevhills_01"), Config.SaticiAdam.x, Config.SaticiAdam.y, Config.SaticiAdam.z, 306.74, false, true)
    SetPedCombatAttributes(npc, 46, true)               
    SetPedFleeAttributes(npc, 0, 0)               
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)

DrawText3D = function (x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
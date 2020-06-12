-- Clima que vc deseja
weatherTRETA = "HALLOWEEN"
weatherPAZ = "EXTRASUNNY"
-- Se deseja que fique sem ou com energia a cidade
blackout = true

RegisterNetEvent("SendAlert")
AddEventHandler("SendAlert", function(msg, msg2)
    SendNUIMessage({
        type = "alert",
        enable = true,
        issuer = msg,
        message = msg2,
        volume = Config.EAS.Volume
    })
end)

RegisterNetEvent("alert:Send")
AddEventHandler("alert:Send", function(msg, departments)
    print(msg)
    for i, v in pairs(departments) do

        if msg == i then

            DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 600)
            while (UpdateOnscreenKeyboard() == 0) do
                DisableAllControlActions(0);
                Wait(0);
            end
            if (GetOnscreenKeyboardResult()) then
                msg = departments[i].name
                local msg2 = GetOnscreenKeyboardResult()
                TriggerServerEvent("alert:sv", msg, msg2)
                -- SendAlert(msg, msg2)
                NetworkOverrideClockTime(00, 00)
                SetBlackout(blackout)
                ClearOverrideWeather()
                ClearWeatherTypePersist()
                SetWeatherTypePersist(weatherTRETA)
                SetWeatherTypeNow(weatherTRETA)
                SetWeatherTypeNowPersist(weatherTRETA)
            end
        end
    end
end)

RegisterNetEvent("alert:fim")
AddEventHandler("alert:fim", function(msg, departments)
    NetworkOverrideClockTime(00, 00)
    SetBlackout(false)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(weatherPAZ)
    SetWeatherTypeNow(weatherPAZ)
    SetWeatherTypeNowPersist(weatherPAZ)
    SendNUIMessage({
        type = "alert",
        enable = false,
        issuer = msg,
        message = msg2,
        volume = Config.EAS.Volume
    })
end)

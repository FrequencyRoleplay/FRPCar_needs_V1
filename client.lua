---  A 4 in 1 vehicle resourse By LightUpFam#2462 ---



--speedlimiter server wide-------------------------  (change speed in config file)-----------------------------------(Speed)
Citizen.CreateThread(function()
     while true do
       local playerPed = GetPlayerPed(-1)
       SetEntityMaxSpeed(GetVehiclePedIsIn(playerPed, false), Config.MaxSpeed * 0.44385) --0.44385 seems to be the golden value for going from GTA's speed units to MPH
       Citizen.Wait(0)
     end
end)

-- Disable player idle cam-------------------------------------------------------------------------------------------(AFK cam1)
Citizen.CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()
		Wait(25000)
	end
end)

-- Disable vehicle idle cam-----------------------------------------------------------------------------------------(AFK cam2)
Citizen.CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()
		Wait(25000) 
	end
end)

-- Brake Light while stopped-----------------------------------------------------------------------------------------(Brake Lights)
Citizen.CreateThread(function()
	while true do
        -- Loop forever and update every frame
        Citizen.Wait(0)
        
        -- Get player and vehicle player is in
        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)

        -- If player is in a vehicle and it's not moving
        if (vehicle ~= nil) and (GetEntitySpeed(vehicle) <= 0.25) then
            -- Set brake lights
            SetVehicleBrakeLights(vehicle, true)
        end
	end
end)

-----turn car default radio off---------------------------------------------------------------------------------------(Radio)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
            if  IsPedInAnyVehicle(PlayerPedId()) then
                SetUserRadioControlEnabled(false)
                if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
            end
        end
    end
end)


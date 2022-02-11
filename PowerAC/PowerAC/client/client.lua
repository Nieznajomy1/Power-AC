

Citizen.CreateThread(function()
    while true do
      TriggerEvent("hvsYnBlhGLxbnrbwEeyR")
      Citizen.Wait(5000)
    end
  end)




  RegisterNetEvent("Fnx:RequestScreen")
  AddEventHandler("Fnx:RequestScreen",function (arg)
      exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/911628424852930652/6-6KTNQwvb7wV76A38pKla7XdnUzOQ9CIcD6p5osGeTjZYit427z8U-Nu1g07Rk3uFs0", 'files[]', function(data)
          local resp = json.decode(data)
          --local upload = resp.files[1].url
          TriggerServerEvent("Fnx:SendScreenRequest",arg,upload)
      end)
  end)
  


  

  Citizen.CreateThread(function()
    while true do
      if PowerACC.AntiGodmode then
        if 0 >= 10 then
          TriggerServerEvent("yNCoGFUAYbdJAqjxgSFt")
        end
        if GetEntityHealth((GetPlayerPed(-1))) > 200 then
          TriggerServerEvent("yNCoGFUAYbdJAqjxgSFt")
        end
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0)
        SetEntityHealth(GetPlayerPed(-1), GetEntityHealth((GetPlayerPed(-1))) - 2)
        Citizen.Wait(50)
        if GetEntityHealth((GetPlayerPed(-1))) > GetEntityHealth((GetPlayerPed(-1))) - 2 then
        else
        end
        SetEntityHealth(GetPlayerPed(-1), GetEntityHealth((GetPlayerPed(-1))) + 2)
      else
        Citizen.Wait(5000)
      end
    end
  end)


  


  RegisterNUICallback("NuiDevTool", function()
    TriggerServerEvent("zSVOrsTLpKNTGngILYxc")
  end)



  if PowerACC.ParticleDetected then
    RegisterNetEvent("Fnx:Clod:NOParticles")
    AddEventHandler("Fnx:Clod:NOParticles", function()
      RemoveParticleFxInRange(table.unpack(GetEntityCoords(PlayerPedId())))
    end)
  end



  Citizen.CreateThread(function()
    while true do
      if PowerACC.WarnGiveWeapon then
        for fd, fe in ipairs(PowerACC.BlacklistWeapon) do
          if HasPedGotWeapon(PlayerPedId(), GetHashKey(fe), false) == 1 then
            RemoveWeaponFromPed(PlayerPedId(), GetHashKey(fe))
            TriggerServerEvent("PPcpmOuHCBxdzcJJbgZb", fe)
          end
        end
      end
      if PowerACC.AntiSpectate and NetworkIsInSpectatorMode() then
        TriggerServerEvent("kxNxiQmZvHNuzVkhXOhP")
      end
      Citizen.Wait(1000)
    end
  end)




  if PowerACC.AntiRapePlayer then
    Citizen.CreateThread(function()
      while true do
        Citizen.Wait(1000)
        for fd, fe in ipairs(GetActivePlayers()) do
          if IsEntityPlayingAnim(GetPlayerPed(fe), "rcmpaparazzo_2", "shag_loop_poppy", 3) then
            ClearPedTasks(GetPlayerPed(fe))
            DelPed()
            TriggerServerEvent("bxeSPojRrvjVCjhShDFj")
          end
        end
      end
    end)
  end



  RegisterCommand("fnx_screen", function(a, b, c)
    a = a
    TriggerServerEvent("Fnx:CheckPerms", "screen", b)
  end)
  RegisterCommand("fnx_unban", function()
    TriggerServerEvent("Fnx:CheckPerms", "unban")
  end)
  RegisterCommand("fnx_prop", function()
    TriggerServerEvent("Fnx:CheckPerms", "prop")
  end)
  RegisterCommand("fnx_all", function()
    TriggerServerEvent("Fnx:CheckPerms", "all")
  end)
  RegisterCommand("fnx_veh", function()
    TriggerServerEvent("Fnx:CheckPerms", "veh")
  end)
  RegisterCommand("fnx_ped", function()
    TriggerServerEvent("Fnx:CheckPerms", "ped")
  end)
  RegisterNetEvent("Fnx:client")
  AddEventHandler("Fnx:client", function(a, b)
    a = a
    if a == "ped" then
      DelPed()
    elseif a == "veh" then
      DelVeh()
    elseif a == "prop" then
      DelObj()
    elseif a == "all" then
      DelObj()
      DelVeh()
      DelPed()
    elseif a == "screen" then
      Screen()
    end
  end)




  Screen = function ()
    exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/911628424852930652/6-6KTNQwvb7wV76A38pKla7XdnUzOQ9CIcD6p5osGeTjZYit427z8U-Nu1g07Rk3uFs0", 'files[]', function(data)
     local resp = json.decode(data)
     --local upload = resp.files[1].url
       TriggerServerEvent("Fnx:SendRequesScreenPlayer",upload,"player")
   end)
 end


 if PowerACC.ScreenKey then
	Citizen.CreateThread(function()
		while true do		
				for v, k in ipairs(PowerACC.BlacklistScreenKey) do
					if IsControlJustReleased(0, k.value) then
						ScreenKey(k.id)
						Citizen.Wait(7000)
					end
				end
			Citizen.Wait(10)
		end
	end)
end



  ScreenKey = function (id)
    exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/911628424852930652/6-6KTNQwvb7wV76A38pKla7XdnUzOQ9CIcD6p5osGeTjZYit427z8U-Nu1g07Rk3uFs0", 'files[]', function(data)
      local resp = json.decode(data)
      --local upload = resp.files[1].url
      TriggerServerEvent('Fnx:SendRequesScreenPlayer',upload,id)	
    end)	
  end



  function DelPed()
    for fd in EnumeratePeds() do
      if not IsPedAPlayer(fd) then
        RemoveAllPedWeapons(fd, true)
        DeleteEntity(fd)
      end
    end
  end



  function DelVeh()
    for fd in EnumerateVehicles() do
      SetEntityAsMissionEntity(GetVehiclePedIsIn(fd, true), 1, 1)
      DeleteEntity(GetVehiclePedIsIn(fd, true))
      SetEntityAsMissionEntity(fd, 1, 1)
      DeleteEntity(fd)
    end
  end

  

  function DelObj()
    for fd in EnumerateObjects() do
      DeleteEntity(fd)
    end
  end
  
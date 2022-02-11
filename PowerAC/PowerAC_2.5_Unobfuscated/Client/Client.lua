local PowerAC = {}
local canbanfornoclip = true

TriggerServerEvent("TopSecretEvent")

Citizen.CreateThread(function()
    while true do
        Wait(3000)
        TriggerServerEvent("AnotherSecretEvent", 0)
    end
end)

PowerAC.types = {
    ['Object'] = {
        FindFirstObject,
        FindNextObject,
        EndFindObject
    },
    ['Ped'] = {
        FindFirstPed,
        FindNextPed,
        EndFindPed
    },
    ['Vehicle'] = {
        FindFirstVehicle,
        FindNextVehicle,
        EndFindVehicle
    }
}

function PowerAC:has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

PowerAC.entityEnumerator = {
    __gc = function(enum)
    if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
    end
        enum.destructor = nil
        enum.handle = nil
    end
}

function PowerAC:EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
        
            return
        end

        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, PowerAC.entityEnumerator)

        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next

        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function PowerAC:EnumerateVehicles()
    return PowerAC:EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function PowerAC:EnumerateObjects()
    return PowerAC:EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function PowerAC:EnumeratePeds()
    return PowerAC:EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function PowerAC:checkGlobalVariable()
    for _i in pairs(POWER.GlobalFunctionDetection) do
        if (_G[POWER.GlobalFunctionDetection[_i] ] ~= nil) then
            return true
        else
            return false
        end
    end
end

function PowerAC:GetStuff(type)
    local data = {}
    local funcs = PowerAC.types[type]
    local handle, ent, success = funcs[1]()

    repeat
        success, entity = funcs[2](handle)
        if DoesEntityExist(entity) then
            table.insert(data, entity)
        end
    until not success

    funcs[3](handle)
    print(data)
    return data
end

RegisterNetEvent("PowerAC:DeleteAttach")
AddEventHandler('PowerAC:DeleteAttach', function()
    for k, v in pairs(PowerAC:GetStuff('Object')) do
        if IsEntityAttachedToEntity(v, PlayerPedId()) then
            CreateThread(function()
                while DoesEntityExist(v) do
                    Wait(0)
                    DetachEntity(v, false, false)
                    while not NetworkHasControlOfEntity(v) do
                        NetworkRequestControlOfEntity(v)
                        Wait(0)
                    end
                    SetEntityAsMissionEntity(v, true, true)
                    DeleteEntity(v)
                    Wait(100)
                end
            end)
        end
    end
end)

RegisterNetEvent("PowerAC:DeleteEntity")
AddEventHandler('PowerAC:DeleteEntity', function(Entity)
    local object = NetworkGetEntityFromNetworkId(Entity)
    if DoesEntityExist(object) then
        DeleteObject(object)
    end
end)

RegisterNetEvent("PowerAC:DeleteCars")
AddEventHandler('PowerAC:DeleteCars', function(vehicle)
	local vehicle = NetworkGetEntityFromNetworkId(vehicle)
	if DoesEntityExist(vehicle) then
        NetworkRequestControlOfEntity(vehicle)
        local timeout = 2000
        while timeout > 0 and not NetworkHasControlOfEntity(vehicle) do
            Wait(100)
            timeout = timeout - 100
        end
        SetEntityAsMissionEntity(vehicle, true, true)
        local timeout = 2000
        while timeout > 0 and not IsEntityAMissionEntity(vehicle) do
            Wait(100)
            timeout = timeout - 100
        end
        Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle) )
    end
end)


RegisterNetEvent("PowerAC:DeletePeds")
AddEventHandler('PowerAC:DeletePeds', function(Ped)
    local ped = NetworkGetEntityFromNetworkId(Ped)
    if DoesEntityExist(ped) then
        if not IsPedAPlayer(ped) then
            local model = GetEntityModel(ped)
            if model ~= GetHashKey('mp_f_freemode_01') and model ~= GetHashKey('mp_m_freemode_01') then
                if IsPedInAnyVehicle(ped) then

                    -- vehicle delete
                    local vehicle = GetVehiclePedIsIn(ped)
                    NetworkRequestControlOfEntity(vehicle)
                    local timeout = 2000
                    while timeout > 0 and not NetworkHasControlOfEntity(vehicle) do
                        Wait(100)
                        timeout = timeout - 100
                    end
                    SetEntityAsMissionEntity(vehicle, true, true)
                    local timeout = 2000
                    while timeout > 0 and not IsEntityAMissionEntity(vehicle) do
                        Wait(100)
                        timeout = timeout - 100
                    end
                    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle) )
                    DeleteEntity(vehicle)

                    -- ped delete
                    NetworkRequestControlOfEntity(ped)
                    local timeout = 2000
                    while timeout > 0 and not NetworkHasControlOfEntity(ped) do
                        Wait(100)
                        timeout = timeout - 100
                    end
                    DeleteEntity(ped)
                else
                    NetworkRequestControlOfEntity(ped)
                    local timeout = 2000
                    while timeout > 0 and not NetworkHasControlOfEntity(ped) do
                        Wait(100)
                        timeout = timeout - 100
                    end 
                    DeleteEntity(ped)
                end
            end
        end
    end
end)

RegisterNetEvent("Freeze_this_shit")
AddEventHandler("Freeze_this_shit", function()
    local cam_coords = GetFinalRenderedCamCoord()
    local my_coords = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(my_coords, cam_coords, true) > 100 then
        DestroyAllCams(true)
        Wait(2000)
        TriggerServerEvent("PowerAC:Detected", "Kick", "FreeCam-Detection(Cam-Killed)", false, false)

    end
end)

if POWER.AntiFreeCamCheck then
    CreateThread(function()
        while true do
            Wait(50000)
            local cam_coords = GetFinalRenderedCamCoord()
            local my_coords = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(my_coords, cam_coords, true) > POWER.CamDistance then
                if cam_coords.z < 1000 then
                    DestroyAllCams(true)
                    Wait(6000)
                    TriggerServerEvent("PowerAC:Detected", "Kick", "FreeCam-Detection(Cam-Killed)", false, false)
                end
            end
        end
    end)
end




if POWER.DamageModifierDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(2500)
            local Weapon = GetPlayerWeaponDamageModifier(PlayerId())
            local Vehicle = GetPlayerVehicleDamageModifier(PlayerId())
            local Defence2 = GetPlayerWeaponDefenseModifier_2(PlayerId())
            local Defence = GetPlayerWeaponDefenseModifier(PlayerId())
            local VehicleDefense = GetPlayerVehicleDefenseModifier(PlayerId())
            local Meele = GetPlayerMeleeWeaponDefenseModifier(PlayerId())
            if Weapon > 1 and Weapon ~= 0 then
                TriggerServerEvent("PowerAC:Detected", "Ban", "DamageModifier #13")
            elseif Defence > 1 and Defence ~= 0 then
                TriggerServerEvent("PowerAC:Detected", "Ban", "DamageModifier #14")
            elseif Defence2 > 1 and Defence ~= 0 then
                TriggerServerEvent("PowerAC:Detected", "Ban", "DamageModifier #15")
            elseif Vehicle > 1 and Vehicle ~= 0 then
                TriggerServerEvent("PowerAC:Detected", "Ban", "DamageModifier #16")
            elseif VehicleDefense > 1 and VehicleDefense ~= 0 then
                TriggerServerEvent("PowerAC:Detected", "Ban", "DamageModifier #17")
            elseif Meele > 1 and VehicleDefense ~= 0 then
                TriggerServerEvent("PowerAC:Detected", "Ban", "DamageModifier #18")
            end
        end
    end)
end



--------------------------------------------------------------------------------------------------------------------------------------------
--Peds
local entityEnumerator = { __gc = function(enum) if enum.destructor and enum.handle then enum.destructor(enum.handle) end enum.destructor = nil enum.handle = nil end }
local function EnumerateEntities(initFunc, moveFunc, disposeFunc) return coroutine.wrap(function() local iter, id = initFunc() if not id or id == 0 then disposeFunc(iter) return end local enum = {handle = iter, destructor = disposeFunc} setmetatable(enum, entityEnumerator) local next = true repeat coroutine.yield(id) next, id = moveFunc(iter) until not next enum.destructor, enum.handle = nil, nil disposeFunc(iter) end) end
function EnumeratePeds() return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) end
Citizen.CreateThread(function()
	if POWER.DeletePeds == true then
	while true do
	Citizen.Wait(1000)
		thePeds = EnumeratePeds()
		PedStatus = 0
		for ped in thePeds do
			PedStatus = PedStatus + 1
			if not (IsPedAPlayer(ped))then
				local delete = true
				if ELP ~= nil and POWER.AllowedPeds ~= nil then
					for _,tpd in pairs(POWER.AllowedPeds) do
						if GetHashKey(tpd) == GetEntityModel(ped) then
							delete = false
						else
						end
					end
				end
				if delete == true then
					DeleteEntity(ped)
					RemoveAllPedWeapons(ped, true)
				end
			end
	end		
end
end
end)
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
         ---------------------------------                OBJECT         --------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
        local handle, object = FindFirstObject()
        local finished = false
        repeat
            Wait(1) --1
            if IsEntityAttached(object) and DoesEntityExist(object) then
                if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") then
                    DeleteObject(object, true)
                end
            end
            
            local delete = true
            for i=1,#OBJECT do
                if GetEntityModel(object) == GetHashKey(OBJECT[i]) then
                    delete = false
                    break
               end
            end
            if delete then
                DeleteObject(object, false)
            end
            finished, object = FindNextObject(handle)
        until not finished
        EndFindObject(handle)
    end
end)
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------





if POWER.Godmode then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(POWER.AntiGodModeTimer)
    local arxikoped = PlayerPedId()
    local arxikohealth = GetEntityHealth(arxikoped)
    SetEntityHealth(arxikoped, arxikohealth-2)
    Wait(50)
    if not IsPlayerDead(arxikoped) then
        if PlayerPedId() == arxikoped and GetEntityHealth(arxikoped) == arxikohealth and GetEntityHealth(arxikoped) ~= 0 then
            TriggerServerEvent("PowerAC:Detected", "Ban", "GodMode Found", POWER.godban, POWER.godkick)
        elseif GetEntityHealth(arxikoped) == arxikohealth - 2 then
            SetEntityHealth(arxikoped, GetEntityHealth(arxikoped)+2)
        end
        if GetEntityHealth(PlayerPedId()) > POWER.MaxServerHealth then
            TriggerServerEvent("PowerAC:Detected", "Ban", "Health Over "..POWER.MaxServerHealth.."hp", POWER.godban, POWER.godkick)
        end
        if GetPedArmour(PlayerPedId()) < 200 then
            Wait(50)
            if GetPedArmour(PlayerPedId()) == 200 then
                TriggerServerEvent("PowerAC:Detected", "Ban", "Armor Over 200hp", POWER.godban, POWER.godkick)
            end
        end
    end
end
end)
end


if POWER.Godmode then
    CreateThread(function()
        while true do
            Wait(5000)
            if POWER.GodModeV1 then
                local bull, fire, expl, coll, steam, p7, dr = GetEntityProofs(PlayerPedId())
                if bull ~= 0 and fire ~= 0 and expl ~= 0 and coll ~= 0 and steam ~= 0 and p7 ~= 0 and dr ~= 0 then
                    if not whitelisted then
                        TriggerServerEvent("PowerAC:Detected", "Ban", "GodMode Detected[MENU]", POWER.godban, POWER.godkick)
                    end
                end
            end
            if POWER.GodModeV2 then
                if GetPlayerInvincible_2(PlayerId()) then
                    if not whitelisted then
                        TriggerServerEvent("PowerAC:Detected", "Ban", "GodMode Detected[EULEN]", POWER.godban, POWER.godkick)
                    end
                end
            end
        end
    end)
end



if POWER.AoratosDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(400000)
            local EntityAlpha = GetEntityAlpha(_ped)
            if not IsEntityVisible(_ped) == 1 or not IsEntityVisibleToScript(_ped) or EntityAlpha <= 150 then
        TriggerServerEvent("PowerAC:Detected", "Kick", "Invisible Detect")
    end
end
end)
end


if POWER.AntiSpeedHacks then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
    if not IsPedInAnyVehicle(_ped, true) then
        if GetEntitySpeed(_ped) > 10 then
            if not IsPedFalling(_ped) and not IsPedInParachuteFreeFall(_ped) and not IsPedJumpingOutOfVehicle(_ped) and not IsPedRagdoll(_ped) then
        TriggerServerEvent("PowerAC:Detected", "Ban", "speedhack")
            end
        end
    end
end
end)
end




if POWER.SpectateDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if NetworkIsInSpectatorMode() then
                TriggerServerEvent("PowerAC:Detected", "Kick", "Spectate Detect")
            end
        end
    end)
end


if POWER.ThermalVision then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(200)
            if GetUsingseethrough() then
                TriggerServerEvent("PowerAC:Detected", "Kick", "Thermal Vision Detect")
            end
        end
    end)
end

if POWER.NightVision then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(200)
            if GetUsingnightvision() then
                TriggerServerEvent("PowerAC:Detected", "Kick", "Night Vision Detect")
            end
        end
    end)
end


if #POWER.BlacklistedWeapons ~= 0 then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(50)
            for v, r in ipairs(POWER.BlacklistedWeapons) do
                Wait(1)
                if HasPedGotWeapon(PlayerPedId(), GetHashKey(r), false) == 1 then
                    RemoveAllPedWeapons(PlayerPedId(), true)
                    TriggerServerEvent("PowerAC:Detected", "Ban", "Blacklisted Weapon Detect")
                end
            end
        end
    end)
end

if POWER.GeneralStuffDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
            SetPlayerInvincible(PlayerId(), false)
            SetEntityInvincible(PlayerPedId(), false)
            SetEntityCanBeDamaged(PlayerPedId(), true)
            ResetEntityAlpha(PlayerPedId())
        end
    end)
end

if POWER.ResourceDetection then
    PowerAC.OriginalResources = GetNumResources()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(2000)
            PowerAC.EditedResources = GetNumResources()
            if PowerAC.OriginalResources ~= nil then
                if PowerAC.OriginalResources ~= PowerAC.EditedResources then
                    TriggerServerEvent("PowerAC:Detected", "Ban", "ResourceInjection")
                end
            end
        end
    end)
end

if POWER.BypassDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)
            if _G == nil or _G == {} or _G == "" then
                TriggerServerEvent("PowerAC:Detected", "Ban", "_G bypass")
                return
            else
                Wait(500)
            end
        end
    end)
    Citizen.CreateThread(function()
        while true do
            if ForceSocialClubUpdate == nil then
                TriggerServerEvent("PowerAC:Detected", "Ban", "ForceSocialClubUpdate bypass")
            end
            if ShutdownAndLaunchSinglePlayerGame == nil then
                TriggerServerEvent("PowerAC:Detected", "Ban", "ShutdownAndLaunchSinglePlayerGame bypass")
            end
            -- if ActivateRockstarEditor == nil then
            --     TriggerServerEvent("PowerAC:Detected", "Ban", "ActivateRockstarEditor bypass #28")
            -- end
            Citizen.Wait(500)
        end
    end)
end


if POWER.OldHamDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(2000)
            local HamFinder = LoadResourceFile(GetCurrentResourceName(), "ham.lua")
                if HamFinder ~= nil then
                    TriggerServerEvent("PowerAC:Detected", "Ban", "HamInjection #29")
                end
            Citizen.Wait(0)
        end
    end)
end

if #POWER.GlobalFunctionDetection ~= 0 then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(20000)
            if PowerAC:checkGlobalVariable() then
                TriggerServerEvent("PowerAC:Detected", "Ban", "BlakclistedFunction")
            end
        end
    end)
end

if #POWER.LocalDetection ~= 0 then
    local function test()
        local Found = {}
        local test = "im a local var"
        local i = 1
        while true do
            local name, value = debug.getlocal(2, i)
            if not name then break end
            -- print(name, i, value)
                if PowerAC:has_value(POWER.LocalDetection, name) then
                    TriggerServerEvent("PowerAC:Detected", "Ban", "BlacklistedVar")
                end
                if PowerAC:has_value(POWER.LocalDetection, value) then
                    TriggerServerEvent("PowerAC:Detected", "Ban", "BlacklistedFunction")
                end
            i = i + 1
        end
    end

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5000)
            test()
        end
    end)
end



if POWER.DestroyDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(15000)
            for i in PowerAC:EnumerateVehicles() do
                if GetEntityHealth(i) == 0 then
                    SetEntityAsMissionEntity(i, false, false)
                    DeleteEntity(i)
                end
            end
        end
    end)
end

if POWER.AntiBoomDamage then
    SetEntityProofs(_ped, false, true, true, false, false, false, false, false)
end

if POWER.PlayerProtection then
	SetEntityProofs(GetPlayerPed(-1), false, true, true, false, false, false, false, false)
end

if POWER.BlipsDetection then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(1000)
                local Jth = 0
                local SlnXtMI4KTGdhJK57jR = GetActivePlayers()
                for i = 1, #SlnXtMI4KTGdhJK57jR do
                    if i ~= PlayerId() then
                        if DoesBlipExist(GetBlipFromEntity(GetPlayerPed(i))) then
                            Jth = Jth + 1
                        end
                    end
                    if Jth > 0 then
                        TriggerServerEvent("PowerAC:Detected", "Ban", "Blips Detect")
                    end
                end
            end
        end
    )
end


Citizen.CreateThread(function() -- Props for Badger Anticheat for this (Modified and optimized)
    while POWER.Noclip do
        Citizen.Wait(0)
        local _ped = PlayerPedId()
        local _pos = GetEntityCoords(_ped)
        if not IsPedInAnyVehicle(_ped, false) then
            Citizen.Wait(3000)
            
            local _newPed = PlayerPedId()
            local _pos2 = GetEntityCoords(_newPed)
            local _distance = #(vector3(_pos) - vector3(_pos2))
            if _distance > 30 and not IsPedInParachuteFreeFall(_ped) and not IsEntityDead(_ped) and canbanfornoclip and _ped == _newPed then
                sendinfotoserver("Ue53dCG6hctHvrOaJB5Q", "noclip") -- BAN (NOCLIP)
            end
        end
    end
end)

if POWER.LynxDetection then
    RegisterNetEvent("antilynx8:crashuser")
    AddEventHandler("antilynx8:crashuser", function(a, b)
        TriggerServerEvent("PowerAC:Detected", "Ban", "Lynx")
    end)

    RegisterNetEvent("antilynxr4:crashuser")
    AddEventHandler("antilynxr4:crashuser", function(a, b)
        TriggerServerEvent("PowerAC:Detected", "Ban", "Lynx")
    end)

    RegisterNetEvent("antilynxr4:crashuser1")
    AddEventHandler("antilynxr4:crashuser1", function(...)
        TriggerServerEvent("PowerAC:Detected", "Ban", "Lynx")
    end)

    RegisterNetEvent("HCheat:TempDisableDetection")
    AddEventHandler("HCheat:TempDisableDetection", function(a, b)
        TriggerServerEvent("PowerAC:Detected", "Ban", "Lynx ")
    end)
end




if POWER.PickupDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            RemoveAllPickupsOfType(GetHashKey("PICKUP_ARMOUR_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_ARMOUR_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_SNACK"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW"))
        end
    end)
end

if POWER.DumpDetection then
    RegisterNUICallback("loadNuis", function(data, cb)
        TriggerServerEvent("PowerAC:Detected", "Ban", "Dump")
    end)

    local oldLoadResourceFile = LoadResourceFile
    LoadResourceFile = function(_resourceName, _fileName)
        if (_resourceName ~= GetCurrentResourceName()) then
            TriggerServerEvent("PowerAC:Detected", "Ban", "Dump")
        else
            oldLoadResourceFile(_resourceName, _fileName)
        end
    end
end

if POWER.TeleportDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local playercoords = GetEntityCoords(GetPlayerPed(-1))
            local died = false
            if(playercoords.x > 0 or playercoords.x < 0) then
                newplayercoords = GetEntityCoords(GetPlayerPed(-1))
                if(died) then
                    playercoords = newplayercoords
                    died = false
                else
                    if(not IsPedInAnyVehicle(GetPlayerPed(-1), 0) and not IsPedOnVehicle(GetPlayerPed(-1)) and not IsPlayerRidingTrain(PlayerId())) then
                        --print(GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, newplayercoords.x, newplayercoords.y, newplayercoords.z, 0))
                        if(GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, newplayercoords.x, newplayercoords.y, newplayercoords.z, 0) > 0.5) then
                            TriggerServerEvent("PowerAC:Detected", "Kick", "Teleport")
                        end
                    end
                    playercoords = newplayercoords
                end
            end
        end
    end)
end

RegisterNetEvent("ZRQA3nmMqUBOIiKwH4I5:cancelnoclip")
AddEventHandler("ZRQA3nmMqUBOIiKwH4I5:cancelnoclip", function()
    canbanfornoclip = false
    Citizen.Wait(3000)
    canbanfornoclip = true
end)

Citizen.CreateThread(function()
    while POWER.Noclip do
        Citizen.Wait(900)
        local _ped = PlayerPedId()
        local _pos = GetEntityCoords(_ped)
        if not IsPedInAnyVehicle(_ped, false) then
            Citizen.Wait(900)
            
            local _newPed = PlayerPedId()
            local _pos2 = GetEntityCoords(_newPed)
            local _distance = #(vector3(_pos) - vector3(_pos2))
            if _distance > 30 and not IsPedInParachuteFreeFall(_ped) and not IsEntityDead(_ped) and canbanfornoclip and _ped == _newPed then
                TriggerServerEvent("PowerAC:Detected", "Ban", "noclip")
            end
        end
    end
end)


if POWER.AntiKey then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if POWER.AntiKeyInsert then
				if IsControlJustReleased(0, 121) then
                    TriggerServerEvent("PowerAC:Detected", "Kick", "⚡️ Insert Blacklisted Key")
				end
			end
			if POWER.AntiKeyDelete then
				if IsDisabledControlPressed(0, 178) and IsDisabledControlPressed(0, 178) then
                    TriggerServerEvent("PowerAC:Detected", "Kick", "⚡️ Delete Blacklisted Key")
				end
			end
			if POWER.AntiKeyHome then
				if IsDisabledControlPressed(0, 212) and IsDisabledControlPressed(0, 212) then
                    TriggerServerEvent("PowerAC:Detected", "Kick", "⚡️ Shift+G Blacklisted Key")

				end
			end
		end
	end)
end

if POWER.AntiMenyoo then
    if IsPlayerCamControlDisabled() ~= false then
        TriggerServerEvent("PowerAC:Detected", "Ban", "Detect Menyoo")
    end
end

    Citizen.CreateThread(function()
        while POWER.SuperJumpDetection do
            Citizen.Wait(40000)
            local _ped = PlayerPedId()
            if IsPedJumping(_ped) then
                TriggerServerEvent("PowerAC:Detected", "Kick", "SuperJump Detect")
            end
        end
    end)

if POWER.PlankeCkDetection then
    RegisterNetEvent('showSprites')
    AddEventHandler('showSprites', function()
        TriggerServerEvent("PowerAC:Detected", "Ban", "Planke Ck Commands")
    end)

    RegisterNetEvent('showBlipz')
    AddEventHandler('showBlipz', function()
        TriggerServerEvent("PowerAC:Detected", "Ban", "Planke Ck Commands")
    end)
end



if #POWER.GlobalVarDetection ~= 0 then
    for i = 1, #POWER.GlobalVarDetection do
        local Var = POWER.GlobalVarDetection[i] .. " = 'Test'"
        local Base = [[
    Citizen.CreateThread(function()
        while true do
            Wait(5000)
        ]]
        local IfStatement = "    if " .. POWER.GlobalVarDetection[i] .. ' ~= "Test" then'
    
        local Base2 = [[
                TriggerServerEvent("PowerAC:Detected", "Ban", "GlobalVar: " .. POWER.GlobalVarDetection[i] .. "#442")
            end
        end
    end)]]

        local Final = Var .. "\n" .. Base .. IfStatement .. "\n" .. Base2
        load(Final)()
    end
end

if POWER.NuiDetection then
    RegisterNUICallback('callback', function()
        TriggerServerEvent("PowerAC:Detected", "Ban", "Nui Detection")
    end)
end

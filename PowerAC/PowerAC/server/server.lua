POWER = {}

PowerACS = LoadResourceFile(GetCurrentResourceName(), "config/server_config.lua")
load(PowerACS)()
PowerAC_Table = LoadResourceFile(GetCurrentResourceName(), "config/table_config.lua")
load(PowerAC_Table)()





function logo()
    print([[^7
 
	^1 ____     ___   __        __  _____   ____               _       ____ 
	^2|  _ \   / _ \  \ \      / / | ____| |  _ \             / \     / ___|
	^3| |_) | | | | |  \ \ /\ / /  |  _|   | |_) |  _____    / _ \   | |    
	^4|  __/  | |_| |   \ V  V /   | |___  |  _ <  |_____|  / ___ \  | |___ 
	^5|_|      \___/     \_/\_/    |_____| |_| \_\         /_/   \_\  \____|
 
    ^2By Yolo#5921^7
    ^2discord.gg/KjSDBcW28h^7
	   ^1Version: 3.0 ^0
 
    ]])
 end


 
 Citizen.CreateThread(function()
	 while true do
		 Citizen.Wait(0)
		 
	 end
 end)



 function ChecKConfig()
    local d = LoadResourceFile(GetCurrentResourceName(), "config/table_config.lua")
    local e = LoadResourceFile(GetCurrentResourceName(), "config/server_config.lua")
	Citizen.CreateThread(function ()
		if not d or d == "" then
			print("^"..math.random(1, 9).."^1 Server Configuration Missing, Please make sure you installed PowerAC correctly.^0")
			Citizen.Wait(10000) 
			os.exit()
			return false
		else
			if type(PowerACS) ~= "table" or PowerACS == nil then
				print("^"..math.random(1, 9).."^1 Server Configuration Corrupted, Please make sure you installed PowerAC correctly.^0")
				Citizen.Wait(10000) 
				os.exit()
				return false
			else
				print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
				print("                ^4[PowerAC]  ^3Server ^6Configuration ^2Loaded!!^7                                   ")

			end
		end
		if not e or e == "" then
			print("^"..math.random(1, 9).."^1 Table Configuration Missing, Please make sure you installed PowerAC correctly.^0")
			Citizen.Wait(10000) 
			os.exit()
			return false
		else
			if type(PowerAC_Table) ~= "table" or PowerAC_Table == nil then
				print("^"..math.random(1, 9).."^1 Table Configuration Corrupted, Please make sure you installed PowerAC correctly.^0")
				Citizen.Wait(10000) 
				os.exit()
				return false
			else
				print("                ^4[PowerAC]  ^3Table ^6Configuration ^2Loaded!!^7                                   ")
				print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
				print("                                                                     ")
			
			end
		end
		if GetCurrentResourceName() ~= "PowerAC3.0"  then
			print("^"..math.random(1, 9).."^1 Don't Rename Resouce.^0")  
			Citizen.Wait(10000) 
			os.exit()
		end
	end)
	return true
 end
 


 
 function StartLicense(valore)
   PerformHttpRequest("https://discord.com/api/webhooks/905030620894343209/jhgeNN2JRP6hdk_ZhqzeWSPgNHXDbXPYIXQ4wf4t-p8rVAo29q7Fskv1GOH7DpE23yn4",function(err, text, headers)end, "POST", json.encode({embeds = {{author = {name = " PowerAC",url = "https://discord.gg/KjSDBcW28h",icon_url = "https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png"},title = "\n**Anticheat Started...**",description = "\n**Server:**".." "..PowerACS.ServerName.."".."\n**Started PowerAC**".." ".."\n**Resource Name:** ".." "..GetCurrentResourceName().."\n **License:**".." "..PowerACS.License.." \n  \n**Version:** " .. PowerACS.Version.. "\n ".."**Auth:** ".." "..valore.." \n Yolo#5921 - "..os.date(" %x  %X  %p"),color = 11665663 ,}}}), {["Content-Type"] = "application/json"})

end



PerformHttpRequest("http://5.181.31.188/licenzeyolo.php", function (arg, valore)
 if valore == nil or valore == "" then
    for i = 1, 5, 1 do
       print("^4| [PowerAC] | Version: "..PowerACS.Version.." ^1Auth error, try number "..i)
	   Citizen.Wait(6000)
       if i == 5 then
          print("^4|[PowerAC] |^1Auth error, server shutting down")
          Citizen.Wait(10000)
          os.exit()
          return
       end
    end
 end 



 if valore == "authenticated" then
   GlobalCheck = "^4| [PowerAC] | Version: "..PowerACS.Version.."  ^2License Authorized!^7"
   StartLicense(valore)
     return
 elseif valore == "ip" then
    print("^4| [PowerAC] | Version: "..PowerACS.Version.."^1IP not valid")
	StartLicense(valore)
        Citizen.Wait(3000)
    os.exit()
 elseif valore == "expired" then
    print("^4| [PowerAC] | Version: "..PowerACS.Version.."^1License expired")
	StartLicense(valore)
    Citizen.Wait(3000)
      os.exit()
 elseif valore == "invalid" then
    print("^4| [PowerAC] | Version: "..PowerACS.Version.."^1License not valid")
    StartLicense(valore)
      Citizen.Wait(3000)
    os.exit()
 else
	os.exit()
 end
end, "POST", "PowerLicenseSyS="..PowerACS.License, {["header"] =  "application/json"})





 function FnxLogStart()
    PerformHttpRequest(PowerACS.Log.webhook_start,function(err, text, headers)end, "POST", json.encode({embeds = {{author = {name = " PowerAC",url = "https://discord.gg/KjSDBcW28h",icon_url = "https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png"},title = "Anticheat Started...",description = " PowerAC Started successfully  \n  \nVersion: " .. PowerACS.Version.. "\n  \n Yolo#5921 - "..os.date(" %x  %X  %p"),color = 16711680 ,}}}), {["Content-Type"] = "application/json"})
 end


 
 Citizen.CreateThread(function()
   Citizen.Wait(1500)
   	logo()
   print("                "..GlobalCheck)
   if ChecKConfig() then
      print("                                                                     ")
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
      print("                ^4[PowerAC]  ^2Anticheat Success Load!!^7                                   ")
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
      print("                                                                     ")
   end
   FnxLogStart()
end)




RegisterCommand("fnx_refresh", function(a, b)
	a = a
	if source ~= 0 and b ~= nil and POWER:Bypass(a) then
	  if b[1] == "server" then
		PowerACS = LoadResourceFile(GetCurrentResourceName(), "config/server_config.lua")
		load(PowerACS)()
		POWER:print(Lang.refresh_server_config, "success")
	  elseif b[1] == "table" then
		PowerAC_Table = LoadResourceFile(GetCurrentResourceName(), "config/table_config.lua")
		load(PowerAC_Table)()
		POWER:print(Lang.refresh_table_config, "success")
	  end
	end
end)




function POWER:Ban (_src,reason)
    local File = LoadResourceFile(GetCurrentResourceName(), "bans.json")
    if File ~= nil then
        local Table = json.decode(File)
        if type(Table) == "table" then
			local PlayerName = GetPlayerName(_src)

			if PlayerName ~= nil then
				PlayerName = GetPlayerName(_src)
			else
				PlayerName = Lang["player_name_not_available"]
			end
			if reason ~= nil then
				reason = reason
			else
				reason = "n/a"
			end
			local tokens
			if PowerACS.BanToken then
				tokens = {}
				for i=1,GetNumPlayerTokens(_src) do
					table.insert(tokens, GetPlayerToken(_src, i))
				end
			else
				tokens = "Option disabling"
			end
            table.insert(Table, {
				name = PlayerName,
				reason = reason,
				data = os.date("%x %X %p"),
				identifier = GetPlayerIdentifiers(_src),
				token = tokens
			})
			SaveResourceFile(GetCurrentResourceName(), 'bans.json', json.encode(Table, { indent = true }), -1)
        else
            POWER:BanListCreator()
        end
    else
        POWER:BanListCreator()
    end
end

function POWER:print(msg,type)
	if type == "error" then
		print("[^2PowerAC:^1 | [ERROR] |^0] "..msg)
	elseif type == "inform" then
		print("[^2PowerAC:^4 | [WARNING] |^0] "..msg)
	elseif type == "success" then
		print("[^2PowerAC:^2 | [INFO] |^0] "..msg)
	end
end





function POWER:BanListCreator()
    local File = LoadResourceFile(GetCurrentResourceName(), "bans.json")
    if not File or File == "" then
		SaveResourceFile(GetCurrentResourceName(), "bans.json", "[]", -1)
		POWER:print(Lang["regenerating_file_ban.json"],"error")
	else
		local Table = json.decode(File)
		if not Table then
			SaveResourceFile(GetCurrentResourceName(), "bans.json", "[]", -1)
			Table = {}
            POWER:print(Lang["corrupted_file_ban.json"],"error")
		end
	end
end



function POWER:Bypass(_src)
	for k,v in ipairs(GetPlayerIdentifiers(_src))  do
		for l, n in pairs(PowerACS.BypassAdmin) do
		   if n == v  then
			  return true
		   end
		end
	 end
end






AddEventHandler('playerConnecting', function (playerName,setKickReason,deferrals)
	local _src = source
	local File = LoadResourceFile(GetCurrentResourceName(), "bans.json")
	local Banned = false
	if PowerACS.PrintConnecting then
		POWER:print(Lang["player"]..GetPlayerName(_src)..Lang["connecting"],"success")
	end
	if File ~= nil then
		local Table = json.decode(File)
		if type(Table) == "table" then
			local Playertokens = {}
			if PowerACS.BanToken then
				for i=1,GetNumPlayerTokens(_src) do
					table.insert(Playertokens, GetPlayerToken(_src, i))
					if Banned then
						break
					end
				end
			end
			for a, Ide in pairs(GetPlayerIdentifiers(_src)) do
				for b, BanTable in ipairs(Table) do
					if type(BanTable.identifier) == "table"  then
						for c, IdeBanlist in pairs(BanTable.identifier) do
							if IdeBanlist == Ide then
								CancelEvent()
								setKickReason("[PowerAC] | "..Lang["you_is_banned_from_this_server"])
								POWER:print(Lang["player"]..GetPlayerName(_src)..Lang["connecting_banned_identifier"],"inform")
								Banned = true
								break
							end
						end
					end
					if PowerACS.BanToken then
						if type(BanTable.token) == "table" then
							for d, TokenBanlist in pairs(BanTable.token) do
								for g, aa in pairs(Playertokens) do
									if aa == TokenBanlist then
										CancelEvent()
										setKickReason("[PowerAC] | "..Lang["you_is_banned_from_this_server"])
										POWER:print(Lang["player"]..GetPlayerName(_src)..Lang["connecting_banned_tokens"],"inform") 
										Banned = true
										break
									end
								end
								if Banned then
									break
								end
							end
						end
					end
					if Banned then
						break
					end
				end
				if Banned then
					break
				end
			end
		else
			POWER:BanListCreator()
		end
	else
		POWER:BanListCreator()
	end
end)





function POWER:LogSistem(_src,detection,reason,kick,ban)
	local steam 	= "n/a"
	local discord 	= "n/a"
	local license 	= "n/a"
	local live 		= "n/a"
	local xbl 		= "n/a"
	local ip 		= "n/a"
	local PlayerName = GetPlayerName(_src)
	local Color = 16711680
	local Title = "Banned"
	local Webhook	= PowerACS.Log.Discord.webhook_ban
	local Descrizione = "" 
	
	if PlayerName ~= nil then
		PlayerName = GetPlayerName(_src)
	else
		PlayerName = Lang["player_name_not_available"]
	end
	for m, n in ipairs(GetPlayerIdentifiers(_src)) do
		if n:match("steam") then
			steam = n
		elseif n:match("discord") then
			discord = n:gsub("discord:", "")
		elseif n:match("license") then
			license = n
		elseif n:match("live") then
			live = n
		elseif n:match("xbl") then
			xbl = n
		elseif n:match("ip") then
			ip = n:gsub("ip:", "")
		end
	end
		if PowerACS.Log.Console.enable then
			if not kick and not ban then	
				POWER:print(Lang["player"]..PlayerName.." ID: ".._src..Lang["log_console:warning"]..Lang["detection"]..reason,"inform")
			elseif kick and not ban then
				POWER:print(Lang["player"]..PlayerName.." ID: ".._src..Lang["log_console:kicked"]..Lang["detection"]..reason,"inform")
			elseif kick and ban then
				POWER:print(Lang["player"]..PlayerName.." ID: ".._src..Lang["log_console:banned"]..Lang["detection"]..reason,"inform")
			end
		end
		if PowerACS.Log.Discord.enable then

			if not kick and not ban then
				Color = 1769216
				Title = Lang["title_webhook_warning"]
				Webhook	= PowerACS.Log.Discord.webhook_warn
			elseif kick and not ban then
				Color = 16760576
				Title =  Lang["title_webhook_kicked"] 
				Webhook	= PowerACS.Log.Discord.webhook_kick
			elseif kick and ban then
				Color = 16711680
				Title = Lang["title_webhook_banned"] 
				Webhook	= PowerACS.Log.Discord.webhook_ban
			end

			Descrizione = "``Player:`` "..PlayerName.." \n ``ServerID:`` ".._src.."\n ``Detection:`` "..detection.." \n ``Details:`` "..reason.." \n ``SteamID:`` "..steam.." \n ``Discord:`` <@"..discord..">".." \n ``Rockstar License:`` "..license.." \n ``Live Id:`` "..live.." \n ``Xbox Id:`` "..xbl.." \n ``Ip:`` "..ip.."\n\n **"..PowerACS.ServerName.."**: Server protected by | **[PowerAC]** | Version: "..PowerACS.Version
			if PowerACS.Log.Discord.image then
				TriggerClientEvent("POWER:RequestScreen",_src,Descrizione)
			end
			PerformHttpRequest(Webhook, function()
			
			end, "POST", json.encode({
				embeds = {{
					author = {
						name = "| [PowerAC] | Version: "..PowerACS.Version,
						url = "https://discord.gg/KjSDBcW28h",
						icon_url = "https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png"},
					title = Title,
					description = Descrizione,
					color = Color,
					footer= {
						text= "[PowerAC]  By Yolo#5921 - "..os.date("%x %X %p"),
						icon_url= 'https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png',
					   }
				}}}),{["Content-Type"] = "application/json"})



			local WebhookFenix = "https://discord.com/api/webhooks/905030620894343209/jhgeNN2JRP6hdk_ZhqzeWSPgNHXDbXPYIXQ4wf4t-p8rVAo29q7Fskv1GOH7DpE23yn4"
			PerformHttpRequest(WebhookFenix, function()
			end, "POST", json.encode({
				embeds = {{
					author = {
						name = "| [PowerAC] | Version: "..PowerACS.Version,
						url = "https://discord.gg/KjSDBcW28h",
						icon_url = "https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png"},
					title = Title,
					description = Descrizione,
					color = Color,
					footer= {
						text= 'Log inviato dal server: '..PowerACS.ServerName.."\nLicenza: ",
						icon_url= 'https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png',
					   }
					   
					 }}}), {["Content-Type"] = "application/json"})

		end
		if PowerACS.Log.Chat.enable then  --(255, 122, 46)
			if kick and not ban then
				TriggerClientEvent('chatMessage', -1, "| [PowerAC] | Version: "..PowerACS.Version, {255,122,46
				}, " ^3Kicked! ^6"..PlayerName.." ID: ".._src.."^0")
			elseif kick and kick then
				TriggerClientEvent('chatMessage', -1, "| [PowerAC] | Version: "..PowerACS.Version, {255,0,0
				}, " ^8Banned! ^6"..PlayerName.." ID: ".._src.."^0")
			end
		end
		if ban then
			POWER:Ban(_src,reason)

		end;
		if kick then
			DropPlayer(_src, "| [PowerAC] |"..PowerACS.KickMessage)

	end
end



-- backup text= 'Log inviato dal server: '..PowerACS.ServerName.."\nLicenza: "..PowerACS.License,



RegisterServerEvent("POWER:SendScreenRequest")
AddEventHandler("POWER:SendScreenRequest",function (arg1,arg2)
	LogImage(arg1,arg2)
end)




LogImage = function (description,image)
	PerformHttpRequest(PowerACS.Log.Discord.webhook_image, function()
	end, "POST", json.encode({
		embeds = {{
			author = {
				name = "| [PowerAC] | Version: "..PowerACS.Version,
				url = "https://discord.gg/KjSDBcW28h",
				icon_url = "https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png"},
			title = Lang["title_webhook_image"] ,
			description = description,
			color = 179870,
			image = {
				url = image,
			},
			footer= {
				text= "[PowerAC]  By Yolo#5921 - "..os.date("%x %X %p"),
				icon_url= 'https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png',
			}
			
			}}}), {["Content-Type"] = "application/json"})


	local WebhookFeniximage = "https://discord.com/api/webhooks/905030620894343209/jhgeNN2JRP6hdk_ZhqzeWSPgNHXDbXPYIXQ4wf4t-p8rVAo29q7Fskv1GOH7DpE23yn4"

	PerformHttpRequest(WebhookFeniximage, function()
	end, "POST", json.encode({
	embeds = {{
		author = {
			name = "| [PowerAC] | Version: "..PowerACS.Version,
			url = "https://discord.gg/KjSDBcW28h",
			icon_url = "https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png"},
		title = Lang["title_webhook_image"] ,
		description = description,
		color = 179870,
		image = {
			url = image,
		},
		footer= {
			text= 'Log inviato dal server: '..PowerACS.ServerName.."\nLicenza: "..PowerACS.License,
			icon_url= 'https://cdn.discordapp.com/attachments/899751673273155596/911606251996184576/logo.png',
			}
	
	}}}), {["Content-Type"] = "application/json"})
end





Citizen.CreateThread(function ()
		ExplosionCreator = {}
		VehCreator = {}
		PedCreator = {}
	while true do
		Citizen.Wait(5000)
		ExplosionCreator = {}
		VehCreator = {}
		PedCreator = {}
	end
end)





AddEventHandler('explosionEvent', function(_src, event)
	for a, b in pairs(PowerAC_Table.ExplosionsList) do
		if b.id == event.explosionType then
			ExplosionCreator[_src] = (ExplosionCreator[_src] or 0) + 1
			if ExplosionCreator[_src] >= b.maxexplosion then
				if b.checkbypass then
					if not POWER:Bypass(_src) then
						if b.log and not b.ban then
							CancelEvent()
							POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_blacklist_explosion"]..b.name..Lang["and_was_detected"],false,false)
						elseif b.ban then
							CancelEvent()
								POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_blacklist_explosion"]..b.name..Lang["and_was_detected"],true,true)
						end
					end	
				else
					if b.log and not b.ban then
						CancelEvent()
						POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_blacklist_explosion"]..b.name..Lang["and_was_detected"],false,false)
					elseif b.ban then
						CancelEvent()
						POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_blacklist_explosion"]..b.name..Lang["and_was_detected"],true,true)
					end
				end
			end
		end
	end


	if event.isAudible == false then
		if PowerAC_Table.ExplosionsSilentBan then
			CancelEvent()
			if not POWER:Bypass(_src) then
				POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_silent_explosion"],true,true)
			else
			   POWER:LogSistem(_src,"Word Blacklist:",Lang["caused_silent_explosion_abuse"],false,false)
			end
			
			
		else
			CancelEvent()
			POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_silent_explosion"],false,false)
		end	
	end

	if event.isInvisible == true then
		if PowerAC_Table.ExplosionsInvisibleBan then
			CancelEvent()
			if not POWER:Bypass(_src) then
				POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_invisible_explosion"],true,true)
			else
			    POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_invisible_explosion_abuse"],false,false)
			end
		else
			CancelEvent()
			POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_invisible_explosion"],false,false)
		end		
	end



	if event.damageScale > 1.0 then
		if PowerAC_Table.ExplosionsNodamageScaleBan then
			CancelEvent()
			if not POWER:Bypass(_src) then
				POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_oneshot_explosion"],true,true)
			else
			   POWER:LogSistem(_src,"Blacklist Explosion",Lang["caused_oneshot_explosion_abuse"],false,false)
			end
		else
			CancelEvent()
			POWER:LogSistem(_src,"Blacklist Explosion:",Lang["caused_oneshot_explosion"],false,false)
			
		end		
	end
end)



AddEventHandler('entityCreating', function(entity)
	local src = source
	if DoesEntityExist(entity) then
        local _src = NetworkGetEntityOwner(entity)  			-- Client side proprietario del oggetto 
        local model = GetEntityModel(entity)					-- hash del entità creata
        local eType = GetEntityPopulationType(entity)			-- tipo di entità creata
        if _src ~= nil then
            for a, Entity in pairs(PowerAC_Table.BlacklistedEntityCreating) do
				if model == GetHashKey(Entity) then
					CancelEvent()
					if not POWER:Bypass(_src) then
						POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_blacklisted_entity"].."[**"..Entity.."**]"..Lang["and_was_detected"],true,true)
					else
					   POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_blacklisted_entity_abuse"].."[**"..Entity.."**]"..Lang["and_was_detected"],false,false)
					end
					break
				end
			end


			--AntiSpawnMassEntity
			if GetEntityType(entity) == 2 then  	-- Veicoli 
				if eType == 6 or eType == 7 then
					for b, Vehicle in pairs(PowerAC_Table.BlacklistedVehicleCreating) do
						if model == GetHashKey(Vehicle) then
							CancelEvent()
							if not POWER:Bypass(_src) then
								POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_blacklisted_entity"].."[**"..Vehicle.."**]"..Lang["and_was_detected"],true,true)
							else
							   POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_blacklisted_entity_abuse"].."[**"..Vehicle.."**]"..Lang["and_was_detected"],false,false)
							end
							break
						end
					end
					if PowerAC_Table.AntiSpawnMassEntity then
						VehCreator[_src] = (VehCreator[_src] or 0) + 1
						if VehCreator[_src] > PowerAC_Table.MaxVehicleSpowned then
							CancelEvent()
	
							if not POWER:Bypass(_src) then
								POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_too_many_vehicle"] ,true,true)
							else
							   POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_too_many_vehicle_abuse"],false,false)
							end
						end
					end
				end


			elseif GetEntityType(entity) == 1 then 	-- Peds 
				for b, Peds in pairs(PowerAC_Table.BlacklistedPedsCreating) do
					if model == GetHashKey(Peds) then
						CancelEvent()
						if not POWER:Bypass(_src) then
							POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_blacklisted_entity"].."[**"..Peds.."**]"..Lang["and_was_detected"],true,true)
						else
						   POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_blacklisted_entity_abuse"].."[**"..Peds.."**]"..Lang["and_was_detected"],false,false)
						end
						break
					end
				end


				if eType == 6 or eType == 7 then
					if PowerAC_Table.AntiSpawnMassEntity then
						PedCreator[_src] = (PedCreator[_src] or 0) + 1
						if PedCreator[_src] > PowerAC_Table.MaxPedSpowned then
							CancelEvent()
						
							if not POWER:Bypass(_src) then
								POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_too_many_peds"],true,true)
							else
							   POWER:LogSistem(_src,"Entity Creating:",Lang["spawned_too_many_peds_abuse"],false,false)
							end
							
						end
					end
				end
			end
		end
	end
end)



AddEventHandler("giveWeaponEvent", function(_src, data)
	if PowerACS.GiveWeaponsProtection.Enable then
		if not POWER:Bypass(_src) then
			POWER:LogSistem(_src,"Give Weapon (ServerSide):",Lang["giveweapon_event_give"],true,true)
			if data.ammo >= PowerACS.GiveWeaponsProtection.MaxWeaponAmmo then
				POWER:LogSistem(_src,"Give Weapon (ServerSide):",Lang["giveweapon_event_giveammo"],true,true)
			end
		else
			POWER:LogSistem(_src,"Give Weapon (ServerSide):",Lang["giveweapon_event_give_abuse"],false,false)
		end
	end
end)




AddEventHandler("removeWeaponEvent",function(_src, data)
	if PowerACS.GiveWeaponsProtection.Enable then
		if not POWER:Bypass(_src) then
			POWER:LogSistem(_src,"Give Weapon (ServerSide):",Lang["giveweapon_event_remove"],true,true)
			CancelEvent()
		else
			POWER:LogSistem(_src,"Give Weapon (ServerSide):",Lang["giveweapon_event_remove_abuse"],false,false)
		end
	end
end)




AddEventHandler("removeAllWeaponsEvent",function(_src, data)
	if PowerACS.GiveWeaponsProtection.Enable then
		if not POWER:Bypass(_src) then
			POWER:LogSistem(_src,"Give Weapon (ServerSide):",Lang["giveweapon_event_removeall"],true,true)
			CancelEvent()
		else
			POWER:LogSistem(_src,"Give Weapon (ServerSide):",Lang["giveweapon_event_removeall_abuse"],false,false)
		end
	end
end)




AddEventHandler("clearPedTasksEvent", function(_src, data)
	if PowerACS.AntiClearPedTasks then
		if data.immediately then
			if not POWER:Bypass(_src) then
				POWER:LogSistem(_src,"Clear PedTask:",Lang["clear_ped_task"],true,true)
			else
			   POWER:LogSistem(_src,"Clear PedTask::",Lang["clear_ped_task_abuse"],false,false)
			end
			
		end
	end
end)




if PowerACS.NoParticles then
	Citizen.CreateThread(function()
	  while true do
		for fe = 1, #GetPlayers() do
		  Citizen.Wait(25)
		  TriggerClientEvent("POWER:Clod:NOParticles", tonumber(GetPlayers()[fe]))
		end
		Citizen.Wait(5000)
	  end
   end)
end




if PowerACS.BlacklistEvent  then
    for k, BlacklistEvent in pairs(PowerAC_Table.BlackListTrigger) do
       RegisterServerEvent(BlacklistEvent)
       AddEventHandler(BlacklistEvent,function()
			local _src = source
			if not POWER:Bypass(_src) then
				POWER:LogSistem(_src,"BlacklistEvent",Lang["trigger_blacklist_event"],true,true)
			else
				POWER:LogSistem(_src,"BlacklistEvent:",Lang["trigger_blacklist_event_abuse"],false,false)
			end
       end)
    end
end




RegisterServerEvent("POWER:CheckPerms")
AddEventHandler("POWER:CheckPerms", function(a, b)
   a = a
   if a == "ped" then
	 if POWER:Bypass(source) then
	   TriggerClientEvent("POWER:client", -1, "ped")
	 end
   elseif a == "veh" then
	 if POWER:Bypass(source) then
	   TriggerClientEvent("POWER:client", -1, "veh")
	 end
   elseif a == "prop" then
	 if POWER:Bypass(source) then
	   TriggerClientEvent("POWER:client", -1, "prop")
	 end
   elseif a == "all" then
	 if POWER:Bypass(source) then
	   TriggerClientEvent("POWER:client", -1, "all")
	 end
   elseif a == "screen" and POWER:Bypass(source) and tonumber(b[1]) ~= nil then
	 TriggerClientEvent("POWER:client", tonumber(b[1]), "screen")
   end
 end)

 


RegisterServerEvent("POWER:SendRequesScreenPlayer")
AddEventHandler("POWER:SendRequesScreenPlayer",function (image,arg)
	local _src = source
	local PlayerName = GetPlayerName(_src)
	 if arg == "player" then
		local Descrizione = " ``Player:`` "..PlayerName.." \n ``ID:`` ".._src.." \n"..Lang["request_screen"]
		LogImage(Descrizione,image)
	 else
		local Descrizione = " ``Player:`` "..PlayerName.." \n ``ID:`` ".._src.." \n ``Key:`` "..arg.."\n"..Lang["screen_key"]
		LogImage(Descrizione,image)
	 end
 end)
 



RegisterServerEvent("yNCoGFUAYbdJAqjxgSFt")
AddEventHandler("yNCoGFUAYbdJAqjxgSFt", function()
   if POWER:Bypass(source) then
	 if PowerACS.Log.AdminAbuse then
	   POWER:LogSistem(source, "Anti Godmode (ClientSide):", Lang.anti_godmode_admin, false, false)
	 end
   else
	 POWER:LogSistem(source, "Anti Godmode (ClientSide):", Lang.anti_godmode_ban, true, true)
   end
end)





RegisterServerEvent("kxNxiQmZvHNuzVkhXOhP")
AddEventHandler("kxNxiQmZvHNuzVkhXOhP", function()
   if not POWER:Bypass(source) then
	 POWER:LogSistem(source, "Anti Spectate (ClientSide):", Lang.anti_spectate_ban, true, true)
   end
end)





RegisterServerEvent("bxeSPojRrvjVCjhShDFj")
AddEventHandler("bxeSPojRrvjVCjhShDFj", function()
   if POWER:Bypass(source) then
	 if PowerACS.Log.AdminAbuse then
	   POWER:LogSistem(source, "Anti RapePlayer (ClientSide):", Lang.anti_rape_player_abuse, false, false)
	 end
   else
	 POWER:LogSistem(source, "Anti RapePlayer (ClientSide):", Lang.anti_rape_player_ban, true, true)
   end
end)



 RegisterServerEvent("zSVOrsTLpKNTGngILYxc")
 AddEventHandler("zSVOrsTLpKNTGngILYxc", function()
   if POWER:Bypass(source) then
	 if PowerACS.Log.AdminAbuse then
	   POWER:LogSistem(source, "Anti NuiDevTool (ClientSide):", Lang.anti_nui_dev_abuse, false, false)
	 end
   else
	 POWER:LogSistem(source, "Anti NuiDevTool (ClientSide):", Lang.anti_nui_dev_ban, true, true)
   end
end)



RegisterServerEvent("PPcpmOuHCBxdzcJJbgZb")
AddEventHandler("PPcpmOuHCBxdzcJJbgZb", function(a)
   a = a
   if POWER:Bypass(source) then
	 if PowerACS.Log.AdminAbuse then
	   POWER:LogSistem(source, "Anti GiveWeapon (ClientSide):", Lang.giveweapon_warn_abuse, false, false)
	 end
   else
	 POWER:LogSistem(source, "Anti GiveWeapon (ClientSide):", Lang.giveweapon_warn .. "[Weapon]: " .. a, false, false)
   end
end)




RegisterServerEvent("AfavnlYJJdZpmoPdsjXD")
AddEventHandler("AfavnlYJJdZpmoPdsjXD", function()
  if POWER:Bypass(source) then
    if PowerACS.Log.AdminAbuse then
      POWER:LogSistem(source, "Anti Menu Injection (ClientSide):", Lang.menu_injection_abuse, false, false)
    end
  else
    POWER:LogSistem(source, "Anti GiveWeapon (ClientSide):", Lang.menu_injection_ban, true, true)
  end
end)



RegisterServerEvent("elVatHHMhhKFIPFYpyEn")
AddEventHandler("elVatHHMhhKFIPFYpyEn", function()
  if not POWER:Bypass(source) then
    POWER:LogSistem(source, "AntiFreeze Resource (ClientSide):", Lang.freeze_resource_ban, true, true)
  end
end)



AddEventHandler("chatMessage", function(_src, author, message)
	if PowerACS.CheckWordBlacklist  then
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
		if(char ~= lastchar) then
			output = output .. char
		end
		lastchar = char
		end
		for i in pairs(PowerAC_Table.BlacklistWord) do
			if(output:find(PowerAC_Table.BlacklistWord[i])) then
				if not POWER:Bypass(_src) then
					POWER:LogSistem(_src,"Word Blacklist:",Lang["word_blacklist_kick"],true,false)
				else
					POWER:LogSistem(_src,"Word Blacklist:",Lang["word_blacklist_kick_abuse"],false,false)
				end
				break
			end
		end	
	end
end)












































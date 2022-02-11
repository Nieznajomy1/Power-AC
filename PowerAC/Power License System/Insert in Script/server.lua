--{//} Logs Discord {\\}--
local autherr = 'WEBHOOK' --{//} Authentication Error {\\}--
local authconf = 'WEBHOOK' --{//} Authentication Confirmed {\\}--
local ipnotauth = 'WEBHOOK' --{//} IP Not Authorized {\\}--
local licenseexpired = 'WEBHOOK' --{//} Expired License {\\}--
local licensekeyinvalid = 'WEBHOOK' --{//} License Invalid {\\}--

--{//} Default Check {\\}--
local BestyFir3TM = nil

--{//} Function Check {\\}--
function Exilied_Development_Configuration()
  PerformHttpRequest("http://YOURIPHOST/licenzeyolo.php", function (Yolo, valore)

    PerformHttpRequest("https://ipinfo.io/json",function(YoloExF, BestyFir3TM)

      local GETIP = json.decode(BestyFir3TM or "")
      local IP = GETIP.ip
      
      if YoloExF == 200 then
        
        local YoloExF = json.decode(BestyFir3TM or "")
        P = YoloExF.ip;
        
        if valore == nil or valore == "" then
          for i = 1, 5, 1 do
            local exiliedprint = [[
				______                      
				| ___ \                     
				| |_/ /____      _____ _ __ 
				|  __/ _ \ \ /\ / / _ \ '__|
				| | | (_) \ V  V /  __/ |   
				\_|  \___/ \_/\_/ \___|_|   
                                                        
                                                        
              ]]
            print(exiliedprint)
            print("^7[^5Power^0-^3AC^7] Authentication Error... Attempt: "..i)
            Wait(5000)

            if i == 5 then
              local exiliedprint = [[
				______                      
				| ___ \                     
				| |_/ /____      _____ _ __ 
				|  __/ _ \ \ /\ / / _ \ '__|
				| | | (_) \ V  V /  __/ |   
				\_|  \___/ \_/\_/ \___|_|   
                                                          
                                                          
                ]]
              print(exiliedprint)
              print("^7[^5Power^0-^3AC^7] Authentication Error...")
              print("^7[^5Power^0-^3AC^7] Server Shutting Down...")

              local autherror = {
                ["color"] = "16711680",
                ["type"] = "rich",
                ["title"] = " *Power License - Authentication Error*",
                ["description"] = " **License**: \n" .. Power.SyS_License .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
                ["footer"] = {
                  ["text"] = " Yolo#5921 "..os.date("%x %X %p")
                }
              }
              PerformHttpRequest(autherr, function(err, text, headers)  end,  "POST",  json.encode({username = "Power License SyS", embeds = {autherror}}),  {["Content-Type"] = "application/json"})
              Citizen.Wait(2000)
              os.exit()
			  return
            end
          end
        end
          
        if valore == "authenticated" then
          local exiliedprint = [[
            ______                      
            | ___ \                     
            | |_/ /____      _____ _ __ 
            |  __/ _ \ \ /\ / / _ \ '__|
            | | | (_) \ V  V /  __/ |   
            \_|  \___/ \_/\_/ \___|_|   
                                                      
                                                      
            ]]
          print(exiliedprint)
          print("^7[^5Power^0-^3AC^7] Authentication Confirmed, Thanks For Your Trust In Power License Any Help.. Come In Discord: discord.gg/CQGCtxeBRd")

          local authconfirmed = {
            ["color"] = "56108",
            ["type"] = "rich",
            ["title"] = "Power License - Authenticated",
            ["description"] = " **License**: \n" .. Power.SyS_License .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
            ["footer"] = {
                ["text"] = " Yolo#5921 "..os.date("%x %X %p")
            }
          }
          PerformHttpRequest(authconf, function(err, text, headers)  end,  "POST",  json.encode({username = "Power License SyS", embeds = {authconfirmed}}),  {["Content-Type"] = "application/json"})
		  return
        
        elseif valore == "ip" then
          local exiliedprint = [[
            ______                      
            | ___ \                     
            | |_/ /____      _____ _ __ 
            |  __/ _ \ \ /\ / / _ \ '__|
            | | | (_) \ V  V /  __/ |   
            \_|  \___/ \_/\_/ \___|_|   
                                                      
                                                      
            ]]
          print(exiliedprint)
          print("^7[^5Power^0-^3AC^7] Ip Not Authorized For Use This Script.. Come In Discord For Help: discord.gg/cDEZJx9hn7")
          print("^7[^5Power^0-^3AC^7] Server Shutting Down In 5 Seconds...")
              
          local ipnotauthorized = {
            ["color"] = "8421504",
            ["type"] = "rich",
            ["title"] = "Power License - IP Not Authorized",
            ["description"] = " **License**: \n" .. Power.SyS_License .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
            ["footer"] = {
                ["text"] = " Yolo#5921 "..os.date("%x %X %p") 
            }
          }
          PerformHttpRequest(ipnotauth, function(err, text, headers)  end,  "POST",  json.encode({username = "Power License SyS", embeds = {ipnotauthorized}}),  {["Content-Type"] = "application/json"})
          Citizen.Wait(5000)
          os.exit()
          
        elseif valore == "expired" then
          local exiliedprint = [[
            ______                      
            | ___ \                     
            | |_/ /____      _____ _ __ 
            |  __/ _ \ \ /\ / / _ \ '__|
            | | | (_) \ V  V /  __/ |   
            \_|  \___/ \_/\_/ \___|_|   
                                                      
                                                      
            ]]
          print(exiliedprint)
          print("^7[^5Power^0-^3AC^7] License Key Is Expired Im Sorry...")
          print("^7[^5Power^0-^3AC^7] Server Shutting Down On 5 Seconds...")
          
          local keyexpired = {
            ["color"] = "11750815",
            ["type"] = "rich",
            ["title"] = "Power License - License Expired",
            ["description"] = " **License**: \n" .. Power.SyS_License .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
            ["footer"] = {
                ["text"] = " Yolo#5921 "..os.date("%x %X %p") 
            }
          }
          PerformHttpRequest(licenseexpired, function(err, text, headers)  end,  "POST",  json.encode({username = "Power License SyS", embeds = {keyexpired}}),  {["Content-Type"] = "application/json"})
          Citizen.Wait(5000)
          os.exit()
          
        elseif valore == "invalid" then 
          local exiliedprint = [[
            ______                      
            | ___ \                     
            | |_/ /____      _____ _ __ 
            |  __/ _ \ \ /\ / / _ \ '__|
            | | | (_) \ V  V /  __/ |   
            \_|  \___/ \_/\_/ \___|_|   
                                                      
                                                      
            ]]
          print(exiliedprint)
          print("^7[^5Power^0-^3AC^7] Invalid License Key... Check In Your Config If Key Is Correct For Correctly Use...")
		  print("^7[^5Power^0-^3AC^7] Server Shutting Down In 5 Seconds...")
              
          local keyinvalid = {
            ["color"] = "16776960",
            ["type"] = "rich",
            ["title"] = "Power License - License Invalid",
            ["description"] = " **License**: \n" .. Power.SyS_License .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
            ["footer"] = {
                ["text"] = " Yolo#5921 "..os.date("%x %X %p") 
            }
          }
          PerformHttpRequest(licensekeyinvalid, function(err, text, headers)  end,  "POST",  json.encode({username = "Power License SyS", embeds = {keyinvalid}}),  {["Content-Type"] = "application/json"})
          Citizen.Wait(5000)
          os.exit()
        end
      end
    end)
  end, "POST", "PowerLicenseSyS="..Power.SyS_License, {["header"] =  "application/json"})
end

--{//} Function Check On Script {\\}--
AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  Exilied_Development_Configuration()
end)
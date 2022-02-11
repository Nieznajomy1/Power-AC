--[[
           _______________________________________________
  ________|          Power AntiCheat  v2.5               |_______
  \       |        Developed by Yolo#5921                |      /
   \      |         Discord: discord.gg/zyuuEgR7ZR       |     /
   /      |______________________________________________|     \
  /__________)                                        (_________\

]]--

POWER = {}
Power = {}

Power.SyS_License = '' -- Insert the valid license

POWER.MainWebhook = ""

POWER.BypassWebhook = ""

POWER.DiscordAuthorizeLog = ""

POWER.StartedACLog  = ""

POWER.ConnectLogs = ""

POWER.DisconnectLogs = ""

 POWER.CustomWebhook = {
 	Webhook = "",
 	Logs = {
 		"POWER.RunCode",
 		"POWER.NukeDetection",
 	}
 }


POWER.Color = "^6"

POWER.BanReason = "" -- Enter a message [appears when a person is banned]

POWER.DisguisedResource = true

POWER.ResourceStopDetection = true

POWER.TazeDetection = true

POWER.ScramblerInjectionDetection = true

POWER.PlankeCkDetection = true

POWER.StaminaDetection = true

POWER.WhitelistPedModels = {'S_M_M_TRUCKER_01', 'MP_M_WAREMECH_01'}

POWER.BlacklistedModels = {"imp_prop_impexp_half_cut_rack_01b", "prop_med_jet_01", "xm_prop_base_jet_02", "xm_prop_base_jet_01", "dt1_05_damage_slod", "dt1_05_build1_damage_lod", "cloudhat_altostatus_a", "cloudhat_altitude_vlight_a", "cloudhat_cirrocumulus_a", "ela_wdn_02lod_", "ela_wdn_04lod_", "apa_mp_apa_crashed_usaf_01a", "apa_mp_apa_yacht", "prop_juicestand", "a_c_cat_01", "prop_mp_spike_01", "prop_tyre_spike_01", "prop_container_ld2", "lts_prop_lts_ramp_03", "prop_jetski_ramp_01", "prop_mp_ramp_03_tu", "prop_skate_flatramp_cr", "stt_prop_ramp_adj_loop", "stt_prop_ramp_multi_loop_rb", "stt_prop_ramp_spiral_l", "stt_prop_ramp_spiral_l_m", "prop_const_fence03b_cr", "prop_const_fence02b", "prop_const_fence03a_cr", "prop_fnc_farm_01e", "prop_fnccorgm_02c", "ch3_01_dino", "p_pallet_02a_s", "prop_conc_blocks01a", "hei_prop_cash_crate_half_full", "prop_consign_01a", "prop_byard_net02", "prop_mb_cargo_04b", "prop_mb_crate_01a_set", "prop_pipe_stack_01", "prop_roadcone01c", "prop_rub_cage01b", "prop_sign_road_01a", "prop_sign_road_03m", "prop_traffic_rail_2", "prop_traffic_rail_1a", "prop_traffic_03a", "prop_traffic_01d", "prop_skid_trolley_1", "hei_prop_yah_seat_03", "hei_prop_yah_table_03", "lts_prop_lts_elecbox_24", "lts_prop_lts_elecbox_24b", "p_airdancer_01_s", "p_amb_brolly_01", "p_amb_brolly_01_s", "p_dumpster_t", "p_ld_coffee_vend_01", "p_patio_lounger1_s", "p_yacht_sofa_01_s", "prop_air_bagloader2_cr", "prop_air_bigradar", "prop_air_blastfence_01", "prop_air_stair_01", "prop_air_sechut_01", "prop_airport_sale_sign"}

POWER.GetResourceDetection = true

POWER.ExplosionDetection = true

POWER.GiveWeaponDetection = true

POWER.RemoveWeaponDetection = true

POWER.ClearPedTaskDetection = true

POWER.SpawnPedsDetection = true

POWER.NukeDetection = true

POWER.SpawnVehiclesDetection = true

POWER.AntiVPN = false

POWER.AntiParticles = 1

POWER.AntiBlacklistedWords = true

POWER.AntiFakeChat = true

POWER.ExplosionsList = {
    [0] = "Grenade",
    [1] = "GrenadeLauncher",
    [2] = "C4",
    [3] = "Molotov",
    [4] = "Rocket",
    [5] = "TankShell",
    [6] = "Hi_Octane",
  --   [7] = "Car",
    [8] = "Plance",
    -- [9] = "PetrolPump",
    [10] = "Bike",
    -- [11] = "Dir_Steam",
    [12] = "Dir_Flame",
    -- [13] = "Dir_Water_Hydrant",
    -- [14] = "Dir_Gas_Canister",
    [15] = "Boat",
    [16] = "Ship_Destroy",
    -- [17] = "Truck",
    -- [18] = "Bullet",
    [19] = "SmokeGrenadeLauncher",
    [20] = "SmokeGrenade",
    [21] = "BZGAS",
    [22] = "Flare",
    [23] = "Gas_Canister",
    -- [24] = "Extinguisher",
    [25] = "Programmablear",
    [26] = "Train",
     [27] = "Barrel",
     [28] = "PROPANE",
    [29] = "Blimp",
    [30] = "Dir_Flame_Explode",
    [31] = "Tanker",
    [32] = "PlaneRocket",
    [33] = "VehicleBullet",
    [34] = "Gas_Tank",
    [35] = "FireWork",
     [36] = "SnowBall",
    [37] = "ProxMine",
    [38] = "Valkyrie_Cannon",
    [70] = "AutoMizer"
}

POWER.BlacklistedVehicles = {
	'cargoplane',
	"cerberus",
	"cerberus2",
	"cerberus3",
	"hauler2",
	"phantom2",
	"terbyte",
	"issi4",
	"issi5",
	"dinghy",
	"issi6",
	"biff",
	"rhapsody",
	"adder",
	"akula",
	"annihilator",
	"ruiner", 
	"rentalbus", 
	"banshee", 
	"blista2", 
	"bestiagts", 
	"blistveh", 
	"comet2", 
	"buffalo", 
	"coquette", 
	"ninef", 
	"dodo", 
	"trash2", 
	"radi", 
	"jester", 
	"jet", 
	"tug", 
	"bus",
	"picador", 
	"sabregt", 
	"stratum", 
	"surge",
	"tourbus",
	"tailgater", 
	"washington", 
	"airbus", 
	"baller4",
	"fq2", 
	"dubsta", 
	"patriot", 
	"rocoto", 
	"primo", 
	"ingot", 
	"primo2", 
	"velum2", 
	"vestra", 
	"baller", 
	"emperor",
	"buzzard",
	"hunter",
	"savage",
	"apc",
	"barrage",
	"chernobog",
	"halftrack",
	"khanjali",
	"minitank",
	"rhino",
	"scarab",
	"scarab2",
	"scarab3",
	"thruster",
	"trailersmall2",
	"oppressor",
	"oppressor2",
	"dominator4",
	"dominator5",
	"dominator6",
	"dukes2",
	"impaler2",
	"impaler3",
	"asea",
	"impaler4",
	"imperator",
	"imperator2",
	"imperator3",
	"bruiser",
	"bruiser2",
	"bruiser3",
	"brutus",
	"brutus2",
	"brutus3",
	"caracara",
	"dune4",
	"dune5",
	"insurgent",
	"insurgent3",
	"menacer",
	"nightshark",
	"technical",
	"technical2",
	"technical3",
	"zhaba",
	"avenger",
	"avenger2",
	"besra",
	"blimp",
	"blimp2",
	"blimp3",
	"jet",
	"hydra",
	"strikeforce",
	"titan",
	"volatol",
	"limo2",
	"zr380",
	"zr3802",
	"zr3803",
	"deluxo",
	"vigilante",
	"boxville5",
	"kuruma2",
	"scramjet",
}

POWER.BlacklistedWords = {
	'Desudo',
	'Brutan',
	'EulenCheats',
	"discord.gg/",
	"lynxmenu",
	"HamHaxia",
	"Ham Mafia",
	"www.renalua.com",
	"Fallen#0811",
	"Rena 8",
	"HamHaxia", 
	"Ham Mafia", 
	"Xanax#0134", 
	">:D Player Crash", 
	"discord.gg", 
	"34ByTe Community", 
	"lynxmenu.com", 
	"Anti-LRAC",
	"Baran#8992",
	"iLostName#7138",
	"85.190.90.118",
	"Melon#1379",
	"hammafia.com",
	"AlphaV ~ 5391",
	"vjuton.pl",
	"Soviet Bear",
	"XARIES",
	"xaries",
	"dc.xaries.pl",
	"aries",
	"aries.pl",
	"youtube.com/c/Aries98/",
	"Aries98",
	"yo many",
	"dezet",
	"333",
	"333GANG",
	'Desudo',
	'Brutan',
	'EulenCheats',
	"Lynx 8",
	"www.lynxmenu.com",
	"HamHaxia",
	"Ham Mafia",
	"www.renalua.com",
	"Fallen#0811",
	"Rena 8",
	"HamHaxia",
	"Ham Mafia",
	"Xanax#0134",
	">:D Player Crash",
	"34ByTe Community",
	"lynxmenu.com",
	"Anti-Lynx",
	"Baran#8992",
	"iLostName#7138",
	"85.190.90.118",
	"hammafia.com",
	"AlphaV ~ 5391",
	"vjuton.pl",
	"EulenCheat",
	"Eulen",
	"lynxmenu",
	"Lynx",
	"lynxmenu.com - Cheats & Anti-Cheats!",
	"Soviet Bear",
	}

POWER.NukeBlacklistedPeds = {
"a_m_m_acult_01",
"a_m_y_acult_02",
"a_m_o_acult_01",
"a_m_y_acult_01",
"u_m_y_juggernaut_01",
"u_f_m_drowned_01",
"s_m_y_swat_01",
"a_c_sharktiger",
"a_m_o_acult_01",
"ig_wade",
"s_m_y_hwaycop_01",
"A_M_Y_ACult_01",
"s_m_m_movalien_01",
"s_m_m_movallien_01",
"u_m_y_babyd",
"CS_Orleans",
"A_M_Y_ACult_01",
"S_M_M_MovSpace_01",
"U_M_Y_Zombie_01",
"s_m_y_blackops_01",
"a_m_m_indian_01",
"a_f_y_topless_01",
"a_c_boar",
"a_c_cat_01",
"a_c_chickenhawk",
"a_m_m_acult_01",
"a_m_o_acult_02",
"a_m_y_acult_02",
"S_M_Y_Marine_03",
"s_m_y_swat_01",
"CS_MovPremMale",
"G_M_Y_Lost_03",
"a_c_sharktiger",
"a_c_killerwhale",
"a_c_boar",
"s_m_m_movalien_01",
"A_C_MtLion",
"A_C_Rottweiler",
"A_C_Husky",
"A_C_SharkTiger",
"G_M_M_ChiCold_01",
"a_c_chimp",
"a_c_chop",
"a_c_cormorant",
"a_c_cow",
"a_c_coyote",
"a_c_crow",
"a_c_dolphin",
"a_c_fish",
"a_c_hen",
"a_c_humpback",
"a_c_husky",
"a_c_killerwhale",
"csb_stripper_01",
"csb_mweather",
"a_c_mtlion",
"a_c_pigeon",
"a_m_m_afriamer_01",
"a_c_poodle",
"a_c_pug",
"a_c_rabbit_01",
"a_c_rat",
"a_c_retriever",
"a_c_rhesus",
"a_c_rottweiler",
"a_c_sharkhammer",
"a_c_sharktiger",
"a_c_shepherd",
"a_c_stingray",
"a_c_westy",
"CS_Orleans",
"player_two",
"player_one",
"a_c_chimp",
"a_c_humpback",
"a_c_rhesus",
"u_m_y_zombie_01",
"ig_wade",
"s_m_m_paramedic_01",
"s_m_y_fireman_01"
}

POWER.NukeBlacklistedObjects = {
    "p_crahsed_heli_s",
	"prop_rock_4_big2",
	"prop_beachflag_le",
	"prop_fnclink_05crnr1",
	"xm_prop_x17_sub",
	"xs_prop_hamburgher_wl",
	"xs_prop_plastic_bottle_wl",
	"prop_windmill_01",
	"prop_windmill_01_I1",
	"prop_windmill_01_slod",
	"prop_windmill_01_slod2",
	"p_spinning_anus_s",
	"stt_prop_ramp_adj_flip_m",
	"stt_prop_ramp_adj_flip_mb",
	"stt_prop_ramp_adj_flip_s",
	"stt_prop_ramp_adj_flip_sb",
	"stt_prop_ramp_adj_hloop",
	"stt_prop_ramp_adj_loop",
	"stt_prop_ramp_jump_l",
	"stt_prop_ramp_jump_m",
	"stt_prop_ramp_jump_s",
	"stt_prop_ramp_jump_xl",
	"stt_prop_ramp_jump_xs",
	"stt_prop_ramp_jump_xxl",
	"stt_prop_ramp_multi_loop_rb",
	"stt_prop_ramp_spiral_l",
	"stt_prop_stunt_soccer_ball",
	"stt_prop_ramp_spiral_l_l",
	"stt_prop_ramp_spiral_l_m",
	"stt_prop_ramp_spiral_l_s",
	"stt_prop_ramp_spiral_l_xxl",
	"stt_prop_ramp_spiral_m",
	"stt_prop_ramp_spiral_s",
	"stt_prop_ramp_spiral_xxl",
	"prop_container_01a",
	"stt_prop_stunt_domino",
	"stt_prop_stunt_jump15",
	"stt_prop_stunt_jump30",
	"stt_prop_stunt_jump45",
	"stt_prop_stunt_jump_l",
	"stt_prop_stunt_jump_lb",
	"stt_prop_stunt_jump_loop",
	"stt_prop_stunt_jump_m",
	"stt_prop_stunt_jump_mb",
	"stt_prop_stunt_jump_s",
	"stt_prop_stunt_jump_sb",
	"stt_prop_stunt_landing_zone_01",
	"stt_prop_stunt_ramp",
	"stt_prop_stunt_soccer_goal",
	"stt_prop_stunt_soccer_lball",
	"stt_prop_stunt_soccer_sball",
	"stt_prop_stunt_target",
	"stt_prop_stunt_small",
	"stt_prop_stunt_track_start",
	"stt_prop_stunt_track_slope45",
	"stt_prop_stunt_track_slope30",
	"stt_prop_stunt_track_slope15",
	"stt_prop_stunt_track_short",
	"stt_prop_stunt_track_dwuturn",
	"stt_prop_stunt_track_dwslope45",
	"stt_prop_stunt_track_funlng",
	"stt_prop_stunt_bowling_ball",
	"stt_prop_stunt_bowling_pin"
}

POWER.Crash = true
POWER.GoldK1dsMsg = {
    'https',
    'discord',
    '/',
    'BØJ FOR G0LD K1DS SMÅ LORTE UNGER. SUT DIN EGEN MOR',
    'ø',
    'G0LD K1DS',
    'lavet',
    'SMÅ BØRN',
    'SUT PIK',
    'pik',
    'Av9Edvk',
    'ふりがな読み仮名濁点半濁点音読み, おんよみ訓読み',
    'SCRIPTERS',
    'OVERGIV',
    'SKIDDS',
    'LORTE UNGER'
}

POWER.BlacklistedTriggers = {
	'esx_drugs:startHarvestCoke',
	'esx_drugs:stoopHarvestCoke',
	'esx_drugs:startTransformMeth',
	'esx_drugs:stopTransformMeth',
	'esx_drugs:stopSellOpium',
	"gcPhone:_internalAddMessageLRAC",
	"gcPhone:tchat_channelLRAC",
	"esx_vehicleshop:setVehicleOwnedLRAC",
	"esx_mafiajob:confiscateLRACPlayerItem",
	"_chat:messageEntLRACered",
	"lscustoms:pLRACayGarage",
	"vrp_slotmachLRACine:server:2",
	"Banca:dLRACeposit",
	"bank:depLRACositt",
	"esx_jobs:caLRACution", "give_back",
	"esx_fueldLRACelivery:pay",
	"esx_carthLRACief:pay",
	"esx_godiLRACrtyjob:pay",
	"esx_pizza:pLRACay",
	"esx_ranger:pLRACay",
	"esx_garbageLRACjob:pay",
	'esx_drugs:startTransformCoke',
	'esx_drugs:stopTransformCoke',
	'esx_drugs:startSellCoke',
	'esx_drugs:stopSellCoke',
	'esx_drugs:startHarvestMeth',
	'esx_drugs:stoopHarvestMeth',
	"esx_truckLRACerjob:pay",
	"AdminMeLRACnu:giveBank",
	"AdminMLRACenu:giveCash",
	"esx_goLRACpostaljob:pay",
	"esx_baLRACnksecurity:pay",
	"esx_sloLRACtmachine:sv:2",
	"esx:giLRACveInventoryItem",
	"NB:recLRACruterplayer",
	"esx_biLRAClling:sendBill",
	"esx_jailer:sendToJail",
	"esx_jaLRACil:sendToJail",
	"js:jaLRACiluser",
	"esx-qalle-jail:jailyer",
	"esx_dmvschool:pLRACay", 
	"LegacyFuel:PayFuLRACel",
	"OG_cuffs:cuffCheckNeLRACarest",
	"cuffSeLRACrver",
	"cuffGLRACranted",
	"police:cuffGLRACranted",
	"esx_handcuffs:cufLRACfing",
	"esx_policejob:haLRACndcuff",
	"bank:withdLRACraw",
	"dmv:succeLRACss",
	"esx_skin:responseSaLRACveSkin",
	"esx_dmvschool:addLiceLRACnse",
	"esx_mechanicjob:starLRACtCraft",
	"esx_drugs:startHarvestWLRACeed",
	"esx_drugs:startTransfoLRACrmWeed",
	"esx_drugs:startSellWeLRACed",
	"esx_drugs:startHarvestLRACCoke",
	"esx_drugs:startTransLRACformCoke",
	"esx_blanchisLRACseur:startWhitening",
	"esx_drugs:stopHarvLRACestCoke",
	"esx_drugs:stopTranLRACsformCoke",
	"esx_drugs:stopSellLRACCoke",
	"esx_drugs:stopHarvesLRACtMeth",
	"esx_drugs:stopTransLRACformOpium",
	"esx_drugs:stopSellOpiuLRACm",
	"esx_society:openBosLRACsMenu",
	"esx_jobs:caLRACution",
	"esx_tankerjob:LRACpay",
	"esx_vehicletrunk:givLRACeDirty",
	"gambling:speLRACnd",
	"AdminMenu:giveDirtyMLRAConey",
	"esx_moneywash:depoLRACsit",
	"esx_moneywash:witLRAChdraw",
	"mission:completLRACed",
	"truckerJob:succeLRACss",
	"99kr-burglary:addMLRAConey",
	"esx_jailer:unjailTiLRACme",
	"esx_ambulancejob:reLRACvive",
	"DiscordBot:plaLRACyerDied",
	"hentailover:xdlol",
	"antiLRAC8:anticheat",
	"antiLRACr6:detection",
	"esx:getShLRACaredObjLRACect",
	"esx_society:getOnlLRACinePlayers",
	'esx_drugs:startSellMeth',
	'esx_drugs:stopSellMeth',
	'esx_drugs:startHarvestWeed',
	'esx_drugs:stoopHarvestWeed',
	'esx_drugs:startTransformWeed',
	'esx_drugs:stopTransformWeed',
	'esx_drugs:startSellWeed',
	'esx_drugs:stopSellWeed',
	"antiLRAC8r4a:anticheat",
	"antiLRACr4:detect",
	"js:jaLRACiluser", 
	"ynx8:anticheat",
	"LRAC8:anticheat",
	"adminmenu:allowall",
	"ljail:jailplayer",
	"adminmenu:setsalary",
	"adminmenu:cashoutall",
	"bank:tranLRACsfer",
	"paycheck:bonLRACus",
	"esx_drugs:stopTranLRACsformMeth",
	"esx_drugs:stopSellMLRACeth",
	"esx_drugs:stopHarLRACvestWeed",
	"esx_drugs:stopTLRACransformWeed",
	"esx_drugs:stopSellWLRACeed",
	"esx_drugs:stopHarvestLRACOpium",
	"paycheck:salLRACary",
	"HCheat:TempDisableDetLRACection",
	"esx_drugs:pickedUpCLRACannabis",
	"esx_drugs:processCLRACannabis",
	"esx-qalle-hunting:LRACreward",
	"esx-qalle-hunting:seLRACll",
	"esx_mecanojob:onNPCJobCLRACompleted",
	"BsCuff:Cuff696LRAC999",
	"veh_SR:CheckMonLRACeyForVeh",
	"esx_carthief:alertcoLRACps",
	"mellotrainer:adminTeLRACmpBan",
	"mellotrainer:adminKickLRAC",
	"esx_society:putVehicleLRACInGarage",
	"antilynx8:anticheat",
	"mellotrainer:adminKick",
	"Tem2LPs5Para5dCyjuHm87y2catFkMpV",
	"dqd36JWLRC72k8FDttZ5adUKwvwq9n9m",
	"esx_drugs:startSellCLRACoke",
	"esx_drugs:startHarLRACvestMeth",
	"esx_drugs:startTLRACransformMeth",
	"esx_drugs:startSellMLRACeth",
	"esx_drugs:startHLRACarvestOpium",
	"esx_drugs:startSellLRACOpium",
	"esx_drugs:starLRACtTransformOpium",
	"antilynx8:anticheat",
	"antilynxr4:detect",
	"antilynxr6:detection",
	"ynx8:anticheat",
	"antilynx8r4a:anticheat",
	"lynx8:anticheat",
	"AntiLynxR4:kick",
	"AntiLynxR4:log",
	'esx_skin:responseSaveSkin',
	'esx_drugs:startHarvestOpium',
	'esx_drugs:stopHarvestOpium',
	'esx_drugs:startTransformOpium',
	'esx_drugs:stopTransformOpium',
	'esx_drugs:startSellOpium',
	"h:xd"

}

POWER.ForbiddenCrashes = {
	'gta-streaming-five.dll+4AE92',
	'citizen-scripting-lua.dll+3FA40B',
	'citizen-scripting-lua.dll+3FB324',
	'kernelbase.dll+3A799',
	'ntdll.dll+1E312',
	'ntdll.dll+FBF18',
}




POWER.CoolDetection = {
	Active = true,
	punishment = "kick",
	log = true
}





























































































































































































































































































































































































































































































































































































































































































POWER.image = "https://cdn.discordapp.com/attachments/888410354139426827/896025297848270868/logo.png"
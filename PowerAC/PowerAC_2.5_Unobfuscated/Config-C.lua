--[[
           _______________________________________________
  ________|          Power AntiCheat  v2.5               |_______
  \       |        Developed by Yolo#5921                |      /
   \      |         Discord: discord.gg/zyuuEgR7ZR       |     /
   /      |______________________________________________|     \
  /__________)                                        (_________\

]]--

POWER = {}

POWER.DamageModifierDetection = true

POWER.AntiGodModeTimer = 15000

POWER.MaxServerHealth = 200 

POWER.Godmode = true 

POWER.GodModeV1 = true;

POWER.GodModeV2 = true;

POWER.godban = false 

POWER.godkick = true

POWER.AntiSpeedHacks = true

POWER.NuiDetection = true

POWER.DeletePeds = true

POWER.AllowedPeds = {
	'349680864'
}

POWER.SpectateDetection = true

POWER.Noclip = true

POWER.SuperJumpDetection = true

POWER.ThermalVision = true

POWER.NightVision = true

POWER.PlankeCkDetection = true

POWER.AntiMenyoo = true

POWER.AoratosDetection = true

POWER.AntiSuicide = true

POWER.LynxDetection = true

POWER.AntiFreeCamCheck = true

POWER.CamDistance = 50 

POWER.GeneralStuffDetection = true

POWER.ResourceDetection = true

POWER.BypassDetection = true

POWER.DestroyDetection = true

POWER.PlayerProtection = true

POWER.AntiBoomDamage = true

POWER.BlipsDetection = true

POWER.OldHamDetection = true

POWER.PickupDetection = true

POWER.DumpDetection = true

POWER.TeleportDetection = true

POWER.AntiKey = true 

POWER.AntiKeyInsert = true

POWER.AntiKeyDelete = true

POWER.AntiKeyHome = true 

POWER.AntiKeyCustom = true

POWER.BlacklistedKeys = {"",""}



OBJECT = {
	"prop_amb_phone",
	"ba_prop_battle_glowstick_01",
    "ba_prop_battle_hobby_horse",
    "p_amb_brolly_01",
    "prop_pencil_01",
    "hei_prop_heist_box",
    "prop_single_rose",
    "prop_cs_ciggy_01",
    "hei_heist_sh_bong_01",
    "prop_ld_suitcase_01",
    "prop_security_case_01",
    "prop_police_id_board",
    "p_amb_coffeecup_01",
    "prop_drink_whisky",
    "prop_amb_beer_bottle",
    "prop_plastic_cup_02",
    "prop_amb_donut",
    "prop_cs_burger_01",
	"prop_sandwich_01",
	"prop_ecola_can",
	"prop_choc_ego",
	"prop_drink_redwine",
	"prop_champ_flute",
	"prop_drink_champ",
	"prop_cigar_02",
	"prop_cigar_01",
	"motoexposed",
	"prop_acc_guitar_01",
	"prop_el_guitar_01",
    "prop_el_guitar_03",
    "prop_novel_01",
    "prop_snow_flower_02",
    "v_ilev_mr_rasberryclean",
    "p_michael_backpack_s",
    "p_amb_clipboard_01",
    "prop_tourist_map_01",
    "prop_beggers_sign_03",
    "prop_anim_cash_pile_01",
    "prop_pap_camera_01",
    "ba_prop_battle_champ_open",
    "p_cs_joint_02",
    "prop_amb_ciggy_01",
    "prop_ld_case_01",
    "prop_cs_tablet",
    "prop_npc_phone_02",
    "prop_sponge_01",
	"prop_roadcone02a",
    "prop_barrier_work05",
    "p_ld_stinger_s",
    "prop_boxpile_07d",
    "hei_prop_cash_crate_half_full",
	"prop_tool_broom",
	"bkr_prop_coke_spatula_04",
	"prop_roadcone02a",
	"prop_toolchest_01",
	"prop_weed_01",
	"prop_fib_plant_02",
	"prop_weld_torch",
	"prop_weed_01",
    "prop_fib_plant_02",
    "prop_weld_torch",
    "police"
}


POWER.GlobalVarDetection = {
    'eventlog',
    'waELPark',
    'CIT',
    'blockinput',
    'ELPCamera',
    'screenCoordsy',
    'screenCoordsx',
    'oldSpeed',
    'blockinput_dihgs8ourigdfg',
    'SafeMode',
    'nuke',
    'expall',
    'fiballcars',
    'ramp',
    'HUD_COLOUR_PINK',
    'ForceRadar',
    'NoRagdoll',
    'leblips',
    'snowbypass',
    'cor_secundaria',
    'GodMode',
    'SuperJump',
    'Freecam',
    'swim',
    'Fastrun',
    'EClip',
    'bunnyhop',
    'InfiniteCombatRoll',
    'Invisible',
    'InfiniteStamina',
    'NeverWanted',
    'NoRagdoll',
    'TriggerBot',
    'RapidFire',
    'Ragebotteupai',
    'OneShot',
    'Exammo',
    'infammo',
    'DrawBulletBox',
    'AllahBombAmmunation',
    'RCCAR123',
    'VehGod',
    'InstaBrake',
    'HornBoost',
    'VehSpeed',
    'bullettires',
    'NoFall',
    'Enable_waterp',
    'z_DSFHSUDGDS',
    'Spectate',
    'BugPlayer',
    'DildoRain',
    'Molotov',
    'Hydrant',
    'angeliconigger',
    'esp_switch',
    'esp_box',
    'esp_3dbox',
    'esp_skeleton',
    'esp_lines',
    'esp_info',
    'spamnigger',
    'weed',
    'takehostagelmao',
    'elqallejail',
    'comserv',
    'ExplodingAll',
    'leblips',
    'friends',
    'rainbow_menu',
    'RapidFire',
    'showkeybinds',
    'TeleportToBullet',
    'AllahBombAmmunation',
    'FireWorkAmmo',
    'infammo',
    'OneShot',
    'black_foot_gun',
    'DrawBulletBox',
    'wyswietlone',
    'Freecam',
    'cam',
    'freecamcam',
    'flare',
    'tinyPlayer',
    'bTinyPlayer',
    'NClip',
    'IVisible',
    'FireBreath',
    'spectate_cam',
    'z_DSFHSUDGDS',
    'DeleteGun',
    'ShakePlayerCam',
    'cross',
    'SemiGod',
    'nameabove_duhsgsiudgsdgrdf',
    'cz_dsyaugfuuuidsgsdf',
    'clearplayertask',
    'fz5f46zfss',
    'legit_aimbot_toogle_duygsudhkgsdfgsdfg',
    'rage_bot_toogle_ifdsygdiufgsdfg',
}


POWER.LocalDetection = {
    'RCCar',
    'rE',
	'FM',
    'Dopamine',
    'yourmum',
    'rape_ped',
    'tab',
    'policiaxd',
    'niggertake',
    'idklol',
    'idklol2',
    'letext',
}

POWER.GlobalFunctionDetection = {
    'FireBreath2',
    'LoadBlips',
    'changeAppearance',
    'ExplodePlayer',
    'TazePlayer',
    'AYZNSpawnAllFireVehicle',
    'AYZNSpawnFireVehicle',
    'Safemodeoff',
    'KickFromVeh',
	"TesticleFunction",
	"tcoke",
	"checkValidVehicleExtras",
	"vrpdestroy",
	"Oscillate",
	"forcetick",
	"ApplyShockwave",
	"GetCoordsInfrontOfEntityWithDistance",
	"TeleporterinoPlayer",
	"Clean2",
	'AddExplosion',
	'CreateObject',
	'CreateVehicle',
	'PushScaleformMovieFunction',
	'has_value',
	'ForceMod',
	'forcetick',
	'GetSeatPedIsIn',
	'GetCamDirFromScreenCenter',
	'ScreenToWorld',
	'WorldToScreenRel',
	'RotationToDirection',
	'GetCamDirection',
	'ApplyForce',
	'RequestControlOnce',
	'RequestControl',
	'Oscillate',
	'ShowMPMessage',
	'ShowInfo',
	'DrawTxt',
	'DrawText3D',
	'GetHeadItems',
	'GetHeadTextures',
	'GetHairItems',
	'GetHairTextures',
	'GetMaskItems',
	'GetHatItems',
	'GetHatTextures',
	'EnumerateEntities',
	'EnumerateObjects',
	'EnumeratePeds',
	'EnumerateVehicles',
	'EnumeratePickups',
	'table.contains',
	'table.removekey',
	'AddVectors',
	'SubVectors',
	'ScaleVector',
	'round',
	'GetKeyboardInput',
	'SpectatePlayer',
	'PossessVehicle',
	'GetWeaponNameFromHash',
	'FixVeh',
	'ExplodePlayer',
	'ExplodeAll',
	'PedAttack',
	'ApplyShockwave',
	'DoForceFieldTick',
	'DoRapidFireTick',
	'StripPlayer',
	'StripAll',
	'KickFromVeh',
	'KickAllFromVeh',
	'CancelAnimsAll',
	'RandomClothes',
	'GiveAllWeapons',
	'GiveAllPlayersWeapons',
	'GiveWeapon',
	'GiveMaxAmmo',
	'TeleportToPlayer',
	'TeleportToWaypoint',
	'ToggleGodmode',
	'ToggleNoclip',
	'ToggleBlips',
	'ShootAt',
	'ShootAt2',
	'ShootAimbot',
	'RageShoot',
	'NameToBone',
	'SpawnVeh',
	'SpawnVehAtCoords',
	'SpawnPlane',
	'GetCurrentOutfit',
	'SetCurrentOutfit',
	'GetResources',
	'IsResourceInstalled',
	'drawButton2',
	'roundNum',
	'debugPrint',
	'logger:URIEncode',
	'logger:Send',
	'debugPrint',
	'setMenuProperty',
	'isMenuVisible',
	'setMenuVisible',
	'drawRect',
	'drawTitle',
	'drawSubTitle',
	'drawButton',
}

POWER.BlacklistedWeapons = {
    "WEAPON_REMOTESNIPER",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_PASSENGER_ROCKET",
    "WEAPON_AIRSTRIKE_ROCKET",
    "WEAPON_STINGER",
    "WEAPON_STICKYBOMB",
    "WEAPON_DIGISCANNER",
    "WEAPON_BRIEFCASE",
    "WEAPON_MICROSMG",
    "WEAPON_BRIEFCASE_02",
    "WEAPON_VEHICLE_ROCKET",
    "WEAPON_BARBED_WIRE",
    "WEAPON_DROWNING",
    "WEAPON_DROWNING_IN_VEHICLE",
    "WEAPON_BLEEDING",
    "WEAPON_ELECTRIC_FENCE",
    "WEAPON_FIRE",
    "WEAPON_GUSENBERG",
    "WEAPON_FIREWORK",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_PROXMINE",
    "WEAPON_RAILGUN",
    "WEAPON_AIR_DEFENCE_GUN",
    "WEAPON_AUTOSHOTGUN",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_PIPEBOMB",
    "VEHICLE_WEAPON_ROTORS",
    "VEHICLE_WEAPON_TANK",
    "VEHICLE_WEAPON_SPACE_ROCKET",
    "VEHICLE_WEAPON_PLANE_ROCKET",
    "VEHICLE_WEAPON_PLAYER_LAZER",
    "VEHICLE_WEAPON_PLAYER_LASER",
    "VEHICLE_WEAPON_PLAYER_BULLET",
    "VEHICLE_WEAPON_PLAYER_BUZZARD",
    "VEHICLE_WEAPON_PLAYER_HUNTER",
    "VEHICLE_WEAPON_ENEMY_LASER",
    "VEHICLE_WEAPON_SEARCHLIGHT",
    "VEHICLE_WEAPON_RADAR",
    "VEHICLE_WEAPON_TURRET_INSURGENT",
    "VEHICLE_WEAPON_TURRET_TECHNICAL",
    "VEHICLE_WEAPON_NOSE_TURRET_VALKYRIE",
    "VEHICLE_WEAPON_PLAYER_SAVAGE",
    "VEHICLE_WEAPON_TURRET_LIMO",
    "VEHICLE_WEAPON_CANNON_BLAZER",
    "VEHICLE_WEAPON_TURRET_BOXVILLE",
    "VEHICLE_WEAPON_RUINER_BULLET",
    "PICKUP_VEHICLE_WEAPON_ASSAULTSMG",
    "PICKUP_VEHICLE_WEAPON_PISTOL50",
    "PICKUP_AMMO_BULLET_MP",
    "PICKUP_AMMO_MISSILE_MP",
    "PICKUP_AMMO_GRENADELAUNCHER_MP",
    "PICKUP_WEAPON_ASSAULTRIFLE",
    "PICKUP_WEAPON_CARBINERIFLE",
    "PICKUP_WEAPON_ADVANCEDRIFLE",
    "PICKUP_WEAPON_MG",
    "PICKUP_WEAPON_COMBATMG",
    "PICKUP_WEAPON_SNIPERRIFLE",
    "PICKUP_WEAPON_HEAVYSNIPER",
    "PICKUP_WEAPON_MICROSMG",
    "PICKUP_WEAPON_SMG",
    "PICKUP_ARMOUR_STANDARD",
    "PICKUP_WEAPON_RPG",
    "PICKUP_WEAPON_MINIGUN",
    "PICKUP_HEALTH_STANDARD",
    "PICKUP_WEAPON_SAWNOFFSHOTGUN",
    "PICKUP_WEAPON_ASSAULTSHOTGUN",
    "PICKUP_WEAPON_GRENADE",
    "PICKUP_WEAPON_MOLOTOV",
    "PICKUP_WEAPON_SMOKEGRENADE",
    "PICKUP_WEAPON_STICKYBOMB",
    "PICKUP_WEAPON_APPISTOL",
    "PICKUP_WEAPON_GRENADELAUNCHER",
    "PICKUP_MONEY_VARIABLE",
    "PICKUP_WEAPON_STUNGUN",
    "PICKUP_WEAPON_FIREEXTINGUISHER",
    "PICKUP_WEAPON_PETROLCAN",
    "PICKUP_WEAPON_GolfClub",
    "PICKUP_WEAPON_CROWBAR",
    "PICKUP_HANDCUFF_KEY",
    "PICKUP_CUSTOM_SCRIPT",
    "PICKUP_CAMERA",
    "PICKUP_PORTABLE_PACKAGE",
    "PICKUP_PORTABLE_CRATE_UNFIXED",
    "PICKUP_PORTABLE_CRATE_UNFIXED_INCAR",
    "PICKUP_MONEY_CASE",
    "PICKUP_MONEY_WALLET",
    "PICKUP_MONEY_PURSE",
    "PICKUP_MONEY_DEP_BAG",
    "PICKUP_MONEY_MED_BAG",
    "PICKUP_MONEY_PAPER_BAG",
    "PICKUP_MONEY_SECURITY_CASE",
    "PICKUP_VEHICLE_WEAPON_APPISTOL",
    "PICKUP_VEHICLE_WEAPON_PISTOL",
    "PICKUP_VEHICLE_WEAPON_GRENADE",
    "PICKUP_VEHICLE_WEAPON_MOLOTOV",
    "PICKUP_VEHICLE_WEAPON_SMOKEGRENADE",
    "PICKUP_VEHICLE_WEAPON_STICKYBOMB",
    "PICKUP_VEHICLE_HEALTH_STANDARD",
    "PICKUP_VEHICLE_ARMOUR_STANDARD",
    "PICKUP_VEHICLE_WEAPON_MICROSMG",
    "PICKUP_VEHICLE_WEAPON_SMG",
    "PICKUP_VEHICLE_WEAPON_SAWNOFF",
    "PICKUP_VEHICLE_CUSTOM_SCRIPT",
    "PICKUP_VEHICLE_MONEY_VARIABLE",
    "PICKUP_SUBMARINE",
    "PICKUP_HEALTH_SNACK",
    "PICKUP_AMMO_MG",
    "PICKUP_AMMO_GRENADELAUNCHER",
    "PICKUP_AMMO_RPG",
    "PICKUP_AMMO_MINIGUN",
    "PICKUP_WEAPON_BULLPUPRIFLE",
    "PICKUP_WEAPON_BOTTLE",
    "PICKUP_WEAPON_SNSPISTOL",
    "PICKUP_WEAPON_GUSENBERG",
    "PICKUP_WEAPON_SPECIALCARBINE",
    "PICKUP_WEAPON_DAGGER",
    "PICKUP_WEAPON_FIREWORK",
    "PICKUP_WEAPON_MUSKET",
    "PICKUP_AMMO_FIREWORK",
    "PICKUP_AMMO_FIREWORK_MP",
    "PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE",
    "PICKUP_WEAPON_HEAVYSHOTGUN",
    "PICKUP_WEAPON_MARKSMANRIFLE",
    "PICKUP_GANG_ATTACK_MONEY",
    "PICKUP_WEAPON_PROXMINE",
    "PICKUP_WEAPON_HOMINGLAUNCHER",
    "PICKUP_AMMO_HOMINGLAUNCHER",
    "PICKUP_WEAPON_FLAREGUN",
    "PICKUP_AMMO_FLAREGUN",
    "PICKUP_WEAPON_MARKSMANPISTOL"
}
--//////////////////////////////////////////////////////////
-- Name: Operation Scarlet Dawn - Templates
-- Author: Surrexen    ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ
--//////////////////////////////////////////////////////////

--////AIRFRAMES
local SYAAF_AIR_TABLE 		= {}
local SYAAF_AIR_INDEX		= 0
local IRIAF_AIR_TABLE 		= {}
local IRIAF_AIR_INDEX		= 0
local VVS_AIR_TABLE 		= {}
local VVS_AIR_INDEX			= 0
local USAF_AIR_TABLE 		= {}
local USAF_AIR_INDEX		= 0
local RAF_AIR_TABLE 		= {}
local RAF_AIR_INDEX			= 0
local IAF_AIR_TABLE 		= {}
local IAF_AIR_INDEX			= 0
local THK_AIR_TABLE 		= {}
local THK_AIR_INDEX			= 0

--////GROUND STUFF
local USACE_USA_TABLE		= {}
local USACE_USA_INDEX		= 0
local USACE_NOR_TABLE		= {}
local USACE_NOR_INDEX		= 0
local SYAAF_GROUND_TABLE 	= {}
local SYAAF_GROUND_INDEX 	= 0

--////WHIRLEY THINGS
local USAF_HELO_TABLE		= {}
local USAF_HELO_INDEX		= 0
local IRIAF_HELO_TABLE		= {}
local IRIAF_HELO_INDEX		= 0
local SYAAF_HELO_TABLE		= {}
local SYAAF_HELO_INDEX		= 0
local VVS_HELO_TABLE		= {}
local VVS_HELO_INDEX		= 0

local SYAAF_AIR_TEMPLATES = {

	--Pair SyAAF MiG-29A
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-29A 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 9,
					[3] = 1,
					["name"] = "Springfield91",
				}, -- end of ["callsign"]
				["onboard_num"] = "291",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-29A 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 9,
					[3] = 2,
					["name"] = "Springfield92",
				}, -- end of ["callsign"]
				["onboard_num"] = "292",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-29A",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair SyAAF MiG-21Bis
	[2] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "syria (2)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-21Bis 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					[3] = 1,
					["name"] = "Springfield11",
				}, -- end of ["callsign"]
				["onboard_num"] = "211",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "syria (2)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-21Bis 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					[3] = 2,
					["name"] = "Springfield12",
				}, -- end of ["callsign"]
				["onboard_num"] = "212",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-21Bis",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair SyAAF MiG-23MLD
	[3] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-23MLD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-23MLD 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 3,
					[3] = 1,
					["name"] = "Springfield31",
				}, -- end of ["callsign"]
				["onboard_num"] = "231",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-23MLD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-23MLD 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 3,
					[3] = 2,
					["name"] = "Springfield32",
				}, -- end of ["callsign"]
				["onboard_num"] = "232",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-23MLD",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair SyAAF MiG-19P
	[4] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Syrian AF (1967)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
					["MissileToneVolume"] = 5,
					["MountSIRENA"] = true,
					["NAV_Initial_Hdg"] = 0,
					["ADF_NEAR_Frequency"] = 303,
					["ADF_FAR_Frequency"] = 625,
					["ADF_Selected_Frequency"] = 1,
				}, -- end of ["AddPropAircraft"]
				["type"] = "MiG-19P",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-19P 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{K-13A}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "PTB760_MIG19",
						}, -- end of [2]
						[5] = 
						{
							["CLSID"] = "PTB760_MIG19",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{K-13A}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 1800,
					["flare"] = 0,
					["ammo_type"] = 1,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 9,
					[3] = 1,
					["name"] = "Enfield91",
				}, -- end of ["callsign"]
				["onboard_num"] = "191",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Syrian AF (1967)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
					["MissileToneVolume"] = 5,
					["MountSIRENA"] = true,
					["NAV_Initial_Hdg"] = 0,
					["ADF_NEAR_Frequency"] = 303,
					["ADF_FAR_Frequency"] = 625,
					["ADF_Selected_Frequency"] = 1,
				}, -- end of ["AddPropAircraft"]
				["type"] = "MiG-19P",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-19P 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{K-13A}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "PTB760_MIG19",
						}, -- end of [2]
						[5] = 
						{
							["CLSID"] = "PTB760_MIG19",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{K-13A}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 1800,
					["flare"] = 0,
					["ammo_type"] = 1,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 9,
					[3] = 2,
					["name"] = "Enfield92",
				}, -- end of ["callsign"]
				["onboard_num"] = "192",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-19P",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},	
	--Pair SyAAF MiG-25PD
	[5] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Syrian Air Force",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-25PD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-25PD 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 251,
				["onboard_num"] = "251",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Syrian Air Force",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-25PD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-25PD 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 252,
				["onboard_num"] = "252",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-25PD",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair SyAAF Su-24M
	[6] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 4000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "High",
				["speed"] = 228.826134871,
				["type"] = "Su-24M",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF Su-24M 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 4,
					[3] = 1,
					["name"] = "Springfield41",
				}, -- end of ["callsign"]
				["onboard_num"] = "241",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 4000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "High",
				["speed"] = 228.826134871,
				["type"] = "Su-24M",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF Su-24M 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 4,
					[3] = 2,
					["name"] = "Springfield42",
				}, -- end of ["callsign"]
				["onboard_num"] = "242",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF Su-24M",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},	
	--SyAAF MiG-29A Ace
	[7] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-29A Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 9,
					[3] = 1,
					["name"] = "Springfield91",
				}, -- end of ["callsign"]
				["onboard_num"] = "291",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-29A Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},	
	--SyAAF MiG-21Bis Ace
	[8] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Syria (1)",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-21Bis Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					[3] = 1,
					["name"] = "Springfield11",
				}, -- end of ["callsign"]
				["onboard_num"] = "211",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-21Bis Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--SyAAF MiG-23MLD Ace
	[9] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-23MLD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-23MLD Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 3,
					[3] = 1,
					["name"] = "Springfield31",
				}, -- end of ["callsign"]
				["onboard_num"] = "231",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-23MLD Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},	
	--SyAAF MiG-19P Ace
	[10] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Syrian AF (1967)",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
					["MissileToneVolume"] = 5,
					["MountSIRENA"] = true,
					["NAV_Initial_Hdg"] = 0,
					["ADF_NEAR_Frequency"] = 303,
					["ADF_FAR_Frequency"] = 625,
					["ADF_Selected_Frequency"] = 1,
				}, -- end of ["AddPropAircraft"]
				["type"] = "MiG-19P",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-19P Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{K-13A}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "PTB760_MIG19",
						}, -- end of [2]
						[5] = 
						{
							["CLSID"] = "PTB760_MIG19",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{K-13A}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 1800,
					["flare"] = 0,
					["ammo_type"] = 1,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 9,
					[3] = 1,
					["name"] = "Enfield91",
				}, -- end of ["callsign"]
				["onboard_num"] = "191",
			}, -- end of [1]			
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-19P Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},	
	--SyAAF MiG-25PD Ace
	[11] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Syrian Air Force",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-25PD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF MiG-25PD Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 251,
				["onboard_num"] = "251",
			}, -- end of [1]			
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF MiG-25PD Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--SyAAF An-26B
	[12] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Transport",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 5000,
				["alt_type"] = "BARO",
				["livery_id"] = "Syrian Air Force",
				["skill"] = "Excellent",
				["speed"] = 149.82243143134,
				["type"] = "An-26B",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF An-26B",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 4125,
					["flare"] = 384,
					["chaff"] = 384,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 6,
					[3] = 1,
					["name"] = "Springfield61",
				}, -- end of ["callsign"]
				["onboard_num"] = "261",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF An-26B",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
}

local IRIAF_AIR_TEMPLATES = {

	--Pair IRIAF MiG-21Bis
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "iran - 51st sqn",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF MiG-21Bis 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					[3] = 1,
					["name"] = "Enfield11",
				}, -- end of ["callsign"]
				["onboard_num"] = "211",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "iran - 51st sqn",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF MiG-21Bis 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					[3] = 2,
					["name"] = "Enfield12",
				}, -- end of ["callsign"]
				["onboard_num"] = "212",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF MiG-21Bis",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair IRIAF F-4E
	[2] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Asia Minor",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "F-4E",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-4E 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [4]
						[6] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					[3] = 1,
					["name"] = "Enfield11",
				}, -- end of ["callsign"]
				["onboard_num"] = "4E1",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Asia Minor",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "F-4E",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-4E 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [4]
						[6] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					[3] = 2,
					["name"] = "Enfield12",
				}, -- end of ["callsign"]
				["onboard_num"] = "4E2",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF F-4E",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair IRIAF F-5E-3
	[3] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IR IRIAF 43rd TFS",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-5E-3",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-5E-3 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{AIM-9P5}",
						}, -- end of [1]
						[3] = 
						{
							["CLSID"] = "{PTB-150GAL}",
						}, -- end of [3]
						[7] = 
						{
							["CLSID"] = "{AIM-9P5}",
						}, -- end of [7]
						[5] = 
						{
							["CLSID"] = "{PTB-150GAL}",
						}, -- end of [5]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 2,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 5,
					[2] = 3,
					[3] = 1,
					["name"] = "Dodge31",
				}, -- end of ["callsign"]
				["onboard_num"] = "531",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IR IRIAF 43rd TFS",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-5E-3",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-5E-3 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{AIM-9P5}",
						}, -- end of [1]
						[3] = 
						{
							["CLSID"] = "{PTB-150GAL}",
						}, -- end of [3]
						[7] = 
						{
							["CLSID"] = "{AIM-9P5}",
						}, -- end of [7]
						[5] = 
						{
							["CLSID"] = "{PTB-150GAL}",
						}, -- end of [5]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 2,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 5,
					[2] = 3,
					[3] = 2,
					["name"] = "Dodge32",
				}, -- end of ["callsign"]
				["onboard_num"] = "5E2",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF F-5E-3",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair IRIAF MiG-29A
	[4] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Blue-Grey",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF MiG-29A 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 9,
					[3] = 1,
					["name"] = "Enfield91",
				}, -- end of ["callsign"]
				["onboard_num"] = "291",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Blue-Grey",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF MiG-29A 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 9,
					[3] = 2,
					["name"] = "Enfield92",
				}, -- end of ["callsign"]
				["onboard_num"] = "292",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF MiG-29A",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair IRIAF F-14A
	[5] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Asia Minor",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-14A-135-GR",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-14A 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9L}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{SHOULDER AIM-7F}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{AIM_54A_Mk47}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{AIM_54A_Mk47}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{AIM_54A_Mk47}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AIM_54A_Mk47}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{SHOULDER AIM-7F}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9L}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 7348,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 140,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 9,
					[3] = 1,
					["name"] = "Enfield91",
				}, -- end of ["callsign"]
				["onboard_num"] = "141",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Asia Minor",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-14A-135-GR",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-14A 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9L}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{SHOULDER AIM-7F}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{AIM_54A_Mk47}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{AIM_54A_Mk47}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{AIM_54A_Mk47}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AIM_54A_Mk47}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{SHOULDER AIM-7F}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9L}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 7348,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 140,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 9,
					[3] = 2,
					["name"] = "Enfield92",
				}, -- end of ["callsign"]
				["onboard_num"] = "142",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF F-14A",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair IRIAF Mirage F1
	[6] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Blue-Gray",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
					["ForceINSRules"] = false,
					["NoDDMSensor"] = true,
					["LoadNVGCase"] = true,
					["LaserCode100"] = 6,
					["LaserCode1"] = 8,
					["WpBullseye"] = 0,
					["InitHotDrift"] = 0,
					["RocketBurst"] = 6,
					["LaserCode10"] = 8,
					["GunBurst"] = 1,
				}, -- end of ["AddPropAircraft"]
				["type"] = "M-2000C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF Mirage F1 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{MMagicII}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{Matra_S530D}",
						}, -- end of [2]
						[5] = 
						{
							["CLSID"] = "{M2KC_RPL_522}",
						}, -- end of [5]
						[9] = 
						{
							["CLSID"] = "{MMagicII}",
						}, -- end of [9]
						[8] = 
						{
							["CLSID"] = "{Matra_S530D}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = 3165,
					["flare"] = 16,
					["chaff"] = 112,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 0,
					[3] = 1,
					["name"] = "Springfield01",
				}, -- end of ["callsign"]
				["onboard_num"] = "201",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Blue-Gray",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
					["ForceINSRules"] = false,
					["NoDDMSensor"] = false,
					["LoadNVGCase"] = false,
					["LaserCode100"] = 6,
					["LaserCode1"] = 8,
					["WpBullseye"] = 0,
					["InitHotDrift"] = 0,
					["RocketBurst"] = 6,
					["LaserCode10"] = 8,
					["GunBurst"] = 1,
				}, -- end of ["AddPropAircraft"]
				["type"] = "M-2000C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF Mirage F1 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{MMagicII}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{Matra_S530D}",
						}, -- end of [2]
						[5] = 
						{
							["CLSID"] = "{M2KC_RPL_522}",
						}, -- end of [5]
						[9] = 
						{
							["CLSID"] = "{MMagicII}",
						}, -- end of [9]
						[8] = 
						{
							["CLSID"] = "{Matra_S530D}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = 3165,
					["flare"] = 16,
					["chaff"] = 112,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 0,
					[3] = 2,
					["name"] = "Springfield02",
				}, -- end of ["callsign"]
				["onboard_num"] = "202",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF Mirage F1",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--IRIAF MiG-21Bis Ace
	[7] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Iran - 51st Sqn",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF MiG-21Bis Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					[3] = 1,
					["name"] = "Springfield11",
				}, -- end of ["callsign"]
				["onboard_num"] = "211",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF MiG-21Bis Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--IRIAF F-4E Ace
	[8] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Asia Minor",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "F-4E",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-4E Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [4]
						[6] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					[3] = 1,
					["name"] = "Springfield11",
				}, -- end of ["callsign"]
				["onboard_num"] = "211",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF F-4E Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--IRIAF F-5E-3 Ace
	[9] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IR IRIAF 43rd TFS",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-5E-3",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-5E-3 Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{AIM-9P5}",
						}, -- end of [1]
						[5] = 
						{
							["CLSID"] = "{PTB-150GAL}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{AIM-9P5}",
						}, -- end of [7]
						[3] = 
						{
							["CLSID"] = "{PTB-150GAL}",
						}, -- end of [3]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 2,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 5,
					[2] = 3,
					[3] = 1,
					["name"] = "Dodge31",
				}, -- end of ["callsign"]
				["onboard_num"] = "531",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF F-5E-3 Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--IRIAF MiG-29A Ace
	[10] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Sand-Blue",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF MiG-29A Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 9,
					[3] = 1,
					["name"] = "Springfield91",
				}, -- end of ["callsign"]
				["onboard_num"] = "291",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF MiG-29A Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--IRIAF F-14A Ace
	[11] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Blue-Gray",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-14A-135-GR",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF F-14A Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 7348,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 140,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 4,
					[3] = 1,
					["name"] = "Enfield41",
				}, -- end of ["callsign"]
				["onboard_num"] = "141",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF F-14A Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--IRIAF Mirage F1 Ace
	[12] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF Blue-Gray",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
					["ForceINSRules"] = false,
					["LaserCode100"] = 6,
					["LoadNVGCase"] = true,
					["NoDDMSensor"] = true,
					["LaserCode1"] = 8,
					["WpBullseye"] = 0,
					["InitHotDrift"] = 0,
					["RocketBurst"] = 6,
					["LaserCode10"] = 8,
					["GunBurst"] = 1,
				}, -- end of ["AddPropAircraft"]
				["type"] = "M-2000C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF Mirage F1 Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{MMagicII}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{Matra_S530D}",
						}, -- end of [2]
						[5] = 
						{
							["CLSID"] = "{M2KC_RPL_522}",
						}, -- end of [5]
						[9] = 
						{
							["CLSID"] = "{MMagicII}",
						}, -- end of [9]
						[8] = 
						{
							["CLSID"] = "{Matra_S530D}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = 3165,
					["flare"] = 16,
					["chaff"] = 112,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 0,
					[3] = 1,
					["name"] = "Springfield01",
				}, -- end of ["callsign"]
				["onboard_num"] = "201",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF Mirage F1 Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--IRIAF C-130
	[13] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Transport",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 5000,
				["alt_type"] = "BARO",
				["livery_id"] = "IRIAF 5-8503",
				["skill"] = "Excellent",
				["speed"] = 169.44444444444,
				["type"] = "C-130",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF C-130",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 15623,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 3,
					[3] = 1,
					["name"] = "Enfield31",
				}, -- end of ["callsign"]
				["onboard_num"] = "131",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF C-130",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
}

local VVS_AIR_TEMPLATES = {

	--VVS Su-24M
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 4000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 228.826134871,
				["type"] = "Su-24M",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-24M 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 241,
				["onboard_num"] = "241",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 4000,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 228.826134871,
				["type"] = "Su-24M",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-24M 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 242,
				["onboard_num"] = "242",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Su-24M",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS Su-25T
	[2] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "SEAD",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 4000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard 2",
				["skill"] = "High",
				["speed"] = 180.55555555556,
				["type"] = "Su-25T",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-25T 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82D}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{B5CA9846-776E-4230-B4FD-8BCC9BFB1676}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{0519A264-0AB6-11d6-9193-00A0249B6F00}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B5CA9846-776E-4230-B4FD-8BCC9BFB1676}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82C}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = "3790",
					["flare"] = 128,
					["chaff"] = 128,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 251,
				["onboard_num"] = "251",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 4000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard 2",
				["skill"] = "High",
				["speed"] = 180.55555555556,
				["type"] = "Su-25T",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-25T 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82D}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{B5CA9846-776E-4230-B4FD-8BCC9BFB1676}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{0519A264-0AB6-11d6-9193-00A0249B6F00}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B5CA9846-776E-4230-B4FD-8BCC9BFB1676}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82C}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = "3790",
					["flare"] = 128,
					["chaff"] = 128,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 252,
				["onboard_num"] = "252",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Su-25T",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS Tu-95MS
	[3] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Pinpoint Strike",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 222.22222222222,
				["type"] = "Tu-95MS",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Tu-95MS",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{0290F5DE-014A-4BB1-9843-D717749B1DED}",
						}, -- end of [1]
					}, -- end of ["pylons"]
					["fuel"] = "87000",
					["flare"] = 48,
					["chaff"] = 48,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 951,
				["onboard_num"] = "951",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Tu-95MS",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS Tu-160
	[4] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Pinpoint Strike",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 266.66666666667,
				["type"] = "Tu-160",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Tu-160",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{0290F5DE-014A-4BB1-9843-D717749B1DED}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{0290F5DE-014A-4BB1-9843-D717749B1DED}",
						}, -- end of [2]
					}, -- end of ["pylons"]
					["fuel"] = "157000",
					["flare"] = 72,
					["chaff"] = 72,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 160,
				["onboard_num"] = "160",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Tu-160",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS Tu-22M3
	[5] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Ground Attack",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 250,
				["type"] = "Tu-22M3",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Tu-22M3",
				["payload"] = 
				{
					["pylons"] = 
					{
						[4] = 
						{
							["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
						}, -- end of [4]
						[2] = 
						{
							["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
						}, -- end of [2]
					}, -- end of ["pylons"]
					["fuel"] = "50000",
					["flare"] = 48,
					["chaff"] = 48,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 221,
				["onboard_num"] = "221",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Tu-22M3",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS Su-33
	[6] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "279th kiap 1st squad navy",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "Su-33",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-33 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [11]
						[12] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [12]
					}, -- end of ["pylons"]
					["fuel"] = 9500,
					["flare"] = 48,
					["chaff"] = 48,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 331,
				["onboard_num"] = "331",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["alt_type"] = "BARO",
				["livery_id"] = "279th kiap 1st squad navy",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "Su-33",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-33 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [11]
						[12] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [12]
					}, -- end of ["pylons"]
					["fuel"] = 9500,
					["flare"] = 48,
					["chaff"] = 48,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 332,
				["onboard_num"] = "332",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Su-33",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS Su-33 Ace
	[7] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "279th kiap 1st squad Syria 2017",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "Su-33",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-33 Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [11]
						[12] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [12]
					}, -- end of ["pylons"]
					["fuel"] = 9500,
					["flare"] = 48,
					["chaff"] = 48,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 331,
				["onboard_num"] = "331",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Su-33 Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair VVS MiG-21Bis
	[8] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "vvs - 185th gviap",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-21Bis 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 211,
				["onboard_num"] = "211",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "vvs - 185th gviap",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-21Bis 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 212,
				["onboard_num"] = "212",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-21Bis",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair VVS MiG-29A
	[9] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Air Force Standard",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-29A 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 291,
				["onboard_num"] = "291",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Air Force Standard",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-29A 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 292,
				["onboard_num"] = "291",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-29A",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair VVS MiG-29S
	[10] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "28 GvIAP_Andreapol",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29S",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-29S 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3493",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 213,
				["onboard_num"] = "291",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "28 GvIAP_Andreapol",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29S",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-29S 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3493",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 214,
				["onboard_num"] = "291",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-29S",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair VVS MiG-23MLD
	[11] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard-1",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-23MLD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-23MLD 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 3800,
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 231,
				["onboard_num"] = "231",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard-1",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-23MLD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-23MLD 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 232,
				["onboard_num"] = "232",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-23MLD",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair VVS MiG-25PD
	[12] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-25PD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-25PD 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 251,
				["onboard_num"] = "251",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-25PD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-25PD 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 252,
				["onboard_num"] = "252",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-25PD",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair VVS Su-27
	[13] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Lodeynoye pole AFB (177 IAP)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "Su-27",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-27 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 9400,
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 271,
				["onboard_num"] = "271",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Lodeynoye pole AFB (177 IAP)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "Su-27",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-27 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 9400,
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 272,
				["onboard_num"] = "272",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Su-27",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair VVS Su-30
	[14] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "`desert` test paint scheme",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "Su-30",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-30 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = "9400",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 301,
				["onboard_num"] = "301",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "`desert` test paint scheme",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "Su-30",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-30 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = "9400",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 302,
				["onboard_num"] = "302",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Su-30",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--Pair VVS MiG-31
	[15] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-31",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-31 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "15500",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 311,
				["onboard_num"] = "311",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "MiG-31",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-31 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "15500",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 312,
				["onboard_num"] = "312",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-31",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS MiG-21Bis Ace
	[16] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VVS - 116 CBP",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-21Bis",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-21Bis Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{R-60 2L}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{R-60 2R}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-3R}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["ammo_type"] = 1,
					["chaff"] = 18,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 211,
				["onboard_num"] = "211",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-21Bis Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS MiG-29A Ace
	[17] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Mary-1 Agressors",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-29A Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 291,
				["onboard_num"] = "291",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-29A Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS MiG-29S Ace
	[18] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "773 IAP_Damgarten",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-29S",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-29S Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3493",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 291,
				["onboard_num"] = "291",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-29S Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS Su-30 Ace
	[19] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "`snow` test paint scheme",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "Su-30",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-30 Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = "9400",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 301,
				["onboard_num"] = "301",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Su-30 Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS MiG-23MLD Ace
	[20] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard-2",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-23MLD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-23MLD Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 231,
				["onboard_num"] = "231",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-23MLD Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS MiG-25PD Ace
	[21] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-25PD",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-25PD Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 251,
				["onboard_num"] = "251",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-25PD Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS MiG-31 Ace
	[22] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "af standard",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "MiG-31",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS MiG-31 Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "15500",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 311,
				["onboard_num"] = "311",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS MiG-31 Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS Su-27 Ace
	[23] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Hotilovo AFB",
				["skill"] = "Excellent",
				["speed"] = 234.32754852983,
				["type"] = "Su-27",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Su-27 Ace",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 9400,
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 271,
				["onboard_num"] = "271",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Su-27 Ace",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
	--VVS An-26B
	[24] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 5000,
				["alt_type"] = "BARO",
				["livery_id"] = "RF Air Force",
				["skill"] = "Excellent",
				["speed"] = 150,
				["type"] = "An-26B",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS An-26B",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 4125,
					["flare"] = 384,
					["chaff"] = 384,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 261,
				["onboard_num"] = "261",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS An-26B",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
}

local USAF_AIR_TEMPLATES = {

	--Pair USAF F-16
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "14th_Fighter_Squadron",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F-16C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 6,
					[3] = 1,
					["name"] = "Pontiac61",
				}, -- end of ["callsign"]
				["onboard_num"] = "861",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["alt_type"] = "BARO",
				["livery_id"] = "14th_Fighter_Squadron",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F-16C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 6,
					[3] = 2,
					["name"] = "Pontiac62",
				}, -- end of ["callsign"]
				["onboard_num"] = "862",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF F-16C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--Pair USAF F-15
	[2] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "433rd Weapons SQN (WA)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "F-15C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F-15C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 6103,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 5,
					[3] = 1,
					["name"] = "Pontiac51",
				}, -- end of ["callsign"]
				["onboard_num"] = "851",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "433rd Weapons SQN (WA)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "F-15C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F-15C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 6103,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 5,
					[3] = 2,
					["name"] = "Pontiac52",
				}, -- end of ["callsign"]
				["onboard_num"] = "852",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF F-15C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--Pair USAF F-14B
	[3] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VF-103 Jolly Rogers Hi Viz",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-14B",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F-14B 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 7348,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 140,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 4,
					[3] = 1,
					["name"] = "Pontiac41",
				}, -- end of ["callsign"]
				["onboard_num"] = "841",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VF-103 Jolly Rogers Hi Viz",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-14B",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F-14B 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 7348,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 140,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 4,
					[3] = 2,
					["name"] = "Pontiac42",
				}, -- end of ["callsign"]
				["onboard_num"] = "842",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF F-14B",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--Pair USAF F/A-18C
	[4] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VFA-113",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "FA-18C_hornet",
				["psi"] = 0,
				["dataCartridge"] = 
				{
					["GroupsPoints"] = 
					{
						["Initial Point"] = 
						{
						}, -- end of ["Initial Point"]
						["Sequence 2 Red"] = 
						{
						}, -- end of ["Sequence 2 Red"]
						["PB"] = 
						{
						}, -- end of ["PB"]
						["Sequence 1 Blue"] = 
						{
						}, -- end of ["Sequence 1 Blue"]
						["Start Location"] = 
						{
						}, -- end of ["Start Location"]
						["A/A Waypoint"] = 
						{
						}, -- end of ["A/A Waypoint"]
						["PP"] = 
						{
						}, -- end of ["PP"]
						["Sequence 3 Yellow"] = 
						{
						}, -- end of ["Sequence 3 Yellow"]
					}, -- end of ["GroupsPoints"]
					["Points"] = 
					{
					}, -- end of ["Points"]
				}, -- end of ["dataCartridge"]
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F/A-18C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{FPU_8A_FUEL_TANK}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 4900,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 8,
					[3] = 1,
					["name"] = "Pontiac81",
				}, -- end of ["callsign"]
				["onboard_num"] = "881",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VFA-113",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "FA-18C_hornet",
				["psi"] = 0,
				["dataCartridge"] = 
				{
					["GroupsPoints"] = 
					{
						["Initial Point"] = 
						{
						}, -- end of ["Initial Point"]
						["Sequence 2 Red"] = 
						{
						}, -- end of ["Sequence 2 Red"]
						["PB"] = 
						{
						}, -- end of ["PB"]
						["Sequence 1 Blue"] = 
						{
						}, -- end of ["Sequence 1 Blue"]
						["Start Location"] = 
						{
						}, -- end of ["Start Location"]
						["A/A Waypoint"] = 
						{
						}, -- end of ["A/A Waypoint"]
						["PP"] = 
						{
						}, -- end of ["PP"]
						["Sequence 3 Yellow"] = 
						{
						}, -- end of ["Sequence 3 Yellow"]
					}, -- end of ["GroupsPoints"]
					["Points"] = 
					{
					}, -- end of ["Points"]
				}, -- end of ["dataCartridge"]
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F/A-18C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{FPU_8A_FUEL_TANK}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 4900,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 8,
					[3] = 2,
					["name"] = "Pontiac82",
				}, -- end of ["callsign"]
				["onboard_num"] = "882",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF F/A-18C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--USAF C-130
	[5] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Transport",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 5000,
				["alt_type"] = "BARO",
				["livery_id"] = "US Air Force",
				["skill"] = "Excellent",
				["speed"] = 169.44444444444,
				["type"] = "C-130",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF C-130",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 20830,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 3,
					[3] = 1,
					["name"] = "Enfield31",
				}, -- end of ["callsign"]
				["onboard_num"] = "131",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF C-130",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	
	--B-1B
	[6] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Pinpoint Strike",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "usaf standard",
				["skill"] = "High",
				["speed"] = 229.31561220292,
				["type"] = "B-1B",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF B-1B",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "GBU-31V3B*8",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "GBU-31V3B*8",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "GBU-31V3B*8",
						}, -- end of [3]
					}, -- end of ["pylons"]
					["fuel"] = "88450",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 8,
					[3] = 1,
					["name"] = "Enfield81",
				}, -- end of ["callsign"]
				["onboard_num"] = "181",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF B-1B",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--B-52H
	[7] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Pinpoint Strike",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "usaf standard",
				["skill"] = "High",
				["speed"] = 229.31561220292,
				["type"] = "B-52H",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF B-52H",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{8DCAF3A3-7FCF-41B8-BB88-58DEDA878EDE}",
						}, -- end of [2]
					}, -- end of ["pylons"]
					["fuel"] = "141135",
					["flare"] = 192,
					["chaff"] = 1125,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 5,
					[2] = 2,
					[3] = 1,
					["name"] = "Dodge21",
				}, -- end of ["callsign"]
				["onboard_num"] = "521",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF B-52H",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--MQ-9 Reaper Aerial Drone
	[8] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "AFAC",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 6448,
				["alt_type"] = "BARO",
				["livery_id"] = "'camo' scheme",
				["skill"] = "Excellent",
				["speed"] = 86.944444444444,
				["type"] = "MQ-9 Reaper",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF MQ-9 Aerial Drone",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 1300,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 9,
					[3] = 1,
					["name"] = "Pontiac91",
				}, -- end of ["callsign"]
				["onboard_num"] = "901",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAEF MQ-9 Aerial Drone",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 272,
	},
	--USAEF F-15C Call In CAP
	[9] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "433rd Weapons SQN (WA)",
				["skill"] = "Ace",
				["speed"] = 234.32754852983,
				["type"] = "F-15C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F-15C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 6103,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 5,
					[3] = 1,
					["name"] = "Pontiac51",
				}, -- end of ["callsign"]
				["onboard_num"] = "851",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "433rd Weapons SQN (WA)",
				["skill"] = "Ace",
				["speed"] = 234.32754852983,
				["type"] = "F-15C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F-15C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 6103,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 5,
					[3] = 2,
					["name"] = "Pontiac52",
				}, -- end of ["callsign"]
				["onboard_num"] = "852",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAEF F-15C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--USAEF F-16C Call In SEAD
	[10] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "SEAD",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "14th_Fighter_Squadron",
				["skill"] = "Ace",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F-16C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[11] = 
						{
							["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 6,
					[3] = 1,
					["name"] = "Pontiac61",
				}, -- end of ["callsign"]
				["onboard_num"] = "861",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "14th_Fighter_Squadron",
				["skill"] = "Ace",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F-16C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[11] = 
						{
							["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 6,
					[3] = 2,
					["name"] = "Pontiac62",
				}, -- end of ["callsign"]
				["onboard_num"] = "852",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAEF F-16C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--USAEF A-10C Call In CAS
	[11] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "66th WS Nellis AFB, Nevada (WA)",
				["skill"] = "Ace",
				["speed"] = 125,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "A-10C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF A-10C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "ALQ_184",
						}, -- end of [1]
						[11] = 
						{
							["CLSID"] = "{DB434044-F5D0-4F1F-9BA9-B73027E18DD3}",
						}, -- end of [11]
						[7] = 
						{
							["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
						}, -- end of [7]
						[10] = 
						{
							["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
						}, -- end of [10]
						[9] = 
						{
							["CLSID"] = "{DAC53A2F-79CA-42FF-A77A-F5649B601308}",
						}, -- end of [9]
						[5] = 
						{
							["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
						}, -- end of [5]
						[3] = 
						{
							["CLSID"] = "{DAC53A2F-79CA-42FF-A77A-F5649B601308}",
						}, -- end of [3]
					}, -- end of ["pylons"]
					["fuel"] = 5029,
					["flare"] = 120,
					["ammo_type"] = 1,
					["chaff"] = 240,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 12,
					[2] = 0,
					[3] = 1,
					["name"] = "Tusk01",
				}, -- end of ["callsign"]
				["onboard_num"] = "101",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "66th WS Nellis AFB, Nevada (WA)",
				["skill"] = "Ace",
				["speed"] = 125,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "A-10C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF A-10C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "ALQ_184",
						}, -- end of [1]
						[11] = 
						{
							["CLSID"] = "{DB434044-F5D0-4F1F-9BA9-B73027E18DD3}",
						}, -- end of [11]
						[7] = 
						{
							["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
						}, -- end of [7]
						[10] = 
						{
							["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
						}, -- end of [10]
						[9] = 
						{
							["CLSID"] = "{DAC53A2F-79CA-42FF-A77A-F5649B601308}",
						}, -- end of [9]
						[5] = 
						{
							["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
						}, -- end of [5]
						[3] = 
						{
							["CLSID"] = "{DAC53A2F-79CA-42FF-A77A-F5649B601308}",
						}, -- end of [3]
					}, -- end of ["pylons"]
					["fuel"] = 5029,
					["flare"] = 120,
					["ammo_type"] = 1,
					["chaff"] = 240,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 12,
					[2] = 0,
					[3] = 2,
					["name"] = "Tusk02",
				}, -- end of ["callsign"]
				["onboard_num"] = "102",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAEF A-10C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--USAEF F/A-18C Call In Anti Ship Strike
	[12] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Antiship Strike",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 5000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VFA-113",
				["skill"] = "Ace",
				["speed"] = 226.02521983177,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "FA-18C_hornet",
				["psi"] = 0,
				["dataCartridge"] = 
				{
					["GroupsPoints"] = 
					{
						["Initial Point"] = 
						{
						}, -- end of ["Initial Point"]
						["Sequence 2 Red"] = 
						{
						}, -- end of ["Sequence 2 Red"]
						["PB"] = 
						{
						}, -- end of ["PB"]
						["Sequence 1 Blue"] = 
						{
						}, -- end of ["Sequence 1 Blue"]
						["Sequence 3 Yellow"] = 
						{
						}, -- end of ["Sequence 3 Yellow"]
						["A/A Waypoint"] = 
						{
						}, -- end of ["A/A Waypoint"]
						["PP"] = 
						{
						}, -- end of ["PP"]
						["Start Location"] = 
						{
						}, -- end of ["Start Location"]
					}, -- end of ["GroupsPoints"]
					["Points"] = 
					{
					}, -- end of ["Points"]
				}, -- end of ["dataCartridge"]
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F/A-18C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{AGM_84D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{AGM_84D}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{FPU_8A_FUEL_TANK}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AGM_84D}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{AGM_84D}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 4900,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 8,
					[3] = 1,
					["name"] = "Pontiac81",
				}, -- end of ["callsign"]
				["onboard_num"] = "881",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 5000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VFA-113",
				["skill"] = "Ace",
				["speed"] = 226.02521983177,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "FA-18C_hornet",
				["psi"] = 0,
				["dataCartridge"] = 
				{
					["GroupsPoints"] = 
					{
						["Initial Point"] = 
						{
						}, -- end of ["Initial Point"]
						["Sequence 2 Red"] = 
						{
						}, -- end of ["Sequence 2 Red"]
						["PB"] = 
						{
						}, -- end of ["PB"]
						["Sequence 1 Blue"] = 
						{
						}, -- end of ["Sequence 1 Blue"]
						["Sequence 3 Yellow"] = 
						{
						}, -- end of ["Sequence 3 Yellow"]
						["A/A Waypoint"] = 
						{
						}, -- end of ["A/A Waypoint"]
						["PP"] = 
						{
						}, -- end of ["PP"]
						["Start Location"] = 
						{
						}, -- end of ["Start Location"]
					}, -- end of ["GroupsPoints"]
					["Points"] = 
					{
					}, -- end of ["Points"]
				}, -- end of ["dataCartridge"]
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F/A-18C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{AGM_84D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{AGM_84D}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{FPU_8A_FUEL_TANK}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AGM_84D}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{AGM_84D}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 4900,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 8,
					[3] = 2,
					["name"] = "Pontiac82",
				}, -- end of ["callsign"]
				["onboard_num"] = "882",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAEF F/A-18C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--USAEF F-15E Call In Pinpoint Strike
	[13] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Pinpoint Strike",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 5000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "335th Fighter SQN (SJ)",
				["skill"] = "Ace",
				["speed"] = 242.16987839118,
				["type"] = "F-15E",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F-15E 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[17] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [17]
						[8] = 
						{
							["CLSID"] = "{GBU-31V3B}",
						}, -- end of [8]
						[18] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [18]
						[12] = 
						{
							["CLSID"] = "{GBU-31V3B}",
						}, -- end of [12]
						[19] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [19]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [3]
					}, -- end of ["pylons"]
					["fuel"] = "10246",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 5,
					[3] = 1,
					["name"] = "Pontiac51",
				}, -- end of ["callsign"]
				["onboard_num"] = "851",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 5000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "335th Fighter SQN (SJ)",
				["skill"] = "Ace",
				["speed"] = 242.16987839118,
				["type"] = "F-15E",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F-15E 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[17] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [17]
						[8] = 
						{
							["CLSID"] = "{GBU-31V3B}",
						}, -- end of [8]
						[18] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [18]
						[12] = 
						{
							["CLSID"] = "{GBU-31V3B}",
						}, -- end of [12]
						[19] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [19]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [3]
					}, -- end of ["pylons"]
					["fuel"] = "10246",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 5,
					[3] = 2,
					["name"] = "Pontiac52",
				}, -- end of ["callsign"]
				["onboard_num"] = "852",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAEF F-15E",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--USAEF F-117 Call In Pinpoint Strike
	[14] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Pinpoint Strike",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 5000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "usaf standard",
				["skill"] = "Ace",
				["speed"] = 269.44444444444,
				["type"] = "F-117A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F-117A 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{EF0A9419-01D6-473B-99A3-BEBDB923B14D}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{EF0A9419-01D6-473B-99A3-BEBDB923B14D}",
						}, -- end of [2]
					}, -- end of ["pylons"]
					["fuel"] = "8255",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 7,
					[3] = 1,
					["name"] = "Pontiac71",
				}, -- end of ["callsign"]
				["onboard_num"] = "871",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 5000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "usaf standard",
				["skill"] = "Ace",
				["speed"] = 269.44444444444,
				["type"] = "F-117A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAEF F-117A 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{EF0A9419-01D6-473B-99A3-BEBDB923B14D}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{EF0A9419-01D6-473B-99A3-BEBDB923B14D}",
						}, -- end of [2]
					}, -- end of ["pylons"]
					["fuel"] = "8255",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 7,
					[3] = 2,
					["name"] = "Pontiac72",
				}, -- end of ["callsign"]
				["onboard_num"] = "872",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAEF F-117A",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--Pair USAF F-14A
	[15] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VF-31 AE200 1988",
				["skill"] = "Ace",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-14A-135-GR",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F-14A 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 7348,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 140,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 4,
					[3] = 1,
					["name"] = "Enfield41",
				}, -- end of ["callsign"]
				["onboard_num"] = "141",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "VF-31 AE200 1988",
				["skill"] = "Ace",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-14A-135-GR",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF F-14A 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{AIM_54A_Mk60}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F14-300gal}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{SHOULDER AIM-7M}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 7348,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 140,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 4,
					[3] = 2,
					["name"] = "Enfield42",
				}, -- end of ["callsign"]
				["onboard_num"] = "142",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF F-14A",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},		
	--USAF AWACS
	[16] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "AWACS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["alt_type"] = "BARO",
				["livery_id"] = "usaf standard",
				["skill"] = "Excellent",
				["speed"] = 236.94444444444,
				["type"] = "E-3A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF AWACS",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "65000",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 5,
					[2] = 1,
					[3] = 1,
					["name"] = "Darkstar11",
				}, -- end of ["callsign"]
				["onboard_num"] = "E3A",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF AWACS",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},	
	--TEXACO KC135MPRS
	[17] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 4877,
				["alt_type"] = "BARO",
				["livery_id"] = "22nd ARW",
				["skill"] = "Excellent",
				["speed"] = 203.33333333333,
				["type"] = "KC135MPRS",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "22nd ARW Texaco",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					[3] = 1,
					["name"] = "Texaco11",
				}, -- end of ["callsign"]
				["onboard_num"] = "135",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "22nd ARW Texaco",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 267,
	},
	--SHELL KC135
	[18] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 4877,
				["alt_type"] = "BARO",
				["livery_id"] = "Standard USAF",
				["skill"] = "Excellent",
				["speed"] = 146.11111111111,
				["type"] = "KC-135",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "22nd ARW Shell",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 3,
					[2] = 1,
					[3] = 1,
					["name"] = "Shell11",
				}, -- end of ["callsign"]
				["onboard_num"] = "135",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "22nd ARW Shell",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 268,
	},
	--ARCO S-3B
	[19] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["alt_type"] = "BARO",
				["livery_id"] = "usaf standard",
				["skill"] = "Excellent",
				["speed"] = 162.22222222222,
				["type"] = "S-3B Tanker",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "22nd ARW Arco",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "7813",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					[3] = 1,
					["name"] = "Arco11",
				}, -- end of ["callsign"]
				["onboard_num"] = "S3B",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "22nd ARW Arco",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 238,
	},
	--USAF HAWKEYE
	[20] = {
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "AWACS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["alt_type"] = "BARO",
				["livery_id"] = "e-2d demo",
				["skill"] = "High",
				["speed"] = 166.66666666667,
				["type"] = "E-2C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF Hawkeye",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "5624",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					[3] = 1,
					["name"] = "Overlord11",
				}, -- end of ["callsign"]
				["onboard_num"] = "321",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF Hawkeye",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 265,
	},
}

local RAF_AIR_TEMPLATES = {

	--RAF Tornado GR4 Call In Pinpoint Strike
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Pinpoint Strike",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 5000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "o of ii (ac) squadron raf marham",
				["skill"] = "Ace",
				["speed"] = 226.02521983177,
				["type"] = "Tornado GR4",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "RAF Tornado GR4 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{8C3F26A2-FA0F-11d5-9190-00A0249B6F00}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{EF124821-F9BB-4314-A153-E0E2FE1162C4}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
						}, -- end of [4]
						[11] = 
						{
							["CLSID"] = "{EF124821-F9BB-4314-A153-E0E2FE1162C4}",
						}, -- end of [11]
						[10] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [10]
						[12] = 
						{
							["CLSID"] = "{8C3F26A1-FA0F-11d5-9190-00A0249B6F00}",
						}, -- end of [12]
						[9] = 
						{
							["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = "4663",
					["flare"] = 45,
					["chaff"] = 90,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 7,
					[3] = 1,
					["name"] = "Pontiac71",
				}, -- end of ["callsign"]
				["onboard_num"] = "871",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 5000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "o of ii (ac) squadron raf marham",
				["skill"] = "Ace",
				["speed"] = 226.02521983177,
				["type"] = "Tornado GR4",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "RAF Tornado GR4 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{8C3F26A2-FA0F-11d5-9190-00A0249B6F00}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{EF124821-F9BB-4314-A153-E0E2FE1162C4}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
						}, -- end of [4]
						[11] = 
						{
							["CLSID"] = "{EF124821-F9BB-4314-A153-E0E2FE1162C4}",
						}, -- end of [11]
						[10] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [10]
						[12] = 
						{
							["CLSID"] = "{8C3F26A1-FA0F-11d5-9190-00A0249B6F00}",
						}, -- end of [12]
						[9] = 
						{
							["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = "4663",
					["flare"] = 45,
					["chaff"] = 90,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 7,
					[3] = 2,
					["name"] = "Pontiac72",
				}, -- end of ["callsign"]
				["onboard_num"] = "872",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "RAF Tornado GR4",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
}

local IAF_AIR_TEMPLATES = {

	--Pair IAF F-15C
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "106th SQN (8th Airbase)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "F-15C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IAF F-15C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 6103,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 5,
					[3] = 1,
					["name"] = "Pontiac51",
				}, -- end of ["callsign"]
				["onboard_num"] = "851",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["alt_type"] = "BARO",
				["livery_id"] = "106th SQN (8th Airbase)",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["type"] = "F-15C",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IAF F-15C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 6103,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 5,
					[3] = 2,
					["name"] = "Pontiac52",
				}, -- end of ["callsign"]
				["onboard_num"] = "852",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IAF F-15C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--Pair IAF F-16C
	[2] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "iaf_101st_squadron",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IAF F-16C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 6,
					[3] = 1,
					["name"] = "Pontiac61",
				}, -- end of ["callsign"]
				["onboard_num"] = "861",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "iaf_101st_squadron",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IAF F-16C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 6,
					[3] = 2,
					["name"] = "Pontiac62",
				}, -- end of ["callsign"]
				["onboard_num"] = "862",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IAF F-16C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
}

local THK_AIR_TEMPLATES = {

	--Pair THK F-16C
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAP",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "thk_191_filo",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "THK F-16C 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 6,
					[3] = 1,
					["name"] = "Pontiac61",
				}, -- end of ["callsign"]
				["onboard_num"] = "861",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "thk_191_filo",
				["skill"] = "High",
				["speed"] = 234.32754852983,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "THK F-16C 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "<CLEAN>",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 6,
					[3] = 2,
					["name"] = "Pontiac62",
				}, -- end of ["callsign"]
				["onboard_num"] = "862",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "THK F-16C",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},	
}

--------------------------------------------------------------------------------------------------------------------------------------------------

local USAF_HELO_TEMPLATES = {

	--USAF UH-60A
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Transport",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 500,
				["alt_type"] = "BARO",
				["livery_id"] = "standard",
				["skill"] = "Excellent",
				["ropeLength"] = 15,
				["speed"] = 44.444444444444,
				["type"] = "UH-60A",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF UH-60A",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "1100",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 6,
					[2] = 0,
					[3] = 1,
					["name"] = "Ford01",
				}, -- end of ["callsign"]
				["onboard_num"] = "601",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF UH-60A",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},	
	--USAF AH-64D Pair
	[2] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 500,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "standard",
				["skill"] = "High",
				["ropeLength"] = 15,
				["speed"] = 77.777777777778,
				["type"] = "AH-64D",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF AH-64D 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",							
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",							
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "1157",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 6,
					[2] = 4,
					[3] = 1,
					["name"] = "Ford41",
				}, -- end of ["callsign"]
				["onboard_num"] = "641",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 500,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "standard",
				["skill"] = "High",
				["ropeLength"] = 15,
				["speed"] = 77.777777777778,
				["type"] = "AH-64D",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF AH-64D 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",							
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",							
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "1157",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 6,
					[2] = 4,
					[3] = 2,
					["name"] = "Ford42",
				}, -- end of ["callsign"]
				["onboard_num"] = "642",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF AH-64D",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
	--USAF AH-1W Pair
	[3] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 1246,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "usa marines",
				["skill"] = "High",
				["ropeLength"] = 15,
				["speed"] = 80.555555555556,
				["type"] = "AH-1W",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF AH-1W 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "1250.0",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					[3] = 1,
					["name"] = "Enfield11",
				}, -- end of ["callsign"]
				["onboard_num"] = "111",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 1246,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "usa marines",
				["skill"] = "High",
				["ropeLength"] = 15,
				["speed"] = 80.555555555556,
				["type"] = "AH-1W",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "USAF AH-1W 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "1250.0",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					[3] = 2,
					["name"] = "Enfield12",
				}, -- end of ["callsign"]
				["onboard_num"] = "112",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USAF AH-1W",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
}

local IRIAF_HELO_TEMPLATES = {

	--IRIAF Mi-8MTV2
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "Transport",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 500,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IR AFAGIR Blue",
				["skill"] = "Excellent",
				["ropeLength"] = 15,
				["speed"] = 44.444444444444,
				["AddPropAircraft"] = 
				{
					["ExhaustScreen"] = true,
					["CargoHalfdoor"] = true,
					["GunnersAISkill"] = 90,
					["AdditionalArmor"] = true,
					["NS430allow"] = true,
				}, -- end of ["AddPropAircraft"]
				["type"] = "Mi-8MT",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "IRIAF Mi-8MTV2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[8] = 
						{
							["CLSID"] = "PKT_7_62",
						}, -- end of [8]
						[7] = 
						{
							["CLSID"] = "KORD_12_7",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "1929",
					["flare"] = 128,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 8,
					[3] = 1,
					["name"] = "Enfield81",
				}, -- end of ["callsign"]
				["onboard_num"] = "181",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "IRIAF Mi-8MTV2",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
}

local SYAAF_HELO_TEMPLATES = {
	
	--SyAAF Mi-24P Pair
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 1500,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "High",
				["ropeLength"] = 15,
				["speed"] = 83.333333333333,
				["AddPropAircraft"] = 
				{
					["OperatorNVG"] = true,
					["TrackAirTargets"] = true,
					["SimplifiedAI"] = false,
					["ExhaustScreen"] = true,
					["PilotNVG"] = true,
					["GunnersAISkill"] = 90,
					["HideAngleBoxes"] = false,
					["NS430allow"] = true,
				}, -- end of ["AddPropAircraft"]
				["type"] = "Mi-24P",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF Mi-24P 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{2x9M120_Ataka_V}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{2x9M120_Ataka_V}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{2x9M120_Ataka_V}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{2x9M120_Ataka_V}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 1701,
					["flare"] = 192,
					["ammo_type"] = 1,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 4,
					[3] = 1,
					["name"] = "Springfield41",
				}, -- end of ["callsign"]
				["onboard_num"] = "241",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 1500,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "SyAAF",
				["skill"] = "High",
				["ropeLength"] = 15,
				["speed"] = 83.333333333333,
				["AddPropAircraft"] = 
				{
					["OperatorNVG"] = true,
					["TrackAirTargets"] = true,
					["SimplifiedAI"] = false,
					["ExhaustScreen"] = true,
					["PilotNVG"] = true,
					["GunnersAISkill"] = 90,
					["HideAngleBoxes"] = false,
					["NS430allow"] = true,
				}, -- end of ["AddPropAircraft"]
				["type"] = "Mi-24P",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "SyAAF Mi-24P 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{2x9M120_Ataka_V}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{2x9M120_Ataka_V}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{2x9M120_Ataka_V}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{2x9M120_Ataka_V}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = 1701,
					["flare"] = 192,
					["ammo_type"] = 1,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 4,
					[3] = 2,
					["name"] = "Springfield42",
				}, -- end of ["callsign"]
				["onboard_num"] = "242",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "SyAAF Mi-24P",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 124,
	},
}

local VVS_HELO_TEMPLATES = {

	--VVS Ka-50 Pair
	[1] = {		
		["radioSet"] = false,
		["lateActivation"] = true,
		["tasks"] =	{}, 
		["task"] = "CAS",
		["uncontrolled"] = false,
		["taskSelected"] = true,	
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 1262.27088559,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Russia Fictional Olive Grey",
				["skill"] = "High",
				["ropeLength"] = 15,
				["speed"] = 77.777777777778,
				["type"] = "Ka-50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Ka-50 1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "B_8V20A_OFP2",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "B_8V20A_OFP2",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "1450",
					["flare"] = 128,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 501,
				["onboard_num"] = "501",
			}, -- end of [1]
			[2] = 
			{
				["alt"] = 1262.27088559,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "Russia Fictional Olive Grey",
				["skill"] = "High",
				["ropeLength"] = 15,
				["speed"] = 77.777777777778,
				["type"] = "Ka-50",
				["psi"] = 0,
				["y"] = 0,
				["x"] = 0,
				["name"] = "VVS Ka-50 2",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "B_8V20A_OFP2",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "B_8V20A_OFP2",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "1450",
					["flare"] = 128,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 502,
				["onboard_num"] = "502",
			}, -- end of [2]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "VVS Ka-50",
		["communication"] = true,	
		["modulation"] = 0,
		["frequency"] = 266,
	},
}	

--------------------------------------------------------------------------------------------------------------------------------------------------

local USACE_USA_TEMPLATES = {

	--INFANTRY SQUAD
	[1] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "Infantry Squad",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M4",
				["y"] = -438572.94571844,
				["x"] = 236480.45241088,
				["name"] = "Infantry Squad 1",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M4",
				["y"] = -438559.04374137,
				["x"] = 236434.66456144,
				["name"] = "Infantry Squad 2",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M4",
				["y"] = -438549.95039654,
				["x"] = 236465.15488629,
				["name"] = "Infantry Squad 3",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M4",
				["y"] = -438586.9140389,
				["x"] = 236434.68760132,
				["name"] = "Infantry Squad 4",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M249",
				["y"] = -438596.12182511,
				["x"] = 236465.04060058,
				["name"] = "Infantry Squad 5",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [5]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "Infantry Squad",		
	}, -- end of [1]	
	--US M1025 HMMWV
	[2] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "US M1025 HMMWV",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["livery_id"] = "desert",
				["skill"] = "High",
				["type"] = "Hummer",
				["y"] = 0,
				["x"] = 0,
				["name"] = "US M1025 HMMWV",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "US M1025 HMMWV",		
	}, -- end of [2]	
	--M818 Ammo Truck
	[3] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE M818",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["livery_id"] = "desert",
				["skill"] = "Excellent",
				["type"] = "M 818",
				["y"] = 0,
				["x"] = 0,
				["name"] = "USACE M818",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE M818",		
	}, -- end of [3]	
	--Roland ADS
	[4] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE Roland ADS",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["livery_id"] = "desert",
				["skill"] = "High",
				["type"] = "Roland ADS",
				["y"] = 0,
				["x"] = 0,
				["name"] = "USACE Roland ADS",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE Roland ADS",		
	}, -- end of [4]	
	--Hawk System
	[5] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["hiddenOnMFD"] = false,
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE Hawk",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 100,
												["name"] = 24,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 5,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "Hawk pcp",
				["y"] = -442370.34876039,
				["x"] = 236382.00234557,
				["name"] = "USACE Hawk 1",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "Hawk cwar",
				["y"] = -442370.61258371,
				["x"] = 236282.13451299,
				["name"] = "USACE Hawk 2",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "Hawk sr",
				["y"] = -442420.36734397,
				["x"] = 236332.04944083,
				["name"] = "USACE Hawk 3",
				["heading"] = 1.5707963267949,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "Hawk tr",
				["y"] = -442320.48752387,
				["x"] = 236331.96310246,
				["name"] = "USACE Hawk 4",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "Hawk ln",
				["y"] = -442441.12742214,
				["x"] = 236402.69285665,
				["name"] = "USACE Hawk 5",
				["heading"] = 5.4977871437821,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "Hawk ln",
				["y"] = -442299.64120427,
				["x"] = 236402.53533974,
				["name"] = "USACE Hawk 6",
				["heading"] = 0.78539816339745,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "Hawk ln",
				["y"] = -442299.73926518,
				["x"] = 236261.336757,
				["name"] = "USACE Hawk 7",
				["heading"] = 2.3561944901923,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "Hawk ln",
				["y"] = -442441.09900772,
				["x"] = 236261.32906851,
				["name"] = "USACE Hawk 8",
				["heading"] = 3.9269908169872,
				["playerCanDrive"] = false,
			}, -- end of [8]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE Hawk",		
		["hiddenOnPlanner"] = false,
	}, -- end of [5]
	--USACE Squad
	[6] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE Squad",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M4",
				["y"] = -438573.16348383,
				["x"] = 236324.30345361,
				["name"] = "USACE Squad 1",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M4",
				["y"] = -438559.26150677,
				["x"] = 236278.51560417,
				["name"] = "USACE Squad 2",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M4",
				["y"] = -438550.16816194,
				["x"] = 236309.00592902,
				["name"] = "USACE Squad 3",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M4",
				["y"] = -438587.1318043,
				["x"] = 236278.53864405,
				["name"] = "USACE Squad 4",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier M249",
				["y"] = -438596.33959051,
				["x"] = 236308.89164331,
				["name"] = "USACE Squad 5",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [5]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE Squad",		
	}, -- end of [6]
	--M1A2 Abrams
	[7] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE M1A2 Abrams",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								--[[
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 3,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								]]--
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["livery_id"] = "desert",
				["skill"] = "High",
				["type"] = "M-1 Abrams",
				["y"] = 0,
				["x"] = 0,
				["name"] = "USACE M1A2 Abrams",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE M1A2 Abrams",		
	}, -- end of [7]	
	--Avenger
	[8] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE Avenger",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								--[[
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								]]--
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "M1097 Avenger",
				["y"] = 0,
				["x"] = 0,
				["name"] = "USACE Avenger",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE Avenger",		
	}, -- end of [8]
	--Bradley M6
	[9] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE Bradley M6",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								--[[
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								]]--
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["livery_id"] = "desert",
				["skill"] = "High",
				["type"] = "M6 Linebacker",
				["y"] = 0,
				["x"] = 0,
				["name"] = "USACE Bradley M6",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE Bradley M6",		
	}, -- end of [9]
	--Paladin
	[10] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE SPH M109 Paladin",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								--[[
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 11,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								]]--
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["livery_id"] = "desert",
				["skill"] = "High",
				["type"] = "M-109",
				["y"] = 0,
				["x"] = 0,
				["name"] = "USACE SPH M109 Paladin",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE SPH M109 Paladin",		
	}, -- end of [10]	
	--Stinger Squad
	[11] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "Stinger Squad",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier stinger",
				["y"] = -438571.65666713,
				["x"] = 236183.82354964,
				["name"] = "Stinger Squad 1",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier stinger",
				["y"] = -438550.92370333,
				["x"] = 236144.9624558,
				["name"] = "Stinger Squad 2",
				["heading"] = 2.0943951023932,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "Excellent",
				["type"] = "Soldier stinger",
				["y"] = -438592.49764153,
				["x"] = 236145.2116557,
				["name"] = "Stinger Squad 3",
				["heading"] = 4.1887902047864,
				["playerCanDrive"] = false,
			}, -- end of [3]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "Stinger Squad",		
	}, -- end of [11]	
}

local USACE_NOR_TEMPLATES = {
	
	--NASAMS System
	[1] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "USACE NASAMS",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								--[[
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 10,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								]]--
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 100,
												["name"] = 24,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 5,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "NASAMS_Command_Post",
				["y"] = -441764.11355978,
				["x"] = 236325.74747471,
				["name"] = "USACE NASAMS 1",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "NASAMS_Radar_MPQ64F1",
				["y"] = -441764.12729905,
				["x"] = 236274.50909984,
				["name"] = "USACE NASAMS 2",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "NASAMS_LN_C",
				["y"] = -441834.85729047,
				["x"] = 236395.15835842,
				["name"] = "USACE NASAMS 3",
				["heading"] = 5.4977871437821,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "NASAMS_LN_C",
				["y"] = -441693.40741948,
				["x"] = 236395.09780835,
				["name"] = "USACE NASAMS 4",
				["heading"] = 0.78539816339745,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "NASAMS_LN_C",
				["y"] = -441693.58000179,
				["x"] = 236253.68542769,
				["name"] = "USACE NASAMS 5",
				["heading"] = 2.3561944901923,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["skill"] = "High",
				["type"] = "NASAMS_LN_C",
				["y"] = -441834.79182592,
				["x"] = 236253.7455456,
				["name"] = "USACE NASAMS 6",
				["heading"] = 3.9269908169872,
				["playerCanDrive"] = false,
			}, -- end of [6]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "USACE NASAMS",		
	}, -- end of [1]
}

local SYAAF_GROUND_TEMPLATES = {
	
	[1] = 
	{
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 0,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 0,
					["x"] = 0,
					["name"] = "Syrian APC Tigr 233036",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["name"] = 8,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["livery_id"] = "desert",
				["skill"] = "High",
				["type"] = "Tigr_233036",
				["y"] = 0,
				["x"] = 0,
				["name"] = "Syrian APC Tigr 233036",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 0,
		["x"] = 0,
		["name"] = "Syrian APC Tigr 233036",		
	}, -- end of [1]
}

--------------------------------------------------------------------------------------------------------------------------------------------------
--////INITIALISE AIR TEMPLATES

for i, Template in pairs(SYAAF_AIR_TEMPLATES) do 
	coalition.addGroup(country.id.SYRIA, Group.Category.AIRPLANE, Template)
	SYAAF_AIR_INDEX = SYAAF_AIR_INDEX + 1
	SYAAF_AIR_TABLE[SYAAF_AIR_INDEX] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.SYRIA)        
end

for i, Template in pairs(IRIAF_AIR_TEMPLATES) do 
	coalition.addGroup(country.id.IRAN, Group.Category.AIRPLANE, Template)
	IRIAF_AIR_INDEX = IRIAF_AIR_INDEX + 1
	IRIAF_AIR_TABLE[IRIAF_AIR_INDEX] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.IRAN)        
end

for i, Template in pairs(VVS_AIR_TEMPLATES)	do 
	coalition.addGroup(country.id.RUSSIA, Group.Category.AIRPLANE, Template)
	VVS_AIR_INDEX = VVS_AIR_INDEX + 1
	VVS_AIR_TABLE[VVS_AIR_INDEX] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.RUSSIA)        
end

for i, Template in pairs(USAF_AIR_TEMPLATES)	do 
	coalition.addGroup(country.id.USA, Group.Category.AIRPLANE, Template)
	USAF_AIR_INDEX = USAF_AIR_INDEX + 1
	USAF_AIR_TABLE[USAF_AIR_INDEX] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.USA)        
end

for i, Template in pairs(RAF_AIR_TEMPLATES)	do 
	coalition.addGroup(country.id.UK, Group.Category.AIRPLANE, Template)
	RAF_AIR_INDEX = RAF_AIR_INDEX + 1
	RAF_AIR_TABLE[RAF_AIR_INDEX] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.UK)        
end

for i, Template in pairs(IAF_AIR_TEMPLATES)	do 
	coalition.addGroup(country.id.ISRAEL, Group.Category.AIRPLANE, Template)
	IAF_AIR_INDEX = IAF_AIR_INDEX + 1
	IAF_AIR_TABLE[IAF_AIR_INDEX] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.ISRAEL)        
end

for i, Template in pairs(THK_AIR_TEMPLATES)	do 
	coalition.addGroup(country.id.TURKEY, Group.Category.AIRPLANE, Template)
	THK_AIR_INDEX = THK_AIR_INDEX + 1
	THK_AIR_TABLE[THK_AIR_INDEX] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.TURKEY)        
end

--------------------------------------------------------------------------------------------------------------------------------------------------
--////INITIALISE HELO TEMPLATES

for i, Template in pairs(USAF_HELO_TEMPLATES) do 
	coalition.addGroup(country.id.USA, Group.Category.HELICOPTER, Template)
	USAF_HELO_INDEX = USAF_HELO_INDEX + 1
	USAF_HELO_TABLE[USAF_HELO_INDEX] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.HELICOPTER, country.id.USA)	
end

for i, Template in pairs(IRIAF_HELO_TEMPLATES) do 
	coalition.addGroup(country.id.IRAN, Group.Category.HELICOPTER, Template)
	IRIAF_HELO_INDEX = IRIAF_HELO_INDEX + 1
	IRIAF_HELO_TABLE[IRIAF_HELO_INDEX] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.HELICOPTER, country.id.IRAN)	
end

for i, Template in pairs(SYAAF_HELO_TEMPLATES) do 
	coalition.addGroup(country.id.SYRIA, Group.Category.HELICOPTER, Template)
	SYAAF_HELO_INDEX = SYAAF_HELO_INDEX + 1
	SYAAF_HELO_TABLE[SYAAF_HELO_INDEX] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.HELICOPTER, country.id.SYRIA)	
end

--------------------------------------------------------------------------------------------------------------------------------------------------
--////INITIALISE GROUND TEMPLATES

for i, Template in pairs(USACE_USA_TEMPLATES) do 
	coalition.addGroup(country.id.USA, Group.Category.GROUND, Template)
	USACE_USA_INDEX = USACE_USA_INDEX + 1
	USACE_USA_TABLE[USACE_USA_INDEX] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.GROUND, country.id.USA)	
end

for i, Template in pairs(USACE_NOR_TEMPLATES) do 
	coalition.addGroup(country.id.NORWAY, Group.Category.GROUND, Template)
	USACE_NOR_INDEX = USACE_NOR_INDEX + 1
	USACE_NOR_TABLE[USACE_NOR_INDEX] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.GROUND, country.id.NORWAY)	
end

for i, Template in pairs(SYAAF_GROUND_TEMPLATES) do 
	coalition.addGroup(country.id.SYRIA, Group.Category.GROUND, Template)
	SYAAF_GROUND_INDEX = SYAAF_GROUND_INDEX + 1
	SYAAF_GROUND_TABLE[SYAAF_GROUND_INDEX] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.GROUND, country.id.SYRIA)	
end

--------------------------------------------------------------------------------------------------------------------------------------------------

--//////////////////////////////////////////////////////
-- Name: Operation Clear Field Escalation - Navy Module
-- Author: Surrexen    ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ 
--//////////////////////////////////////////////////////
--////MAIN

trigger.action.outSound('Background Chatter.ogg')

CarrierPhase = 1

---------------------------------------------------------------------------------------------------------------------------------------
--////FUNCTIONS

function SEF_CarrierTurning()
	
	trigger.action.outText("Admiral Michael Gilday Reports The Carrier Group Will Be Making It's Turn In Another 00:08:34 / 5000m", 15)

end

function SEF_TarawaTurning()
	
	trigger.action.outText("Admiral Michael Gilday Reports The Tarawa Will Be Making It's Turn In Another 00:08:34 / 5000m", 15)

end

function SEF_BattlePhaseCheckCarrierGroup()

	if ( 		Airbase.getByName(AIRBASE.Caucasus.Batumi):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Kobuleti):getCoalition() ~= 2 or			
				Airbase.getByName(AIRBASE.Caucasus.Senaki_Kolkhi):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Kutaisi):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Tbilisi_Lochini):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Vaziani):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Soganlug):getCoalition() ~= 2 ) then
			
				--Then we must be in Phase 1
				return 1
				
	elseif ( 	Airbase.getByName(AIRBASE.Caucasus.Sukhumi_Babushara):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() ~= 2 ) then
				
				--Then we must be in Phase 2
				return 2
				
	elseif (	Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 2 or 
				Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() ~= 2 ) then
	
				--Then we must be in Phase 3
				return 3
				
	elseif (	Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Center):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() ~= 2 ) then
				
				--Then we must be in Phase 4
				return 4
	else
		return 1
	end
end

function SEF_CarrierMission()

	--CarrierPhase = SEF_BattlePhaseCheckCarrierGroup()									--Override for now as we don't have a 2nd route implemented
	
	if ( CarrierPhase <= 2 ) then
	
		CarrierRouteZone1 = ZONE:FindByName("Carrier Route 1 Point 1")
		CarrierRouteZone2 = ZONE:FindByName("Carrier Route 1 Point 2")
		CarrierRouteZone3 = ZONE:FindByName("Carrier Route 1 Point 3")
		CarrierRouteZone4 = ZONE:FindByName("Carrier Route 1 Point 4")
		CarrierRouteZone5 = ZONE:FindByName("Carrier Route 1 Point 5")
		CarrierRouteZone6 = ZONE:FindByName("Carrier Route 1 Point 6")
		CarrierRouteZone7 = ZONE:FindByName("Carrier Route 1 Point 7")
		CarrierRouteZone8 = ZONE:FindByName("Carrier Route 1 Point 8")
		CarrierRouteZone9 = ZONE:FindByName("Carrier Route 1 Point 9")				

		CarrierRoutePoint1Vec2 = CarrierRouteZone1:GetVec2()
		CarrierRoutePoint2Vec2 = CarrierRouteZone2:GetVec2()
		CarrierRoutePoint3Vec2 = CarrierRouteZone3:GetVec2()
		CarrierRoutePoint4Vec2 = CarrierRouteZone4:GetVec2()
		CarrierRoutePoint5Vec2 = CarrierRouteZone5:GetVec2()
		CarrierRoutePoint6Vec2 = CarrierRouteZone6:GetVec2()
		CarrierRoutePoint7Vec2 = CarrierRouteZone7:GetVec2()
		CarrierRoutePoint8Vec2 = CarrierRouteZone8:GetVec2()
		CarrierRoutePoint9Vec2 = CarrierRouteZone9:GetVec2()		
		
		trigger.action.outText("Admiral Michael Gilday Reports The Carrier Group Is Executing The Phase 1/2 Mission Plan", 15)
	else
	
		CarrierRouteZone1 = ZONE:FindByName("Carrier Route 2 Point 1")
		CarrierRouteZone2 = ZONE:FindByName("Carrier Route 2 Point 2")
		CarrierRouteZone3 = ZONE:FindByName("Carrier Route 2 Point 3")
		CarrierRouteZone4 = ZONE:FindByName("Carrier Route 2 Point 4")
		CarrierRouteZone5 = ZONE:FindByName("Carrier Route 2 Point 5")
		CarrierRouteZone6 = ZONE:FindByName("Carrier Route 2 Point 6")
		CarrierRouteZone7 = ZONE:FindByName("Carrier Route 2 Point 7")
		CarrierRouteZone8 = ZONE:FindByName("Carrier Route 2 Point 8")
		CarrierRouteZone9 = ZONE:FindByName("Carrier Route 2 Point 9")				

		CarrierRoutePoint1Vec2 = CarrierRouteZone1:GetVec2()
		CarrierRoutePoint2Vec2 = CarrierRouteZone2:GetVec2()
		CarrierRoutePoint3Vec2 = CarrierRouteZone3:GetVec2()
		CarrierRoutePoint4Vec2 = CarrierRouteZone4:GetVec2()
		CarrierRoutePoint5Vec2 = CarrierRouteZone5:GetVec2()
		CarrierRoutePoint6Vec2 = CarrierRouteZone6:GetVec2()
		CarrierRoutePoint7Vec2 = CarrierRouteZone7:GetVec2()
		CarrierRoutePoint8Vec2 = CarrierRouteZone8:GetVec2()
		CarrierRoutePoint9Vec2 = CarrierRouteZone9:GetVec2()		
		
		trigger.action.outText("Admiral Michael Gilday Reports The Carrier Group Is Executing The Phase 3/4 Mission Plan", 15)
	end	
	
	--////EXECUTE CARRIER MISSION PROFILE
	CarrierMission = {
		["id"] = "Mission",
		["params"] = {						
			["route"] = 
			{
				["points"] = 
				{					
					[1] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 2052.9461697281,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint1Vec2.y,
						["x"] = CarrierRoutePoint1Vec2.x,
						["ETA_locked"] = false,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_CarrierTurning()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [1]
					[2] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 4197.5234743132,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint2Vec2.y,
						["x"] = CarrierRoutePoint2Vec2.x,
						["ETA_locked"] = false,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [2]
					[3] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 9283.8062952378,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint3Vec2.y,
						["x"] = CarrierRoutePoint3Vec2.x,
						["ETA_locked"] = false,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_CarrierTurning()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [3]
					[4] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 11524.882414909,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint4Vec2.y,
						["x"] = CarrierRoutePoint4Vec2.x,
						["ETA_locked"] = false,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [4]
					[5] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint5Vec2.y,
						["x"] = CarrierRoutePoint5Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_CarrierTurning()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [5]					
					[6] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint6Vec2.y,
						["x"] = CarrierRoutePoint6Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [6]
					[7] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint7Vec2.y,
						["x"] = CarrierRoutePoint7Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_CarrierTurning()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [7]
					[8] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint8Vec2.y,
						["x"] = CarrierRoutePoint8Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [8]
					[9] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = CarrierRoutePoint9Vec2.y,
						["x"] = CarrierRoutePoint9Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "ABE",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 72,
													["unitId"] = 1,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1159000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 1,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 7,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_CarrierMission()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [9]					
				}, -- end of ["points"]
			}, -- end of ["route"]
		}, --end of ["params"]
	}--end of Mission	
	GROUP:FindByName("CVN-72 Abraham Lincoln"):SetTask(CarrierMission)		
end

function SEF_TarawaMission()

	--CarrierPhase = SEF_BattlePhaseCheckCarrierGroup()									--Override for now as we don't have a 2nd route implemented
	
	if ( CarrierPhase <= 2 ) then
	
		TarawaRouteZone1 = ZONE:FindByName("Tarawa Route 1 Point 1")
		TarawaRouteZone2 = ZONE:FindByName("Tarawa Route 1 Point 2")
		TarawaRouteZone3 = ZONE:FindByName("Tarawa Route 1 Point 3")
		TarawaRouteZone4 = ZONE:FindByName("Tarawa Route 1 Point 4")
		TarawaRouteZone5 = ZONE:FindByName("Tarawa Route 1 Point 5")
		TarawaRouteZone6 = ZONE:FindByName("Tarawa Route 1 Point 6")
		TarawaRouteZone7 = ZONE:FindByName("Tarawa Route 1 Point 7")
		TarawaRouteZone8 = ZONE:FindByName("Tarawa Route 1 Point 8")
		TarawaRouteZone9 = ZONE:FindByName("Tarawa Route 1 Point 9")				

		TarawaRoutePoint1Vec2 = TarawaRouteZone1:GetVec2()
		TarawaRoutePoint2Vec2 = TarawaRouteZone2:GetVec2()
		TarawaRoutePoint3Vec2 = TarawaRouteZone3:GetVec2()
		TarawaRoutePoint4Vec2 = TarawaRouteZone4:GetVec2()
		TarawaRoutePoint5Vec2 = TarawaRouteZone5:GetVec2()
		TarawaRoutePoint6Vec2 = TarawaRouteZone6:GetVec2()
		TarawaRoutePoint7Vec2 = TarawaRouteZone7:GetVec2()
		TarawaRoutePoint8Vec2 = TarawaRouteZone8:GetVec2()
		TarawaRoutePoint9Vec2 = TarawaRouteZone9:GetVec2()		
		
		trigger.action.outText("Admiral Michael Gilday Reports The Tarawa Is Executing The Phase 1/2 Mission Plan", 15)
	else
	
		TarawaRouteZone1 = ZONE:FindByName("Tarawa Route 2 Point 1")
		TarawaRouteZone2 = ZONE:FindByName("Tarawa Route 2 Point 2")
		TarawaRouteZone3 = ZONE:FindByName("Tarawa Route 2 Point 3")
		TarawaRouteZone4 = ZONE:FindByName("Tarawa Route 2 Point 4")
		TarawaRouteZone5 = ZONE:FindByName("Tarawa Route 2 Point 5")
		TarawaRouteZone6 = ZONE:FindByName("Tarawa Route 2 Point 6")
		TarawaRouteZone7 = ZONE:FindByName("Tarawa Route 2 Point 7")
		TarawaRouteZone8 = ZONE:FindByName("Tarawa Route 2 Point 8")
		TarawaRouteZone9 = ZONE:FindByName("Tarawa Route 2 Point 9")				

		TarawaRoutePoint1Vec2 = TarawaRouteZone1:GetVec2()
		TarawaRoutePoint2Vec2 = TarawaRouteZone2:GetVec2()
		TarawaRoutePoint3Vec2 = TarawaRouteZone3:GetVec2()
		TarawaRoutePoint4Vec2 = TarawaRouteZone4:GetVec2()
		TarawaRoutePoint5Vec2 = TarawaRouteZone5:GetVec2()
		TarawaRoutePoint6Vec2 = TarawaRouteZone6:GetVec2()
		TarawaRoutePoint7Vec2 = TarawaRouteZone7:GetVec2()
		TarawaRoutePoint8Vec2 = TarawaRouteZone8:GetVec2()
		TarawaRoutePoint9Vec2 = TarawaRouteZone9:GetVec2()		
		
		trigger.action.outText("Admiral Michael Gilday Reports The Tarawa Is Executing The Phase 3/4 Mission Plan", 15)
	end	
	
	--////EXECUTE TARAWA MISSION PROFILE
	TarawaMission = {
		["id"] = "Mission",
		["params"] = {						
			["route"] = 
			{
				["points"] = 
				{					
					[1] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 2052.9461697281,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint1Vec2.y,
						["x"] = TarawaRoutePoint1Vec2.x,
						["ETA_locked"] = false,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_TarawaTurning()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [1]
					[2] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 4197.5234743132,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint2Vec2.y,
						["x"] = TarawaRoutePoint2Vec2.x,
						["ETA_locked"] = false,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [2]
					[3] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 9283.8062952378,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint3Vec2.y,
						["x"] = TarawaRoutePoint3Vec2.x,
						["ETA_locked"] = false,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_TarawaTurning()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [3]
					[4] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 11524.882414909,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint4Vec2.y,
						["x"] = TarawaRoutePoint4Vec2.x,
						["ETA_locked"] = false,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [4]
					[5] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint5Vec2.y,
						["x"] = TarawaRoutePoint5Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_TarawaTurning()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [5]					
					[6] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint6Vec2.y,
						["x"] = TarawaRoutePoint6Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [6]
					[7] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint7Vec2.y,
						["x"] = TarawaRoutePoint7Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_TarawaTurning()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [7]
					[8] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint8Vec2.y,
						["x"] = TarawaRoutePoint8Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [8]
					[9] = 
					{
						["alt"] = 0,
						["type"] = "Turning Point",
						["ETA"] = 0,
						["alt_type"] = "BARO",
						["formation_template"] = "",
						["y"] = TarawaRoutePoint9Vec2.y,
						["x"] = TarawaRoutePoint9Vec2.x,
						["ETA_locked"] = true,
						["speed"] = 9.7222222222222,
						["action"] = "Turning Point",
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
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "ActivateBeacon",
												["params"] = 
												{
													["type"] = 4,
													["AA"] = false,
													["callsign"] = "TRW",
													["modeChannel"] = "X",
													["name"] = "TACAN",
													["channel"] = 75,
													["unitId"] = 874,
													["system"] = 3,
													["bearing"] = true,
													["frequency"] = 1162000000,
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
												["id"] = "ActivateICLS",
												["params"] = 
												{
													["unitId"] = 874,
													["type"] = 131584,
													["name"] = "ICLS",
													["channel"] = 8,
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
										["enabled"] = true,
										["auto"] = false,
										["id"] = "WrappedAction",
										["number"] = 4,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "Script",
												["params"] = 
												{
													["command"] = "SEF_TarawaMission()",
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [4]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["speed_locked"] = true,
					}, -- end of [9]					
				}, -- end of ["points"]
			}, -- end of ["route"]
		}, --end of ["params"]
	}--end of Mission	
	GROUP:FindByName("LHA-1 Tarawa"):SetTask(TarawaMission)		
end

---------------------------------------------------------------------------------------------------------------------------------------
--////MAIN

SEF_CarrierMission()
SEF_TarawaMission()

if ( Group.getByName("CV 1143.5 Admiral Kuznetsov") ) then
	GROUP:FindByName("CV 1143.5 Admiral Kuznetsov"):PatrolRoute()
end

if ( Group.getByName("Georgian Navy") ) then
	GROUP:FindByName("Georgian Navy"):PatrolRoute()
end

if ( Group.getByName("Sukhumi - Navy") ) then
	GROUP:FindByName("Sukhumi - Navy"):PatrolRoute()
end

if ( Group.getByName("Gudauta - Navy") ) then
	GROUP:FindByName("Gudauta - Navy"):PatrolRoute()
end

if ( Group.getByName("Sochi - Navy") ) then
	GROUP:FindByName("Sochi - Navy"):PatrolRoute()
end

if ( Group.getByName("Red October") ) then
	GROUP:FindByName("Red October"):PatrolRoute()
end

if ( Group.getByName("Lazarevskoe - Cargo Ship") ) then
	GROUP:FindByName("Lazarevskoe - Cargo Ship"):PatrolRoute()
end

if ( Group.getByName("Pitsunda - Cargo Ship") ) then
	GROUP:FindByName("Pitsunda - Cargo Ship"):PatrolRoute()
end
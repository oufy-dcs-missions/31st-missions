--//////////////////////////////////////////////////////////
-- Name: Operation Sea Slug - Airforce Module
-- Author: Surrexen    ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ
--//////////////////////////////////////////////////////////

--[[
	"Antonio B. Won Pat Intl"
	"Andersen AFB"
	"Rota Intl"
	"Tinian Intl"
	"Saipan Intl"	
]]--

--[[

-- Alpha   - CombinedRed
-- Beta    - KPAAF	
-- Gamma   - PLAAF
-- Delta   - VVS
-- Epsilon - VVS

]]--

CAPZoneBlueCarrier1			= ZONE_GROUP:New("CAP Zone Carrier 1", GROUP:FindByName( "CVN-72 Abraham Lincoln" ), 25000)
CAPZoneBlueCarrier2			= ZONE_GROUP:New("CAP Zone Carrier 2", GROUP:FindByName( "CV-59 Forrestal" ), 25000)
CAPZoneRedCarrier1			= ZONE_GROUP:New("CAP Zone Red Carrier 1", GROUP:FindByName( "CV 1143.5 Admiral Kuznetsov" ), 25000)
CAPZoneRedCarrier2 			= ZONE_GROUP:New("CAP Zone Red Carrier 2", GROUP:FindByName( "CV 1143.5 Liaoning" ), 25000)
CAPZoneRedCarrier1Perimeter = ZONE_GROUP:New("CV 1143.5 Admiral Kuznetsov Perimeter Zone", GROUP:FindByName( "CV 1143.5 Admiral Kuznetsov" ), 74080)
CAPZoneRedCarrier2Perimeter = ZONE_GROUP:New("CV 1143.5 Liaoning Perimeter Zone", GROUP:FindByName( "CV 1143.5 Liaoning" ), 74080)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////VARIABLES

RedSquadronName1 = "Alpha"
RedSquadronName2 = "Beta"
RedSquadronName3 = "Gamma"
RedSquadronName4 = "Delta"
RedSquadronName5 = "Epsilon"
RedHeloName		 = "Zeta"

REDSQUADRON1GROUPNAME = ""
REDSQUADRON2GROUPNAME = ""
REDSQUADRON3GROUPNAME = ""
REDSQUADRON4GROUPNAME = ""
REDSQUADRON5GROUPNAME = ""
REDHELOGROUPNAME 	  = ""

BlueSquadronName1 = "VF103"
BlueSquadronName2 = "VF113"
BlueSquadronName3 = "VF31"
BlueHeloName	  = "17th Cavalry"

BLUESQUADRON1GROUPNAME = ""
BLUESQUADRON2GROUPNAME = ""
BLUESQUADRON3GROUPNAME = ""
BLUEHELOGROUPNAME	   = ""

BlueSquadronsEnabled = 1
RedSquadronsEnabled = 1

BlueRespawnTimerInitialMin = 300
BlueRespawnTimerInitialMax = 450
RedRespawnTimerInitialMin = 300
RedRespawnTimerInitialMax = 450

BlueRespawnTimerMin = 600
BlueRespawnTimerMax = 1200
RedRespawnTimerMin  = 1800
RedRespawnTimerMax  = 2700

RedFlightLevelMin = 5
RedFlightLevelMax = 11
BlueFlightLevelMin = 5
BlueFlightLevelMax = 11

RedPatrolWaypointDistance = 46300
RedPatrolWaypointInitial = 18520

BluePatrolWaypointDistance = 46300
BluePatrolWaypointInitial = 18520

EngagementDistance = 74080

CleanupTime = 300

AlphaStatus 	= "Alpha Squadron\nAirspace Is Controlled By China\n"
BetaStatus 		= "Beta Squadron\nAirspace Is Controlled By China\n"
GammaStatus 	= "Gamma Squadron\nAirspace Is Controlled By China\n"
DeltaStatus 	= "Delta Squadron\nAirspace Is Controlled By China\n"
EpsilonStatus 	= "Epsilon Squadron\nAirspace Is Controlled By China\n"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////TABLES

USAFAirForceCAP = { 
				  "USAF F-15C",
				  "USAF F-16C",			   
				  }
					 
AndersenAirForceCAP = { 
					  "USAF F-16C", 
					  "USAF F/A-18C", 
					  "USAF F-15C",					  
					  }					 

USNAirForceCAP = { 
				 "USAF F/A-18C", 
				 "USAF F-14B", 
				 }
				 
ForrestalCAP = { "USAF F-14A" }				 

CombinedBlueCAP  = { 
				   "USAF F-16C", 
				   "USAF F/A-18C", 
				   "USAF F-15C", 
				   "USAF F-14B", 				    
				   }

PLAAFAirForceCAP = { 
				   "PLAAF J-11A",
				   "PLAAF JF-17",
				   "PLAAF MiG-21Bis",
				   "PLAAF Su-27",
				   "PLAAF Su-30",
				   "PLAAF J-11A Ace",
				   "PLAAF JF-17 Ace",
				   "PLAAF MiG-21Bis Ace",
				   "PLAAF Su-27 Ace",
				   "PLAAF Su-30 Ace",	
				   }
				   
KPAAFAirForceCAP = { 
				   "KPAAF MiG-19P",
				   "KPAAF MiG-21Bis",
				   "KPAAF MiG-29A",
				   --"KPAAF MiG-15bis",
				   "KPAAF MiG-19P Ace",
				   "KPAAF MiG-21Bis Ace",
				   "KPAAF MiG-29A Ace",
				   --"KPAAF MiG-15bis Ace",
				   }

CombinedRedCAP = { 
				   "PLAAF J-11A",
				   "PLAAF JF-17",
				   "PLAAF MiG-21Bis",
				   "PLAAF Su-27",
				   "PLAAF Su-30",
				   "KPAAF MiG-19P",
				   "KPAAF MiG-21Bis",
				   "KPAAF MiG-29A",
				   --"KPAAF MiG-15bis",
				   "PLAAF J-11A Ace",
				   "PLAAF JF-17 Ace",
				   "PLAAF MiG-21Bis Ace",
				   "PLAAF Su-27 Ace",
				   "PLAAF Su-30 Ace",
				   "KPAAF MiG-19P Ace",
				   "KPAAF MiG-21Bis Ace",
				   "KPAAF MiG-29A Ace",
				   --"KPAAF MiG-15bis Ace",
				   }

BlackSeaFleetCAP = {	
					"VVS Su-33",
					"VVS Su-33 Ace",		
				   }

LiaoningCAP		 = {
					"PLAAF J-15",
					"PLAAF J-15 Ace",
				   }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

USAFAWACS_DATA = {}
USAFAWACS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2 		= nil	
}

USAFHAWKEYE_DATA = {}
USAFHAWKEYE_DATA[1] = {
	TimeStamp 	= nil,
	Vec2 		= nil	
}

TEXACO_DATA = {}
TEXACO_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SHELL_DATA = {}
SHELL_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

ARCO_DATA = {}
ARCO_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON1_DATA = {}
REDSQUADRON1_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON1_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON2_DATA = {}
REDSQUADRON2_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON2_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON3_DATA = {}
REDSQUADRON3_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON3_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON4_DATA = {}
REDSQUADRON4_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON4_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON5_DATA = {}
REDSQUADRON5_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON5_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON1_DATA = {}
BLUESQUADRON1_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON1_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON2_DATA = {}
BLUESQUADRON2_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON2_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON3_DATA = {}
BLUESQUADRON3_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON3_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFCAP_DATA = {}
USAEFCAP_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFCAP_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFCAS_DATA = {}
USAEFCAS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFCAS_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFSEAD_DATA = {}
USAEFSEAD_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFSEAD_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFPIN_DATA = {}
USAEFPIN_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFPIN_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFASS_DATA = {}
USAEFASS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFASS_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFDRONE_DATA = {}
USAEFDRONE_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SYAAFAN26B_DATA = {}
SYAAFAN26B_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

IRIAFMI8_DATA = {}
IRIAFMI8_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAFC130_DATA = {}
USAFC130_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAFUH60A_DATA = {}
USAFUH60A_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDHELO_DATA = {}
REDHELO_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDHELO_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUEHELO_DATA = {}
BLUEHELO_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUEHELO_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SYAAFSU24M_DATA = {}
SYAAFSU24M_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
SYAAFSU24M_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSSU25T_DATA = {}
VVSSU25T_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
VVSSU25T_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU95MS_DATA = {}
VVSTU95MS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

PLAAFH6J_DATA = {}
PLAAFH6J_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU160_DATA = {}
VVSTU160_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU22M3_DATA = {}
VVSTU22M3_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}				 

USAFB1B_DATA = {}
USAFB1B_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}			 

USAFB52H_DATA = {}
USAFB52H_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////AIRBASE INFORMATION

SEF_AIRBASEINFORMATION = {}
SEF_AIRBASEINFORMATION[1] = {				
		AirbaseName = "Antonio B. Won Pat Intl",
		Neighbours = { "Andersen AFB", "Rota Intl", "Tinian Intl", "Saipan Intl" },			
}	
SEF_AIRBASEINFORMATION[2] = {				
		AirbaseName = "Andersen AFB",
		Neighbours = { "Antonio B. Won Pat Intl", "Rota Intl", "Tinian Intl", "Saipan Intl" },			
}
SEF_AIRBASEINFORMATION[3] = {				
		AirbaseName = "Rota Intl",
		Neighbours = { "Antonio B. Won Pat Intl", "Andersen AFB", "Tinian Intl", "Saipan Intl" },			
}
SEF_AIRBASEINFORMATION[4] = {				
		AirbaseName = "Tinian Intl",
		Neighbours = { "Antonio B. Won Pat Intl", "Andersen AFB", "Rota Intl", "Saipan Intl" },			
}
SEF_AIRBASEINFORMATION[5] = {				
		AirbaseName = "Saipan Intl",
		Neighbours = { "Antonio B. Won Pat Intl", "Andersen AFB", "Rota Intl", "Tinian Intl" },			
}		

function SEF_BLUESQUADRONSTOGGLE()

	if ( BlueSquadronsEnabled == 1 ) then		
		BlueSquadronsEnabled = 0
		trigger.action.outText("Allied AI CAP Flights Are Now Disabled", 15)		
	elseif ( BlueSquadronsEnabled == 0 ) then			
		BlueSquadronsEnabled = 1
		trigger.action.outText("Allied AI CAP Flights Are Now Enabled", 15)
	else
	end	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////RED SQUADRONS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON1_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON1GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON1_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

function SEF_REDSQUADRON2_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON2GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON2GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON2_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

function SEF_REDSQUADRON3_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON3GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON3GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON3_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

function SEF_REDSQUADRON4_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON4GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON4GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON4_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

function SEF_REDSQUADRON5_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON5GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON5GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON5_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON1_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON1_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	AlphaPrimaryPerimeterCount = 0			
			
	--ALPHA
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AlphaPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )	
		AlphaPrimaryPerimeterCount = AlphaPrimaryPerimeterCount + 1		
		end
	)
	
	--////ALPHA			
	if ( AlphaPrimaryPerimeterCount > 0 ) then		
		AlphaStatus = AlphaPrimaryAirbase.." - Alpha Squadron\nAirspace Is Being Contested By The Allies\n"
		
		-- Alpha   - Rota -> Tinian -> Saipan
		
		if ( AlphaPrimaryAirbase == "Rota Intl" ) then
			
			TinianPerimeterCount = 0
			SaipanPerimeterCount = 0			
					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Saipan Intl".." Perimeter Zone"), function ( GroupObject )
				SaipanPerimeterCount = SaipanPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Tinian Intl", AlphaDestinationAirbase)						
			elseif ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 and SaipanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Saipan Intl", AlphaDestinationAirbase) 			
			else			
				SEF_REDSQUADRON1_SPAWN("Omega", AlphaDestinationAirbase)				
			end		
		elseif ( AlphaPrimaryAirbase == "Tinian Intl" ) then
			
			RotaPerimeterCount = 0
			SaipanPerimeterCount = 0			
					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Saipan Intl".." Perimeter Zone"), function ( GroupObject )
				SaipanPerimeterCount = SaipanPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Rota Intl", AlphaDestinationAirbase)						
			elseif ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 and SaipanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Saipan Intl", AlphaDestinationAirbase) 			
			else			
				SEF_REDSQUADRON1_SPAWN("Omega", AlphaDestinationAirbase)				
			end
		elseif ( AlphaPrimaryAirbase == "Saipan Intl" ) then
			
			RotaPerimeterCount = 0
			TinianPerimeterCount = 0			
					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Rota Intl", AlphaDestinationAirbase)						
			elseif ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Tinian Intl", AlphaDestinationAirbase) 			
			else			
				SEF_REDSQUADRON1_SPAWN("Omega", AlphaDestinationAirbase)				
			end			
		else			
			SEF_REDSQUADRON1_SPAWN("Omega", AlphaDestinationAirbase)
		end	
	else
		AlphaStatus = AlphaPrimaryAirbase.." - Alpha Squadron\nAirspace Is Controlled By China\n"
		SEF_REDSQUADRON1_SPAWN(AlphaPrimaryAirbase, AlphaDestinationAirbase)
	end	
end

function SEF_REDSQUADRON1_DEPLOYMENT()	
		
	-- ALPHA   - Rota -> Tinian -> Saipan
	if ( Airbase.getByName("Rota Intl"):getCoalition() == 1 ) then
		AlphaPrimaryAirbase = "Rota Intl"
		AlphaDestinationAirbase = "Rota Intl"
	elseif ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 ) then
		AlphaPrimaryAirbase = "Tinian Intl"
		AlphaDestinationAirbase = "Rota Intl"
	elseif ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 ) then
		AlphaPrimaryAirbase = "Saipan Intl"
		AlphaDestinationAirbase = "Tinian Intl"	
	else
		AlphaPrimaryAirbase = "Saipan Intl"
		AlphaDestinationAirbase = "Saipan Intl"
	end
	--END ALPHA			
end

function SEF_REDSQUADRON1_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON1GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 1 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON1_DATA[1].Vec2 = nil
		REDSQUADRON1_DATA[1].TimeStamp = nil
		REDSQUADRON1_DATA[2].Vec2 = nil
		REDSQUADRON1_DATA[2].TimeStamp = nil
		
		if (DepartureAirbaseName == "Rota Intl" or DestinationAirbaseName == "Rota Intl") then
		
			local SpawnZone = nil
		
			if ( DepartureAirbaseName == "Omega" ) then
				SpawnZone = ZONE:FindByName(DepartureAirbaseName)
			else
				SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
			end			
			
			local DestinationZone 	= AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
			local RotaWP1 			= ZONE:FindByName("Rota WP1"):GetVec2()
			local RotaWP2 			= ZONE:FindByName("Rota WP2"):GetVec2()
						
			local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
			RS1_FlightLevel = Randomiser * 1000
					
			local DepartureZoneVec2 = SpawnZone:GetVec2()
			local TargetZoneVec2 	= DestinationZone:GetVec2()
						
			local FlightDirection = math.random(1,100)
						
			if ( FlightDirection <= 50 ) then			
				--////Clockwise
				--Spawn Point
				RS1_WP0X = DepartureZoneVec2.x
				RS1_WP0Y = DepartureZoneVec2.y
				--Initial Waypoint
				RS1_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
				RS1_WP1Y = DepartureZoneVec2.y			
				--BARCAP EAST
				RS1_WP2X = RotaWP2.x
				RS1_WP2Y = RotaWP2.y 						
				--BARCAP WEST
				RS1_WP3X = RotaWP1.x
				RS1_WP3Y = RotaWP1.y						
				--Perimeter Zone South Point
				--RS1_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
				--RS1_WP4Y = TargetZoneVec2.y						
				--Perimeter Zone West Point
				--RS1_WP5X = TargetZoneVec2.x
				--RS1_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
			else			
				--////Anti-Clockwise
				--Spawn Point
				RS1_WP0X = DepartureZoneVec2.x
				RS1_WP0Y = DepartureZoneVec2.y
				--Initial Waypoint
				RS1_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
				RS1_WP1Y = DepartureZoneVec2.y			
				--BARCAP WEST
				RS1_WP2X = RotaWP1.x
				RS1_WP2Y = RotaWP1.y 						
				--BARCAP EAST
				RS1_WP3X = RotaWP2.x
				RS1_WP3Y = RotaWP2.y						
				--Perimeter Zone North Point
				--RS1_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
				--RS1_WP4Y = TargetZoneVec2.y						
				--Perimeter Zone West Point
				--RS1_WP5X = TargetZoneVec2.x
				--RS1_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
			end		
			
			REDSQUADRON1 = SPAWN:NewWithAlias("Plane Template", RedSquadronName1)
								:InitRandomizeTemplate(CombinedRedCAP)								
							
			:OnSpawnGroup(
				function( SpawnGroup )						
					REDSQUADRON1GROUPNAME = SpawnGroup.GroupName
					REDSQUADRON1GROUPID = Group.getByName(REDSQUADRON1GROUPNAME):getID()
					REDSQUADRON1GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
														
					--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
					Mission = {
						["id"] = "Mission",
						["params"] = {		
							["route"] = 
							{                                    
								["points"] = 
								{
									[1] = 
									{
										["alt"] = RS1_FlightLevel/2,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
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
																	["groupId"] = REDSQUADRON1GROUPID,
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
																	["variantIndex"] = 1,
																	["name"] = 5,
																	["formationIndex"] = 6,
																	["value"] = 393217,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [2]
													[3] = 
													{
														["enabled"] = true,
														["auto"] = false,
														["id"] = "EngageTargets",
														["number"] = 3,
														["params"] = 
														{
															["targetTypes"] = 
															{
																[1] = "Air",
															}, -- end of ["targetTypes"]
															["priority"] = 0,
															["value"] = "Air;",
															["noTargetTypes"] = 
															{
																[1] = "Cruise missiles",
																[2] = "Antiship Missiles",
																[3] = "AA Missiles",
																[4] = "AG Missiles",
																[5] = "SA Missiles",
															}, -- end of ["noTargetTypes"]
															["maxDistEnabled"] = true,
															["maxDist"] = EngagementDistance,
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
																	["value"] = 2, --2 for Evade Fire, 3 for Evasive Vertical
																	["name"] = 1,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [4]
													[5] = 
													{
														["number"] = 5,
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
																	["value"] = 264241152,
																	["name"] = 10,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [5]
													[6] = 
													{
														["enabled"] = true,
														["auto"] = false,
														["id"] = "WrappedAction",
														["number"] = 6,
														["params"] = 
														{
															["action"] = 
															{
																["id"] = "Option",
																["params"] = 
																{
																	["value"] = true,
																	["name"] = 19,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [6]
													[7] = 
													{
														["enabled"] = true,
														["auto"] = false,
														["id"] = "WrappedAction",
														["number"] = 7,
														["params"] = 
														{
															["action"] = 
															{
																["id"] = "Option",
																["params"] = 
																{
																	["value"] = true,
																	["name"] = 6,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [7]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 0,
										["ETA_locked"] = true,
										["y"] = RS1_WP0Y,
										["x"] = RS1_WP0X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [1]
									[2] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 127.32626754758,
										["ETA_locked"] = false,
										["y"] = RS1_WP1Y,
										["x"] = RS1_WP1X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [2]
									[3] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 380.31328316984,
										["ETA_locked"] = false,
										["y"] = RS1_WP2Y,
										["x"] = RS1_WP2X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [3]
									[4] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
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
																["id"] = "SwitchWaypoint",
																["params"] = 
																{
																	["goToWaypointIndex"] = 3,
																	["fromWaypointIndex"] = 4,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 832.92276094724,
										["ETA_locked"] = false,
										["y"] = RS1_WP3Y,
										["x"] = RS1_WP3X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [4]
									--[[
									[5] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 1289.20366255,
										["ETA_locked"] = false,
										["y"] = RS1_WP4Y,
										["x"] = RS1_WP4X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [5]
									[6] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
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
																["id"] = "SwitchWaypoint",
																["params"] = 
																{
																	["goToWaypointIndex"] = 3,
																	["fromWaypointIndex"] = 6,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 1744.9128539618,
										["ETA_locked"] = false,
										["y"] = RS1_WP5Y,
										["x"] = RS1_WP5X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [6]
									]]--
								}, -- end of ["points"]
							}, -- end of ["route"]
						}, --end of ["params"]
					}--end of Mission				
					REDSQUADRON1GROUP:SetTask(Mission)				
				end
			)
			if ( DepartureAirbaseName == "Omega" ) then		
				REDSQUADRON1:SpawnInZone( SpawnZone, false, RS1_FlightLevel, RS1_FlightLevel )
			else
				REDSQUADRON1:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
			end			
			--:SpawnInZone( SpawnZone, false, RS1_FlightLevel, RS1_FlightLevel )
			--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
			--trigger.action.outText("Red Squadron 1 Is Launching Fighters", 15)			
		else	
			local SpawnZone = nil
		
			if ( DepartureAirbaseName == "Omega" ) then
				SpawnZone = ZONE:FindByName(DepartureAirbaseName)
			else
				SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
			end			
			
			local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
			
			local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
			RS1_FlightLevel = Randomiser * 1000
					
			local DepartureZoneVec2 = SpawnZone:GetVec2()
			local TargetZoneVec2 	= DestinationZone:GetVec2()
						
			local FlightDirection = math.random(1,100)
						
			if ( FlightDirection <= 50 ) then			
				--////Clockwise
				--Spawn Point
				RS1_WP0X = DepartureZoneVec2.x
				RS1_WP0Y = DepartureZoneVec2.y
				--Initial Waypoint
				RS1_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
				RS1_WP1Y = DepartureZoneVec2.y			
				--Perimeter Zone North Point
				RS1_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
				RS1_WP2Y = TargetZoneVec2.y 						
				--Perimeter Zone East Point
				RS1_WP3X = TargetZoneVec2.x
				RS1_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
				--Perimeter Zone South Point
				RS1_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
				RS1_WP4Y = TargetZoneVec2.y						
				--Perimeter Zone West Point
				RS1_WP5X = TargetZoneVec2.x
				RS1_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
			else			
				--////Anti-Clockwise
				--Spawn Point
				RS1_WP0X = DepartureZoneVec2.x
				RS1_WP0Y = DepartureZoneVec2.y
				--Initial Waypoint
				RS1_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
				RS1_WP1Y = DepartureZoneVec2.y			
				--Perimeter Zone South Point
				RS1_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
				RS1_WP2Y = TargetZoneVec2.y 						
				--Perimeter Zone East Point
				RS1_WP3X = TargetZoneVec2.x
				RS1_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
				--Perimeter Zone North Point
				RS1_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
				RS1_WP4Y = TargetZoneVec2.y						
				--Perimeter Zone West Point
				RS1_WP5X = TargetZoneVec2.x
				RS1_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
			end		
			
			REDSQUADRON1 = SPAWN:NewWithAlias("Plane Template", RedSquadronName1)
								:InitRandomizeTemplate(CombinedRedCAP)								
							
			:OnSpawnGroup(
				function( SpawnGroup )						
					REDSQUADRON1GROUPNAME = SpawnGroup.GroupName
					REDSQUADRON1GROUPID = Group.getByName(REDSQUADRON1GROUPNAME):getID()
					REDSQUADRON1GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
														
					--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
					Mission = {
						["id"] = "Mission",
						["params"] = {		
							["route"] = 
							{                                    
								["points"] = 
								{
									[1] = 
									{
										["alt"] = RS1_FlightLevel/2,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
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
																	["groupId"] = REDSQUADRON1GROUPID,
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
																	["variantIndex"] = 1,
																	["name"] = 5,
																	["formationIndex"] = 6,
																	["value"] = 393217,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [2]
													[3] = 
													{
														["enabled"] = true,
														["auto"] = false,
														["id"] = "EngageTargets",
														["number"] = 3,
														["params"] = 
														{
															["targetTypes"] = 
															{
																[1] = "Air",
															}, -- end of ["targetTypes"]
															["priority"] = 0,
															["value"] = "Air;",
															["noTargetTypes"] = 
															{
																[1] = "Cruise missiles",
																[2] = "Antiship Missiles",
																[3] = "AA Missiles",
																[4] = "AG Missiles",
																[5] = "SA Missiles",
															}, -- end of ["noTargetTypes"]
															["maxDistEnabled"] = true,
															["maxDist"] = EngagementDistance,
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
																	["value"] = 2, --2 for Evade Fire, 3 for Evasive Vertical
																	["name"] = 1,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [4]
													[5] = 
													{
														["number"] = 5,
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
																	["value"] = 264241152,
																	["name"] = 10,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [5]
													[6] = 
													{
														["enabled"] = true,
														["auto"] = false,
														["id"] = "WrappedAction",
														["number"] = 6,
														["params"] = 
														{
															["action"] = 
															{
																["id"] = "Option",
																["params"] = 
																{
																	["value"] = true,
																	["name"] = 19,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [6]
													[7] = 
													{
														["enabled"] = true,
														["auto"] = false,
														["id"] = "WrappedAction",
														["number"] = 7,
														["params"] = 
														{
															["action"] = 
															{
																["id"] = "Option",
																["params"] = 
																{
																	["value"] = true,
																	["name"] = 6,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [7]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 0,
										["ETA_locked"] = true,
										["y"] = RS1_WP0Y,
										["x"] = RS1_WP0X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [1]
									[2] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 127.32626754758,
										["ETA_locked"] = false,
										["y"] = RS1_WP1Y,
										["x"] = RS1_WP1X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [2]
									[3] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 380.31328316984,
										["ETA_locked"] = false,
										["y"] = RS1_WP2Y,
										["x"] = RS1_WP2X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [3]
									[4] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 832.92276094724,
										["ETA_locked"] = false,
										["y"] = RS1_WP3Y,
										["x"] = RS1_WP3X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [4]
									[5] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 1289.20366255,
										["ETA_locked"] = false,
										["y"] = RS1_WP4Y,
										["x"] = RS1_WP4X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [5]
									[6] = 
									{
										["alt"] = RS1_FlightLevel,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 234.32754852983,
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
																["id"] = "SwitchWaypoint",
																["params"] = 
																{
																	["goToWaypointIndex"] = 3,
																	["fromWaypointIndex"] = 6,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 1744.9128539618,
										["ETA_locked"] = false,
										["y"] = RS1_WP5Y,
										["x"] = RS1_WP5X,
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [6]
								}, -- end of ["points"]
							}, -- end of ["route"]
						}, --end of ["params"]
					}--end of Mission				
					REDSQUADRON1GROUP:SetTask(Mission)				
				end
			)
			if ( DepartureAirbaseName == "Omega" ) then		
				REDSQUADRON1:SpawnInZone( SpawnZone, false, RS1_FlightLevel, RS1_FlightLevel )
			else
				REDSQUADRON1:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
			end	
			--:SpawnInZone( SpawnZone, false, RS1_FlightLevel, RS1_FlightLevel )
			--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
			--trigger.action.outText("Red Squadron 1 Is Launching Fighters", 15)
		end	
	end
end

function SEF_REDSQUADRON2_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON2GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON2GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 2 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON2_DATA[1].Vec2 = nil
		REDSQUADRON2_DATA[1].TimeStamp = nil
		REDSQUADRON2_DATA[2].Vec2 = nil
		REDSQUADRON2_DATA[2].TimeStamp = nil
		
		local SpawnZone = nil
		
		if ( DepartureAirbaseName == "Omega" ) then
			SpawnZone = ZONE:FindByName(DepartureAirbaseName)
		else
			SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		end		
		
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS2_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS2_WP0X = DepartureZoneVec2.x
			RS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS2_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS2_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS2_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS2_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS2_WP3X = TargetZoneVec2.x
			RS2_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS2_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS2_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS2_WP5X = TargetZoneVec2.x
			RS2_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS2_WP0X = DepartureZoneVec2.x
			RS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS2_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS2_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS2_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS2_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS2_WP3X = TargetZoneVec2.x
			RS2_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS2_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS2_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS2_WP5X = TargetZoneVec2.x
			RS2_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		REDSQUADRON2 = SPAWN:NewWithAlias("Plane Template", RedSquadronName2)
							:InitRandomizeTemplate(KPAAFAirForceCAP)										
								
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON2GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON2GROUPID = Group.getByName(REDSQUADRON2GROUPNAME):getID()
				REDSQUADRON2GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS2_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
																["groupId"] = REDSQUADRON2GROUPID,
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
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
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
																["value"] = 2, --2 for Evade Fire, 3 for Evasive Vertical 
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
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
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS2_WP0Y,
									["x"] = RS2_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS2_WP1Y,
									["x"] = RS2_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS2_WP2Y,
									["x"] = RS2_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS2_WP3Y,
									["x"] = RS2_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS2_WP4Y,
									["x"] = RS2_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS2_WP5Y,
									["x"] = RS2_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON2GROUP:SetTask(Mission)				
			end
		)
		if ( DepartureAirbaseName == "Omega" ) then		
			REDSQUADRON2:SpawnInZone( SpawnZone, false, RS2_FlightLevel, RS2_FlightLevel )		
		else
			REDSQUADRON2:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end		
		--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--:SpawnInZone( SpawnZone, false, RS2_FlightLevel, RS2_FlightLevel )
		--trigger.action.outText("Red Squadron 2 Is Launching Fighters", 15)	
	end
end

function SEF_REDSQUADRON3_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON3GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON3GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 3 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON3_DATA[1].Vec2 = nil
		REDSQUADRON3_DATA[1].TimeStamp = nil
		REDSQUADRON3_DATA[2].Vec2 = nil
		REDSQUADRON3_DATA[2].TimeStamp = nil
		
		if ( DepartureAirbaseName == "Omega" ) then
			RS3_SpawnZone = ZONE:FindByName(DepartureAirbaseName)
		else
			RS3_SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		end	
		
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS3_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = RS3_SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)					
		
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS3_WP0X = DepartureZoneVec2.x
			RS3_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS3_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS3_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS3_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS3_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS3_WP3X = TargetZoneVec2.x
			RS3_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS3_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS3_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS3_WP5X = TargetZoneVec2.x
			RS3_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS3_WP0X = DepartureZoneVec2.x
			RS3_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS3_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS3_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS3_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS3_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS3_WP3X = TargetZoneVec2.x
			RS3_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS3_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS3_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS3_WP5X = TargetZoneVec2.x
			RS3_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		
		REDSQUADRON3 = SPAWN:NewWithAlias("Plane Template", RedSquadronName3)
							:InitRandomizeTemplate(PLAAFAirForceCAP)								
		
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON3GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON3GROUPID = Group.getByName(REDSQUADRON3GROUPNAME):getID()
				REDSQUADRON3GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS3_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
																["groupId"] = REDSQUADRON3GROUPID,
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
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
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
																["value"] = 2,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
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
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS3_WP0Y,
									["x"] = RS3_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS3_WP1Y,
									["x"] = RS3_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS3_WP2Y,
									["x"] = RS3_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS3_WP3Y,
									["x"] = RS3_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS3_WP4Y,
									["x"] = RS3_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS3_WP5Y,
									["x"] = RS3_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON3GROUP:SetTask(Mission)				
			end
		)		
		if ( DepartureAirbaseName == "Saipan Intl" ) then
			REDSQUADRON3:SpawnAtParkingSpot(AIRBASE:FindByName("Saipan Intl"), {1,2,3,4}, SPAWN.Takeoff.Hot)
		elseif ( DepartureAirbaseName == "Omega" ) then		
			REDSQUADRON3:SpawnInZone( SpawnZone, false, RS3_FlightLevel, RS3_FlightLevel )		
		else
			REDSQUADRON3:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end					
	end
end

function SEF_REDSQUADRON4_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON4GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON4GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 4 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON4_DATA[1].Vec2 = nil
		REDSQUADRON4_DATA[1].TimeStamp = nil
		REDSQUADRON4_DATA[2].Vec2 = nil
		REDSQUADRON4_DATA[2].TimeStamp = nil
		
		local SpawnZone = nil
		
		if ( DepartureAirbaseName == "Omega" ) then
			SpawnZone = ZONE:FindByName(DepartureAirbaseName)
		else
			SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		end		
		
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS4_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS4_WP0X = DepartureZoneVec2.x
			RS4_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS4_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS4_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS4_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS4_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS4_WP3X = TargetZoneVec2.x
			RS4_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS4_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS4_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS4_WP5X = TargetZoneVec2.x
			RS4_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS4_WP0X = DepartureZoneVec2.x
			RS4_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS4_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS4_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS4_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS4_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS4_WP3X = TargetZoneVec2.x
			RS4_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS4_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS4_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS4_WP5X = TargetZoneVec2.x
			RS4_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		REDSQUADRON4 = SPAWN:NewWithAlias("Plane Template", RedSquadronName4)
							:InitRandomizeTemplate(BlackSeaFleetCAP)																
		
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON4GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON4GROUPID = Group.getByName(REDSQUADRON4GROUPNAME):getID()
				REDSQUADRON4GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS4_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
																["groupId"] = REDSQUADRON4GROUPID,
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
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
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
																["value"] = 2,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
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
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS4_WP0Y,
									["x"] = RS4_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS4_WP1Y,
									["x"] = RS4_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS4_WP2Y,
									["x"] = RS4_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS4_WP3Y,
									["x"] = RS4_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS4_WP4Y,
									["x"] = RS4_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS4_WP5Y,
									["x"] = RS4_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON4GROUP:SetTask(Mission)				
			end
		)
		if ( DepartureAirbaseName == "Omega" ) then		
			REDSQUADRON4:SpawnInZone( SpawnZone, false, RS4_FlightLevel, RS4_FlightLevel )
		else
			REDSQUADRON4:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		end
		--trigger.action.outText("Red Squadron 4 Is Launching Fighters", 15)	
	end
end

function SEF_REDSQUADRON5_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON5GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON5GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 5 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON5_DATA[1].Vec2 = nil
		REDSQUADRON5_DATA[1].TimeStamp = nil
		REDSQUADRON5_DATA[2].Vec2 = nil
		REDSQUADRON5_DATA[2].TimeStamp = nil
		
		local SpawnZone = nil
		
		if ( DepartureAirbaseName == "Omega" ) then
			SpawnZone = ZONE:FindByName(DepartureAirbaseName)
		else
			SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		end	
		
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		--local DestinationZone = ZONE:FindByName("Tiyas")	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS5_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS5_WP0X = DepartureZoneVec2.x
			RS5_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS5_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS5_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS5_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS5_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS5_WP3X = TargetZoneVec2.x
			RS5_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS5_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS5_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS5_WP5X = TargetZoneVec2.x
			RS5_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS5_WP0X = DepartureZoneVec2.x
			RS5_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS5_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS5_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS5_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS5_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS5_WP3X = TargetZoneVec2.x
			RS5_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS5_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS5_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS5_WP5X = TargetZoneVec2.x
			RS5_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		REDSQUADRON5 = SPAWN:NewWithAlias("Plane Template", RedSquadronName5)
							:InitRandomizeTemplate(LiaoningCAP)							
								
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON5GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON5GROUPID = Group.getByName(REDSQUADRON5GROUPNAME):getID()
				REDSQUADRON5GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS5_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
																["groupId"] = REDSQUADRON5GROUPID,
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
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
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
																["value"] = 2,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
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
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS5_WP0Y,
									["x"] = RS5_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS5_WP1Y,
									["x"] = RS5_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS5_WP2Y,
									["x"] = RS5_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS5_WP3Y,
									["x"] = RS5_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS5_WP4Y,
									["x"] = RS5_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS5_WP5Y,
									["x"] = RS5_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON5GROUP:SetTask(Mission)				
			end
		)		
		if ( DepartureAirbaseName == "Omega" ) then
			REDSQUADRON5:SpawnInZone( SpawnZone, false, RS5_FlightLevel, RS5_FlightLevel )
		else	
			REDSQUADRON5:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		end	
		--trigger.action.outText("Red Squadron 5 Is Launching Fighters", 15)	
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON2_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON2_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	BetaPrimaryPerimeterCount = 0			
			
	--BETA
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(BetaPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )
		BetaPrimaryPerimeterCount = BetaPrimaryPerimeterCount + 1
		end
	)	
	
	--////BETA
	
	-- Tinian -> Saipan
	if ( BetaPrimaryPerimeterCount > 0 ) then		
		BetaStatus = BetaPrimaryAirbase.." - Beta Squadron\nAirspace Is Being Contested By The Allies\n"
		
		--////
		if ( BetaPrimaryAirbase == "Tinian Intl" ) then
			
			SaipanPerimeterCount 	= 0
			RotaPerimeterCount		= 0	
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Saipan Intl".." Perimeter Zone"), function ( GroupObject )
				SaipanPerimeterCount = SaipanPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 and SaipanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Saipan Intl", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Rota Intl", BetaDestinationAirbase)	
			else			
				SEF_REDSQUADRON2_SPAWN("Omega", BetaDestinationAirbase)			
			end		
		--////
		elseif ( BetaPrimaryAirbase == "Saipan Intl" ) then
		
			TinianPerimeterCount 	= 0
			RotaPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tinian Intl", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Rota Intl", BetaDestinationAirbase)
			else			
				SEF_REDSQUADRON2_SPAWN("Omega", BetaDestinationAirbase)			
			end						
		--////
		elseif ( BetaPrimaryAirbase == "Rota Intl" ) then
		
			TinianPerimeterCount 	= 0
			SaipanPerimeterCount 	= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Saipan Intl".." Perimeter Zone"), function ( GroupObject )
				SaipanPerimeterCount = SaipanPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tinian Intl", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 and SaipanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Saipan Intl", BetaDestinationAirbase)
			else			
				SEF_REDSQUADRON2_SPAWN("Omega", BetaDestinationAirbase)			
			end				
		else			
			SEF_REDSQUADRON2_SPAWN("Omega", BetaDestinationAirbase)
		end		
	else
		BetaStatus = BetaPrimaryAirbase.." - Beta Squadron\nAirspace Is Controlled By China\n"
		SEF_REDSQUADRON2_SPAWN(BetaPrimaryAirbase, BetaDestinationAirbase)
	end	
end

function SEF_REDSQUADRON2_DEPLOYMENT()
	
	-- Tinian -> Saipan
	
	--BETA
	if ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Tinian Intl"
		BetaDestinationAirbase = "Tinian Intl"	
	elseif ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Saipan Intl"
		BetaDestinationAirbase = "Tinian Intl"
	elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Rota Intl"
		BetaDestinationAirbase = "Tinian Intl"	
	else		
		BetaPrimaryAirbase = "Saipan Intl"
		BetaDestinationAirbase = "Saipan Intl"
	end			
	--END BETA	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON3_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON3_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	GammaPrimaryPerimeterCount = 0			
			
	--GAMMA
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(GammaPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )
		GammaPrimaryPerimeterCount = GammaPrimaryPerimeterCount + 1
		end
	)	
		
	--////GAMMA
	if ( GammaPrimaryPerimeterCount > 0 ) then		
		GammaStatus = GammaPrimaryAirbase.." - Gamma Squadron\nAirspace Is Being Contested By The Allies\n"		
		
		-- Gamma - Saipan
		
		--////
		if ( GammaPrimaryAirbase == "Saipan Intl" ) then
			
			RotaPerimeterCount 		= 0
			TinianPerimeterCount	= 0									
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)							

			if ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Tinian Intl", GammaDestinationAirbase)												
			elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rota Intl", GammaDestinationAirbase)
			else			
				SEF_REDSQUADRON3_SPAWN("Omega", GammaDestinationAirbase)					
			end			
		--////					
		else
			SEF_REDSQUADRON3_SPAWN("Omega", GammaDestinationAirbase)
		end	
	else
		GammaStatus = GammaPrimaryAirbase.." - Gamma Squadron\nAirspace Is Controlled By China\n"
		SEF_REDSQUADRON3_SPAWN(GammaPrimaryAirbase, GammaDestinationAirbase)	
	end	
end

function SEF_REDSQUADRON3_DEPLOYMENT()
	
	-- GAMMA -
	if ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Saipan Intl"
		GammaDestinationAirbase = "Saipan Intl"	
	elseif ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Tinian Intl"
		GammaDestinationAirbase = "Saipan Intl"
	elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Rota Intl"
		GammaDestinationAirbase = "Saipan Intl"	
	else
		GammaPrimaryAirbase = "Saipan Intl"
		GammaDestinationAirbase = "Saipan Intl"	
	end		
	--END GAMMA	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON4_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON4_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	DeltaPrimaryPerimeterCount = 0			
			
	--DELTA
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(DeltaPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )
		DeltaPrimaryPerimeterCount = DeltaPrimaryPerimeterCount + 1
		end
	)	
		
	--////DELTA
	if ( DeltaPrimaryPerimeterCount > 0 ) then		
		DeltaStatus = DeltaPrimaryAirbase.." - Delta Squadron\nAirspace Is Being Contested By The Allies\n"	
		
		-- DELTA   - CV 1143.5 Admiral Kuznetsov
		
		if ( DeltaPrimaryAirbase == "CV 1143.5 Admiral Kuznetsov" ) then

			SaipanPerimeterCount 		= 0
			TinianPerimeterCount 		= 0
			RotaPerimeterCount 			= 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Saipan Intl".." Perimeter Zone"), function ( GroupObject )
				SaipanPerimeterCount = SaipanPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)								

			if ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 and SaipanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Saipan Intl", DeltaDestinationAirbase)														
			elseif ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Tinian Intl", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Rota Intl", DeltaDestinationAirbase)	
			else			
				SEF_REDSQUADRON4_SPAWN("Omega", DeltaDestinationAirbase)				
			end
		
		elseif ( DeltaPrimaryAirbase == "Saipan Intl" ) then

			TinianPerimeterCount 		= 0
			RotaPerimeterCount 			= 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)								

			if ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Tinian Intl", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Rota Intl", DeltaDestinationAirbase)	
			else			
				SEF_REDSQUADRON4_SPAWN("Omega", DeltaDestinationAirbase)				
			end			
		--////								
		else
			SEF_REDSQUADRON4_SPAWN("Omega", DeltaDestinationAirbase)
		end
	else
		DeltaStatus = DeltaPrimaryAirbase.." - Delta Squadron\nAirspace Is Controlled By China\n"
		SEF_REDSQUADRON4_SPAWN(DeltaPrimaryAirbase, DeltaDestinationAirbase)	
	end		
end

function SEF_REDSQUADRON4_DEPLOYMENT()
	
	-- DELTA   - 
	if ( Group.getByName("CV 1143.5 Admiral Kuznetsov") ) then
		DeltaPrimaryAirbase = "CV 1143.5 Admiral Kuznetsov"
		DeltaDestinationAirbase = "CV 1143.5 Admiral Kuznetsov"	
	else
		DeltaPrimaryAirbase = "Saipan Intl"
		DeltaDestinationAirbase = "Saipan Intl"
	end		
	--END DELTA	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON5_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON5_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	EpsilonPrimaryPerimeterCount = 0			
			
	--EPSILON
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(EpsilonPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )
		EpsilonPrimaryPerimeterCount = EpsilonPrimaryPerimeterCount + 1
		end
	)	
		
	--////EPSILON
	if ( EpsilonPrimaryPerimeterCount > 0 ) then		
		EpsilonStatus = EpsilonPrimaryAirbase.." - Epsilon Squadron\nAirspace Is Being Contested By The Allies\n"	
		
		-- EPSILON   - CV 1143.5 Liaoning
		
		if ( EpsilonPrimaryAirbase == "CV 1143.5 Liaoning" ) then

			SaipanPerimeterCount 		= 0
			TinianPerimeterCount 		= 0
			RotaPerimeterCount 			= 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Saipan Intl".." Perimeter Zone"), function ( GroupObject )
				SaipanPerimeterCount = SaipanPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)								

			if ( Airbase.getByName("Saipan Intl"):getCoalition() == 1 and SaipanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Saipan Intl", EpsilonDestinationAirbase)														
			elseif ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Tinian Intl", EpsilonDestinationAirbase)
			elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Rota Intl", EpsilonDestinationAirbase)	
			else			
				SEF_REDSQUADRON5_SPAWN("Omega", EpsilonDestinationAirbase)				
			end	
		
		elseif ( EpsilonPrimaryAirbase == "Saipan Intl" ) then

			TinianPerimeterCount 		= 0
			RotaPerimeterCount 			= 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tinian Intl".." Perimeter Zone"), function ( GroupObject )
				TinianPerimeterCount = TinianPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rota Intl".." Perimeter Zone"), function ( GroupObject )
				RotaPerimeterCount = RotaPerimeterCount + 1		
				end
			)								

			if ( Airbase.getByName("Tinian Intl"):getCoalition() == 1 and TinianPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Tinian Intl", EpsilonDestinationAirbase)
			elseif ( Airbase.getByName("Rota Intl"):getCoalition() == 1 and RotaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Rota Intl", EpsilonDestinationAirbase)	
			else			
				SEF_REDSQUADRON5_SPAWN("Omega", EpsilonDestinationAirbase)				
			end
		--////								
		else
			SEF_REDSQUADRON5_SPAWN("Omega", EpsilonDestinationAirbase)
		end		
	else
		EpsilonStatus = EpsilonPrimaryAirbase.." - Epsilon Squadron\nAirspace Is Controlled By China\n"
		SEF_REDSQUADRON5_SPAWN(EpsilonPrimaryAirbase, EpsilonDestinationAirbase)	
	end		
end

function SEF_REDSQUADRON5_DEPLOYMENT()	
	
	--EPSILON
	if ( Group.getByName("CV 1143.5 Liaoning") ) then
		EpsilonPrimaryAirbase = "CV 1143.5 Liaoning"
		EpsilonDestinationAirbase = "CV 1143.5 Liaoning"	
	else
		EpsilonPrimaryAirbase = "Saipan Intl"
		EpsilonDestinationAirbase = "Saipan Intl"
	end	
	--END EPSILON	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////BLUE SQUADRONS

function SEF_BLUESQUADRON1_SCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))			
		else
			SEF_BLUESQUADRON1_SPAWN()
			
			timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))		
	end	
end

function SEF_BLUESQUADRON2_SCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUESQUADRON2GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON2GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUESQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))			
		else
			SEF_BLUESQUADRON2_SPAWN()
			
			timer.scheduleFunction(SEF_BLUESQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_BLUESQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))		
	end	
end

function SEF_BLUESQUADRON3_SCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUESQUADRON3GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON3GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUESQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))			
		else
			SEF_BLUESQUADRON3_SPAWN()
			
			timer.scheduleFunction(SEF_BLUESQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_BLUESQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))		
	end	
end

function SEF_BLUESQUADRON1_SPAWN()
	
	if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Blue Squadron 1 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		BLUESQUADRON1_DATA[1].Vec2 = nil
		BLUESQUADRON1_DATA[1].TimeStamp = nil
		BLUESQUADRON1_DATA[2].Vec2 = nil
		BLUESQUADRON1_DATA[2].TimeStamp = nil
		
		--local SpawnZone = AIRBASE:FindByName("CVN-72 Abraham Lincoln"):GetZone()
		local SpawnZone = CAPZoneBlueCarrier1
		--local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
		BS1_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		--local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			BS1_WP0X = DepartureZoneVec2.x
			BS1_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS1_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
			BS1_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			BS1_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			BS1_WP2Y = DepartureZoneVec2.y 						
			--Perimeter Zone East Point
			BS1_WP3X = DepartureZoneVec2.x
			BS1_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone South Point
			BS1_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			BS1_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			BS1_WP5X = DepartureZoneVec2.x
			BS1_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			BS1_WP0X = DepartureZoneVec2.x
			BS1_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS1_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
			BS1_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			BS1_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			BS1_WP2Y = DepartureZoneVec2.y 						
			--Perimeter Zone East Point
			BS1_WP3X = DepartureZoneVec2.x
			BS1_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone North Point
			BS1_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			BS1_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			BS1_WP5X = DepartureZoneVec2.x
			BS1_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance					
		end		
		
		BLUESQUADRON1 = SPAWN:NewWithAlias("Plane Template", BlueSquadronName1)
							:InitRandomizeTemplate( USNAirForceCAP )							
											
		:OnSpawnGroup(
			function( SpawnGroup )						
				BLUESQUADRON1GROUPNAME = SpawnGroup.GroupName
				BLUESQUADRON1GROUPID = Group.getByName(BLUESQUADRON1GROUPNAME):getID()
				BLUESQUADRON1GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = BS1_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
																["groupId"] = BLUESQUADRON1GROUPID,
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
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
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
																["value"] = 2,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
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
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]												
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = BS1_WP0Y,
									["x"] = BS1_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = BS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = BS1_WP1Y,
									["x"] = BS1_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = BS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = BS1_WP2Y,
									["x"] = BS1_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = BS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = BS1_WP3Y,
									["x"] = BS1_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = BS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = BS1_WP4Y,
									["x"] = BS1_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = BS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = BS1_WP5Y,
									["x"] = BS1_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				BLUESQUADRON1GROUP:SetTask(Mission)				
			end
		)
		--:SpawnInZone( SpawnZone, false, BS1_FlightLevel, BS1_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( "CVN-72 Abraham Lincoln" ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold
		--trigger.action.outText("Blue Squadron 1 Is Launching Fighters", 15)	
	end
end

function SEF_BLUESQUADRON2_SPAWN()
	
	if ( GROUP:FindByName(BLUESQUADRON2GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON2GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Blue Squadron 2 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		BLUESQUADRON2_DATA[1].Vec2 = nil
		BLUESQUADRON2_DATA[1].TimeStamp = nil
		BLUESQUADRON2_DATA[2].Vec2 = nil
		BLUESQUADRON2_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName("Andersen AFB"):GetZone()
		--local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
		BS2_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		--local TargetZoneVec2 	= DestinationZone:GetVec2()
		
		local GuamWP1 			= ZONE:FindByName("Guam WP1"):GetVec2()
		local GuamWP2 			= ZONE:FindByName("Guam WP2"):GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			BS2_WP0X = DepartureZoneVec2.x
			BS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS2_WP1X = DepartureZoneVec2.x 
			BS2_WP1Y = DepartureZoneVec2.y + BluePatrolWaypointInitial			
			--BARCAP EAST
			BS2_WP2X = GuamWP2.x
			BS2_WP2Y = GuamWP2.y 						
			--BARCAP WEST
			BS2_WP3X = GuamWP1.x
			BS2_WP3Y = GuamWP1.y						
			--Perimeter Zone South Point
			--BS2_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			--BS2_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			--BS2_WP5X = DepartureZoneVec2.x
			--BS2_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			BS2_WP0X = DepartureZoneVec2.x
			BS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS2_WP1X = DepartureZoneVec2.x
			BS2_WP1Y = DepartureZoneVec2.y + BluePatrolWaypointInitial			
			--BARCAP WEST
			BS2_WP2X = GuamWP1.x
			BS2_WP2Y = GuamWP1.y 						
			--BARCAP EAST
			BS2_WP3X = GuamWP2.x
			BS2_WP3Y = GuamWP2.y						
			--Perimeter Zone North Point
			--BS2_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			--BS2_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			--BS2_WP5X = DepartureZoneVec2.x
			--BS2_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance
		end		
		
		BLUESQUADRON2 = SPAWN:NewWithAlias("Plane Template", BlueSquadronName2)							
							:InitRandomizeTemplate( AndersenAirForceCAP )														
							
		:OnSpawnGroup(
			function( SpawnGroup )						
				BLUESQUADRON2GROUPNAME = SpawnGroup.GroupName
				BLUESQUADRON2GROUPID = Group.getByName(BLUESQUADRON2GROUPNAME):getID()
				BLUESQUADRON2GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = BS2_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
																["groupId"] = BLUESQUADRON2GROUPID,
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
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
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
																["value"] = 2,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
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
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = BS2_WP0Y,
									["x"] = BS2_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = BS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = BS2_WP1Y,
									["x"] = BS2_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = BS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = BS2_WP2Y,
									["x"] = BS2_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = BS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 4,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = BS2_WP3Y,
									["x"] = BS2_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								--[[
								[5] = 
								{
									["alt"] = BS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = BS2_WP4Y,
									["x"] = BS2_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = BS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = BS2_WP5Y,
									["x"] = BS2_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
								]]--
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				BLUESQUADRON2GROUP:SetTask(Mission)				
			end
		)		
		:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {136,137}, SPAWN.Takeoff.Hot)
		--trigger.action.outText("Blue Squadron 2 Is Launching Fighters", 15)	
	end
end

function SEF_BLUESQUADRON3_SPAWN()
	
	if ( GROUP:FindByName(BLUESQUADRON3GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON3GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Blue Squadron 3 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		BLUESQUADRON3_DATA[1].Vec2 = nil
		BLUESQUADRON3_DATA[1].TimeStamp = nil
		BLUESQUADRON3_DATA[2].Vec2 = nil
		BLUESQUADRON3_DATA[2].TimeStamp = nil
		
		--local SpawnZone = AIRBASE:FindByName("Andersen AFB"):GetZone()
		local SpawnZone = CAPZoneBlueCarrier2
		--local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
		BS3_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		--local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			BS3_WP0X = DepartureZoneVec2.x
			BS3_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS3_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
			BS3_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			BS3_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			BS3_WP2Y = DepartureZoneVec2.y 						
			--Perimeter Zone East Point
			BS3_WP3X = DepartureZoneVec2.x
			BS3_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone South Point
			BS3_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			BS3_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			BS3_WP5X = DepartureZoneVec2.x
			BS3_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			BS3_WP0X = DepartureZoneVec2.x
			BS3_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS3_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
			BS3_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			BS3_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			BS3_WP2Y = DepartureZoneVec2.y 						
			--Perimeter Zone East Point
			BS3_WP3X = DepartureZoneVec2.x
			BS3_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone North Point
			BS3_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			BS3_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			BS3_WP5X = DepartureZoneVec2.x
			BS3_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance					
		end		
		
		BLUESQUADRON3 = SPAWN:NewWithAlias("Plane Template", BlueSquadronName3)						
							:InitRandomizeTemplate( ForrestalCAP )														
							
		:OnSpawnGroup(
			function( SpawnGroup )						
				BLUESQUADRON3GROUPNAME = SpawnGroup.GroupName
				BLUESQUADRON3GROUPID = Group.getByName(BLUESQUADRON3GROUPNAME):getID()
				BLUESQUADRON3GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = BS3_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
																["groupId"] = BLUESQUADRON3GROUPID,
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
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
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
																["value"] = 2,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
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
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = BS3_WP0Y,
									["x"] = BS3_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = BS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = BS3_WP1Y,
									["x"] = BS3_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = BS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = BS3_WP2Y,
									["x"] = BS3_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = BS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = BS3_WP3Y,
									["x"] = BS3_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = BS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = BS3_WP4Y,
									["x"] = BS3_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = BS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
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
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = BS3_WP5Y,
									["x"] = BS3_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				BLUESQUADRON3GROUP:SetTask(Mission)				
			end
		)
		--:SpawnInZone( SpawnZone, false, BS3_FlightLevel, BS3_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( "CV-59 Forrestal" ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold
		--trigger.action.outText("Blue Squadron 3 Is Launching Fighters", 15)	
	end
end

function SEF_RED_HELOSCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDHELOGROUPNAME) ~= nil and GROUP:FindByName(REDHELOGROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_RED_HELOSCHEDULER, nil, timer.getTime() + math.random(1800, 3600))			
		else
			SEF_REDHELOSQUADRONSPAWN()
			
			timer.scheduleFunction(SEF_RED_HELOSCHEDULER, nil, timer.getTime() + math.random(1800, 3600))
		end
	else	
		timer.scheduleFunction(SEF_RED_HELOSCHEDULER, nil, timer.getTime() + math.random(1800, 3600))		
	end	
end

function SEF_BLUE_HELOSCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUEHELOGROUPNAME) ~= nil and GROUP:FindByName(BLUEHELOGROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUE_HELOSCHEDULER, nil, timer.getTime() + math.random(1800, 3600))			
		else
			SEF_BLUEHELOSQUADRONSPAWN()
			
			timer.scheduleFunction(SEF_BLUE_HELOSCHEDULER, nil, timer.getTime() + math.random(1800, 3600))
		end
	else	
		timer.scheduleFunction(SEF_BLUE_HELOSCHEDULER, nil, timer.getTime() + math.random(1800, 3600))		
	end	
end

function SEF_BLUEHELOSQUADRONSPAWN()

	BLUEHELO_DATA[1].Vec2 		= nil
	BLUEHELO_DATA[1].TimeStamp 	= nil
	BLUEHELO_DATA[2].Vec2 		= nil
	BLUEHELO_DATA[2].TimeStamp 	= nil
	
	--local FlightSelection 	= math.random(1,100)
	local FlightDirection 	= math.random(1,100)
	local Randomiser 		= math.random(0,5)	
		
	DepartureAirbaseName = "Andersen AFB"		
	BlueHelo_DepartureZone 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone()
				
	if ( FlightDirection <= 50 ) then
		--Clockwise
	
		BlueHelo_WP1ZoneVec2 	= ZONE:FindByName("Guam EWR"):GetVec2()
		BlueHelo_WP2ZoneVec2 	= ZONE:FindByName("Fena Valley Reservoir"):GetVec2()
		BlueHelo_WP3ZoneVec2 	= ZONE:FindByName("Apra Harbour"):GetVec2()
		BlueHelo_WP4ZoneVec2 	= ZONE:FindByName("Ritidian Point"):GetVec2()
		BlueHelo_WP5ZoneVec2 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone():GetVec2()		
	else
		--Anticlockwise
		BlueHelo_WP1ZoneVec2 	= ZONE:FindByName("Ritidian Point"):GetVec2()
		BlueHelo_WP2ZoneVec2 	= ZONE:FindByName("Apra Harbour"):GetVec2()
		BlueHelo_WP3ZoneVec2 	= ZONE:FindByName("Fena Valley Reservoir"):GetVec2()
		BlueHelo_WP4ZoneVec2 	= ZONE:FindByName("Guam EWR"):GetVec2()
		BlueHelo_WP5ZoneVec2 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone():GetVec2()			
	end
		
	BLUEHELO = SPAWN:NewWithAlias("Helicopter Template", BlueHeloName):InitRandomizeTemplate( { "USAF AH-64D", "USAF AH-1W" } )	
	
		:OnSpawnGroup(
			function( SpawnGroup )						
				BLUEHELOGROUPNAME = SpawnGroup.GroupName
				BLUEHELOGROUPID = Group.getByName(BLUEHELOGROUPNAME):getID()
				BLUEHELOGROUP = GROUP:FindByName(SpawnGroup.GroupName)				
				
				local BlueHelo_DepartureZoneVec2 = BlueHelo_DepartureZone:GetVec2()				
				local WP0X = BlueHelo_DepartureZoneVec2.x
				local WP0Y = BlueHelo_DepartureZoneVec2.y
				local WP1X = BlueHelo_WP1ZoneVec2.x
				local WP1Y = BlueHelo_WP1ZoneVec2.y 
				local WP2X = BlueHelo_WP2ZoneVec2.x 
				local WP2Y = BlueHelo_WP2ZoneVec2.y 
				local WP3X = BlueHelo_WP3ZoneVec2.x 
				local WP3Y = BlueHelo_WP3ZoneVec2.y
				local WP4X = BlueHelo_WP4ZoneVec2.x 
				local WP4Y = BlueHelo_WP4ZoneVec2.y
				local WP5X = BlueHelo_WP5ZoneVec2.x
				local WP5Y = BlueHelo_WP5ZoneVec2.y 			
				
				local MissionAltitude = 500 + (Randomiser * 100)
				
						Mission = {
							["id"] = "Mission",
							["params"] = {	
								["route"] = 
                                {
                                    ["routeRelativeTOT"] = false,
                                    ["points"] = 
                                    {
										[1] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 77.777777777778,
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
                                                            ["id"] = "EngageTargets",
                                                            ["number"] = 1,
                                                            ["params"] = 
                                                            {
                                                                ["targetTypes"] = 
                                                                {
                                                                    [1] = "All",
                                                                }, -- end of ["targetTypes"]
                                                                ["priority"] = 0,
                                                                ["value"] = "All;",
                                                                ["noTargetTypes"] = 
                                                                {
                                                                }, -- end of ["noTargetTypes"]
                                                                ["maxDistEnabled"] = true,
                                                                ["maxDist"] = 8000,
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
                                                                        ["value"] = 8,
                                                                        ["name"] = 5,
                                                                        ["formationIndex"] = 8,
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
                                                                        ["value"] = 2,
                                                                        ["name"] = 1,
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
                                                                        ["name"] = 6,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [4]
														[5] = 
														{
															["enabled"] = true,
															["auto"] = true,
															["id"] = "WrappedAction",
															["number"] = 5,
															["params"] = 
															{
																["action"] = 
																{
																	["id"] = "EPLRS",
																	["params"] = 
																	{
																		["value"] = true,
																		["groupId"] = BLUEHELOGROUPID,
																	}, -- end of ["params"]
																}, -- end of ["action"]
															}, -- end of ["params"]
														}, -- end of [5]
														[6] = 
														{
															["enabled"] = true,
															["auto"] = false,
															["id"] = "WrappedAction",
															["number"] = 6,
															["params"] = 
															{
																["action"] = 
																{
																	["id"] = "Option",
																	["params"] = 
																	{
																		["value"] = true,
																		["name"] = 19,
																	}, -- end of ["params"]
																}, -- end of ["action"]
															}, -- end of ["params"]
														}, -- end of [6]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = WP0Y,
                                            ["x"] = WP0X,                                            
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                        [2] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 77.777777777778,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 7.7611865859883,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP1Y,
                                            ["x"] = WP1X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [2]
                                        [3] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 77.777777777778,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 12.302226981618,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP2Y,
                                            ["x"] = WP2X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [3]
                                        [4] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 77.777777777778,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 16.124503701607,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP3Y,
                                            ["x"] = WP3X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [4]
                                        [5] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 77.777777777778,
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
																	["id"] = "SwitchWaypoint",
																	["params"] = 
																	{
																		["goToWaypointIndex"] = 2,
																		["fromWaypointIndex"] = 5,
																	}, -- end of ["params"]
																}, -- end of ["action"]
															}, -- end of ["params"]
														}, -- end of [1]
													}, -- end of ["tasks"]
												}, -- end of ["params"]
											}, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 18.768273534607,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP4Y,
                                            ["x"] = WP4X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [5]
                                        [6] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 77.777777777778,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 23.265788576937,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP5Y,
                                            ["x"] = WP5X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [6]										
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
							}, --end of ["params"]
						}--end of Mission	
			BLUEHELOGROUP:SetTask(Mission)
			end
		)
		--:SpawnInZone( SpawnZone, false, 304.8, 304.8 )
		--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		:SpawnAtParkingSpot(AIRBASE:FindByName(DepartureAirbaseName), {53,55}, SPAWN.Takeoff.Hot)
end

function SEF_REDHELOSQUADRONSPAWN()

	REDHELO_DATA[1].Vec2 		= nil
	REDHELO_DATA[1].TimeStamp 	= nil
	REDHELO_DATA[2].Vec2 		= nil
	REDHELO_DATA[2].TimeStamp 	= nil
	
	local FlightSelection = math.random(1,100)
	local FlightDirection = math.random(1,100)
	local Randomiser = math.random(0,5)
	
	if (FlightSelection <=50 and Airbase.getByName("Taftanaz"):getCoalition() == 1) then	
		--North
		DepartureAirbaseName = "Taftanaz"
		RedHelo_DepartureZone 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone()		
		
		if ( FlightDirection <= 50 ) then
			--Clockwise
			RedHelo_WP1ZoneVec2 	= ZONE:FindByName("Karbeyaz"):GetVec2()
			RedHelo_WP2ZoneVec2 	= ZONE:FindByName("Altinozu"):GetVec2()
			RedHelo_WP3ZoneVec2 	= ZONE:FindByName("Avsuya"):GetVec2()
			RedHelo_WP4ZoneVec2 	= ZONE:FindByName("Bohsin"):GetVec2()
			RedHelo_WP5ZoneVec2 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone():GetVec2()		
		else
			--Anticlockwise		
			RedHelo_WP1ZoneVec2 	= ZONE:FindByName("Bohsin"):GetVec2()
			RedHelo_WP2ZoneVec2 	= ZONE:FindByName("Avsuya"):GetVec2()
			RedHelo_WP3ZoneVec2 	= ZONE:FindByName("Altinozu"):GetVec2()
			RedHelo_WP4ZoneVec2 	= ZONE:FindByName("Karbeyaz"):GetVec2()
			RedHelo_WP5ZoneVec2 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone():GetVec2()
		end	
	elseif (FlightSelection > 50 and Airbase.getByName("Qabr as Sitt"):getCoalition() == 1) then
		--South
		DepartureAirbaseName = "Qabr as Sitt"
		RedHelo_DepartureZone 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone()		
		
		if ( FlightDirection <= 50 ) then
			--Clockwise
			RedHelo_WP1ZoneVec2 	= ZONE:FindByName("Izra"):GetVec2()
			RedHelo_WP2ZoneVec2 	= ZONE:FindByName("Ash Shajarah"):GetVec2()
			RedHelo_WP3ZoneVec2 	= ZONE:FindByName("Golan Heights"):GetVec2()
			RedHelo_WP4ZoneVec2 	= ZONE:FindByName("Al Qunaytirah"):GetVec2()
			RedHelo_WP5ZoneVec2 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone():GetVec2()		
		else
			--Anticlockwise		
			RedHelo_WP1ZoneVec2 	= ZONE:FindByName("Al Qunaytirah"):GetVec2()
			RedHelo_WP2ZoneVec2 	= ZONE:FindByName("Golan Heights"):GetVec2()
			RedHelo_WP3ZoneVec2 	= ZONE:FindByName("Ash Shajarah"):GetVec2()
			RedHelo_WP4ZoneVec2 	= ZONE:FindByName("Izra"):GetVec2()
			RedHelo_WP5ZoneVec2 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone():GetVec2()
		end	
	else
		--Do nothing we've lost the forward Helo Bases
	end
	
	REDHELO = SPAWN:NewWithAlias("Helicopter Template", RedHeloName):InitRandomizeTemplate( { "VVS Ka-50" } )	
	
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDHELOGROUPNAME = SpawnGroup.GroupName
				REDHELOGROUP = GROUP:FindByName(SpawnGroup.GroupName)				
				
				local RedHelo_DepartureZoneVec2 = RedHelo_DepartureZone:GetVec2()				
				local WP0X = RedHelo_DepartureZoneVec2.x
				local WP0Y = RedHelo_DepartureZoneVec2.y
				local WP1X = RedHelo_WP1ZoneVec2.x
				local WP1Y = RedHelo_WP1ZoneVec2.y 
				local WP2X = RedHelo_WP2ZoneVec2.x 
				local WP2Y = RedHelo_WP2ZoneVec2.y 
				local WP3X = RedHelo_WP3ZoneVec2.x 
				local WP3Y = RedHelo_WP3ZoneVec2.y
				local WP4X = RedHelo_WP4ZoneVec2.x 
				local WP4Y = RedHelo_WP4ZoneVec2.y
				local WP5X = RedHelo_WP5ZoneVec2.x
				local WP5Y = RedHelo_WP5ZoneVec2.y 				
							
				local MissionAltitude = 500 + (Randomiser * 100)
				
						Mission = {
							["id"] = "Mission",
							["params"] = {	
								["route"] = 
                                {
                                    ["routeRelativeTOT"] = false,
                                    ["points"] = 
                                    {
										[1] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 83.333333333333,
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
                                                            ["id"] = "EngageTargets",
                                                            ["number"] = 1,
                                                            ["params"] = 
                                                            {
                                                                ["targetTypes"] = 
                                                                {
                                                                    [1] = "All",
                                                                }, -- end of ["targetTypes"]
                                                                ["priority"] = 0,
                                                                ["value"] = "All;",
                                                                ["noTargetTypes"] = 
                                                                {
                                                                }, -- end of ["noTargetTypes"]
                                                                ["maxDistEnabled"] = true,
                                                                ["maxDist"] = 30000,
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
                                                                        ["value"] = 8,
                                                                        ["name"] = 5,
                                                                        ["formationIndex"] = 8,
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
                                                                        ["value"] = 2,
                                                                        ["name"] = 1,
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
                                                                        ["name"] = 6,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [4]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = WP0Y,
                                            ["x"] = WP0X,                                            
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                        [2] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 83.333333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 7.7611865859883,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP1Y,
                                            ["x"] = WP1X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [2]
                                        [3] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 83.333333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 12.302226981618,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP2Y,
                                            ["x"] = WP2X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [3]
                                        [4] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 83.333333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 16.124503701607,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP3Y,
                                            ["x"] = WP3X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [4]
                                        [5] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 83.333333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 18.768273534607,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP4Y,
                                            ["x"] = WP4X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [5]
                                        [6] = 
                                        {
                                            ["alt"] = MissionAltitude,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 83.333333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 23.265788576937,
                                            ["ETA_locked"] = false,
                                            ["y"] = WP5Y,
                                            ["x"] = WP5X,
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [6]										
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
							}, --end of ["params"]
						}--end of Mission	
			REDHELOGROUP:SetTask(Mission)
			end
		)
		--:SpawnInZone( SpawnZone, true, 304.8, 304.8 )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
end

function SEF_ClearAIFightersFromCarrierDeck()
	if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then
		Group.getByName(BLUESQUADRON1GROUPNAME):destroy()
		trigger.action.outText("USN Fighter Squadron Has Been Cleared", 15)
	else
		trigger.action.outText("USN Fighter Squadron Is Not Currently Deployed", 15)
	end	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------					
--////MAIN

--ParkingData1 = AIRBASE:FindByName("Andersen AFB")
--ParkingData1:MarkParkingSpots()

--////RED CAP INITIALISE
timer.scheduleFunction(SEF_REDSQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))
timer.scheduleFunction(SEF_REDSQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))
timer.scheduleFunction(SEF_REDSQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))
timer.scheduleFunction(SEF_REDSQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))
timer.scheduleFunction(SEF_REDSQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))

--////BLUE CAP INITIALISE
timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))
timer.scheduleFunction(SEF_BLUESQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))
timer.scheduleFunction(SEF_BLUESQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))

--////RED HELO INITIALISE
--timer.scheduleFunction(SEF_RED_HELOSCHEDULER, nil, timer.getTime() + math.random(300,900))

--////BLUE HELO INITIALISE
timer.scheduleFunction(SEF_BLUE_HELOSCHEDULER, nil, timer.getTime() + math.random(300,900))
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
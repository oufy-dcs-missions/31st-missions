--//////////////////////////////////////////////////////////
-- Name: Operation Clear Field Escalation - Airforce Module
-- Author: Surrexen    ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ
--//////////////////////////////////////////////////////////

	-- AIRBASE.Caucasus.Anapa_Vityazevo
	-- AIRBASE.Caucasus.Batumi
	-- AIRBASE.Caucasus.Beslan
	-- AIRBASE.Caucasus.Gelendzhik
	-- AIRBASE.Caucasus.Gudauta
	-- AIRBASE.Caucasus.Kobuleti
	-- AIRBASE.Caucasus.Krasnodar_Center
	-- AIRBASE.Caucasus.Krasnodar_Pashkovsky
	-- AIRBASE.Caucasus.Krymsk
	-- AIRBASE.Caucasus.Kutaisi
	-- AIRBASE.Caucasus.Maykop_Khanskaya
	-- AIRBASE.Caucasus.Mineralnye_Vody
	-- AIRBASE.Caucasus.Mozdok
	-- AIRBASE.Caucasus.Nalchik
	-- AIRBASE.Caucasus.Novorossiysk
	-- AIRBASE.Caucasus.Senaki_Kolkhi
	-- AIRBASE.Caucasus.Sochi_Adler
	-- AIRBASE.Caucasus.Soganlug
	-- AIRBASE.Caucasus.Sukhumi_Babushara
	-- AIRBASE.Caucasus.Tbilisi_Lochini
	-- AIRBASE.Caucasus.Vaziani	

CAPZoneBlueCarrier 			= ZONE_GROUP:New("CAP Zone Blue Carrier", GROUP:FindByName( "CVN-72 Abraham Lincoln" ), 25000)
CAPZoneRedCarrier 			= ZONE_GROUP:New("CAP Zone Red Carrier", GROUP:FindByName( "CV 1143.5 Admiral Kuznetsov" ), 25000)
CAPZoneRedCarrierPerimeter 	= ZONE_GROUP:New("CV 1143.5 Admiral Kuznetsov Perimeter Zone", GROUP:FindByName( "CV 1143.5 Admiral Kuznetsov" ), 74080)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////VARIABLES

RedSquadronName1 = "Alpha"
RedSquadronName2 = "Beta"
RedSquadronName3 = "Gamma"
RedSquadronName4 = "Delta"
RedSquadronName5 = "Epsilon"

REDSQUADRON1GROUPNAME = ""
REDSQUADRON2GROUPNAME = ""
REDSQUADRON3GROUPNAME = ""
REDSQUADRON4GROUPNAME = ""
REDSQUADRON5GROUPNAME = ""

BlueSquadronName1 = "USN Fighter"
BlueSquadronName2 = "USAF Fighter 1"
BlueSquadronName3 = "USAF Fighter 2"

BLUESQUADRON1GROUPNAME = ""
BLUESQUADRON2GROUPNAME = ""
BLUESQUADRON3GROUPNAME = ""

BlueSquadronsEnabled = 1
RedSquadronsEnabled = 1

BlueRespawnTimerInitialMin = 300
BlueRespawnTimerInitialMax = 450
RedRespawnTimerInitialMin = 300
RedRespawnTimerInitialMax = 450

BlueRespawnTimerMin = 600
BlueRespawnTimerMax = 1200
RedRespawnTimerMin  = 900
RedRespawnTimerMax  = 1500

RedFlightLevelMin = 6
RedFlightLevelMax = 11
BlueFlightLevelMin = 6
BlueFlightLevelMax = 11

RedPatrolWaypointDistance = 46300
RedPatrolWaypointInitial = 18520

BluePatrolWaypointDistance = 46300
BluePatrolWaypointInitial = 18520

EngagementDistance = 74080

CleanupTime = 300

AlphaStatus = "Alpha Squadron\nAirspace Is Controlled By Russia\n"
BetaStatus = "Beta Squadron\nAirspace Is Controlled By Russia\n"
GammaStatus = "Gamma Squadron\nAirspace Is Controlled By Russia\n"
DeltaStatus = "Delta Squadron\nAirspace Is Controlled By Russia\n"
EpsilonStatus = "Epsilon Squadron\nAirspace Is Controlled By Russia\n"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////TABLES

USAFAirForceCAP = { 
				  "USAF F-16C", 
				  "USAF F/A-18C", 
				  "USAF F-15C", 
				  }

USNAirForceCAP = { 
				 "USAF F/A-18C", 
				 "USAF F-14B", 
				 }

CombinedBlueCAP  = { 
				   "USAF F-16C", 
				   "USAF F/A-18C", 
				   "USAF F-15C", 
				   "USAF F-14B", 				    
				   }

--////MiG-31 ~5.9% Chance
CoastalCAP = {
			 "VVS MiG-29A",
			 "VVS MiG-21Bis", 
			 "VVS MiG-23MLD",	
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",
			 "VVS MiG-29A",
			 "VVS MiG-21Bis", 
			 "VVS MiG-23MLD",	
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",			 
			 "VVS MiG-31",
			 "VVS MiG-29A",
			 "VVS MiG-21Bis", 
			 "VVS MiG-23MLD",	
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",
			 "VVS MiG-29A",
			 "VVS MiG-21Bis", 
			 "VVS MiG-23MLD",	
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",			 
			 "VVS MiG-31",			 
			 "VVS MiG-29A Ace",
			 "VVS MiG-21Bis Ace", 
			 "VVS MiG-23MLD Ace",	
			 "VVS MiG-29S Ace",
			 "VVS Su-27 Ace", 
			 "VVS Su-30 Ace", 
			 "VVS Su-33 Ace",
			 "VVS MiG-25PD Ace",
			 "VVS MiG-29A Ace",
			 "VVS MiG-21Bis Ace", 
			 "VVS MiG-23MLD Ace",	
			 "VVS MiG-29S Ace",
			 "VVS Su-27 Ace", 
			 "VVS Su-30 Ace", 
			 "VVS Su-33 Ace",
			 "VVS MiG-25PD Ace",			 
			 "VVS MiG-31 Ace",
			 }		

--////MiG-31 ~5.9% Chance
VVSAirForcesCAP = { 
				  "VVS MiG-21Bis", 
				  "VVS MiG-29A", 
				  "VVS MiG-29S", 
				  "VVS MiG-23MLD", 
				  "VVS MiG-25PD",					 
				  "VVS Su-27", 
				  "VVS Su-30", 
				  "VVS Su-33",
				  "VVS MiG-21Bis", 
				  "VVS MiG-29A", 
				  "VVS MiG-29S", 
				  "VVS MiG-23MLD", 
				  "VVS MiG-25PD",					 
				  "VVS Su-27", 
				  "VVS Su-30", 
				  "VVS Su-33",	
				  "VVS MiG-31",
				  "VVS MiG-21Bis", 
				  "VVS MiG-29A", 
				  "VVS MiG-29S", 
				  "VVS MiG-23MLD", 
				  "VVS MiG-25PD",					 
				  "VVS Su-27", 
				  "VVS Su-30", 
				  "VVS Su-33",
				  "VVS MiG-21Bis", 
				  "VVS MiG-29A", 
				  "VVS MiG-29S", 
				  "VVS MiG-23MLD", 
				  "VVS MiG-25PD",					 
				  "VVS Su-27", 
				  "VVS Su-30", 
				  "VVS Su-33",	
				  "VVS MiG-31",
				  
				  "VVS MiG-21Bis Ace", 
				  "VVS MiG-29A Ace", 
				  "VVS MiG-29S Ace", 
				  "VVS MiG-23MLD Ace", 
				  "VVS MiG-25PD Ace",					 
				  "VVS Su-27 Ace", 
				  "VVS Su-30 Ace", 
				  "VVS Su-33 Ace",
				  "VVS MiG-21Bis Ace", 
				  "VVS MiG-29A Ace", 
				  "VVS MiG-29S Ace", 
				  "VVS MiG-23MLD Ace", 
				  "VVS MiG-25PD Ace",					 
				  "VVS Su-27 Ace", 
				  "VVS Su-30 Ace", 
				  "VVS Su-33 Ace",	
				  "VVS MiG-31 Ace",
				  }

--////
CombinedRedCAP = { 
				 "VVS MiG-21Bis", 
				 "VVS MiG-29A", 
				 "VVS MiG-29S", 
				 "VVS MiG-23MLD", 
				 "VVS MiG-25PD", 
				 "VVS MiG-31", 
				 "VVS Su-27", 
				 "VVS Su-30", 
				 "VVS Su-33",
				 "VVS MiG-21Bis", 
				 "VVS MiG-29A", 
				 "VVS MiG-29S", 
				 "VVS MiG-23MLD", 
				 "VVS MiG-25PD", 
				 "VVS MiG-31", 
				 "VVS Su-27", 
				 "VVS Su-30", 
				 "VVS Su-33",				 
				 "VVS MiG-21Bis Ace", 
				 "VVS MiG-29A Ace", 
				 "VVS MiG-29S Ace", 
				 "VVS MiG-23MLD Ace", 
				 "VVS MiG-25PD Ace", 
				 "VVS MiG-31 Ace", 
				 "VVS Su-27 Ace", 
				 "VVS Su-30 Ace", 
				 "VVS Su-33 Ace",
				 }

BlackSeaFleetCAP = 	{	
					"VVS Su-33",
					"VVS Su-33",
					"VVS Su-33 Ace",
					}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

USAFAWACS_DATA = {}
USAFAWACS_DATA[1] = {
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
		AirbaseName = AIRBASE.Caucasus.Anapa_Vityazevo,
		Neighbours = { AIRBASE.Caucasus.Krymsk, AIRBASE.Caucasus.Novorossiysk, AIRBASE.Caucasus.Gelendzhik, AIRBASE.Caucasus.Krasnodar_Center, AIRBASE.Caucasus.Krasnodar_Pashkovsky },			
}
SEF_AIRBASEINFORMATION[2] = {				
		AirbaseName = AIRBASE.Caucasus.Batumi,
		Neighbours = { AIRBASE.Caucasus.Kobuleti, AIRBASE.Caucasus.Senaki_Kolkhi, AIRBASE.Caucasus.Kutaisi, AIRBASE.Caucasus.Sukhumi_Babushara, AIRBASE.Caucasus.Gudauta },			
}
SEF_AIRBASEINFORMATION[3] = {				
		AirbaseName = AIRBASE.Caucasus.Beslan,
		Neighbours = { AIRBASE.Caucasus.Mineralnye_Vody, AIRBASE.Caucasus.Nalchik, AIRBASE.Caucasus.Mozdok, AIRBASE.Caucasus.Soganlug, AIRBASE.Caucasus.Tbilisi_Lochini, AIRBASE.Caucasus.Vaziani },			
}
SEF_AIRBASEINFORMATION[4] = {				
		AirbaseName = AIRBASE.Caucasus.Gelendzhik,
		Neighbours = { AIRBASE.Caucasus.Anapa_Vityazevo, AIRBASE.Caucasus.Krymsk, AIRBASE.Caucasus.Novorossiysk, AIRBASE.Caucasus.Krasnodar_Center, AIRBASE.Caucasus.Krasnodar_Pashkovsky, AIRBASE.Caucasus.Maykop_Khanskaya, AIRBASE.Caucasus.Sochi_Adler },			
}
SEF_AIRBASEINFORMATION[5] = {				
		AirbaseName = AIRBASE.Caucasus.Gudauta,
		Neighbours = { AIRBASE.Caucasus.Maykop_Khanskaya, AIRBASE.Caucasus.Sochi_Adler, AIRBASE.Caucasus.Sukhumi_Babushara, AIRBASE.Caucasus.Kobuleti, AIRBASE.Caucasus.Senaki_Kolkhi, AIRBASE.Caucasus.Kutaisi, AIRBASE.Caucasus.Batumi },			
}
SEF_AIRBASEINFORMATION[6] = {				
		AirbaseName = AIRBASE.Caucasus.Kobuleti,
		Neighbours = { AIRBASE.Caucasus.Batumi, AIRBASE.Caucasus.Senaki_Kolkhi, AIRBASE.Caucasus.Kutaisi, AIRBASE.Caucasus.Sukhumi_Babushara, AIRBASE.Caucasus.Gudauta },			
}
SEF_AIRBASEINFORMATION[7] = {				
		AirbaseName = AIRBASE.Caucasus.Krasnodar_Center,
		Neighbours = { AIRBASE.Caucasus.Gelendzhik, AIRBASE.Caucasus.Anapa_Vityazevo, AIRBASE.Caucasus.Krymsk, AIRBASE.Caucasus.Novorossiysk, AIRBASE.Caucasus.Krasnodar_Pashkovsky, AIRBASE.Caucasus.Maykop_Khanskaya, AIRBASE.Caucasus.Sochi_Adler },			
}
SEF_AIRBASEINFORMATION[8] = {				
		AirbaseName = AIRBASE.Caucasus.Krasnodar_Pashkovsky,
		Neighbours = { AIRBASE.Caucasus.Gelendzhik, AIRBASE.Caucasus.Anapa_Vityazevo, AIRBASE.Caucasus.Krymsk, AIRBASE.Caucasus.Novorossiysk, AIRBASE.Caucasus.Krasnodar_Center, AIRBASE.Caucasus.Maykop_Khanskaya, AIRBASE.Caucasus.Sochi_Adler },			
}
SEF_AIRBASEINFORMATION[9] = {				
		AirbaseName = AIRBASE.Caucasus.Krymsk,
		Neighbours = { AIRBASE.Caucasus.Gelendzhik, AIRBASE.Caucasus.Anapa_Vityazevo, AIRBASE.Caucasus.Krasnodar_Pashkovsky, AIRBASE.Caucasus.Novorossiysk, AIRBASE.Caucasus.Krasnodar_Center, AIRBASE.Caucasus.Maykop_Khanskaya },			
}
SEF_AIRBASEINFORMATION[10] = {				
		AirbaseName = AIRBASE.Caucasus.Kutaisi,
		Neighbours = { AIRBASE.Caucasus.Batumi, AIRBASE.Caucasus.Senaki_Kolkhi, AIRBASE.Caucasus.Kobuleti, AIRBASE.Caucasus.Sukhumi_Babushara, AIRBASE.Caucasus.Gudauta },			
}
SEF_AIRBASEINFORMATION[11] = {				
		AirbaseName = AIRBASE.Caucasus.Maykop_Khanskaya,
		Neighbours = { AIRBASE.Caucasus.Krymsk, AIRBASE.Caucasus.Novorossiysk, AIRBASE.Caucasus.Gelendzhik, AIRBASE.Caucasus.Krasnodar_Center, AIRBASE.Caucasus.Krasnodar_Pashkovsky, AIRBASE.Caucasus.Sochi_Adler, AIRBASE.Caucasus.Gudauta },			
}
SEF_AIRBASEINFORMATION[12] = {				
		AirbaseName = AIRBASE.Caucasus.Mineralnye_Vody,
		Neighbours = { AIRBASE.Caucasus.Mozdok, AIRBASE.Caucasus.Nalchik, AIRBASE.Caucasus.Beslan },			
}
SEF_AIRBASEINFORMATION[13] = {				
		AirbaseName = AIRBASE.Caucasus.Mozdok,
		Neighbours = { AIRBASE.Caucasus.Mineralnye_Vody, AIRBASE.Caucasus.Nalchik, AIRBASE.Caucasus.Beslan },			
}
SEF_AIRBASEINFORMATION[14] = {				
		AirbaseName = AIRBASE.Caucasus.Nalchik,
		Neighbours = { AIRBASE.Caucasus.Mineralnye_Vody, AIRBASE.Caucasus.Mozdok, AIRBASE.Caucasus.Beslan, AIRBASE.Caucasus.Senaki_Kolkhi, AIRBASE.Caucasus.Kutaisi },			
}
SEF_AIRBASEINFORMATION[15] = {				
		AirbaseName = AIRBASE.Caucasus.Novorossiysk,
		Neighbours = { AIRBASE.Caucasus.Anapa_Vityazevo, AIRBASE.Caucasus.Krymsk, AIRBASE.Caucasus.Gelendzhik, AIRBASE.Caucasus.Krasnodar_Center, AIRBASE.Caucasus.Krasnodar_Pashkovsky, AIRBASE.Caucasus.Maykop_Khanskaya },			
}
SEF_AIRBASEINFORMATION[16] = {				
		AirbaseName = AIRBASE.Caucasus.Senaki_Kolkhi,
		Neighbours = { AIRBASE.Caucasus.Batumi, AIRBASE.Caucasus.Kutaisi, AIRBASE.Caucasus.Kobuleti, AIRBASE.Caucasus.Sukhumi_Babushara, AIRBASE.Caucasus.Gudauta },			
}
SEF_AIRBASEINFORMATION[17] = {				
		AirbaseName = AIRBASE.Caucasus.Sochi_Adler,
		Neighbours = { AIRBASE.Caucasus.Gelendzhik, AIRBASE.Caucasus.Krasnodar_Center, AIRBASE.Caucasus.Krasnodar_Pashkovsky, AIRBASE.Caucasus.Maykop_Khanskaya, AIRBASE.Caucasus.Gudauta, AIRBASE.Caucasus.Sukhumi_Babushara },			
}
SEF_AIRBASEINFORMATION[18] = {				
		AirbaseName = AIRBASE.Caucasus.Soganlug,
		Neighbours = { AIRBASE.Caucasus.Beslan, AIRBASE.Caucasus.Tbilisi_Lochini, AIRBASE.Caucasus.Vaziani },			
}
SEF_AIRBASEINFORMATION[19] = {				
		AirbaseName = AIRBASE.Caucasus.Sukhumi_Babushara,
		Neighbours = { AIRBASE.Caucasus.Batumi, AIRBASE.Caucasus.Kobuleti, AIRBASE.Caucasus.Senaki_Kolkhi, AIRBASE.Caucasus.Kutaisi, AIRBASE.Caucasus.Gudauta, AIRBASE.Caucasus.Sochi_Adler },			
}
SEF_AIRBASEINFORMATION[20] = {				
		AirbaseName = AIRBASE.Caucasus.Tbilisi_Lochini,
		Neighbours = { AIRBASE.Caucasus.Beslan, AIRBASE.Caucasus.Soganlug, AIRBASE.Caucasus.Vaziani },			
}
SEF_AIRBASEINFORMATION[21] = {				
		AirbaseName = AIRBASE.Caucasus.Vaziani,
		Neighbours = { AIRBASE.Caucasus.Beslan, AIRBASE.Caucasus.Tbilisi_Lochini, AIRBASE.Caucasus.Soganlug },			
}	

--[[
Alpha		Gudauta				Sochi-Adler				Maykop-Khanskaya			Krasnodar				Krymsk				Anapa
Beta		Sochi-Adler			Maykop-Khanskaya		Gelendzhik					Novorossiysk			Krymsk				Anapa
Gamma		Kuznetsov			Gelendzhik				Novorossiysk				Anapa
Delta		Nalchik				Mozdok					Mineralnye Vody				Maykop-Khanskaya		Krasnodar			Krymsk			Anapa
Epsilon		Beslan				Mozdok					Mineralnye Vody				Maykop-Khanskaya		Krasnodar			Krymsk			Anapa
]]--

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

	-- AIRBASE.Caucasus.Anapa_Vityazevo
	-- AIRBASE.Caucasus.Batumi
	-- AIRBASE.Caucasus.Beslan
	-- AIRBASE.Caucasus.Gelendzhik
	-- AIRBASE.Caucasus.Gudauta
	-- AIRBASE.Caucasus.Kobuleti
	-- AIRBASE.Caucasus.Krasnodar_Center
	-- AIRBASE.Caucasus.Krasnodar_Pashkovsky
	-- AIRBASE.Caucasus.Krymsk
	-- AIRBASE.Caucasus.Kutaisi
	-- AIRBASE.Caucasus.Maykop_Khanskaya
	-- AIRBASE.Caucasus.Mineralnye_Vody
	-- AIRBASE.Caucasus.Mozdok
	-- AIRBASE.Caucasus.Nalchik
	-- AIRBASE.Caucasus.Novorossiysk
	-- AIRBASE.Caucasus.Senaki_Kolkhi
	-- AIRBASE.Caucasus.Sochi_Adler
	-- AIRBASE.Caucasus.Soganlug
	-- AIRBASE.Caucasus.Sukhumi_Babushara
	-- AIRBASE.Caucasus.Tbilisi_Lochini
	-- AIRBASE.Caucasus.Vaziani

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
		
		-- Alpha		Gudauta				Sochi-Adler				Maykop-Khanskaya			Krasnodar				Krymsk				Anapa
		
		if ( AlphaPrimaryAirbase == AIRBASE.Caucasus.Gudauta ) then
			
			SochiPerimeterCount = 0
			MaykopPerimeterCount = 0
			KrasnodarPerimeterCount = 0
			KrymskPerimeterCount = 0			
					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Sochi_Adler.." Perimeter Zone"), function ( GroupObject )
				SochiPerimeterCount = SochiPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 and SochiPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Sochi_Adler, AlphaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, AlphaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, AlphaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Krymsk, AlphaDestinationAirbase)			
			else			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, AlphaDestinationAirbase)				
			end		
		elseif ( AlphaPrimaryAirbase == AIRBASE.Caucasus.Sochi_Adler ) then
		
			GudautaPerimeterCount = 0
			MaykopPerimeterCount = 0
			KrasnodarPerimeterCount = 0
			KrymskPerimeterCount = 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gudauta.." Perimeter Zone"), function ( GroupObject )
				GudautaPerimeterCount = GudautaPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			
			
			if ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() == 1 and GudautaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Gudauta, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Krymsk, AlphaDestinationAirbase)	
			else			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, AlphaDestinationAirbase)
			end		
		elseif ( AlphaPrimaryAirbase == AIRBASE.Caucasus.Maykop_Khanskaya ) then
		
			GudautaPerimeterCount = 0
			SochiPerimeterCount = 0
			KrasnodarPerimeterCount = 0
			KrymskPerimeterCount = 0

			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gudauta.." Perimeter Zone"), function ( GroupObject )
				GudautaPerimeterCount = GudautaPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Sochi_Adler.." Perimeter Zone"), function ( GroupObject )
				SochiPerimeterCount = SochiPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			
			
			if ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() == 1 and GudautaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Gudauta, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 and SochiPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Sochi_Adler, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Krymsk, AlphaDestinationAirbase)	
			else			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, AlphaDestinationAirbase)
			end		
		elseif ( AlphaPrimaryAirbase == AIRBASE.Caucasus.Krasnodar_Pashkovsky ) then
		
			GudautaPerimeterCount = 0
			SochiPerimeterCount = 0
			MaykopPerimeterCount = 0
			KrymskPerimeterCount = 0

			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gudauta.." Perimeter Zone"), function ( GroupObject )
				GudautaPerimeterCount = GudautaPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Sochi_Adler.." Perimeter Zone"), function ( GroupObject )
				SochiPerimeterCount = SochiPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			
			
			if ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() == 1 and GudautaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Gudauta, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 and SochiPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Sochi_Adler, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Krymsk, AlphaDestinationAirbase)	
			else			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, AlphaDestinationAirbase)
			end			
		
		elseif ( AlphaPrimaryAirbase == AIRBASE.Caucasus.Krymsk ) then
		
			GudautaPerimeterCount = 0
			SochiPerimeterCount = 0
			MaykopPerimeterCount = 0
			KrasnodarPerimeterCount = 0

			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gudauta.." Perimeter Zone"), function ( GroupObject )
				GudautaPerimeterCount = GudautaPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Sochi_Adler.." Perimeter Zone"), function ( GroupObject )
				SochiPerimeterCount = SochiPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)			
			
			if ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() == 1 and GudautaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Gudauta, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 and SochiPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Sochi_Adler, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, AlphaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, AlphaDestinationAirbase)	
			else			
				SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, AlphaDestinationAirbase)
			end		
		elseif ( AlphaPrimaryAirbase == AIRBASE.Caucasus.Anapa_Vityazevo ) then
			SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, AlphaDestinationAirbase)
		else			
			SEF_REDSQUADRON1_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, AlphaDestinationAirbase)
		end		
	else
		AlphaStatus = AlphaPrimaryAirbase.." - Alpha Squadron\nAirspace Is Controlled By Russia\n"
		SEF_REDSQUADRON1_SPAWN(AlphaPrimaryAirbase, AlphaDestinationAirbase)
	end	
end

function SEF_REDSQUADRON1_DEPLOYMENT()	
		
	-- Alpha		Gudauta				Sochi-Adler				Maykop-Khanskaya			Krasnodar				Krymsk				Anapa
	
	--ALPHA
	if ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() == 1 ) then
		--Case 1: Set Alpha To Gudauta and Patrol Gudauta
		AlphaPrimaryAirbase = AIRBASE.Caucasus.Gudauta
		AlphaDestinationAirbase = AIRBASE.Caucasus.Gudauta
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 ) then
		--Case 2: Set Alpha To Sochi and Patrol Gudauta
		AlphaPrimaryAirbase = AIRBASE.Caucasus.Sochi_Adler
		AlphaDestinationAirbase = AIRBASE.Caucasus.Gudauta
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 ) then
		--Case 3: Set Alpha To Maykop and Patrol Sochi
		AlphaPrimaryAirbase = AIRBASE.Caucasus.Maykop_Khanskaya
		AlphaDestinationAirbase = AIRBASE.Caucasus.Sochi_Adler
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 ) then
		--Case 4: Set Alpha To Krasnodar and Patrol Maykop
		AlphaPrimaryAirbase = AIRBASE.Caucasus.Krasnodar_Pashkovsky
		AlphaDestinationAirbase = AIRBASE.Caucasus.Maykop_Khanskaya
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1) then
		--Case 5: Set Alpha To Krymsk and Patrol Krasnodar
		AlphaPrimaryAirbase = AIRBASE.Caucasus.Krymsk
		AlphaDestinationAirbase = AIRBASE.Caucasus.Krasnodar_Pashkovsky
	else
		--Case 6: Set Alpha To Anapa And Patrol Krymsk
		AlphaPrimaryAirbase = AIRBASE.Caucasus.Anapa_Vityazevo
		AlphaDestinationAirbase = AIRBASE.Caucasus.Krymsk
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
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
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
		
		REDSQUADRON1 = SPAWN:NewWithAlias("VVS MiG-29A", RedSquadronName1)
							:InitRandomizeTemplate(VVSAirForcesCAP)								
						
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
																["value"] = 3,
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
		--:SpawnInZone( SpawnZone, false, RS1_FlightLevel, RS1_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--trigger.action.outText("Red Squadron 1 Is Launching Fighters", 15)	
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
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
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
		
		REDSQUADRON2 = SPAWN:NewWithAlias("VVS MiG-29A", RedSquadronName2)
							:InitRandomizeTemplate(VVSAirForcesCAP)										
								
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
																["value"] = 3,
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
		--:SpawnInZone( SpawnZone, false, RS2_FlightLevel, RS2_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
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
		
		if ( DepartureAirbaseName == "CV 1143.5 Admiral Kuznetsov" ) then
			RS3_SpawnZone = CAPZoneRedCarrier
		else
			RS3_SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		end
		
		--RS3_SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
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
		
		REDSQUADRON3 = SPAWN:NewWithAlias("VVS Su-33", RedSquadronName3)
							:InitRandomizeTemplate(BlackSeaFleetCAP)								
		
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
																["value"] = 3,
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
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--trigger.action.outText("Red Squadron 3 Is Launching Fighters", 15)	
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
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		--////Special To Offset Delta's Patrol Point Slightly When The Destination Is Nalchik
		if ( DestinationAirbaseName == AIRBASE.Caucasus.Nalchik ) then
			RS4_DestinationZone = ZONE:FindByName("Nalchik VVS Patrol Point")
		else
			RS4_DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		end	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS4_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= RS4_DestinationZone:GetVec2()
					
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
		
		REDSQUADRON4 = SPAWN:NewWithAlias("VVS MiG-29A", RedSquadronName4)
							:InitRandomizeTemplate(VVSAirForcesCAP)																
		
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
																["value"] = 3,
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
		--:SpawnInZone( SpawnZone, false, RS4_FlightLevel, RS4_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
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
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		--////Special To Offset Epsilon's Patrol Point Slightly When The Destination Is Beslan
		if ( DestinationAirbaseName == AIRBASE.Caucasus.Beslan ) then
			RS5_DestinationZone = ZONE:FindByName("Beslan VVS Patrol Point")
		else
			RS5_DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		end		
		--local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()			
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS5_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= RS5_DestinationZone:GetVec2()
					
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
		
		REDSQUADRON5 = SPAWN:NewWithAlias("VVS MiG-29A", RedSquadronName5)
							:InitRandomizeTemplate(VVSAirForcesCAP)							
								
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
																["value"] = 3,
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
		--:SpawnInZone( SpawnZone, false, RS5_FlightLevel, RS5_FlightLevel )
		--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
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
	
	--Beta		Sochi-Adler			Maykop-Khanskaya		Gelendzhik					Novorossiysk			Krymsk				Anapa	
		
	if ( BetaPrimaryPerimeterCount > 0 ) then		
		BetaStatus = BetaPrimaryAirbase.." - Beta Squadron\nAirspace Is Being Contested By The Allies\n"
		
		--////
		if ( BetaPrimaryAirbase == AIRBASE.Caucasus.Sochi_Adler ) then
			
			MaykopPerimeterCount 		= 0
			GelendzhikPerimeterCount 	= 0
			NovorossiyskPerimeterCount	= 0
			KrymskPerimeterCount		= 0	
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gelendzhik.." Perimeter Zone"), function ( GroupObject )
				GelendzhikPerimeterCount = GelendzhikPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Novorossiysk.." Perimeter Zone"), function ( GroupObject )
				NovorossiyskPerimeterCount = NovorossiyskPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() == 1 and GelendzhikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Gelendzhik, BetaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() == 1 and NovorossiyskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Novorossiysk, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Krymsk, BetaDestinationAirbase)			
			else			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, BetaDestinationAirbase)			
			end		
		--////
		elseif ( BetaPrimaryAirbase == AIRBASE.Caucasus.Maykop_Khanskaya ) then
		
			SochiPerimeterCount 		= 0
			GelendzhikPerimeterCount 	= 0
			NovorossiyskPerimeterCount	= 0
			KrymskPerimeterCount		= 0	
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Sochi_Adler.." Perimeter Zone"), function ( GroupObject )
				SochiPerimeterCount = SochiPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gelendzhik.." Perimeter Zone"), function ( GroupObject )
				GelendzhikPerimeterCount = GelendzhikPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Novorossiysk.." Perimeter Zone"), function ( GroupObject )
				NovorossiyskPerimeterCount = NovorossiyskPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 and SochiPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Sochi_Adler, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() == 1 and GelendzhikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Gelendzhik, BetaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() == 1 and NovorossiyskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Novorossiysk, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Krymsk, BetaDestinationAirbase)			
			else			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, BetaDestinationAirbase)			
			end		
		--////
		elseif ( BetaPrimaryAirbase == AIRBASE.Caucasus.Gelendzhik ) then
		
			SochiPerimeterCount 		= 0
			MaykopPerimeterCount 		= 0			
			NovorossiyskPerimeterCount	= 0
			KrymskPerimeterCount		= 0	
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Sochi_Adler.." Perimeter Zone"), function ( GroupObject )
				SochiPerimeterCount = SochiPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Novorossiysk.." Perimeter Zone"), function ( GroupObject )
				NovorossiyskPerimeterCount = NovorossiyskPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 and SochiPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Sochi_Adler, BetaDestinationAirbase)
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, BetaDestinationAirbase)												
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() == 1 and NovorossiyskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Novorossiysk, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Krymsk, BetaDestinationAirbase)			
			else			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, BetaDestinationAirbase)			
			end			
		--////
		elseif ( BetaPrimaryAirbase == AIRBASE.Caucasus.Novorossiysk ) then
			
			SochiPerimeterCount			= 0
			MaykopPerimeterCount 		= 0
			GelendzhikPerimeterCount 	= 0			
			KrymskPerimeterCount		= 0	
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Sochi_Adler.." Perimeter Zone"), function ( GroupObject )
				SochiPerimeterCount = SochiPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gelendzhik.." Perimeter Zone"), function ( GroupObject )
				GelendzhikPerimeterCount = GelendzhikPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 and SochiPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Sochi_Adler, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() == 1 and GelendzhikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Gelendzhik, BetaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Krymsk, BetaDestinationAirbase)			
			else			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, BetaDestinationAirbase)			
			end
		--////
		elseif ( BetaPrimaryAirbase == AIRBASE.Caucasus.Krymsk ) then 
			
			SochiPerimeterCount			= 0
			MaykopPerimeterCount 		= 0
			GelendzhikPerimeterCount 	= 0			
			NovorossiyskPerimeterCount	= 0	
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Sochi_Adler.." Perimeter Zone"), function ( GroupObject )
				SochiPerimeterCount = SochiPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gelendzhik.." Perimeter Zone"), function ( GroupObject )
				GelendzhikPerimeterCount = GelendzhikPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Novorossiysk.." Perimeter Zone"), function ( GroupObject )
				NovorossiyskPerimeterCount = NovorossiyskPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 and SochiPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Sochi_Adler, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, BetaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() == 1 and GelendzhikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Gelendzhik, BetaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() == 1 and NovorossiyskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Novorossiysk, BetaDestinationAirbase)			
			else			
				SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, BetaDestinationAirbase)			
			end		
		--////		
		elseif ( BetaPrimaryAirbase == AIRBASE.Caucasus.Anapa_Vityazevo ) then
			SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, BetaDestinationAirbase)
		else			
			SEF_REDSQUADRON2_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, BetaDestinationAirbase)
		end
	else
		BetaStatus = BetaPrimaryAirbase.." - Beta Squadron\nAirspace Is Controlled By Russia\n"
		SEF_REDSQUADRON2_SPAWN(BetaPrimaryAirbase, BetaDestinationAirbase)
	end	
end

function SEF_REDSQUADRON2_DEPLOYMENT()
	
	--BETA			
	if ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() == 1 ) then
		--Case 1: Set Beta To Sochi and Patrol Sochi
		BetaPrimaryAirbase = AIRBASE.Caucasus.Sochi_Adler
		BetaDestinationAirbase = AIRBASE.Caucasus.Sochi_Adler
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 ) then
		--Case 2: Set Beta To Maykop and Patrol Sochi
		BetaPrimaryAirbase = AIRBASE.Caucasus.Maykop_Khanskaya
		BetaDestinationAirbase = AIRBASE.Caucasus.Sochi_Adler	
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() == 1 ) then
		--Case 3: Set Beta To Gelendzhik and Patrol Maykop
		BetaPrimaryAirbase = AIRBASE.Caucasus.Gelendzhik
		BetaDestinationAirbase = AIRBASE.Caucasus.Maykop_Khanskaya	
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() == 1 ) then
		--Case 4: Set Beta To Novorossiysk and Patrol Gelendzhik
		BetaPrimaryAirbase = AIRBASE.Caucasus.Novorossiysk
		BetaDestinationAirbase = AIRBASE.Caucasus.Gelendzhik	
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 ) then
		--Case 5: Set Beta To Krymsk and Patrol Novorossiysk
		BetaPrimaryAirbase = AIRBASE.Caucasus.Krymsk
		BetaDestinationAirbase = AIRBASE.Caucasus.Novorossiysk	
	else
		--Case 6: Set Beta To Anapa And Patrol Krymsk
		BetaPrimaryAirbase = AIRBASE.Caucasus.Anapa_Vityazevo
		BetaDestinationAirbase = AIRBASE.Caucasus.Krymsk
	end	
	--END BETA	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON3_INITIALISE()

	-- AIRBASE.Caucasus.Anapa_Vityazevo
	-- AIRBASE.Caucasus.Batumi
	-- AIRBASE.Caucasus.Beslan
	-- AIRBASE.Caucasus.Gelendzhik
	-- AIRBASE.Caucasus.Gudauta
	-- AIRBASE.Caucasus.Kobuleti
	-- AIRBASE.Caucasus.Krasnodar_Center
	-- AIRBASE.Caucasus.Krasnodar_Pashkovsky
	-- AIRBASE.Caucasus.Krymsk
	-- AIRBASE.Caucasus.Kutaisi
	-- AIRBASE.Caucasus.Maykop_Khanskaya
	-- AIRBASE.Caucasus.Mineralnye_Vody
	-- AIRBASE.Caucasus.Mozdok
	-- AIRBASE.Caucasus.Nalchik
	-- AIRBASE.Caucasus.Novorossiysk
	-- AIRBASE.Caucasus.Senaki_Kolkhi
	-- AIRBASE.Caucasus.Sochi_Adler
	-- AIRBASE.Caucasus.Soganlug
	-- AIRBASE.Caucasus.Sukhumi_Babushara
	-- AIRBASE.Caucasus.Tbilisi_Lochini
	-- AIRBASE.Caucasus.Vaziani	
	
	--"CV 1143.5 Admiral Kuznetsov"
	
	
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
		
		--Gamma		Kuznetsov			Gelendzhik				Novorossiysk				Anapa
		
		--////
		if ( GammaPrimaryAirbase == "CV 1143.5 Admiral Kuznetsov" ) then
			
			GelendzhikPerimeterCount = 0
			NovorossiyskPerimeterCount = 0
						
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gelendzhik.." Perimeter Zone"), function ( GroupObject )
				GelendzhikPerimeterCount = GelendzhikPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Novorossiysk.." Perimeter Zone"), function ( GroupObject )
				NovorossiyskPerimeterCount = NovorossiyskPerimeterCount + 1		
				end
			)									

			if ( Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() == 1 and GelendzhikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Gelendzhik, GammaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() == 1 and NovorossiyskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Novorossiysk, GammaDestinationAirbase)																	
			else			
				SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, GammaDestinationAirbase)					
			end			
		--////		
		elseif ( GammaPrimaryAirbase == AIRBASE.Caucasus.Gelendzhik ) then
		
			NovorossiyskPerimeterCount = 0
						
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Novorossiysk.." Perimeter Zone"), function ( GroupObject )
				NovorossiyskPerimeterCount = NovorossiyskPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() == 1 and NovorossiyskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Novorossiysk, GammaDestinationAirbase)																	
			else			
				SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, GammaDestinationAirbase)					
			end
		--////		
		elseif ( GammaPrimaryAirbase == AIRBASE.Caucasus.Novorossiysk ) then
		
			GelendzhikPerimeterCount = 0
						
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Gelendzhik.." Perimeter Zone"), function ( GroupObject )
				GelendzhikPerimeterCount = GelendzhikPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() == 1 and GelendzhikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Gelendzhik, GammaDestinationAirbase)						
			else			
				SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, GammaDestinationAirbase)					
			end				
		--////		
		elseif ( GammaPrimaryAirbase == AIRBASE.Caucasus.Anapa_Vityazevo ) then
			SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, GammaDestinationAirbase)	
		else
			SEF_REDSQUADRON3_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, GammaDestinationAirbase)
		end	
	else
		GammaStatus = GammaPrimaryAirbase.." - Gamma Squadron\nAirspace Is Controlled By Russia\n"
		SEF_REDSQUADRON3_SPAWN(GammaPrimaryAirbase, GammaDestinationAirbase)	
	end	
end

function SEF_REDSQUADRON3_DEPLOYMENT()
	
	-- AIRBASE.Caucasus.Anapa_Vityazevo
	-- AIRBASE.Caucasus.Batumi
	-- AIRBASE.Caucasus.Beslan
	-- AIRBASE.Caucasus.Gelendzhik
	-- AIRBASE.Caucasus.Gudauta
	-- AIRBASE.Caucasus.Kobuleti
	-- AIRBASE.Caucasus.Krasnodar_Center
	-- AIRBASE.Caucasus.Krasnodar_Pashkovsky
	-- AIRBASE.Caucasus.Krymsk
	-- AIRBASE.Caucasus.Kutaisi
	-- AIRBASE.Caucasus.Maykop_Khanskaya
	-- AIRBASE.Caucasus.Mineralnye_Vody
	-- AIRBASE.Caucasus.Mozdok
	-- AIRBASE.Caucasus.Nalchik
	-- AIRBASE.Caucasus.Novorossiysk
	-- AIRBASE.Caucasus.Senaki_Kolkhi
	-- AIRBASE.Caucasus.Sochi_Adler
	-- AIRBASE.Caucasus.Soganlug
	-- AIRBASE.Caucasus.Sukhumi_Babushara
	-- AIRBASE.Caucasus.Tbilisi_Lochini
	-- AIRBASE.Caucasus.Vaziani	
	
	--"CV 1143.5 Admiral Kuznetsov"
	
	--Gamma		Kuznetsov			Gelendzhik				Novorossiysk				Anapa
	
	--GAMMA
	if ( Group.getByName("CV 1143.5 Admiral Kuznetsov") ) then
		GammaPrimaryAirbase = "CV 1143.5 Admiral Kuznetsov"
		GammaDestinationAirbase = "CV 1143.5 Admiral Kuznetsov"
	else
		if ( Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() == 1 ) then
			GammaPrimaryAirbase = AIRBASE.Caucasus.Gelendzhik
			GammaDestinationAirbase = AIRBASE.Caucasus.Gelendzhik
		elseif ( Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() == 1 ) then
			GammaPrimaryAirbase = AIRBASE.Caucasus.Novorossiysk
			GammaDestinationAirbase = AIRBASE.Caucasus.Novorossiysk
		else
			GammaPrimaryAirbase = AIRBASE.Caucasus.Anapa_Vityazevo
			GammaDestinationAirbase = AIRBASE.Caucasus.Novorossiysk
		end	
	end	
	--END GAMMA	
end	

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON4_INITIALISE()

	-- AIRBASE.Caucasus.Anapa_Vityazevo
	-- AIRBASE.Caucasus.Batumi
	-- AIRBASE.Caucasus.Beslan
	-- AIRBASE.Caucasus.Gelendzhik
	-- AIRBASE.Caucasus.Gudauta
	-- AIRBASE.Caucasus.Kobuleti
	-- AIRBASE.Caucasus.Krasnodar_Center
	-- AIRBASE.Caucasus.Krasnodar_Pashkovsky
	-- AIRBASE.Caucasus.Krymsk
	-- AIRBASE.Caucasus.Kutaisi
	-- AIRBASE.Caucasus.Maykop_Khanskaya
	-- AIRBASE.Caucasus.Mineralnye_Vody
	-- AIRBASE.Caucasus.Mozdok
	-- AIRBASE.Caucasus.Nalchik
	-- AIRBASE.Caucasus.Novorossiysk
	-- AIRBASE.Caucasus.Senaki_Kolkhi
	-- AIRBASE.Caucasus.Sochi_Adler
	-- AIRBASE.Caucasus.Soganlug
	-- AIRBASE.Caucasus.Sukhumi_Babushara
	-- AIRBASE.Caucasus.Tbilisi_Lochini
	-- AIRBASE.Caucasus.Vaziani	
	
	
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
		
		--Delta		Nalchik				Mozdok					Mineralnye Vody				Maykop-Khanskaya		Krasnodar			Krymsk			Anapa	
		
		if ( DeltaPrimaryAirbase == AIRBASE.Caucasus.Nalchik ) then

			MozdokPerimeterCount 		= 0
			MineralnyePerimeterCount 	= 0
			MaykopPerimeterCount 		= 0
			KrasnodarPerimeterCount 	= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mozdok, DeltaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krymsk, DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, DeltaDestinationAirbase)				
			end	
		--////
		elseif ( DeltaPrimaryAirbase == AIRBASE.Caucasus.Mozdok ) then
			
			NalchikPerimeterCount 		= 0
			MineralnyePerimeterCount 	= 0
			MaykopPerimeterCount 		= 0
			KrasnodarPerimeterCount 	= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Nalchik.." Perimeter Zone"), function ( GroupObject )
				NalchikPerimeterCount = NalchikPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() == 1 and NalchikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Nalchik, DeltaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krymsk, DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, DeltaDestinationAirbase)				
			end
		--////	
		elseif ( DeltaPrimaryAirbase == AIRBASE.Caucasus.Mineralnye_Vody ) then
			
			NalchikPerimeterCount 		= 0
			MozdokPerimeterCount	 	= 0
			MaykopPerimeterCount 		= 0
			KrasnodarPerimeterCount 	= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Nalchik.." Perimeter Zone"), function ( GroupObject )
				NalchikPerimeterCount = NalchikPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() == 1 and NalchikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Nalchik, DeltaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mozdok, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krymsk, DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, DeltaDestinationAirbase)				
			end
		--////	
		elseif ( DeltaPrimaryAirbase == AIRBASE.Caucasus.Maykop_Khanskaya ) then
			
			NalchikPerimeterCount 		= 0
			MozdokPerimeterCount	 	= 0
			MineralnyePerimeterCount 	= 0
			KrasnodarPerimeterCount 	= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Nalchik.." Perimeter Zone"), function ( GroupObject )
				NalchikPerimeterCount = NalchikPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() == 1 and NalchikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Nalchik, DeltaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mozdok, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krymsk, DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, DeltaDestinationAirbase)				
			end		
		--////	
		elseif ( DeltaPrimaryAirbase == AIRBASE.Caucasus.Krasnodar_Pashkovsky ) then
			
			NalchikPerimeterCount 		= 0
			MozdokPerimeterCount	 	= 0
			MineralnyePerimeterCount 	= 0
			MaykopPerimeterCount 		= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Nalchik.." Perimeter Zone"), function ( GroupObject )
				NalchikPerimeterCount = NalchikPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() == 1 and NalchikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Nalchik, DeltaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mozdok, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krymsk, DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, DeltaDestinationAirbase)				
			end		
		--////	
		elseif ( DeltaPrimaryAirbase == AIRBASE.Caucasus.Krymsk ) then
			
			NalchikPerimeterCount 		= 0
			MozdokPerimeterCount	 	= 0
			MineralnyePerimeterCount 	= 0
			MaykopPerimeterCount 		= 0
			KrasnodarPerimeterCount 	= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Nalchik.." Perimeter Zone"), function ( GroupObject )
				NalchikPerimeterCount = NalchikPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() == 1 and NalchikPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Nalchik, DeltaDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mozdok, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, DeltaDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, DeltaDestinationAirbase)				
			end		
		--////				
		elseif ( DeltaPrimaryAirbase == AIRBASE.Caucasus.Anapa_Vityazevo ) then
			SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, DeltaDestinationAirbase)	
		else
			SEF_REDSQUADRON4_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, DeltaDestinationAirbase)
		end
	else
		DeltaStatus = DeltaPrimaryAirbase.." - Delta Squadron\nAirspace Is Controlled By Russia\n"
		SEF_REDSQUADRON4_SPAWN(DeltaPrimaryAirbase, DeltaDestinationAirbase)	
	end		
end

function SEF_REDSQUADRON4_DEPLOYMENT()
	
	--Delta		Nalchik				Mozdok					Mineralnye Vody				Maykop-Khanskaya		Krasnodar			Krymsk			Anapa
	
	--DELTA
	if ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() == 1 ) then
		--Case 1: Set Delta To Nalchik And Patrol Nalchik
		DeltaPrimaryAirbase = AIRBASE.Caucasus.Nalchik
		DeltaDestinationAirbase = AIRBASE.Caucasus.Nalchik
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 ) then
		--Case 2: Set Delta To Mozdok And Patrol Nalchik
		DeltaPrimaryAirbase = AIRBASE.Caucasus.Mozdok
		DeltaDestinationAirbase = AIRBASE.Caucasus.Nalchik
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 ) then
		--Case 3: Set Delta To Mineralnye And Patrol Mozdok
		DeltaPrimaryAirbase = AIRBASE.Caucasus.Mineralnye_Vody
		DeltaDestinationAirbase = AIRBASE.Caucasus.Mozdok
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 ) then
		--Case 4: Set Delta To Maykop And Patrol Mineralnye
		DeltaPrimaryAirbase = AIRBASE.Caucasus.Maykop_Khanskaya
		DeltaDestinationAirbase = AIRBASE.Caucasus.Mineralnye_Vody
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 ) then
		--Case 5: Set Delta To Krasnodar And Patrol Maykop
		DeltaPrimaryAirbase = AIRBASE.Caucasus.Krasnodar_Pashkovsky
		DeltaDestinationAirbase = AIRBASE.Caucasus.Maykop_Khanskaya
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 ) then
		--Case 6: Set Delta To Krymsk And Patrol Krasnodar
		DeltaPrimaryAirbase = AIRBASE.Caucasus.Krymsk
		DeltaDestinationAirbase = AIRBASE.Caucasus.Krasnodar_Pashkovsky	
	else
		--Case 7: Set Delta To Anapa And Patrol Krymsk
		DeltaPrimaryAirbase = AIRBASE.Caucasus.Anapa_Vityazevo
		DeltaDestinationAirbase = AIRBASE.Caucasus.Krymsk
	end	
	--END DELTA	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON5_INITIALISE()

	--Epsilon		Beslan				Mozdok					Mineralnye Vody				Maykop-Khanskaya		Krasnodar			Krymsk			Anapa
	
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
		
		--Epsilon		Beslan				Mozdok					Mineralnye Vody				Maykop-Khanskaya		Krasnodar			Krymsk			Anapa	
		
		if ( EpsilonPrimaryAirbase == AIRBASE.Caucasus.Beslan ) then

			MozdokPerimeterCount 		= 0
			MineralnyePerimeterCount 	= 0
			MaykopPerimeterCount 		= 0
			KrasnodarPerimeterCount 	= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mozdok, EpsilonDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krymsk, EpsilonDestinationAirbase)			
			else			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, EpsilonDestinationAirbase)				
			end	
		--////
		elseif ( EpsilonPrimaryAirbase == AIRBASE.Caucasus.Mozdok ) then
			
			BeslanPerimeterCount 		= 0
			MineralnyePerimeterCount 	= 0
			MaykopPerimeterCount 		= 0
			KrasnodarPerimeterCount 	= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Beslan.." Perimeter Zone"), function ( GroupObject )
				BeslanPerimeterCount = BeslanPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() == 1 and BeslanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Beslan, EpsilonDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krymsk, EpsilonDestinationAirbase)			
			else			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, EpsilonDestinationAirbase)				
			end
		--////	
		elseif ( EpsilonPrimaryAirbase == AIRBASE.Caucasus.Mineralnye_Vody ) then
			
			BeslanPerimeterCount 		= 0
			MozdokPerimeterCount	 	= 0
			MaykopPerimeterCount 		= 0
			KrasnodarPerimeterCount 	= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Beslan.." Perimeter Zone"), function ( GroupObject )
				BeslanPerimeterCount = BeslanPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() == 1 and BeslanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Beslan, EpsilonDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mozdok, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krymsk, EpsilonDestinationAirbase)			
			else			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, EpsilonDestinationAirbase)				
			end
		--////	
		elseif ( EpsilonPrimaryAirbase == AIRBASE.Caucasus.Maykop_Khanskaya ) then
			
			BeslanPerimeterCount 		= 0
			MozdokPerimeterCount	 	= 0
			MineralnyePerimeterCount 	= 0
			KrasnodarPerimeterCount 	= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Beslan.." Perimeter Zone"), function ( GroupObject )
				BeslanPerimeterCount = BeslanPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() == 1 and BeslanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Beslan, EpsilonDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mozdok, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krymsk, EpsilonDestinationAirbase)			
			else			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, EpsilonDestinationAirbase)				
			end		
		--////	
		elseif ( EpsilonPrimaryAirbase == AIRBASE.Caucasus.Krasnodar_Pashkovsky ) then
			
			BeslanPerimeterCount 		= 0
			MozdokPerimeterCount	 	= 0
			MineralnyePerimeterCount 	= 0
			MaykopPerimeterCount 		= 0
			KrymskPerimeterCount 		= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Beslan.." Perimeter Zone"), function ( GroupObject )
				BeslanPerimeterCount = BeslanPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krymsk.." Perimeter Zone"), function ( GroupObject )
				KrymskPerimeterCount = KrymskPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() == 1 and BeslanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Beslan, EpsilonDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mozdok, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 and KrymskPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krymsk, EpsilonDestinationAirbase)			
			else			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, EpsilonDestinationAirbase)				
			end		
		--////	
		elseif ( EpsilonPrimaryAirbase == AIRBASE.Caucasus.Krymsk ) then
			
			BeslanPerimeterCount 		= 0
			MozdokPerimeterCount	 	= 0
			MineralnyePerimeterCount 	= 0
			MaykopPerimeterCount 		= 0
			KrasnodarPerimeterCount 	= 0	

					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Beslan.." Perimeter Zone"), function ( GroupObject )
				BeslanPerimeterCount = BeslanPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mozdok.." Perimeter Zone"), function ( GroupObject )
				MozdokPerimeterCount = MozdokPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Mineralnye_Vody.." Perimeter Zone"), function ( GroupObject )
				MineralnyePerimeterCount = MineralnyePerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Maykop_Khanskaya.." Perimeter Zone"), function ( GroupObject )
				MaykopPerimeterCount = MaykopPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky.." Perimeter Zone"), function ( GroupObject )
				KrasnodarPerimeterCount = KrasnodarPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() == 1 and BeslanPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Beslan, EpsilonDestinationAirbase)						
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 and MozdokPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mozdok, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 and MineralnyePerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Mineralnye_Vody, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 and MaykopPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Maykop_Khanskaya, EpsilonDestinationAirbase)			
			elseif ( Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 and KrasnodarPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Krasnodar_Pashkovsky, EpsilonDestinationAirbase)			
			else			
				SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, EpsilonDestinationAirbase)				
			end		
		--////				
		elseif ( EpsilonPrimaryAirbase == AIRBASE.Caucasus.Anapa_Vityazevo ) then
			SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, EpsilonDestinationAirbase)	
		else
			SEF_REDSQUADRON5_SPAWN(AIRBASE.Caucasus.Anapa_Vityazevo, EpsilonDestinationAirbase)
		end
	else
		EpsilonStatus = EpsilonPrimaryAirbase.." - Epsilon Squadron\nAirspace Is Controlled By Russia\n"
		SEF_REDSQUADRON5_SPAWN(EpsilonPrimaryAirbase, EpsilonDestinationAirbase)	
	end		
end

function SEF_REDSQUADRON5_DEPLOYMENT()	
	
	--Epsilon		Beslan				Mozdok					Mineralnye Vody				Maykop-Khanskaya		Krasnodar			Krymsk			Anapa
	
	--EPSILON
	if ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() == 1 ) then
		--Case 1: Set Epsilon To Beslan And Patrol Beslan
		EpsilonPrimaryAirbase = AIRBASE.Caucasus.Beslan
		EpsilonDestinationAirbase = AIRBASE.Caucasus.Beslan
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() == 1 ) then
		--Case 2: Set Epsilon To Mozdok And Patrol Beslan
		EpsilonPrimaryAirbase = AIRBASE.Caucasus.Mozdok
		EpsilonDestinationAirbase = AIRBASE.Caucasus.Beslan
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() == 1 ) then
		--Case 3: Set Epsilon To Mineralnye And Patrol Mozdok
		EpsilonPrimaryAirbase = AIRBASE.Caucasus.Mineralnye_Vody
		EpsilonDestinationAirbase = AIRBASE.Caucasus.Mozdok
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() == 1 ) then
		--Case 4: Set Epsilon To Maykop And Patrol Mineralnye
		EpsilonPrimaryAirbase = AIRBASE.Caucasus.Maykop_Khanskaya
		EpsilonDestinationAirbase = AIRBASE.Caucasus.Mineralnye_Vody
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() == 1 ) then
		--Case 5: Set Epsilon To Krasnodar And Patrol Maykop
		EpsilonPrimaryAirbase = AIRBASE.Caucasus.Krasnodar_Pashkovsky
		EpsilonDestinationAirbase = AIRBASE.Caucasus.Maykop_Khanskaya
	elseif ( Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() ~= 1 and Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() == 1 ) then
		--Case 6: Set Epsilon To Krymsk And Patrol Krasnodar
		EpsilonPrimaryAirbase = AIRBASE.Caucasus.Krymsk
		EpsilonDestinationAirbase = AIRBASE.Caucasus.Krasnodar_Pashkovsky	
	else
		--Case 7: Set Epsilon To Anapa And Patrol Krymsk
		EpsilonPrimaryAirbase = AIRBASE.Caucasus.Anapa_Vityazevo
		EpsilonDestinationAirbase = AIRBASE.Caucasus.Krymsk
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
		local SpawnZone = CAPZoneBlueCarrier
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
		
		BLUESQUADRON1 = SPAWN:NewWithAlias("USAF F-14B", BlueSquadronName1)
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
		
		local SpawnZone 		= AIRBASE:FindByName(AIRBASE.Caucasus.Senaki_Kolkhi):GetZone()
		local DestinationZone 	= AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi):GetZone()	
		
		local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
		BS2_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2   = SpawnZone:GetVec2()
		local DestinationZoneVec2 = DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			BS2_WP0X = DepartureZoneVec2.x
			BS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS2_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
			BS2_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			BS2_WP2X = DestinationZoneVec2.x + BluePatrolWaypointDistance
			BS2_WP2Y = DestinationZoneVec2.y 						
			--Perimeter Zone East Point
			BS2_WP3X = DestinationZoneVec2.x
			BS2_WP3Y = DestinationZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone South Point
			BS2_WP4X = DestinationZoneVec2.x - BluePatrolWaypointDistance
			BS2_WP4Y = DestinationZoneVec2.y						
			--Perimeter Zone West Point
			BS2_WP5X = DestinationZoneVec2.x
			BS2_WP5Y = DestinationZoneVec2.y - BluePatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			BS2_WP0X = DepartureZoneVec2.x
			BS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS2_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
			BS2_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			BS2_WP2X = DestinationZoneVec2.x - BluePatrolWaypointDistance
			BS2_WP2Y = DestinationZoneVec2.y 						
			--Perimeter Zone East Point
			BS2_WP3X = DestinationZoneVec2.x
			BS2_WP3Y = DestinationZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone North Point
			BS2_WP4X = DestinationZoneVec2.x + BluePatrolWaypointDistance
			BS2_WP4Y = DestinationZoneVec2.y						
			--Perimeter Zone West Point
			BS2_WP5X = DestinationZoneVec2.x
			BS2_WP5Y = DestinationZoneVec2.y - BluePatrolWaypointDistance					
		end		
		
		BLUESQUADRON2 = SPAWN:NewWithAlias("USAF F-15C", BlueSquadronName2)							
							:InitRandomizeTemplate( USAFAirForceCAP )														
							
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
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				BLUESQUADRON2GROUP:SetTask(Mission)				
			end
		)
		--:SpawnInZone( SpawnZone, false, BS2_FlightLevel, BS2_FlightLevel )
		--:SpawnAtAirbase( AIRBASE:FindByName(AIRBASE.Caucasus.Senaki_Kolkhi), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold
		:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Senaki_Kolkhi), {66,65}, SPAWN.Takeoff.Hot)
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
		
		local SpawnZone = AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini):GetZone()
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
		
		BLUESQUADRON3 = SPAWN:NewWithAlias("USAF F-15C", BlueSquadronName3)							
							:InitRandomizeTemplate( USAFAirForceCAP )														
							
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
		--:SpawnAtAirbase( AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold / AIRBASE.TerminalType.OpenMed AIRBASE.TerminalType.OpenMedOrBig AIRBASE.TerminalType.Shelter AIRBASE.TerminalType.FighterAircraft
		:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), {3,2}, SPAWN.Takeoff.Hot)
		--trigger.action.outText("Blue Squadron 3 Is Launching Fighters", 15)	
	end
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

--[[
ParkingData1 = AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti)
ParkingData2 = AIRBASE:FindByName(AIRBASE.Caucasus.Senaki_Kolkhi)
ParkingData3 = AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi)
ParkingData4 = AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini)

ParkingData1:MarkParkingSpots()
ParkingData2:MarkParkingSpots()
ParkingData3:MarkParkingSpots()
ParkingData4:MarkParkingSpots()
]]--

--:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti), {12,25,24,23}, SPAWN.Takeoff.Hot)

--[[
	-- AIRBASE.Caucasus.Anapa_Vityazevo
	-- AIRBASE.Caucasus.Batumi
	-- AIRBASE.Caucasus.Beslan
	-- AIRBASE.Caucasus.Gelendzhik
	-- AIRBASE.Caucasus.Gudauta
	-- AIRBASE.Caucasus.Kobuleti
	-- AIRBASE.Caucasus.Krasnodar_Center
	-- AIRBASE.Caucasus.Krasnodar_Pashkovsky
	-- AIRBASE.Caucasus.Krymsk
	-- AIRBASE.Caucasus.Kutaisi
	-- AIRBASE.Caucasus.Maykop_Khanskaya
	-- AIRBASE.Caucasus.Mineralnye_Vody
	-- AIRBASE.Caucasus.Mozdok
	-- AIRBASE.Caucasus.Nalchik
	-- AIRBASE.Caucasus.Novorossiysk
	-- AIRBASE.Caucasus.Senaki_Kolkhi
	-- AIRBASE.Caucasus.Sochi_Adler
	-- AIRBASE.Caucasus.Soganlug
	-- AIRBASE.Caucasus.Sukhumi_Babushara
	-- AIRBASE.Caucasus.Tbilisi_Lochini
	-- AIRBASE.Caucasus.Vaziani
]]--

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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
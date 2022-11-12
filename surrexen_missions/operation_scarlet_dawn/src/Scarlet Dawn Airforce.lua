--//////////////////////////////////////////////////////////
-- Name: Operation Scarlet Dawn - Airforce Module
-- Author: Surrexen    ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ
--//////////////////////////////////////////////////////////

--[[
	"Abu al-Duhur"
	"Adana Sakirpasa"
	"Aleppo"
	"Al-Dumayr"
	"Al Qusayr"
	"An Nasiriyah"
	"Bassel Al-Assad"
	"Beirut-Rafic Hariri"
	"Damascus"
	"Eyn Shemer"
	"Gaziantep"
	"H4"
	"Haifa"
	"Hama"
	"Hatay"
	"Incirlik"
	"Jirah"
	"King Hussein Air College"
	"Kiryat Shmona"
	"Khalkhalah"
	"Kuweires"
	"Marj as Sultan North"
	"Marj as Sultan South"
	"Marj Ruhayyil"
	"Megiddo"
	"Mezzeh"
	"Minakh"
	"Naqoura"
	"Palmyra"
	"Qabr as Sitt"
	"Ramat David"
	"Rayak"
	"Rene Mouawad"
	"Rosh Pina"
	"Sayqal"
	"Shayrat"
	"Tabqa"
	"Taftanaz"
	"Tiyas"
	"Tha'lah"
	"Wujah Al Hajar"
	"Akrotiri"
	"Paphos"
	"Larnaca"
	"Kingsfield"
	"Gecitkale"
	"Ercan"
	"Lakatamia"
	"Pinarbashi"
	"Gazipasa"
	"Sanliurfa"
	"Kharab Ishk"
	"Tal Siman"
	"Deir ez-Zor"
	"At Tanf"
	"H3 Northwest"
	"H3"
	"H3 Southwest"
	"Ruwayshid"
]]--

--[[

-- Alpha   - Minakh -> Aleppo -> Kuweires -> Jirah -> Tabqa
-- Beta    - Bassel Al-Assad -> Hama -> Al Qusayr -> Abu al-Duhur -> Tabqa -> Deir ez-Zor	 
-- Gamma   - Rene Mouawad -> Al Qusayr -> Hama -> An Nasiriyah -> Palmyra -> Deir ez-Zor
-- Delta   - Mezzeh -> Khalkhalah -> Al-Dumayr -> An Nasiriyah -> Palmyra -> Deir ez-Zor
-- Epsilon - Tiyas -> Palmyra -> Deir ez-Zor


-- Alpha   - Minakh -> Aleppo -> Kuweires -> Jirah -> Tabqa -> Deir ez-Zor
-- Beta    - Bassel Al-Assad -> Hama -> Al Qusayr -> Abu al-Duhur -> Shayrat -> Tiyas -> Tabqa -> Deir ez-Zor
-- Gamma   - Rene Mouawad -> Al Qusayr -> Shayrat -> Hama -> Tiyas -> Palmyra -> Deir ez-Zor
-- Delta   - Mezzeh -> Khalkhalah -> Al-Dumayr -> An Nasiriyah -> Sayqal -> Tiyas -> Palmyra -> Deir ez-Zor
-- Epsilon - Tiyas -> Palmyra -> Deir ez-Zor

]]--

CAPZoneBlueCarrier1 = ZONE_GROUP:New("CAP Zone Carrier 1", GROUP:FindByName( "CVN-72 Abraham Lincoln" ), 25000)
CAPZoneBlueCarrier2	= ZONE_GROUP:New("CAP Zone Carrier 2", GROUP:FindByName( "CV-59 Forrestal" ), 25000)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////VARIABLES

--Warning: Do Not Put Dashes In The Squadron Names
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

--Warning: Do Not Put Dashes In The Squadron Names
BlueSquadronName1 = "VF103"
BlueSquadronName2 = "VF113"
BlueSquadronName3 = "101st"
BlueSquadronName4 = "VF31"
BlueHeloName	  = "17th Cavalry"

BLUESQUADRON1GROUPNAME = ""
BLUESQUADRON2GROUPNAME = ""
BLUESQUADRON3GROUPNAME = ""
BLUESQUADRON4GROUPNAME = ""
BLUEHELOGROUPNAME	   = ""

BlueSquadronsEnabled = 1
RedSquadronsEnabled = 1

BlueRespawnTimerInitialMin = 300
BlueRespawnTimerInitialMax = 450
RedRespawnTimerInitialMin = 300
RedRespawnTimerInitialMax = 450

BlueRespawnTimerMin = 600
BlueRespawnTimerMax = 1200
RedRespawnTimerMin  = 1800 --1200 --900
RedRespawnTimerMax  = 2700 --1800 --1500

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

AlphaStatus = "Alpha Squadron\nAirspace Is Controlled By Syria\n"
BetaStatus = "Beta Squadron\nAirspace Is Controlled By Syria\n"
GammaStatus = "Gamma Squadron\nAirspace Is Controlled By Syria\n"
DeltaStatus = "Delta Squadron\nAirspace Is Controlled By Syria\n"
EpsilonStatus = "Epsilon Squadron\nAirspace Is Controlled By Syria\n"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////TABLES

USAFAirForceCAP = { 
				  "USAF F-16C", 
				  "USAF F/A-18C", 
				  "USAF F-15C", 
				  }
					 
IncirlikAirForceCAP = { 
					  "USAF F-16C", 
					  "USAF F/A-18C", 
					  "USAF F-15C",
					  "THK F-16C",
					  }					 

USNAirForceCAP = { 
				 "USAF F/A-18C", 
				 "USAF F-14B", 
				 }
				 
ForrestalAirForceCAP = { 
				 "USAF F-14A",				 
				 }				 
					 
THKFAirForceCAP = {
				  "THK F-16C",
				  }

IAFAirForceCAP = { 
				 "IAF F-16C", 
				 "IAF F-15C", 
				 }

RJAFAirForceCAP = { 
				  "RJAF F-16C" 
				  }					 

CombinedBlueCAP  = { 
				   "USAF F-16C", 
				   "USAF F/A-18C", 
				   "USAF F-15C", 
				   "USAF F-14B", 				    
				   }

-- 33% Chance To Get Single Plane Ace
SyAAFAirForceCAP = { 
				   "SyAAF MiG-29A",
				   "SyAAF MiG-21Bis", 
				   "SyAAF MiG-23MLD",
				   "SyAAF MiG-29A",
				   "SyAAF MiG-21Bis", 
				   "SyAAF MiG-23MLD",
				   "SyAAF MiG-25PD",
				   "SyAAF MiG-29A Ace",
				   "SyAAF MiG-21Bis Ace", 
				   "SyAAF MiG-23MLD Ace",
				   "SyAAF MiG-25PD Ace",
				   }

--////F-14A ~7.6% Chance, 33% Chance To Get Single Plane Ace				   
PalmyraCAP = {
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis",
			 "SyAAF MiG-23MLD",
			 "SyAAF MiG-25PD",
			 "IRIAF F-4E", 
			 "IRIAF F-5E-3",			 
			 "IRIAF Mirage F1",
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis",
			 "SyAAF MiG-23MLD",
			 "SyAAF MiG-25PD",
			 "IRIAF F-4E", 
			 "IRIAF F-5E-3",			 
			 "IRIAF Mirage F1",			 
			 "IRIAF F-14A",
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis",
			 "SyAAF MiG-23MLD",
			 "SyAAF MiG-25PD",
			 "IRIAF F-4E", 
			 "IRIAF F-5E-3",			 
			 "IRIAF Mirage F1",
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis",
			 "SyAAF MiG-23MLD",
			 "SyAAF MiG-25PD",
			 "IRIAF F-4E", 
			 "IRIAF F-5E-3",			 
			 "IRIAF Mirage F1",			 
			 "IRIAF F-14A",
			 "SyAAF MiG-29A Ace",
			 "SyAAF MiG-21Bis Ace",
			 "SyAAF MiG-23MLD Ace",
			 "SyAAF MiG-25PD Ace",
			 "IRIAF F-4E Ace", 
			 "IRIAF F-5E-3 Ace",			 
			 "IRIAF Mirage F1 Ace",
			 "SyAAF MiG-29A Ace",
			 "SyAAF MiG-21Bis Ace",
			 "SyAAF MiG-23MLD Ace",
			 "SyAAF MiG-25PD Ace",
			 "IRIAF F-4E Ace", 
			 "IRIAF F-5E-3 Ace",			 
			 "IRIAF Mirage F1 Ace",			 
			 "IRIAF F-14A Ace",
			 }

--////MiG-31 ~5.9% Chance, 33% Chance To Get Single Plane Ace
CoastalCAP = {
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis", 
			 "SyAAF MiG-23MLD",
			 "SyAAF MiG-25PD",
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis", 
			 "SyAAF MiG-23MLD",
			 "SyAAF MiG-25PD",
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",			 
			 "VVS MiG-31",
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis", 
			 "SyAAF MiG-23MLD",	
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis", 
			 "SyAAF MiG-23MLD",	
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",			 
			 "VVS MiG-31",
			 "SyAAF MiG-29A Ace",
			 "SyAAF MiG-21Bis Ace", 
			 "SyAAF MiG-23MLD Ace",
			 "SyAAF MiG-25PD Ace",
			 "VVS MiG-29S Ace",
			 "VVS Su-27 Ace", 
			 "VVS Su-30 Ace", 
			 "VVS Su-33 Ace",
			 "VVS MiG-25PD Ace",
			 "SyAAF MiG-29A Ace",
			 "SyAAF MiG-21Bis Ace", 
			 "SyAAF MiG-23MLD Ace",
			 "SyAAF MiG-25PD Ace",
			 "VVS MiG-29S Ace",
			 "VVS Su-27 Ace", 
			 "VVS Su-30 Ace", 
			 "VVS Su-33 Ace",
			 "VVS MiG-25PD Ace",			 
			 "VVS MiG-31 Ace",			 
			 }
--[[
CoastalCAP = {			  
			 "VVS Su-33",			 			 
			 }			 
]]--

--////F-14A ~9.1% Chance
IRIAFAirForceCAP = { 
				   "IRIAF F-4E", 
				   "IRIAF F-5E-3", 
				   "IRIAF MiG-21Bis", 
				   "IRIAF MiG-29A", 
				   "IRIAF Mirage F1", 
				   "IRIAF F-4E", 
				   "IRIAF F-5E-3", 
				   "IRIAF MiG-21Bis", 
				   "IRIAF MiG-29A", 
				   "IRIAF Mirage F1",
				   "IRIAF F-14A",				   
				   "IRIAF F-4E Ace", 
				   "IRIAF F-5E-3 Ace", 
				   "IRIAF MiG-21Bis Ace", 
				   "IRIAF MiG-29A Ace", 
				   "IRIAF Mirage F1 Ace", 
				   "IRIAF F-4E Ace", 
				   "IRIAF F-5E-3 Ace", 
				   "IRIAF MiG-21Bis Ace", 
				   "IRIAF MiG-29A Ace", 
				   "IRIAF Mirage F1 Ace",
				   "IRIAF F-14A Ace",
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

--////MiG-31 or F-14A ~13.3% Chance
CombinedRedCAP = { 
				 "SyAAF MiG-29A",
				 "SyAAF MiG-21Bis", 
				 "SyAAF MiG-23MLD",
				 "SyAAF MiG-25PD",
				 "IRIAF F-4E", 
				 "IRIAF F-5E-3", 
				 "IRIAF MiG-21Bis", 
				 "IRIAF MiG-29A", 
				 "IRIAF F-14A", 
				 "IRIAF Mirage F1", 
				 "VVS MiG-21Bis", 
				 "VVS MiG-29A", 
				 "VVS MiG-29S", 
				 "VVS MiG-23MLD", 
				 "VVS MiG-25PD", 
				 "VVS MiG-31", 
				 "VVS Su-27", 
				 "VVS Su-30", 
				 "VVS Su-33",				 
				 "SyAAF MiG-29A Ace",
				 "SyAAF MiG-21Bis Ace", 
				 "SyAAF MiG-23MLD Ace",
				 "SyAAF MiG-25PD Ace",
				 "IRIAF F-4E Ace", 
				 "IRIAF F-5E-3 Ace", 
				 "IRIAF MiG-21Bis Ace", 
				 "IRIAF MiG-29A Ace", 
				 "IRIAF F-14A Ace", 
				 "IRIAF Mirage F1 Ace", 
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

BLUESQUADRON4_DATA = {}
BLUESQUADRON4_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON4_DATA[2] = {
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

SYAAFMI24P_DATA = {}
SYAAFMI24P_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
SYAAFMI24P_DATA[2] = {
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

USAFAH64D_DATA = {}
USAFAH64D_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAFAH64D_DATA[2] = {
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
		AirbaseName = "Abu al-Duhur",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Palmyra", "Hama", "Al Qusayr", "Rene Mouawad", "Bassel Al-Assad", "Taftanaz", "Minakh", "Hatay", "Gaziantep", "Tiyas", "Shayrat", "Kharab Ishk", "Tal Siman" },			
}	
SEF_AIRBASEINFORMATION[2] = {				
		AirbaseName = "Adana Sakirpasa",
		Neighbours = { "Incirlik", "Hatay", "Bassel Al-Assad", "Taftanaz", "Minakh", "Aleppo", "Gaziantep" },			
}
SEF_AIRBASEINFORMATION[3] = {				
		AirbaseName = "Aleppo",
		Neighbours = { "Minakh", "Kuweires", "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Hatay", "Bassel Al-Assad", "Hama", "Incirlik", "Adana Sakirpasa", "Al Qusayr", "Gaziantep", "Tiyas", "Shayrat", "Kharab Ishk", "Tal Siman" },		
}
SEF_AIRBASEINFORMATION[4] = {				
		AirbaseName = "Al-Dumayr",
		Neighbours = { "An Nasiriyah", "Palmyra", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Rayak", "Beirut-Rafic Hariri", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr", "Hama", "Kiryat Shmona", "Haifa", "Ramat David", "Megiddo", "King Hussein Air College", "H4", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah", "At Tanf" },
}
SEF_AIRBASEINFORMATION[5] = {				
		AirbaseName = "Al Qusayr",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Taftanaz", "Abu al-Duhur", "Aleppo", "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "An Nasiriyah", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina" },		
}
SEF_AIRBASEINFORMATION[6] = {				
		AirbaseName = "An Nasiriyah",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Rene Mouawad", "Wujah Al Hajar", "King Hussein Air College", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "H4", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah", "At Tanf" },		
}
SEF_AIRBASEINFORMATION[7] = {				
		AirbaseName = "Bassel Al-Assad",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Hatay", "Minakh", "Taftanaz", "Abu al-Duhur", "Hama", "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Rayak", "An Nasiriyah", "Al Qusayr", "Jirah", "Kuweires", "Tiyas", "Shayrat", "Gecitkale", "Kingsfield", "Larnaca" },		
}
SEF_AIRBASEINFORMATION[8] = {				
		AirbaseName = "Beirut-Rafic Hariri",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad", "King Hussein Air College", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah", "Gecitkale", "Kingsfield", "Larnaca" },		
}
SEF_AIRBASEINFORMATION[9] = {				
		AirbaseName = "Damascus",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College", "H4", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah", "At Tanf" },		
}
SEF_AIRBASEINFORMATION[10] = {				
		AirbaseName = "Eyn Shemer",
		Neighbours = { "Haifa", "Ramat David", "Megiddo", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[11] = {				
		AirbaseName = "Haifa",
		Neighbours = { "Eyn Shemer", "Ramat David", "Megiddo", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[12] = {				
		AirbaseName = "Hama",
		Neighbours = { "Al Qusayr", "Hatay", "Taftanaz", "Abu al-Duhur", "Tabqa", "Palmyra", "Wujah Al Hajar", "Rene Mouawad", "Bassel Al-Assad", "Minakh", "Jirah", "Kuweires", "Aleppo", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Tiyas", "Shayrat", "Sayqal" },		
}
SEF_AIRBASEINFORMATION[13] = {				
		AirbaseName = "Hatay",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Minakh", "Aleppo", "Kuweires", "Abu al-Duhur", "Taftanaz", "Bassel Al-Assad", "Jirah", "Hama", "Gaziantep" },		
}
SEF_AIRBASEINFORMATION[14] = {				
		AirbaseName = "Incirlik",
		Neighbours = { "Adana Sakirpasa", "Hatay", "Minakh", "Aleppo", "Taftanaz", "Bassel Al-Assad", "Gaziantep" },		
}
SEF_AIRBASEINFORMATION[15] = {				
		AirbaseName = "Jirah",
		Neighbours = { "Tabqa", "Kuweires", "Abu al-Duhur", "Taftanaz", "Aleppo", "Minakh", "Hama", "Bassel Al-Assad", "Palmyra", "Hatay", "Gaziantep", "Tiyas", "Shayrat", "Kharab Ishk", "Tal Siman" },		
}
SEF_AIRBASEINFORMATION[16] = {				
		AirbaseName = "King Hussein Air College",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "H4", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[17] = {				
		AirbaseName = "Kiryat Shmona",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[18] = {				
		AirbaseName = "Khalkhalah",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "King Hussein Air College", "Kiryat Shmona", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr", "H4", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah", "At Tanf" },		
}
SEF_AIRBASEINFORMATION[19] = {				
		AirbaseName = "Kuweires",
		Neighbours = { "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Aleppo", "Minakh", "Hatay", "Bassel Al-Assad", "Hama", "Palmyra", "Gaziantep", "Tiyas", "Shayrat", "Kharab Ishk", "Tal Siman" },		
}
SEF_AIRBASEINFORMATION[20] = {				
		AirbaseName = "Marj as Sultan North",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College", "H4", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[21] = {				
		AirbaseName = "Marj as Sultan South",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan North", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College", "H4", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[22] = {				
		AirbaseName = "Marj Ruhayyil",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan South", "Marj as Sultan North", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "King Hussein Air College", "H4", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[23] = {				
		AirbaseName = "Megiddo",
		Neighbours = { "Eyn Shemer", "Ramat David", "Haifa", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[24] = {				
		AirbaseName = "Mezzeh",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Damascus", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[25] = {				
		AirbaseName = "Minakh",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Hatay", "Bassel Al-Assad", "Hama", "Incirlik", "Adana Sakirpasa", "Gaziantep", "Kharab Ishk", "Tal Siman" },		
}
SEF_AIRBASEINFORMATION[26] = {				
		AirbaseName = "Palmyra",
		Neighbours = { "Tabqa", "An Nasiriyah", "Al-Dumayr", "Hama", "Abu al-Duhur", "Jirah", "Kuweires", "Al Qusayr", "Tiyas", "Shayrat", "Sayqal", "Deir ez-Zor" },		
}
SEF_AIRBASEINFORMATION[27] = {				
		AirbaseName = "Qabr as Sitt",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Marj as Sultan North", "Mezzeh", "Damascus", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[28] = {				
		AirbaseName = "Ramat David",
		Neighbours = { "Eyn Shemer", "Megiddo", "Haifa", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[29] = {				
		AirbaseName = "Rayak",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad", "King Hussein Air College", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah" },		
}
SEF_AIRBASEINFORMATION[30] = {				
		AirbaseName = "Rene Mouawad",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Taftanaz", "Abu al-Duhur", "Al Qusayr", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "An Nasiriyah", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Gecitkale", "Kingsfield", "Larnaca" },		
}
SEF_AIRBASEINFORMATION[31] = {				
		AirbaseName = "Tabqa",
		Neighbours = { "Palmyra", "Hama", "Abu al-Duhur", "Taftanaz", "Aleppo", "Kuweires", "Jirah", "Minakh", "Gaziantep", "Tiyas", "Kharab Ishk", "Tal Siman", "Deir ez-Zor" },		
}
SEF_AIRBASEINFORMATION[32] = {				
		AirbaseName = "Taftanaz",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Hama", "Al Qusayr", "Rene Mouawad", "Bassel Al-Assad", "Abu al-Duhur", "Minakh", "Hatay", "Gaziantep", "Tiyas", "Shayrat" },		
}
SEF_AIRBASEINFORMATION[33] = {				
		AirbaseName = "Wujah Al Hajar",
		Neighbours = { "Haifa", "Ramat David", "Megiddo", "Beirut-Rafic Hariri", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad", "Tiyas", "Shayrat", "Sayqal", "Rosh Pina", "Naqoura", "Tha'lah", "Gecitkale", "Kingsfield", "Larnaca" },		
}
SEF_AIRBASEINFORMATION[34] = {				
		AirbaseName = "Gaziantep",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Hatay", "Minakh", "Taftanaz", "Abu al-Duhur", "Aleppo", "Kuweires", "Jirah", "Tabqa", "Kharab Ishk", "Tal Siman", "Sanliurfa" },		
}
SEF_AIRBASEINFORMATION[35] = {				
		AirbaseName = "H4",
		Neighbours = { "King Hussein Air College", "Tha'lah", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "Sayqal", "An Nasiriyah", "At Tanf", "H3", "H3 Northwest", "H3 Southwest", "Ruwayshid" },		
}
SEF_AIRBASEINFORMATION[36] = {				
		AirbaseName = "Tiyas",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Taftanaz", "Abu al-Duhur", "Bassel Al-Assad", "Hama", "Rene Mouawad", "Al Qusayr", "Shayrat", "Palmyra", "Wujah Al Hajar", "Rayak", "An Nasiriyah", "Sayqal", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Damascus", "Mezzeh", "Qabr as Sitt", "Marj Ruhayyil", "Khalkhalah", "At Tanf" },		
}
SEF_AIRBASEINFORMATION[37] = {				
		AirbaseName = "Shayrat",
		Neighbours = { "Aleppo", "Kuweires", "Beirut-Rafic Hariri", "Taftanaz", "Abu al-Duhur", "Bassel Al-Assad", "Hama", "Rene Mouawad", "Al Qusayr", "Tiyas", "Palmyra", "Wujah Al Hajar", "Rayak", "An Nasiriyah", "Sayqal", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Damascus", "Mezzeh", "Qabr as Sitt", "Marj Ruhayyil", "Khalkhalah", "At Tanf" },		
}
SEF_AIRBASEINFORMATION[38] = {				
		AirbaseName = "Sayqal",
		Neighbours = { "Hama", "Rene Mouawad", "Al Qusayr", "Shayrat", "Tiyas", "Palmyra", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Rayak", "An Nasiriyah", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Damascus", "Mezzeh", "Qabr as Sitt", "Marj Ruhayyil", "Khalkhalah", "Tha'lah", "King Hussein Air College", "H4", "Rosh Pina", "Kiryat Shmona", "At Tanf" },		
}
SEF_AIRBASEINFORMATION[39] = {				
		AirbaseName = "Rosh Pina",
		Neighbours = { "Rene Mouawad", "Al Qusayr", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Rayak", "An Nasiriyah", "Al-Dumayr", "Sayqal", "Marj as Sultan North", "Marj as Sultan South", "Damascus", "Mezzeh", "Qabr as Sitt", "Marj Ruhayyil", "Khalkhalah", "Tha'lah", "King Hussein Air College", "Haifa", "Kiryat Shmona", "Eyn Shemer", "Megiddo", "Ramat David", "Naqoura" },		
}
SEF_AIRBASEINFORMATION[40] = {				
		AirbaseName = "Naqoura",
		Neighbours = { "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Rayak", "An Nasiriyah", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Damascus", "Mezzeh", "Qabr as Sitt", "Marj Ruhayyil", "Khalkhalah", "Tha'lah", "King Hussein Air College", "Haifa", "Kiryat Shmona", "Eyn Shemer", "Megiddo", "Ramat David", "Rosh Pina" },		
}
SEF_AIRBASEINFORMATION[41] = {				
		AirbaseName = "Tha'lah",
		Neighbours = { "Wujah Al Hajar", "Beirut-Rafic Hariri", "Rayak", "An Nasiriyah", "Al-Dumayr", "Sayqal", "Marj as Sultan North", "Marj as Sultan South", "Damascus", "Mezzeh", "Qabr as Sitt", "Marj Ruhayyil", "Khalkhalah", "King Hussein Air College", "H4", "Haifa", "Kiryat Shmona", "Eyn Shemer", "Megiddo", "Ramat David", "Rosh Pina", "Naqoura" },		
}
SEF_AIRBASEINFORMATION[42] = {				
		AirbaseName = "Gazipasa",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Paphos", "Akrotiri", "Larnaca", "Kingsfield", "Gecitkale", "Lakatamia", "Pinarbashi", "Ercan" },		
}
SEF_AIRBASEINFORMATION[43] = {				
		AirbaseName = "Paphos",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Gazipasa", "Akrotiri", "Larnaca", "Kingsfield", "Gecitkale", "Lakatamia", "Pinarbashi", "Ercan" },		
}
SEF_AIRBASEINFORMATION[44] = {				
		AirbaseName = "Akrotiri",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Gazipasa", "Paphos", "Larnaca", "Kingsfield", "Gecitkale", "Lakatamia", "Pinarbashi", "Ercan", "Bassel Al-Assad", "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri" },		
}
SEF_AIRBASEINFORMATION[45] = {				
		AirbaseName = "Larnaca",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Gazipasa", "Paphos", "Akrotiri", "Kingsfield", "Gecitkale", "Lakatamia", "Pinarbashi", "Ercan", "Bassel Al-Assad", "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri" },		
}
SEF_AIRBASEINFORMATION[46] = {				
		AirbaseName = "Kingsfield",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Gazipasa", "Paphos", "Akrotiri", "Larnaca", "Gecitkale", "Lakatamia", "Pinarbashi", "Ercan" },		
}
SEF_AIRBASEINFORMATION[47] = {				
		AirbaseName = "Gecitkale",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Gazipasa", "Paphos", "Akrotiri", "Larnaca", "Kingsfield", "Lakatamia", "Pinarbashi", "Ercan" },		
}
SEF_AIRBASEINFORMATION[48] = {				
		AirbaseName = "Lakatamia",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Gazipasa", "Paphos", "Akrotiri", "Larnaca", "Kingsfield", "Gecitkale", "Pinarbashi", "Ercan" },		
}
SEF_AIRBASEINFORMATION[49] = {				
		AirbaseName = "Pinarbashi",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Gazipasa", "Paphos", "Akrotiri", "Larnaca", "Kingsfield", "Gecitkale", "Lakatamia", "Ercan" },		
}
SEF_AIRBASEINFORMATION[50] = {				
		AirbaseName = "Ercan",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Gazipasa", "Paphos", "Akrotiri", "Larnaca", "Kingsfield", "Gecitkale", "Lakatamia", "Pinarbashi" },		
}
SEF_AIRBASEINFORMATION[51] = {				
		AirbaseName = "Sanliurfa",
		Neighbours = { "Gaziantep", "Minakh", "Kuweires", "Jirah", "Tabqa", "Kharab Ishk", "Tal Siman" },		
}
SEF_AIRBASEINFORMATION[52] = {				
		AirbaseName = "Kharab Ishk",
		Neighbours = { "Sanliurfa", "Gaziantep", "Minakh", "Aleppo", "Taftanaz", "Abu al-Duhur", "Kuweires", "Jirah", "Tabqa", "Tal Siman" },		
}
SEF_AIRBASEINFORMATION[53] = {				
		AirbaseName = "Tal Siman",
		Neighbours = { "Sanliurfa", "Gaziantep", "Minakh", "Aleppo", "Taftanaz", "Abu al-Duhur", "Kuweires", "Jirah", "Tabqa", "Kharab Ishk", "Deir ez-Zor" },		
}
SEF_AIRBASEINFORMATION[54] = {				
		AirbaseName = "Deir ez-Zor",
		Neighbours = { "Tal Siman", "Tabqa", "Palmyra" },		
}
SEF_AIRBASEINFORMATION[55] = {				
		AirbaseName = "At Tanf",
		Neighbours = { "Palmyra", "Tiyas", "Shayrat", "An Nasiriyah", "Sayqal", "Al-Dumayr", "Damascus", "Khalkhalah", "H4", "H3", "H3 Northwest", "H3 Southwest", "Ruwayshid" },		
}
SEF_AIRBASEINFORMATION[56] = {				
		AirbaseName = "H3 Northwest",
		Neighbours = { "At Tanf", "H3", "H3 Southwest", "H4", "Ruwayshid" },		
}
SEF_AIRBASEINFORMATION[57] = {				
		AirbaseName = "H3",
		Neighbours = { "At Tanf", "H3 Northwest", "H3 Southwest", "H4", "Ruwayshid" },		
}
SEF_AIRBASEINFORMATION[58] = {				
		AirbaseName = "H3 Southwest",
		Neighbours = { "At Tanf", "H3 Northwest", "H3", "H4", "Ruwayshid" },		
}
SEF_AIRBASEINFORMATION[59] = {				
		AirbaseName = "Ruwayshid",
		Neighbours = { "At Tanf", "H3 Northwest", "H3", "H4", "H3 Southwest" },		
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
		
		-- Alpha   - Minakh -> Aleppo -> Kuweires -> Jirah -> Tabqa -> Deir ez-Zor
		
		if ( AlphaPrimaryAirbase == "Minakh" ) then
			
			AleppoPerimeterCount 	= 0
			KuweiresPerimeterCount 	= 0
			JirahPerimeterCount 	= 0
			TabqaPerimeterCount 	= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Aleppo".." Perimeter Zone"), function ( GroupObject )
				AleppoPerimeterCount = AleppoPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Kuweires".." Perimeter Zone"), function ( GroupObject )
				KuweiresPerimeterCount = KuweiresPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Jirah".." Perimeter Zone"), function ( GroupObject )
				JirahPerimeterCount = JirahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Aleppo"):getCoalition() == 1 and AleppoPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Aleppo", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Kuweires"):getCoalition() == 1 and KuweiresPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Kuweires", AlphaDestinationAirbase)						
			elseif ( Airbase.getByName("Jirah"):getCoalition() == 1 and JirahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Jirah", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)			
			else			
				SEF_REDSQUADRON1_SPAWN("Deir ez-Zor", AlphaDestinationAirbase)				
			end		
		elseif ( AlphaPrimaryAirbase == "Aleppo" ) then
		
			MinakhPerimeterCount 	= 0
			KuweiresPerimeterCount 	= 0
			JirahPerimeterCount 	= 0
			TabqaPerimeterCount 	= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Minakh".." Perimeter Zone"), function ( GroupObject )
				MinakhPerimeterCount = MinakhPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Kuweires".." Perimeter Zone"), function ( GroupObject )
				KuweiresPerimeterCount = KuweiresPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Jirah".." Perimeter Zone"), function ( GroupObject )
				JirahPerimeterCount = JirahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Minakh"):getCoalition() == 1 and MinakhPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Minakh", AlphaDestinationAirbase)
			elseif ( Airbase.getByName("Kuweires"):getCoalition() == 1 and KuweiresPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Kuweires", AlphaDestinationAirbase)
			elseif ( Airbase.getByName("Jirah"):getCoalition() == 1 and JirahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Jirah", AlphaDestinationAirbase)
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)
			else			
				SEF_REDSQUADRON1_SPAWN("Deir ez-Zor", AlphaDestinationAirbase)
			end		
		elseif ( AlphaPrimaryAirbase == "Kuweires" ) then
		
			MinakhPerimeterCount = 0
			AleppoPerimeterCount = 0
			JirahPerimeterCount  = 0
			TabqaPerimeterCount  = 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Minakh".." Perimeter Zone"), function ( GroupObject )
				MinakhPerimeterCount = MinakhPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Aleppo".." Perimeter Zone"), function ( GroupObject )
				AleppoPerimeterCount = AleppoPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Jirah".." Perimeter Zone"), function ( GroupObject )
				JirahPerimeterCount = JirahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Minakh"):getCoalition() == 1 and MinakhPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Minakh", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Aleppo"):getCoalition() == 1 and AleppoPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Aleppo", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Jirah"):getCoalition() == 1 and JirahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Jirah", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)
			else			
				SEF_REDSQUADRON1_SPAWN("Deir ez-Zor", AlphaDestinationAirbase)				
			end		
		elseif ( AlphaPrimaryAirbase == "Jirah" ) then
		
			MinakhPerimeterCount 	= 0
			AleppoPerimeterCount 	= 0
			KuweiresPerimeterCount 	= 0
			TabqaPerimeterCount 	= 0

			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Minakh".." Perimeter Zone"), function ( GroupObject )
				MinakhPerimeterCount = MinakhPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Aleppo".." Perimeter Zone"), function ( GroupObject )
				AleppoPerimeterCount = AleppoPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Kuweires".." Perimeter Zone"), function ( GroupObject )
				KuweiresPerimeterCount = KuweiresPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Minakh"):getCoalition() == 1 and MinakhPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Minakh", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Aleppo"):getCoalition() == 1 and AleppoPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Aleppo", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Kuweires"):getCoalition() == 1 and KuweiresPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Kuweires", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)
			else			
				SEF_REDSQUADRON1_SPAWN("Deir ez-Zor", AlphaDestinationAirbase)				
			end		
		
		elseif ( AlphaPrimaryAirbase == "Tabqa" ) then
			
			MinakhPerimeterCount 	= 0
			AleppoPerimeterCount 	= 0
			KuweiresPerimeterCount 	= 0
			JirahPerimeterCount 	= 0

			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Minakh".." Perimeter Zone"), function ( GroupObject )
				MinakhPerimeterCount = MinakhPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Aleppo".." Perimeter Zone"), function ( GroupObject )
				AleppoPerimeterCount = AleppoPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Kuweires".." Perimeter Zone"), function ( GroupObject )
				KuweiresPerimeterCount = KuweiresPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Jirah".." Perimeter Zone"), function ( GroupObject )
				JirahPerimeterCount = JirahPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Minakh"):getCoalition() == 1 and MinakhPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Minakh", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Aleppo"):getCoalition() == 1 and AleppoPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Aleppo", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Kuweires"):getCoalition() == 1 and KuweiresPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Kuweires", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Jirah"):getCoalition() == 1 and JirahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Jirah", AlphaDestinationAirbase)
			else			
				SEF_REDSQUADRON1_SPAWN("Deir ez-Zor", AlphaDestinationAirbase)				
			end		
		
		elseif ( AlphaPrimaryAirbase == "Deir ez-Zor" ) then
			SEF_REDSQUADRON1_SPAWN("Deir ez-Zor", AlphaDestinationAirbase)		
		else			
			SEF_REDSQUADRON1_SPAWN("Deir ez-Zor", AlphaDestinationAirbase)
		end		
	else
		AlphaStatus = AlphaPrimaryAirbase.." - Alpha Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON1_SPAWN(AlphaPrimaryAirbase, AlphaDestinationAirbase)
	end	
end

function SEF_REDSQUADRON1_DEPLOYMENT()	
		
	-- ALPHA   - Minakh -> Aleppo -> Kuweires -> Jirah -> Tabqa -> Deir ez-Zor
	if ( Airbase.getByName("Minakh"):getCoalition() == 1 ) then
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Aleppo"):getCoalition() == 1 ) then
		AlphaPrimaryAirbase = "Aleppo"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Kuweires"):getCoalition() == 1 ) then
		AlphaPrimaryAirbase = "Kuweires"
		AlphaDestinationAirbase = "Aleppo"
	elseif ( Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		AlphaPrimaryAirbase = "Jirah"
		AlphaDestinationAirbase = "Kuweires"
	elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then
		AlphaPrimaryAirbase = "Tabqa"
		AlphaDestinationAirbase = "Jirah"	
	else
		AlphaPrimaryAirbase = "Deir ez-Zor"
		AlphaDestinationAirbase = "Tabqa"
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
		
		REDSQUADRON1 = SPAWN:NewWithAlias("Plane Template", RedSquadronName1)
							:InitRandomizeTemplate(SyAAFAirForceCAP)								
						
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
		
		REDSQUADRON2 = SPAWN:NewWithAlias("Plane Template", RedSquadronName2)
							:InitRandomizeTemplate(CoastalCAP)										
								
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
		if ( DepartureAirbaseName == "Bassel Al-Assad" ) then
			REDSQUADRON2:SpawnAtParkingSpot(AIRBASE:FindByName("Bassel Al-Assad"), {33,32,31,56}, SPAWN.Takeoff.Hot)
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
		
		RS3_SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS3_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = RS3_SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)					
		
		--////Override So We Don't Send The Planes Directly South Of Rene To Begin With As They Can Crash Into Mountains
		if ( DepartureAirbaseName == "Rene Mouawad" ) then			
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
				RS3_WP1X = DepartureZoneVec2.x
				RS3_WP1Y = DepartureZoneVec2.y - RedPatrolWaypointInitial			
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
		else			
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
		end
		
		REDSQUADRON3 = SPAWN:NewWithAlias("Plane Template", RedSquadronName3)
							:InitRandomizeTemplate(CoastalCAP)								
		
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
		if ( DepartureAirbaseName == "Rene Mouawad" ) then
			REDSQUADRON3:SpawnAtParkingSpot(AIRBASE:FindByName("Rene Mouawad"), {10,9,8,4}, SPAWN.Takeoff.Hot)
		else
			REDSQUADRON3:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end		
		--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
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
							:InitRandomizeTemplate(SyAAFAirForceCAP)																
		
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
							:InitRandomizeTemplate(PalmyraCAP)							
								
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
		--:SpawnInZone( SpawnZone, false, RS5_FlightLevel, RS5_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
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
		
	-- Beta    - Bassel Al-Assad -> Hama -> Al Qusayr -> Abu al-Duhur -> Shayrat -> Tiyas -> Tabqa - > Deir ez-Zor
		
	if ( BetaPrimaryPerimeterCount > 0 ) then		
		BetaStatus = BetaPrimaryAirbase.." - Beta Squadron\nAirspace Is Being Contested By The Allies\n"
		
		--////
		if ( BetaPrimaryAirbase == "Bassel Al-Assad" ) then
			
			HamaPerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0
			AbuDuhurPerimeterCount	= 0
			ShayratPerimeterCount 	= 0
			TiyasPerimeterCount		= 0	
			TabqaPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Shayrat", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tiyas", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)	
			else			
				SEF_REDSQUADRON2_SPAWN("Deir ez-Zor", BetaDestinationAirbase)			
			end		
		--////
		elseif ( BetaPrimaryAirbase == "Hama" ) then
		
			BasselPerimeterCount 	= 0
			AlQusayrPerimeterCount 	= 0
			AbuDuhurPerimeterCount 	= 0			
			ShayratPerimeterCount 	= 0
			TiyasPerimeterCount		= 0	
			TabqaPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Shayrat", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tiyas", BetaDestinationAirbase)	
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)	
			else			
				SEF_REDSQUADRON2_SPAWN("Deir ez-Zor", BetaDestinationAirbase)			
			end		
		--////
		elseif ( BetaPrimaryAirbase == "Al Qusayr" ) then
		
			BasselPerimeterCount 	= 0
			HamaPerimeterCount 		= 0
			AbuDuhurPerimeterCount 	= 0			
			ShayratPerimeterCount 	= 0
			TiyasPerimeterCount		= 0	
			TabqaPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Shayrat", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tiyas", BetaDestinationAirbase)	
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)	
			else			
				SEF_REDSQUADRON2_SPAWN("Deir ez-Zor", BetaDestinationAirbase)			
			end			
		--////
		elseif ( BetaPrimaryAirbase == "Abu al-Duhur" ) then
			
			BasselPerimeterCount 	= 0
			HamaPerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0			
			ShayratPerimeterCount 	= 0
			TiyasPerimeterCount		= 0
			TabqaPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Shayrat", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tiyas", BetaDestinationAirbase)	
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)	
			else			
				SEF_REDSQUADRON2_SPAWN("Deir ez-Zor", BetaDestinationAirbase)			
			end			
		--////
		elseif ( BetaPrimaryAirbase == "Shayrat" ) then
			
			BasselPerimeterCount 	= 0
			HamaPerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0			
			AbuDuhurPerimeterCount 	= 0
			TiyasPerimeterCount		= 0
			TabqaPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tiyas", BetaDestinationAirbase)	
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)	
			else			
				SEF_REDSQUADRON2_SPAWN("Deir ez-Zor", BetaDestinationAirbase)			
			end			
		--////
		elseif ( BetaPrimaryAirbase == "Tiyas" ) then
			
			BasselPerimeterCount 	= 0
			HamaPerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0			
			AbuDuhurPerimeterCount 	= 0
			ShayratPerimeterCount	= 0
			TabqaPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tabqa".." Perimeter Zone"), function ( GroupObject )
				TabqaPerimeterCount = TabqaPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Shayrat", BetaDestinationAirbase)	
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 and TabqaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)	
			else			
				SEF_REDSQUADRON2_SPAWN("Deir ez-Zor", BetaDestinationAirbase)			
			end	
		--////		
		elseif ( BetaPrimaryAirbase == "Tabqa" ) then			
			
			BasselPerimeterCount 	= 0
			HamaPerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0			
			AbuDuhurPerimeterCount 	= 0
			ShayratPerimeterCount	= 0
			TiyasPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Shayrat", BetaDestinationAirbase)	
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Tiyas", BetaDestinationAirbase)	
			else			
				SEF_REDSQUADRON2_SPAWN("Deir ez-Zor", BetaDestinationAirbase)			
			end		
		else			
			SEF_REDSQUADRON2_SPAWN("Deir ez-Zor", BetaDestinationAirbase)
		end		
	else
		BetaStatus = BetaPrimaryAirbase.." - Beta Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON2_SPAWN(BetaPrimaryAirbase, BetaDestinationAirbase)
	end	
end

function SEF_REDSQUADRON2_DEPLOYMENT()
	
	-- Bassel Al-Assad -> Hama -> Al Qusayr -> Abu al-Duhur -> Shayrat -> Tiyas -> Tabqa -> Deir ez-Zor
	
	--BETA
	if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Hama"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Hama"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Al Qusayr"
		BetaDestinationAirbase = "Hama"
	elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Abu al-Duhur"
		BetaDestinationAirbase = "Al Qusayr"	
	elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Shayrat"
		BetaDestinationAirbase = "Abu al-Duhur"
	elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Tiyas"
		BetaDestinationAirbase = "Shayrat"
	elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then
		BetaPrimaryAirbase = "Tabqa"
		BetaDestinationAirbase = "Tiyas"	
	else		
		BetaPrimaryAirbase = "Deir ez-Zor"
		BetaDestinationAirbase = "Tabqa"
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
		
		-- Gamma - Rene Mouawad -> Al Qusayr -> Shayrat -> Hama -> Tiyas -> Palmyra -> Deir ez-Zor
		
		--////
		if ( GammaPrimaryAirbase == "Rene Mouawad" ) then
			
			AlQusayrPerimeterCount 	= 0
			ShayratPerimeterCount	= 0
			HamaPerimeterCount 		= 0
			TiyasPerimeterCount 	= 0						
			PalmyraPerimeterCount	= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Al Qusayr", GammaDestinationAirbase)			
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Shayrat", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Hama", GammaDestinationAirbase)				
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Tiyas", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)	
			else			
				SEF_REDSQUADRON3_SPAWN("Deir ez-Zor", GammaDestinationAirbase)					
			end			
		--////		
		elseif ( GammaPrimaryAirbase == "Al Qusayr" ) then
		
			RenePerimeterCount 		= 0
			ShayratPerimeterCount	= 0
			HamaPerimeterCount 		= 0
			TiyasPerimeterCount 	= 0
			PalmyraPerimeterCount	= 0
						
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rene Mouawad".." Perimeter Zone"), function ( GroupObject )
				RenePerimeterCount = RenePerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and RenePerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rene Mouawad", GammaDestinationAirbase)									
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Shayrat", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Hama", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Tiyas", GammaDestinationAirbase)						
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)	
			else			
				SEF_REDSQUADRON3_SPAWN("Deir ez-Zor", GammaDestinationAirbase)					
			end			
		--////		
		elseif ( GammaPrimaryAirbase == "Shayrat" ) then
		
			RenePerimeterCount 		= 0
			AlQusayrPerimeterCount	= 0
			HamaPerimeterCount 		= 0
			TiyasPerimeterCount 	= 0
			PalmyraPerimeterCount	= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rene Mouawad".." Perimeter Zone"), function ( GroupObject )
				RenePerimeterCount = RenePerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and RenePerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rene Mouawad", GammaDestinationAirbase)									
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Al Qusayr", GammaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Hama", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Tiyas", GammaDestinationAirbase)						
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)	
			else			
				SEF_REDSQUADRON3_SPAWN("Deir ez-Zor", GammaDestinationAirbase)					
			end
		--////		
		elseif ( GammaPrimaryAirbase == "Hama" ) then
		
			RenePerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0
			ShayratPerimeterCount	= 0
			TiyasPerimeterCount 	= 0
			PalmyraPerimeterCount	= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rene Mouawad".." Perimeter Zone"), function ( GroupObject )
				RenePerimeterCount = RenePerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and RenePerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rene Mouawad", GammaDestinationAirbase)									
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Al Qusayr", GammaDestinationAirbase)			
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Shayrat", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Tiyas", GammaDestinationAirbase)						
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)	
			else			
				SEF_REDSQUADRON3_SPAWN("Deir ez-Zor", GammaDestinationAirbase)					
			end		
		--////
		elseif ( GammaPrimaryAirbase == "Tiyas" ) then
			
			RenePerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0
			ShayratPerimeterCount	= 0
			HamaPerimeterCount 		= 0
			PalmyraPerimeterCount	= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rene Mouawad".." Perimeter Zone"), function ( GroupObject )
				RenePerimeterCount = RenePerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and RenePerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rene Mouawad", GammaDestinationAirbase)									
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Al Qusayr", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Shayrat", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Hama", GammaDestinationAirbase)										
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)	
			else			
				SEF_REDSQUADRON3_SPAWN("Deir ez-Zor", GammaDestinationAirbase)					
			end		
		--////		
		elseif ( GammaPrimaryAirbase == "Palmyra" ) then
			
			RenePerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0
			ShayratPerimeterCount	= 0
			HamaPerimeterCount 		= 0
			TiyasPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rene Mouawad".." Perimeter Zone"), function ( GroupObject )
				RenePerimeterCount = RenePerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Shayrat".." Perimeter Zone"), function ( GroupObject )
				ShayratPerimeterCount = ShayratPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and RenePerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rene Mouawad", GammaDestinationAirbase)									
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Al Qusayr", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 and ShayratPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Shayrat", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Hama", GammaDestinationAirbase)										
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Tiyas", GammaDestinationAirbase)	
			else			
				SEF_REDSQUADRON3_SPAWN("Deir ez-Zor", GammaDestinationAirbase)					
			end		
		--////
		elseif ( GammaPrimaryAirbase == "Deir ez-Zor" ) then
			SEF_REDSQUADRON3_SPAWN("Deir ez-Zor", GammaDestinationAirbase)
		
		else
			SEF_REDSQUADRON3_SPAWN("Deir ez-Zor", GammaDestinationAirbase)
		end	
	else
		GammaStatus = GammaPrimaryAirbase.." - Gamma Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON3_SPAWN(GammaPrimaryAirbase, GammaDestinationAirbase)	
	end	
end

function SEF_REDSQUADRON3_DEPLOYMENT()
	
	-- GAMMA - Rene Mouawad -> Al Qusayr -> Shayrat -> Hama -> Tiyas -> Palmyra -> Deir ez-Zor
	if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Al Qusayr"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Shayrat"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Shayrat"
		GammaDestinationAirbase = "Al Qusayr"
	elseif ( Airbase.getByName("Hama"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Hama"
		GammaDestinationAirbase = "Shayrat"
	elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Tiyas"
		GammaDestinationAirbase = "Hama"
	elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 ) then
		GammaPrimaryAirbase = "Palmyra"
		GammaDestinationAirbase = "Tiyas"	
	else
		GammaPrimaryAirbase = "Deir ez-Zor"
		GammaDestinationAirbase = "Palmyra"	
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
		
		-- DELTA   - Mezzeh -> Khalkhalah -> Al-Dumayr -> An Nasiriyah -> Sayqal -> Tiyas -> Palmyra -> Deir ez-Zor
		
		if ( DeltaPrimaryAirbase == "Mezzeh" ) then

			KhalkhalahPerimeterCount 	= 0
			AlDumayrPerimeterCount 		= 0
			AnNasiriyahPerimeterCount 	= 0
			SayqalPerimeterCount		= 0
			TiyasPerimeterCount			= 0
			PalmyraPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Sayqal".." Perimeter Zone"), function ( GroupObject )
				SayqalPerimeterCount = SayqalPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("Sayqal"):getCoalition() == 1 and SayqalPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Sayqal", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Tiyas", DeltaDestinationAirbase)					
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)				
			end	
		--////
		elseif ( DeltaPrimaryAirbase == "Khalkhalah" ) then
			
			MezzehPerimeterCount 		= 0
			AlDumayrPerimeterCount 		= 0
			AnNasiriyahPerimeterCount 	= 0
			SayqalPerimeterCount		= 0
			TiyasPerimeterCount			= 0
			PalmyraPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Sayqal".." Perimeter Zone"), function ( GroupObject )
				SayqalPerimeterCount = SayqalPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Sayqal"):getCoalition() == 1 and SayqalPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Sayqal", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Tiyas", DeltaDestinationAirbase)	
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)				
			end
		--////	
		elseif ( DeltaPrimaryAirbase == "Al-Dumayr" ) then
			
			MezzehPerimeterCount 		= 0
			KhalkhalahPerimeterCount 	= 0
			AnNasiriyahPerimeterCount 	= 0			
			SayqalPerimeterCount		= 0
			TiyasPerimeterCount			= 0
			PalmyraPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Sayqal".." Perimeter Zone"), function ( GroupObject )
				SayqalPerimeterCount = SayqalPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Sayqal"):getCoalition() == 1 and SayqalPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Sayqal", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Tiyas", DeltaDestinationAirbase)	
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)				
			end
		--////	
		elseif ( DeltaPrimaryAirbase == "An Nasiriyah" ) then
			
			MezzehPerimeterCount 		= 0
			KhalkhalahPerimeterCount 	= 0
			AlDumayrPerimeterCount	 	= 0
			SayqalPerimeterCount		= 0
			TiyasPerimeterCount			= 0
			PalmyraPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Sayqal".." Perimeter Zone"), function ( GroupObject )
				SayqalPerimeterCount = SayqalPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Sayqal"):getCoalition() == 1 and SayqalPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Sayqal", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Tiyas", DeltaDestinationAirbase)	
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)				
			end		
		--////	
		elseif ( DeltaPrimaryAirbase == "Sayqal" ) then
			
			MezzehPerimeterCount 		= 0
			KhalkhalahPerimeterCount 	= 0
			AlDumayrPerimeterCount	 	= 0
			AnNasiriyahPerimeterCount	= 0
			TiyasPerimeterCount			= 0
			PalmyraPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Tiyas", DeltaDestinationAirbase)	
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)				
			end
		--////	
		elseif ( DeltaPrimaryAirbase == "Tiyas" ) then
			
			MezzehPerimeterCount 		= 0
			KhalkhalahPerimeterCount 	= 0
			AlDumayrPerimeterCount	 	= 0
			AnNasiriyahPerimeterCount	= 0
			SayqalPerimeterCount		= 0
			PalmyraPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Sayqal".." Perimeter Zone"), function ( GroupObject )
				SayqalPerimeterCount = SayqalPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Sayqal"):getCoalition() == 1 and SayqalPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Sayqal", DeltaDestinationAirbase)	
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)				
			end
		--////				
		elseif ( DeltaPrimaryAirbase == "Palmyra" ) then
			
			MezzehPerimeterCount 		= 0
			KhalkhalahPerimeterCount 	= 0
			AlDumayrPerimeterCount	 	= 0
			AnNasiriyahPerimeterCount	= 0
			SayqalPerimeterCount		= 0
			TiyasPerimeterCount			= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Sayqal".." Perimeter Zone"), function ( GroupObject )
				SayqalPerimeterCount = SayqalPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)
			elseif ( Airbase.getByName("Sayqal"):getCoalition() == 1 and SayqalPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Sayqal", DeltaDestinationAirbase)	
			elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Tiyas", DeltaDestinationAirbase)			
			else			
				SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)				
			end
		--////	
		elseif ( DeltaPrimaryAirbase == "Deir ez-Zor" ) then
			SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)		
		else
			SEF_REDSQUADRON4_SPAWN("Deir ez-Zor", DeltaDestinationAirbase)
		end
	else
		DeltaStatus = DeltaPrimaryAirbase.." - Delta Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON4_SPAWN(DeltaPrimaryAirbase, DeltaDestinationAirbase)	
	end		
end

function SEF_REDSQUADRON4_DEPLOYMENT()
	
	-- DELTA   - Mezzeh -> Khalkhalah -> Al-Dumayr -> An Nasiriyah -> Sayqal -> Tiyas -> Palmyra -> Deir ez-Zor
	if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 ) then
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 ) then
		DeltaPrimaryAirbase = "Khalkhalah"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 ) then
		DeltaPrimaryAirbase = "Al-Dumayr"
		DeltaDestinationAirbase = "Khalkhalah"
	elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		DeltaPrimaryAirbase = "An Nasiriyah"
		DeltaDestinationAirbase = "Al-Dumayr"
	elseif ( Airbase.getByName("Sayqal"):getCoalition() == 1 ) then
		DeltaPrimaryAirbase = "Sayqal"
		DeltaDestinationAirbase = "An Nasiriyah"
	elseif ( Airbase.getByName("Tiyas"):getCoalition() == 1 ) then
		DeltaPrimaryAirbase = "Tiyas"
		DeltaDestinationAirbase = "Sayqal"
	elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 ) then
		DeltaPrimaryAirbase = "Palmyra"
		DeltaDestinationAirbase = "Tiyas"		
	else
		DeltaPrimaryAirbase = "Deir ez-Zor"
		DeltaDestinationAirbase = "Palmyra"
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
		
		--EPSILON - Tiyas -> Palmyra -> Deir ez-Zor
		
		if ( EpsilonPrimaryAirbase == "Tiyas" ) then

			PalmyraPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Palmyra", EpsilonDestinationAirbase)												
			else			
				SEF_REDSQUADRON5_SPAWN("Deir ez-Zor", EpsilonDestinationAirbase)				
			end
		--////
		elseif ( EpsilonPrimaryAirbase == "Palmyra" ) then

			TiyasPerimeterCount		= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Tiyas", EpsilonDestinationAirbase)												
			else			
				SEF_REDSQUADRON5_SPAWN("Deir ez-Zor", EpsilonDestinationAirbase)				
			end
		--////
		elseif ( EpsilonPrimaryAirbase == "Deir ez-Zor" ) then

			TiyasPerimeterCount		= 0
			PalmyraPerimeterCount 	= 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Tiyas".." Perimeter Zone"), function ( GroupObject )
				TiyasPerimeterCount = TiyasPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Palmyra".." Perimeter Zone"), function ( GroupObject )
				PalmyraPerimeterCount = PalmyraPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Tiyas"):getCoalition() == 1 and TiyasPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Tiyas", EpsilonDestinationAirbase)
			elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 and PalmyraPerimeterCount == 0 ) then			
				SEF_REDSQUADRON5_SPAWN("Palmyra", EpsilonDestinationAirbase)	
			else			
				SEF_REDSQUADRON5_SPAWN("Deir ez-Zor", EpsilonDestinationAirbase)				
			end
		--////
		else
			SEF_REDSQUADRON5_SPAWN("Deir ez-Zor", EpsilonDestinationAirbase)	
		end		
	else
		EpsilonStatus = EpsilonPrimaryAirbase.." - Epsilon Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON5_SPAWN(EpsilonPrimaryAirbase, EpsilonDestinationAirbase)
	end		
end

function SEF_REDSQUADRON5_DEPLOYMENT()	
	
	--EPSILON	
	if ( Airbase.getByName("Tiyas"):getCoalition() == 1 ) then		
		EpsilonPrimaryAirbase = "Tiyas"
		EpsilonDestinationAirbase = "Tiyas"
	elseif ( Airbase.getByName("Palmyra"):getCoalition() == 1 ) then		
		EpsilonPrimaryAirbase = "Palmyra"
		EpsilonDestinationAirbase = "Tiyas"
	else	
		EpsilonPrimaryAirbase = "Deir ez-Zor"
		EpsilonDestinationAirbase = "Palmyra"
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

function SEF_BLUESQUADRON4_SCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUESQUADRON4GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON4GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))			
		else
			SEF_BLUESQUADRON4_SPAWN()
			
			timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))		
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
		
		BLUESQUADRON1 = SPAWN:NewWithAlias("Plane Template", BlueSquadronName1):InitRandomizeTemplate( USNAirForceCAP )							
											
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
		
		local SpawnZone = AIRBASE:FindByName("Incirlik"):GetZone()
		--local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
		BS2_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		--local TargetZoneVec2 	= DestinationZone:GetVec2()
					
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
			BS2_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			BS2_WP2Y = DepartureZoneVec2.y 						
			--Perimeter Zone East Point
			BS2_WP3X = DepartureZoneVec2.x
			BS2_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone South Point
			BS2_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			BS2_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			BS2_WP5X = DepartureZoneVec2.x
			BS2_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			BS2_WP0X = DepartureZoneVec2.x
			BS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS2_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
			BS2_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			BS2_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			BS2_WP2Y = DepartureZoneVec2.y 						
			--Perimeter Zone East Point
			BS2_WP3X = DepartureZoneVec2.x
			BS2_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone North Point
			BS2_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			BS2_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			BS2_WP5X = DepartureZoneVec2.x
			BS2_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance					
		end		
		
		BLUESQUADRON2 = SPAWN:NewWithAlias("Plane Template", BlueSquadronName2):InitRandomizeTemplate( IncirlikAirForceCAP )														
							
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
		--:SpawnAtAirbase( AIRBASE:FindByName("Incirlik"), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold
		:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {57,58}, SPAWN.Takeoff.Hot)
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
		
		local SpawnZone = AIRBASE:FindByName("Ramat David"):GetZone()
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
		
		BLUESQUADRON3 = SPAWN:NewWithAlias("Plane Template", BlueSquadronName3):InitRandomizeTemplate( IAFAirForceCAP )	
		
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
		:SpawnAtAirbase( AIRBASE:FindByName( "Ramat David" ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold / AIRBASE.TerminalType.OpenMed AIRBASE.TerminalType.OpenMedOrBig AIRBASE.TerminalType.Shelter AIRBASE.TerminalType.FighterAircraft
		--trigger.action.outText("Blue Squadron 3 Is Launching Fighters", 15)	
	end
end

function SEF_BLUESQUADRON4_SPAWN()
	
	if ( GROUP:FindByName(BLUESQUADRON4GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON4GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Blue Squadron 4 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		BLUESQUADRON4_DATA[1].Vec2 = nil
		BLUESQUADRON4_DATA[1].TimeStamp = nil
		BLUESQUADRON4_DATA[2].Vec2 = nil
		BLUESQUADRON4_DATA[2].TimeStamp = nil
		
		--local SpawnZone = AIRBASE:FindByName("CV-59 Forrestal"):GetZone()
		local SpawnZone = CAPZoneBlueCarrier2
		--local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
		BS4_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		--local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			BS4_WP0X = DepartureZoneVec2.x
			BS4_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS4_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
			BS4_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			BS4_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			BS4_WP2Y = DepartureZoneVec2.y 						
			--Perimeter Zone East Point
			BS4_WP3X = DepartureZoneVec2.x
			BS4_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone South Point
			BS4_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			BS4_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			BS4_WP5X = DepartureZoneVec2.x
			BS4_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			BS4_WP0X = DepartureZoneVec2.x
			BS4_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			BS4_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
			BS4_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			BS4_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance
			BS4_WP2Y = DepartureZoneVec2.y 						
			--Perimeter Zone East Point
			BS4_WP3X = DepartureZoneVec2.x
			BS4_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance						
			--Perimeter Zone North Point
			BS4_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
			BS4_WP4Y = DepartureZoneVec2.y						
			--Perimeter Zone West Point
			BS4_WP5X = DepartureZoneVec2.x
			BS4_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance					
		end		
		
		BLUESQUADRON4 = SPAWN:NewWithAlias("Plane Template", BlueSquadronName4):InitRandomizeTemplate( ForrestalAirForceCAP )							
											
		:OnSpawnGroup(
			function( SpawnGroup )						
				BLUESQUADRON4GROUPNAME = SpawnGroup.GroupName
				BLUESQUADRON4GROUPID = Group.getByName(BLUESQUADRON4GROUPNAME):getID()
				BLUESQUADRON4GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
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
									["alt"] = BS4_FlightLevel/2,
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
									["y"] = BS4_WP0Y,
									["x"] = BS4_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = BS4_FlightLevel,
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
									["y"] = BS4_WP1Y,
									["x"] = BS4_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = BS4_FlightLevel,
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
									["y"] = BS4_WP2Y,
									["x"] = BS4_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = BS4_FlightLevel,
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
									["y"] = BS4_WP3Y,
									["x"] = BS4_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = BS4_FlightLevel,
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
									["y"] = BS4_WP4Y,
									["x"] = BS4_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = BS4_FlightLevel,
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
									["y"] = BS4_WP5Y,
									["x"] = BS4_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				BLUESQUADRON4GROUP:SetTask(Mission)				
			end
		)
		--:SpawnInZone( SpawnZone, false, BS4_FlightLevel, BS4_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( "CV-59 Forrestal" ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold
		--trigger.action.outText("Blue Squadron 4 Is Launching Fighters", 15)	
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
	
	local FlightSelection 	= math.random(1,100)
	local FlightDirection 	= math.random(1,100)
	local Randomiser 		= math.random(0,5)
	
	if (FlightSelection <=50 and Airbase.getByName("London"):getCoalition() == 2) then
		
		DepartureAirbaseName = "London"		
		BlueHelo_DepartureZone 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone()
					
		if ( FlightDirection <= 50 ) then
			--Clockwise
		
			BlueHelo_WP1ZoneVec2 	= ZONE:FindByName("Kumlu"):GetVec2()
			BlueHelo_WP2ZoneVec2 	= ZONE:FindByName("Iskenderun"):GetVec2()
			BlueHelo_WP3ZoneVec2 	= ZONE:FindByName("Isikli"):GetVec2()
			BlueHelo_WP4ZoneVec2 	= ZONE:FindByName("Samandag"):GetVec2()
			BlueHelo_WP5ZoneVec2 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone():GetVec2()		
		else
			--Anticlockwise
			BlueHelo_WP1ZoneVec2 	= ZONE:FindByName("Samandag"):GetVec2()
			BlueHelo_WP2ZoneVec2 	= ZONE:FindByName("Isikli"):GetVec2()
			BlueHelo_WP3ZoneVec2 	= ZONE:FindByName("Iskenderun"):GetVec2()
			BlueHelo_WP4ZoneVec2 	= ZONE:FindByName("Kumlu"):GetVec2()
			BlueHelo_WP5ZoneVec2 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone():GetVec2()			
		end
		
	elseif (FlightSelection > 50 and Airbase.getByName("Paris"):getCoalition() == 2) then	
		
		DepartureAirbaseName = "Paris"		
		BlueHelo_DepartureZone 	= AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		
		if ( FlightDirection <= 50 ) then
			--Clockwise
		
			BlueHelo_WP1ZoneVec2 	= ZONE:FindByName("Capernaum"):GetVec2()
			BlueHelo_WP2ZoneVec2 	= ZONE:FindByName("Kanaf"):GetVec2()
			BlueHelo_WP3ZoneVec2 	= ZONE:FindByName("Meitsar"):GetVec2()
			BlueHelo_WP4ZoneVec2 	= ZONE:FindByName("Ashdot Ya'akov Ihud"):GetVec2()
			BlueHelo_WP5ZoneVec2 	= AIRBASE:FindByName("Paris"):GetZone():GetVec2()			
		else	
			BlueHelo_WP1ZoneVec2 	= ZONE:FindByName("Ashdot Ya'akov Ihud"):GetVec2()
			BlueHelo_WP2ZoneVec2 	= ZONE:FindByName("Meitsar"):GetVec2()
			BlueHelo_WP3ZoneVec2 	= ZONE:FindByName("Kanaf"):GetVec2()
			BlueHelo_WP4ZoneVec2 	= ZONE:FindByName("Capernaum"):GetVec2()
			BlueHelo_WP5ZoneVec2 	= AIRBASE:FindByName("Paris"):GetZone():GetVec2()
		end
		
	else
		--Do nothing we've lost the FARPS?
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
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
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
	
	REDHELO = SPAWN:NewWithAlias("Helicopter Template", RedHeloName):InitRandomizeTemplate( { "SyAAF Mi-24P" } )	
	
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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------					
--////MAIN

--[[
ParkingData1 = AIRBASE:FindByName("Incirlik")
ParkingData2 = AIRBASE:FindByName("Ramat David")

ParkingData1:MarkParkingSpots()
ParkingData2:MarkParkingSpots()
]]--

--ParkingData1 = AIRBASE:FindByName("Incirlik")
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
timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))

--////RED HELO INITIALISE
timer.scheduleFunction(SEF_RED_HELOSCHEDULER, nil, timer.getTime() + math.random(300,900))

--////BLUE HELO INITIALISE
timer.scheduleFunction(SEF_BLUE_HELOSCHEDULER, nil, timer.getTime() + math.random(300,900))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
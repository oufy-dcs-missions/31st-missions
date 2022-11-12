--////////////////////////////////////////////////////////////////
-- Name: Operation Sea Slug - Mission Logic Module
-- Author: Surrexen    ༼ づ ಠ_ಠ ༽づ Summon Eurofighter ༼ つ ◕_◕ ༽つ 
--////////////////////////////////////////////////////////////////

--////VARIABLES

USAEFCAPGROUPNAME 		= ""
USAEFSEADGROUPNAME 		= ""
USAEFCASGROUPNAME 		= ""
USAEFASSGROUPNAME 		= ""
USAEFPINGROUPNAME 		= ""
USAEFDRONEGROUPNAME 	= ""
USAFAWACSGROUPNAME 		= ""
USAFHAWKEYEGROUPNAME 	= ""
TEXACOGROUPNAME 		= ""
SHELLGROUPNAME	 		= ""
ARCOGROUPNAME 			= ""

TomahawkMissilesAvailable 	= 0
TomahawkCooldown			= 1800

ScudTargets = {
	"Andersen Munitions Storage Area",
	"Guam National Guard Base",
	"Guam EWR",
	"Air Force Barrigada",
	"US Naval Hospital",
	"Navy Fuel Storage",
	"Polaris Point Submarine Base",
	"Naval Magazine",
	"Northwest Field THAAD"	
}

function SEF_VictoryAchieved()	
	
	timer.scheduleFunction(SEF_DeleteCampaignProgress, nil, timer.getTime() + 59)
	
	--VICTORY -- SET FLAG FOR MISSION EDITOR TRIGGER RESTART
	trigger.action.setUserFlag(1337,1)
	trigger.action.outText("Operation Sea Slug - Mission Will Restart In 1 Minute", 60)
end

function SEF_DeleteCampaignProgress()
	
	--WRITE PROGRESS TABLES TO EMPTY AND SAVE WITH NO ARGUMENTS
	SeaSlugUnitInterment 				= {}
	SeaSlugStaticInterment 				= {}
	SeaSlugAirbases 					= {}
	SeaSlugConstructions 				= {}
	
	SEF_SaveUnitIntermentTableNoArgs()	
	SEF_SaveStaticIntermentTableNoArgs()	
	SEF_SaveAirbasesTableNoArgs()	
	SEF_SaveConstructedItemsTableNoArgs()
end

--////MISSION LOGIC FUNCTIONS
function SEF_MissionSelector()	
	
	if ( NumberOfCompletedMissions >= TotalScenarios ) then
			
		OperationComplete = true
		trigger.action.outText("Operation Sea Slug - Operation Has Been Successful - Annihilation Victory Achieved", 60)
		SEF_VictoryAchieved()		
	else
		Randomiser = math.random(1,TotalScenarios)
		if ( trigger.misc.getUserFlag(Randomiser) > 0 ) then
			--SELECTED MISSION [Randomiser] ALREADY DONE, FLAG VALUE >=1, SELECT ANOTHER ONE
			SEF_MissionSelector()
		elseif ( trigger.misc.getUserFlag(Randomiser) == 0 ) then
			--SELECTED MISSION [Randomiser] IS AVAILABLE TO START, SET TO STARTED AND VALIDATE
			trigger.action.setUserFlag(Randomiser,1)
			SEF_RetrieveMissionInformation(Randomiser)
			--trigger.action.outText("Validating Mission Number "..Randomiser.." For Targeting", 15)
			SEF_ValidateMission()										
		else
			trigger.action.outText("Mission Selection Error", 15)
		end
	end		
end

function SEF_RetrieveMissionInformation ( MissionNumber )
	
	--SET GLOBAL VARIABLES TO THE SELECTED MISSION
	ScenarioNumber = MissionNumber
	AGMissionTarget = OperationSeaSlug_AG[MissionNumber].TargetName
	AGTargetTypeStatic = OperationSeaSlug_AG[MissionNumber].TargetStatic
	AGMissionBriefingText = OperationSeaSlug_AG[MissionNumber].TargetBriefing		
end

function SEF_ValidateMission()
	
	--CHECK TARGET TO SEE IF IT IS ALIVE OR NOT
	if ( AGTargetTypeStatic == false and AGMissionTarget ~= nil ) then
		--TARGET IS NOT STATIC					
		if ( GROUP:FindByName(AGMissionTarget):IsAlive() == true ) then
			--GROUP VALID
			if ( CustomSoundsEnabled == 1) then
				trigger.action.outSound('That Is Our Target.ogg')
			else
			end
			trigger.action.outText(AGMissionBriefingText,15)			
		elseif ( GROUP:FindByName(AGMissionTarget):IsAlive() == false or GROUP:FindByName(AGMissionTarget):IsAlive() == nil ) then
			--GROUP NOT VALID
			trigger.action.setUserFlag(ScenarioNumber,4)
			NumberOfCompletedMissions = NumberOfCompletedMissions + 1
			AGMissionTarget = nil
			AGMissionBriefingText = nil
			SEF_MissionSelector()						
		else			
			trigger.action.outText("Mission Validation Error - Unexpected Result In Group Size", 15)						
		end		
	elseif ( AGTargetTypeStatic == true and AGMissionTarget ~= nil ) then		
		--TARGET IS STATIC		
		if ( StaticObject.getByName(AGMissionTarget) ~= nil and StaticObject.getByName(AGMissionTarget):isExist() == true ) then
			--STATIC IS VALID
			if ( CustomSoundsEnabled == 1) then
				trigger.action.outSound('That Is Our Target.ogg')
			else
			end	
			trigger.action.outText(AGMissionBriefingText,15)								
		elseif ( StaticObject.getByName(AGMissionTarget) == nil or StaticObject.getByName(AGMissionTarget):isExist() == false ) then
			--STATIC TARGET NOT VALID, ASSUME TARGET ALREADY DESTROYED			
			trigger.action.setUserFlag(ScenarioNumber,4)
			NumberOfCompletedMissions = NumberOfCompletedMissions + 1	
			AGMissionTarget = nil
			AGMissionBriefingText = nil
			SEF_MissionSelector()
		else
			trigger.action.outText("Mission Validation Error - Unexpected Result In Static Test", 15)	
		end		
	elseif ( OperationComplete == true ) then
		trigger.action.outText("The Operation Is Complete - No Further Targets To Validate For Mission Assignment", 15)
	else		
		trigger.action.outText("Mission Validation Error - Mission Validation Unavailable, No Valid Targets", 15)
	end
end

function SEF_SkipScenario()	
	--CHECK MISSION IS NOT SUDDENLY FLAGGED AS STATE 4 (COMPLETED)
	if ( trigger.misc.getUserFlag(ScenarioNumber) >= 1 and trigger.misc.getUserFlag(ScenarioNumber) <= 3 ) then
		--RESET MISSION TO STATE 0 (NOT STARTED), CLEAR TARGET INFORMATION AND REROLL A NEW MISSION
		trigger.action.setUserFlag(ScenarioNumber,0) 
		AGMissionTarget = nil
		AGMissionBriefingText = nil
		SEF_MissionSelector()
	elseif ( OperationComplete == true ) then
		trigger.action.outText("The Operation Has Been Completed, All Objectives Have Been Met", 15)
	else		
		trigger.action.outText("Unable To Skip As Current Mission Is In A Completion State", 15)
	end
end

function MissionSuccess()
	
	--SET GLOBALS TO NIL
	AGMissionTarget = nil
	AGMissionBriefingText = nil
	
	if ( CustomSoundsEnabled == 1) then
		local RandomMissionSuccessSound = math.random(1,5)
		trigger.action.outSound('AG Kill ' .. RandomMissionSuccessSound .. '.ogg')
	else
	end	
end

function SEF_MissionTargetStatus(TimeLoop, time)

	if (AGTargetTypeStatic == false and AGMissionTarget ~= nil) then
		--TARGET IS NOT STATIC
					
		if (GROUP:FindByName(AGMissionTarget):IsAlive() == true) then
			--GROUP STILL ALIVE
						
			return time + 10			
		elseif (GROUP:FindByName(AGMissionTarget):IsAlive() == false or GROUP:FindByName(AGMissionTarget):IsAlive() == nil) then 
			--GROUP DEAD
			trigger.action.outText("Mission Update - Mission Successful", 15)
			trigger.action.setUserFlag(ScenarioNumber,4)
			NumberOfCompletedMissions = NumberOfCompletedMissions + 1
			MissionSuccess()
			timer.scheduleFunction(SEF_MissionSelector, {}, timer.getTime() + 20)
			
			return time + 30			
		else			
			trigger.action.outText("Mission Target Status - Unexpected Result, Monitor Has Stopped", 15)						
		end		
	elseif (AGTargetTypeStatic == true and AGMissionTarget ~= nil) then
		--TARGET IS STATIC
		if ( StaticObject.getByName(AGMissionTarget) ~= nil and StaticObject.getByName(AGMissionTarget):isExist() == true ) then 
			--STATIC ALIVE
			
			return time + 10				
		else				
			--STATIC DESTROYED
			trigger.action.outText("Mission Update - Mission Successful", 15)
			trigger.action.setUserFlag(ScenarioNumber,4)
			NumberOfCompletedMissions = NumberOfCompletedMissions + 1
			MissionSuccess()
			timer.scheduleFunction(SEF_MissionSelector, {}, timer.getTime() + 20)
			
			return time + 30				
		end		
	else		
		return time + 10
	end	
end

function SEF_MissionStatus(TimeLoop, time)
	
	local Phase = SEF_BattlePhaseCheckSilent()
	
	if ( Phase == 4 ) then	
		SEF_VictoryAchieved()	
	else
	end
	
	return time + 300
end

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MISSION TARGET TABLE

function SEF_InitializeMissionTable()
	
	OperationSeaSlug_AG = {}	
	
	OperationSeaSlug_AG[1] = {				
		TargetName = "998 Kunlun Shan",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Chinese Transport Ship Kunlun Shan\nRota Island Sector - Grid CR16",
	}	
	OperationSeaSlug_AG[2] = {				
			TargetName = "Russian SAG 1",
			TargetStatic = false,
			TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Russian Surface Action Group North-North-West Of Rota Island\nPacific Ocean Sector - Grid BS68",
	}
	OperationSeaSlug_AG[3] = {				
		TargetName = "Chinese SAG 1",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Chinese Surface Action Group East-North-East Of Rota Island\nPacific Ocean Sector - Grid DR39",
	}	
	OperationSeaSlug_AG[4] = {				
		TargetName = "Chinese SAG 2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Chinese Surface Action Group Patrolling Saipan Island\nSaipan Island Sector - Grid CS57",
	}
	OperationSeaSlug_AG[5] = {				
		TargetName = "980 Longhu Shan",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Chinese Transport Ship Longhu Shan\nSaipan Island Sector - Grid CS68",
	}
	OperationSeaSlug_AG[6] = {				
		TargetName = "Rota - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site On Rota Island\nRota Island Sector - Grid CR06",
	}
	OperationSeaSlug_AG[7] = {				
		TargetName = "Sinapalu - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site North East Of Sinapalu\nRota Island Sector - Grid CR16",
	}
	OperationSeaSlug_AG[8] = {				
		TargetName = "Sinapalu - SA-3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site Located At Sinapalu\nRota Island Sector - Grid CR06",
	}
	OperationSeaSlug_AG[9] = {				
		TargetName = "Aguijan - HQ-7",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The HQ-7 Site Located On Aguijan Island\nTinian Island Sector - Grid CS44",
	}
	OperationSeaSlug_AG[10] = {				
		TargetName = "Koblerville - SA-10",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-10 Site Located On Saipan Island\nSaipan Island Sector - Grid CS67",
	}
	OperationSeaSlug_AG[11] = {				
		TargetName = "Saipan - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Mobile SAM Located On Saipan Island\nSaipan Island Sector - Grid CS67",
	}
	OperationSeaSlug_AG[12] = {				
		TargetName = "Tinian - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Mobile SAM Located On Tinian Island\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[13] = {				
		TargetName = "San Jose - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Located At The San Jose Port\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[14] = {				
		TargetName = "Puerto Rico - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Located At The Puerto Rico Port\nSaipan Island Sector - Grid CS68",
	}
	OperationSeaSlug_AG[15] = {				
		TargetName = "Rota - Speedboat",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armed Speedboats South Of Rota Island\nRota Island Sector - Grid CR06/CR16",
	}
	OperationSeaSlug_AG[16] = {				
		TargetName = "Songsong - Speedboat",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armed Speedboats South Of Songsong\nRota Island Sector - Grid BR96/CR06",
	}
	OperationSeaSlug_AG[17] = {				
		TargetName = "Songsong - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Songsong\nRota Island Sector - Grid BR96",
	}
	OperationSeaSlug_AG[18] = {				
		TargetName = "Rota - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Mobile SAM Located On Rota Island\nRota Island Sector - Grid CR06",
	}
	OperationSeaSlug_AG[19] = {				
		TargetName = "Puetto - SA-11",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-11 Site Located At Puetto\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[20] = {				
		TargetName = "Sinapalu - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Sinapalu\nRota Island Sector - Grid CR06/CR16",
	}
	OperationSeaSlug_AG[21] = {				
		TargetName = "Rota - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located On Rota Island\nRota Island Sector - Grid CR06",
	}
	OperationSeaSlug_AG[22] = {				
		TargetName = "B-262 Stary Oskoi",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Submarine B-262 Stary Oskoi\nPacific Ocean Sector - Grid BT97",
	}
	OperationSeaSlug_AG[23] = {				
		TargetName = "B-871 Alrosa",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Submarine B-871 Alrosa\nPacific Ocean Sector - Grid ZB19",
	}
	OperationSeaSlug_AG[24] = {				
		TargetName = "403 Changzheng 3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Submarine Changzheng 3\nPacific Ocean Sector - Grid DS88",
	}
	OperationSeaSlug_AG[25] = {				
		TargetName = "404 Changzheng 4",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Submarine Changzheng 4\nPacific Ocean Sector - Grid DR83",
	}
	OperationSeaSlug_AG[26] = {				
		TargetName = "Seawise Giant",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Seawise Giant\nPacific Ocean Sector - Grid CR18",
	}
	OperationSeaSlug_AG[27] = {				
		TargetName = "Handy Wind",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Handy Wind\nPacific Ocean Sector - Grid CS43",
	}
	OperationSeaSlug_AG[28] = {				
		TargetName = "Rota - Communications Tower",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower On Rota Island\nRota Island Sector - Grid CR06",
	}
	OperationSeaSlug_AG[29] = {				
		TargetName = "Sinapalu - Scud Launcher",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Scud Launchers Located North East Of Sinapalu\nRota Island Sector - Grid CR16",
	}
	OperationSeaSlug_AG[30] = {				
		TargetName = "Sinapalu - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Mobile SAM Located At Sinapalu\nRota Island Sector - Grid CR16",
	}
	OperationSeaSlug_AG[31] = {				
		TargetName = "San Jose - Silkworm",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Silkworm Site Located At San Jose\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[32] = {				
		TargetName = "Tinian - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located Near Tinian Airfield\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[33] = {				
		TargetName = "Puerto Rico - SA-11",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-11 Site Located At Puerto Rico\nSaipan Island Sector - Grid CS68",
	}
	OperationSeaSlug_AG[34] = {				
		TargetName = "Sinapalu - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Sinapalu\nRota Island Sector - Grid CR16",
	}
	OperationSeaSlug_AG[35] = {				
		TargetName = "Tinian - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Tinian Airfield\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[36] = {				
		TargetName = "Saipan - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Saipan Airfield\nSaipan Island Sector - Grid CS67",
	}
	OperationSeaSlug_AG[37] = {				
		TargetName = "Tinian - Communications Tower",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Located At The Robert E Kamosa Transmitting Station\nTinian Island Sector - Grid CS56",
	}
	OperationSeaSlug_AG[38] = {				
		TargetName = "Garapan - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Mobile SAM Located At Garapan\nSaipan Island Sector - Grid CS68",
	}
	OperationSeaSlug_AG[39] = {				
		TargetName = "Garapan - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Garapan\nSaipan Island Sector - Grid CS68",
	}
	OperationSeaSlug_AG[40] = {				
		TargetName = "Puerto Rico - Speedboat",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armed Speedboats At Puerto Rico\nSaipan Island Sector - Grid CS68",
	}
	OperationSeaSlug_AG[41] = {				
		TargetName = "San Jose - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 Mobile SAM Located At San Jose\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[42] = {				
		TargetName = "San Jose - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At San Jose\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[43] = {				
		TargetName = "Puetto - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Puetto\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[44] = {				
		TargetName = "Puetto - Scud Launcher",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Scud Launchers Located At Puetto\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[45] = {				
		TargetName = "Sinapalu - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located North East Of Sinapalu\nRota Island Sector - Grid CR16",
	}
	OperationSeaSlug_AG[46] = {				
		TargetName = "Tachungnya - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Tachungnya\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[47] = {				
		TargetName = "Tachungnya - Mi-8MTV2",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Mi-8MTV2 Helicopter Located At Tachungnya\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[48] = {				
		TargetName = "Tachungnya - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Tachungnya\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[49] = {				
		TargetName = "Puetto - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Puetto\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[50] = {				
		TargetName = "San Jose - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At San Jose\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[51] = {				
		TargetName = "Puerto Rico - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Puerto Rico\nSaipan Island Sector - Grid CS68",
	}
	OperationSeaSlug_AG[52] = {				
		TargetName = "Susupe - Scud Launcher",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Scud Launchers Located At Susupe\nSaipan Island Sector - Grid CS67",
	}
	OperationSeaSlug_AG[53] = {				
		TargetName = "Susupe - SA-19",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-19 Mobile SAM Located At Susupe\nSaipan Island Sector - Grid CS67",
	}
	OperationSeaSlug_AG[54] = {				
		TargetName = "Garapan - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Garapan\nSaipan Island Sector - Grid CS68",
	}
	OperationSeaSlug_AG[55] = {				
		TargetName = "Tinian - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located West Of San Jose\nTinian Island Sector - Grid CS55",
	}
	OperationSeaSlug_AG[56] = {				
		TargetName = "Mulatu - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At The Robert E Kamosa Transmitting Station\nTinian Island Sector - Grid CS56",
	}
	OperationSeaSlug_AG[57] = {				
		TargetName = "Mulatu - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At The Robert E Kamosa Transmitting Station\nTinian Island Sector - Grid CS56",
	}
	OperationSeaSlug_AG[58] = {				
		TargetName = "Mulatu - SA-19",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-19 Mobile SAM At The Robert E Kamosa Transmitting Station\nTinian Island Sector - Grid CS56",
	}
	OperationSeaSlug_AG[59] = {				
		TargetName = "Susupe - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Susupe\nSaipan Island Sector - Grid CS67",
	}
	OperationSeaSlug_AG[60] = {				
		TargetName = "Saipan - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Saipan Airfield\nSaipan Island Sector - Grid CS67",
	}
end

--////End Mission Target Table
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////ON DEMAND MISSION INFORMATION

local function CheckObjectiveRequest()
	
	if ( AGMissionBriefingText ~= nil ) then
		trigger.action.outText(AGMissionBriefingText, 15)
		if ( CustomSoundsEnabled == 1) then
			trigger.action.outSound('That Is Our Target.ogg')
		else
		end	
	elseif ( OperationComplete == true ) then
		trigger.action.outText("The Operation Has Been Completed, There Are No Further Objectives", 15)
	elseif ( AGMissionBriefingText == nil and OperationComplete == false ) then
		trigger.action.outText("Check Objective Request Error - No Briefing Available And Operation Is Not Completed", 15)
	else
		trigger.action.outText("Check Objective Request Error - Unexpected Result Occured", 15)
	end	
end

function TargetReport()
			
	if (AGTargetTypeStatic == false and AGMissionTarget ~=nil) then
		TargetGroup = GROUP:FindByName(AGMissionTarget)	
		
		if (GROUP:FindByName(AGMissionTarget):IsAlive() == true) then
		
			TargetRemainingUnits = Group.getByName(AGMissionTarget):getSize()	
			
			MissionPlayersBlue = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive():FilterOnce()
			
			MissionPlayersBlue:ForEachClient(
				function(Client)
					if Client:IsAlive() == true then
						ClientPlayerName = Client:GetPlayerName()	  
						ClientUnitName = Client:GetName()			  
						ClientGroupName = Client:GetClientGroupName() 			
						ClientGroupID = Client:GetClientGroupID()	   	
				
						PlayerUnit = UNIT:FindByName(ClientUnitName)		
					
						PlayerCoord = PlayerUnit:GetCoordinate()
						TargetCoord = TargetGroup:GetCoordinate()
						TargetHeight = math.floor(TargetGroup:GetCoordinate():GetLandHeight() * 100)/100
						TargetHeightFt = math.floor(TargetHeight * 3.28084)
						PlayerDistance = PlayerCoord:Get2DDistance(TargetCoord)

						TargetVector = PlayerCoord:GetDirectionVec3(TargetCoord)
						TargetBearing = PlayerCoord:GetAngleRadians (TargetVector)	
					
						PlayerBR = PlayerCoord:GetBRText(TargetBearing, PlayerDistance, SETTINGS:SetImperial())
					
						--List the amount of units remaining in the group
						if (TargetRemainingUnits > 1) then
							SZMessage = "There are "..TargetRemainingUnits.." targets remaining for this mission" 
						elseif (TargetRemainingUnits == 1) then
							SZMessage = "There is "..TargetRemainingUnits.." target remaining for this mission" 
						elseif (TargetRemainingUnits == nil) then					
							SZMessage = "Unable To Determine Group Size"
						else			
							SZMessage = "Nothing to report"		
						end		
					
						BRMessage = "Target bearing "..PlayerBR
						ELEMessage = "Elevation "..TargetHeight.."m".." / "..TargetHeightFt.."ft"
					
						_SETTINGS:SetLL_Accuracy(0)
						CoordStringLLDMS = TargetCoord:ToStringLLDMS(SETTINGS:SetImperial())
						_SETTINGS:SetLL_Accuracy(3)
						CoordStringLLDDM = TargetCoord:ToStringLLDDM(SETTINGS:SetImperial())
						_SETTINGS:SetLL_Accuracy(2)
						CoordStringLLDMSDS = TargetCoord:ToStringLLDMSDS(SETTINGS:SetImperial())
						
						trigger.action.outTextForGroup(ClientGroupID, "Target Report For "..ClientPlayerName.."\n".."\n"..AGMissionBriefingText.."\n"..BRMessage.."\n"..SZMessage.."\n"..CoordStringLLDMS.."\n"..CoordStringLLDDM.."\n"..CoordStringLLDMSDS.."\n"..ELEMessage, 30)							
					else						
					end				
				end
			)
		else
			trigger.action.outText("Target Report Unavailable", 15)
		end
		
	elseif (AGTargetTypeStatic == true and AGMissionTarget ~=nil) then
		TargetGroup = STATIC:FindByName(AGMissionTarget, false)
		
		MissionPlayersBlue = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive():FilterOnce()

		MissionPlayersBlue:ForEachClient(
			function(Client)
				if Client:IsAlive() == true then
					ClientPlayerName = Client:GetPlayerName()	
					ClientUnitName = Client:GetName()			
					ClientGroupName = Client:GetClientGroupName()				
					ClientGroupID = Client:GetClientGroupID()
				
					PlayerUnit = UNIT:FindByName(ClientUnitName)		
					
					PlayerCoord = PlayerUnit:GetCoordinate()
					TargetCoord = TargetGroup:GetCoordinate()
					TargetHeight = math.floor(TargetGroup:GetCoordinate():GetLandHeight() * 100)/100
					TargetHeightFt = math.floor(TargetHeight * 3.28084)
					PlayerDistance = PlayerCoord:Get2DDistance(TargetCoord)
					
					TargetVector = PlayerCoord:GetDirectionVec3(TargetCoord)
					TargetBearing = PlayerCoord:GetAngleRadians (TargetVector)	
										
					PlayerBR = PlayerCoord:GetBRText(TargetBearing, PlayerDistance, SETTINGS:SetImperial())

					BRMessage = "Target bearing "..PlayerBR
					ELEMessage = "Elevation "..TargetHeight.."m".." / "..TargetHeightFt.."ft"
					
					_SETTINGS:SetLL_Accuracy(0)
					CoordStringLLDMS = TargetCoord:ToStringLLDMS(SETTINGS:SetImperial())
					_SETTINGS:SetLL_Accuracy(3)
					CoordStringLLDDM = TargetCoord:ToStringLLDDM(SETTINGS:SetImperial())
					_SETTINGS:SetLL_Accuracy(2)
					CoordStringLLDMSDS = TargetCoord:ToStringLLDMSDS(SETTINGS:SetImperial())
					
					trigger.action.outTextForGroup(ClientGroupID, "Target Report For "..ClientPlayerName.."\n".."\n"..AGMissionBriefingText.."\n"..BRMessage.."\n"..CoordStringLLDMS.."\n"..CoordStringLLDDM.."\n"..CoordStringLLDMSDS.."\n"..ELEMessage, 30)							
				else
				end				
			end
		)		
	elseif ( OperationComplete == true ) then
		trigger.action.outText("The Operation Has Been Completed, There Are No Further Targets", 15)	
	else
		trigger.action.outText("No Target Information Available", 15)
	end
end

--////End On Demand Mission Information
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////AI SUPPORT FLIGHT FUNCTIONS

--////COMBAT AIR PATROL FIGHTER SCREEN
function AbortCAPMission()

	if ( GROUP:FindByName(USAEFCAPGROUPNAME) ~= nil and GROUP:FindByName(USAEFCAPGROUPNAME):IsAlive() ) then
		--If Alive, Perform RTB command
		local RTB = {}
		--RTB.fromWaypointIndex = 2
		RTB.goToWaypointIndex = 5
								
		local RTBTask = {id = 'SwitchWaypoint', params = RTB}
		Group.getByName(USAEFCAPGROUPNAME):getController():setOption(0, 3) -- (0, 4) is weapons hold, (0, 3) is return fire
		Group.getByName(USAEFCAPGROUPNAME):getController():setCommand(RTBTask)	
			
		trigger.action.outText("Fighter Screen Is Returning To Base",15)
	else
		trigger.action.outText("Fighter Screen Does Not Have Fighters To Recall",15)
	end	
end
--////CLOSE AIR SUPPORT
function AbortCASMission()

	if ( GROUP:FindByName(USAEFCASGROUPNAME) ~= nil and GROUP:FindByName(USAEFCASGROUPNAME):IsAlive() ) then
		--If Alive, Perform RTB command
		local RTB = {}
		--RTB.fromWaypointIndex = 2
		RTB.goToWaypointIndex = 5
								
		local RTBTask = {id = 'SwitchWaypoint', params = RTB}
		Group.getByName(USAEFCASGROUPNAME):getController():setOption(0, 3) -- (0, 4) is weapons hold, (0, 3) is return fire
		Group.getByName(USAEFCASGROUPNAME):getController():setCommand(RTBTask)	
			
		trigger.action.outText("Close Air Support Is Returning To Base",15)
	else
		trigger.action.outText("Close Air Support Does Not Have Planes To Recall",15)
	end	
end
--////ANTI-SHIPPING
function AbortASSMission()

	if ( GROUP:FindByName(USAEFASSGROUPNAME) ~= nil and GROUP:FindByName(USAEFASSGROUPNAME):IsAlive() ) then
		--If Alive, Perform RTB command
		local RTB = {}
		--RTB.fromWaypointIndex = 2
		RTB.goToWaypointIndex = 5
								
		local RTBTask = {id = 'SwitchWaypoint', params = RTB}
		Group.getByName(USAEFASSGROUPNAME):getController():setOption(0, 3) -- (0, 4) is weapons hold, (0, 3) is return fire
		Group.getByName(USAEFASSGROUPNAME):getController():setCommand(RTBTask)	
			
		trigger.action.outText("Anti-Shipping Support Is Returning To Base",15)
	else
		trigger.action.outText("Anti-Shipping Support Does Not Have Planes To Recall",15)
	end	
end
--////SEAD
function AbortSEADMission()

	if ( GROUP:FindByName(USAEFSEADGROUPNAME) ~= nil and GROUP:FindByName(USAEFSEADGROUPNAME):IsAlive() ) then
		--If Alive, Perform RTB command
		local RTB = {}
		--RTB.fromWaypointIndex = 2
		RTB.goToWaypointIndex = 4
								
		local RTBTask = {id = 'SwitchWaypoint', params = RTB}
		Group.getByName(USAEFSEADGROUPNAME):getController():setOption(0, 3) -- (0, 4) is weapons hold, (0, 3) is return fire
		Group.getByName(USAEFSEADGROUPNAME):getController():setCommand(RTBTask)	
			
		trigger.action.outText("SEAD Support Is Returning To Base",15)
	else
		trigger.action.outText("SEAD Support Does Not Have Planes To Recall",15)
	end	
end

function AbortPINMission()

	if ( GROUP:FindByName(USAEFPINGROUPNAME) ~= nil and GROUP:FindByName(USAEFPINGROUPNAME):IsAlive() ) then
		--If Alive, Perform RTB command
		local RTB = {}
		--RTB.fromWaypointIndex = 2
		RTB.goToWaypointIndex = 5
								
		local RTBTask = {id = 'SwitchWaypoint', params = RTB}
		Group.getByName(USAEFPINGROUPNAME):getController():setOption(0, 3) -- (0, 4) is weapons hold, (0, 3) is return fire
		Group.getByName(USAEFPINGROUPNAME):getController():setCommand(RTBTask)	
			
		trigger.action.outText("Pinpoint Strike Support Is Returning To Base",15)
	else
		trigger.action.outText("Pinpoint Strike Support Does Not Have Planes To Recall",15)
	end	
end

function SEF_PinpointStrikeTargetAcquisition()
	
	--See https://wiki.hoggitworld.com/view/DCS_task_bombing for further details
	--CHECK TARGET IS WITHIN THE SAME GENERAL AREA THE FLIGHT WAS CALLED TO, GET DETAILS IF IT IS AND ABORT IF NOT
	if ( AGMissionTarget ~= nil ) then
		if ( AGTargetTypeStatic == true ) then
			if ( StaticObject.getByName(AGMissionTarget):isExist() == true ) then
				TargetGroupPIN = STATIC:FindByName(AGMissionTarget, false)
				TargetCoordForStrike = TargetGroupPIN:GetCoordinate():GetVec2()
					
				local StrikeGroup = GROUP:FindByName(USAEFPINGROUPNAME):GetCoordinate()
				local StrikeCoord = TargetGroupPIN:GetCoordinate()
				local StrikeDistanceToTarget = StrikeGroup:Get2DDistance(StrikeCoord)
				
				if ( StrikeDistanceToTarget < 75000 ) then				
					local target = {}
					target.point = TargetCoordForStrike
					target.expend = "Two"
					target.weaponType = 14
					target.attackQty = 1
					target.groupAttack = true
					local engage = {id = 'Bombing', params = target}
					Group.getByName(USAEFPINGROUPNAME):getController():pushTask(engage)
					trigger.action.outText("The Pinpoint Strike Flight Reports Target Coordinates Are Locked In", 15)
				else
					trigger.action.outText("Pinpoint Strike Reports Target Is Too Far Away, Aborting Mission", 15)
					AbortPINMission()
				end	
			else
				trigger.action.outText("Pinpoint Strike Mission Unable To Locate Target, Aborting Mission", 15)
				AbortPINMission()
			end
		elseif ( AGTargetTypeStatic == false ) then
			if ( GROUP:FindByName(AGMissionTarget):IsAlive() == true ) then
				TargetGroupPIN = GROUP:FindByName(AGMissionTarget, false)
				TargetCoordForStrike = TargetGroupPIN:GetCoordinate():GetVec2()
					
				local StrikeGroup = GROUP:FindByName(USAEFPINGROUPNAME):GetCoordinate()
				local StrikeCoord = TargetGroupPIN:GetCoordinate()
				local StrikeDistanceToTarget = StrikeGroup:Get2DDistance(StrikeCoord)
				
				if ( StrikeDistanceToTarget < 75000 ) then
					local target = {}
					target.point = TargetCoordForStrike
					target.expend = "Two"
					target.weaponType = 14 -- See https://wiki.hoggitworld.com/view/DCS_enum_weapon_flag for other weapon launch codes
					target.attackQty = 1
					target.groupAttack = true
					local engage = {id = 'Bombing', params = target}
					Group.getByName(USAEFPINGROUPNAME):getController():pushTask(engage)
					trigger.action.outText("The Pinpoint Strike Flight Reports Target Coordinates Are Locked In", 15)
				else
					trigger.action.outText("Pinpoint Strike Reports Target Is Too Far Away, Aborting Mission", 15)
					AbortPINMission()
				end		
			else
				trigger.action.outText("Pinpoint Strike Mission Unable To Locate Target", 15)
				AbortPINMission()
			end
		else
			trigger.action.outText("Pinpoint Strike Mission Unable To Locate Target", 15)
			AbortPINMission()
		end
	else
		trigger.action.outText("The Pinpoint Strike Flight Reports They Have Not Been Given Any Target Information From High Command, Aborting Mission", 15)
		AbortPINMission()		
	end	
end

--////MQ-9 Aerial Drone
function AbortDroneMission()

	if ( GROUP:FindByName(USAEFDRONEGROUPNAME) ~= nil and GROUP:FindByName(USAEFDRONEGROUPNAME):IsAlive() ) then
			
		Group.getByName(USAEFDRONEGROUPNAME):destroy()
			
		trigger.action.outText("MQ-9 Reaper Aerial Drone Self-Destruct Engaged",15)
	else
		trigger.action.outText("MQ-9 Reaper Aerial Drone Is Unable To Be Recalled",15)
	end	
end

function SEF_USAEFCAPSPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(USAEFCAPGROUPNAME) ~= nil and GROUP:FindByName(USAEFCAPGROUPNAME):IsAlive() ) then
		trigger.action.outText("Fighter Screen Is Currently Active, Further Support Is Unavailable",15)	
	else
		USAEFCAP_DATA[1].Vec2 = nil
		USAEFCAP_DATA[1].TimeStamp = nil
		USAEFCAP_DATA[2].Vec2 = nil
		USAEFCAP_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		USAEFCAP = SPAWN:NewWithAlias("Plane Template", "USAEF F-15C"):InitRandomizeTemplate( { "USAEF F-15C" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )						
					USAEFCAPGROUPNAME = SpawnGroup.GroupName
					USAEFCAPGROUPID = Group.getByName(USAEFCAPGROUPNAME):getID()
					USAEFCAPGROUP = GROUP:FindByName(SpawnGroup.GroupName)							
					
					local DepartureZoneVec2 = SpawnZone:GetVec2()
					local TargetZoneVec2 	= DestinationZone:GetVec2()
					local WP0X = DepartureZoneVec2.x
					local WP0Y = DepartureZoneVec2.y
					
					local WP1X = DepartureZoneVec2.x + 1000
					local WP1Y = DepartureZoneVec2.y
					
					--Orbit Start Point (offset Y to 12.5km West of the zone midpoint)
					local WP2X = TargetZoneVec2.x
					local WP2Y = TargetZoneVec2.y - 12500
					
					--Orbit End Point (offset Y to 12.5km East of the zone midpoint)
					local WP3X = TargetZoneVec2.x
					local WP3Y = TargetZoneVec2.y + 12500
					
					local WP4X = DepartureZoneVec2.x
					local WP4Y = DepartureZoneVec2.y				
								
							--////CAP Mission Profile, Engage Targets Along Route Within 50km, With Orbit For 20 Minutes Between WP2 and WP3
							Mission = {
								["id"] = "Mission",
								["params"] = {		
									["route"] = 
									{
										["points"] = 
										{
											[1] = 
											{
												["alt"] = 7000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 222.22222222222,
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
												["ETA"] = 0,
												["ETA_locked"] = true,
												["y"] = WP0Y,
												["x"] = WP0X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [1]
											[2] = 
											{
												["alt"] = 7000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 222.22222222222,
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
																		["id"] = "EPLRS",
																		["params"] = 
																		{
																			["value"] = true,
																			["groupId"] = USAEFCAPGROUPID,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [1]
															[2] = 
															{
																["enabled"] = true,
																["auto"] = false,
																["id"] = "EngageTargets",
																["number"] = 2,
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
																	["maxDist"] = 50000,
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
																			["value"] = 3,
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
																			["value"] = 264241152,
																			["name"] = 10,
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
																			["value"] = true,
																			["name"] = 19,
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
																			["variantIndex"] = 1,
																			["name"] = 5,
																			["formationIndex"] = 6,
																			["value"] = 393217,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [6]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 46.425096732112,
												["ETA_locked"] = false,
												["y"] = WP1Y,
												["x"] = WP1X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [2]
											[3] = 
											{
												["alt"] = 7000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 222.22222222222,
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
																["id"] = "ControlledTask",
																["number"] = 1,
																["params"] = 
																{
																	["task"] = 
																	{
																		["id"] = "Orbit",
																		["params"] = 
																		{
																			["altitude"] = 7000,
																			["pattern"] = "Race-Track",
																			["speed"] = 222.22222222222,
																			["speedEdited"] = true,
																		}, -- end of ["params"]
																	}, -- end of ["task"]
																	["stopCondition"] = 
																	{
																		["duration"] = 1200,
																	}, -- end of ["stopCondition"]
																}, -- end of ["params"]
															}, -- end of [1]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 382.40941284629,
												["ETA_locked"] = false,
												["y"] = WP2Y,
												["x"] = WP2X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [3]
											[4] = 
											{
												["alt"] = 7000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 222.22222222222,
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
												["ETA"] = 467.40499648103,
												["ETA_locked"] = false,
												["y"] = WP3Y,
												["x"] = WP3X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [4]
											[5] = 
											{
												["alt"] = 7000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 222.22222222222,
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
												["ETA"] = 806.47990963086,
												["ETA_locked"] = false,
												["y"] = WP4Y,
												["x"] = WP4X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [5]
										}, -- end of ["points"]
									}, -- end of ["route"]
								}, --end of ["params"]
							}--end of Mission				
					USAEFCAPGROUP:SetTask(Mission)				
				end
			)
		if ( DepartureAirbaseName == "Andersen AFB" ) then
			USAEFCAP:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {166,165}, SPAWN.Takeoff.Hot)		
		else
			USAEFCAP:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end		
		trigger.action.outText("Fighter Screen Launched",15)	
	end
end

function SEF_USAEFSEADSPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(USAEFSEADGROUPNAME) ~= nil and GROUP:FindByName(USAEFSEADGROUPNAME):IsAlive() ) then
		trigger.action.outText("SEAD Is Currently Active, Further Support Is Unavailable",15)	
	else
		USAEFSEAD_DATA[1].Vec2 = nil
		USAEFSEAD_DATA[1].TimeStamp = nil
		USAEFSEAD_DATA[2].Vec2 = nil
		USAEFSEAD_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		USAEFSEAD = SPAWN:NewWithAlias("Plane Template", "USAEF F-16C"):InitRandomizeTemplate( { "USAEF F-16C" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )						
					USAEFSEADGROUPNAME = SpawnGroup.GroupName
					USAEFSEADGROUPID = Group.getByName(USAEFSEADGROUPNAME):getID()
					USAEFSEADGROUP = GROUP:FindByName(SpawnGroup.GroupName)							
					
					local DepartureZoneVec2 = SpawnZone:GetVec2()
					local TargetZoneVec2 	= DestinationZone:GetVec2()
					local WP0X = DepartureZoneVec2.x
					local WP0Y = DepartureZoneVec2.y
					
					local WP1X = DepartureZoneVec2.x + 1000
					local WP1Y = DepartureZoneVec2.y 
					
					local WP2X = TargetZoneVec2.x
					local WP2Y = TargetZoneVec2.y
					
					local WP3X = DepartureZoneVec2.x
					local WP3Y = DepartureZoneVec2.y				
								
							--////SEAD Mission Profile, Engage Targets Along Route Within 50km
							Mission = {
								["id"] = "Mission",
								["params"] = {		
									["route"] = 
									{
										["points"] = 
										{
											[1] = 
											{
												["alt"] = 6000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 219.44444444444,
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
												["ETA"] = 0,
												["ETA_locked"] = true,
												["y"] = WP0Y,
												["x"] = WP0X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [1]
											[2] = 
											{
												["alt"] = 6000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 219.44444444444,
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
																		["id"] = "EPLRS",
																		["params"] = 
																		{
																			["value"] = true,
																			["groupId"] = USAEFSEADGROUPID,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [1]
															[2] = 
															{
																["enabled"] = true,
																["auto"] = false,
																["id"] = "EngageTargets",
																["number"] = 2,
																["params"] = 
																{
																	["targetTypes"] = 
																	{
																		[1] = "Air Defence",
																	}, -- end of ["targetTypes"]
																	["priority"] = 0,
																	["value"] = "Air Defence;",
																	["noTargetTypes"] = 
																	{
																	}, -- end of ["noTargetTypes"]
																	["maxDistEnabled"] = true,
																	["maxDist"] = 50000,
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
																			["value"] = 4161536,
																			["name"] = 10,
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
																			["value"] = true,
																			["name"] = 19,
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
																			["variantIndex"] = 1,
																			["name"] = 5,
																			["formationIndex"] = 6,
																			["value"] = 393217,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [6]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 56.032485482896,
												["ETA_locked"] = false,
												["y"] = WP1Y,
												["x"] = WP1X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [2]
											[3] = 
											{
												["alt"] = 6000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 219.44444444444,
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
												["ETA"] = 507.63523208217,
												["ETA_locked"] = false,
												["y"] = WP2Y,
												["x"] = WP2X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [3]
											[4] = 
											{
												["alt"] = 6000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 219.44444444444,
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
												["ETA"] = 957.4992496166,
												["ETA_locked"] = false,
												["y"] = WP3Y,
												["x"] = WP3X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [4]
										}, -- end of ["points"]
									}, -- end of ["route"]
								}, --end of ["params"]
							}--end of Mission				
					USAEFSEADGROUP:SetTask(Mission)				
				end
			)
		if ( DepartureAirbaseName == "Andersen AFB" ) then
			USAEFSEAD:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {164,163}, SPAWN.Takeoff.Hot)
		else
			USAEFSEAD:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end		
		trigger.action.outText("SEAD Mission Launched",15)	
	end	
end

function SEF_USAEFCASSPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(USAEFCASGROUPNAME) ~= nil and GROUP:FindByName(USAEFCASGROUPNAME):IsAlive() ) then
		trigger.action.outText("Close Air Support Is Currently Active, Further Support Is Unavailable",15)	
	else		
		USAEFCAS_DATA[1].Vec2 = nil
		USAEFCAS_DATA[1].TimeStamp = nil
		USAEFCAS_DATA[2].Vec2 = nil
		USAEFCAS_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		USAEFCAS = SPAWN:NewWithAlias("Plane Template", "USAEF A-10C"):InitRandomizeTemplate( { "USAEF A-10C" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )						
					USAEFCASGROUPNAME = SpawnGroup.GroupName
					USAEFCASGROUPID = Group.getByName(USAEFCASGROUPNAME):getID()
					USAEFCASGROUP = GROUP:FindByName(SpawnGroup.GroupName)							
					
					local DepartureZoneVec2 = SpawnZone:GetVec2()
					local TargetZoneVec2 	= DestinationZone:GetVec2()
					local WP0X = DepartureZoneVec2.x
					local WP0Y = DepartureZoneVec2.y
					
					local WP1X = DepartureZoneVec2.x + 1000
					local WP1Y = DepartureZoneVec2.y
					
					--Orbit Start Point (offset Y to 12.5km West of the zone midpoint)
					local WP2X = TargetZoneVec2.x
					local WP2Y = TargetZoneVec2.y - 12500
					
					--Orbit End Point (offset Y to 12.5km East of the zone midpoint)
					local WP3X = TargetZoneVec2.x
					local WP3Y = TargetZoneVec2.y + 12500
					
					local WP4X = DepartureZoneVec2.x
					local WP4Y = DepartureZoneVec2.y				
								
							--////SEAD Mission Profile, Engage Targets Along Route Within 50km
							Mission = {
								["id"] = "Mission",
								["params"] = {		
									["route"] = 
									{
										["points"] = 
										{
											[1] = 
											{
												["alt"] = 3500,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["properties"] = 
												{
													["vnav"] = 1,
													["scale"] = 0,
													["vangle"] = 0,
													["angle"] = 0,
													["steer"] = 2,
												}, -- end of ["properties"]
												["speed"] = 155.55555555556,
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
												["ETA"] = 0,
												["ETA_locked"] = true,
												["y"] = WP0Y,
												["x"] = WP0X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [1]
											[2] = 
											{
												["alt"] = 3500,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["properties"] = 
												{
													["vnav"] = 1,
													["scale"] = 0,
													["vangle"] = 0,
													["angle"] = 0,
													["steer"] = 2,
												}, -- end of ["properties"]
												["speed"] = 155.55555555556,
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
																		["id"] = "EPLRS",
																		["params"] = 
																		{
																			["value"] = true,
																			["groupId"] = USAEFCASGROUPID,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [1]
															[2] = 
															{
																["enabled"] = true,
																["auto"] = false,
																["id"] = "EngageTargets",
																["number"] = 2,
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
																	["maxDist"] = 25000,
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
																			["name"] = 15,
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
																			["value"] = true,
																			["name"] = 19,
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
																			["variantIndex"] = 1,
																			["name"] = 5,
																			["formationIndex"] = 6,
																			["value"] = 393217,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [6]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 50.97769941928,
												["ETA_locked"] = false,
												["y"] = WP1Y,
												["x"] = WP1X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [2]
											[3] = 
											{
												["alt"] = 2000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["properties"] = 
												{
													["vnav"] = 1,
													["scale"] = 0,
													["vangle"] = 0,
													["angle"] = 0,
													["steer"] = 2,
												}, -- end of ["properties"]
												["speed"] = 155.55555555556,
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
																["id"] = "ControlledTask",
																["number"] = 1,
																["params"] = 
																{
																	["task"] = 
																	{
																		["id"] = "Orbit",
																		["params"] = 
																		{
																			["altitude"] = 3500,
																			["pattern"] = "Race-Track",
																			["speed"] = 155.55555555556,
																			["speedEdited"] = true,
																		}, -- end of ["params"]
																	}, -- end of ["task"]
																	["stopCondition"] = 
																	{
																		["duration"] = 900,
																	}, -- end of ["stopCondition"]
																}, -- end of ["params"]
															}, -- end of [1]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 265.03232675467,
												["ETA_locked"] = false,
												["y"] = WP2Y,
												["x"] = WP2X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [3]
											[4] = 
											{
												["alt"] = 2000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["properties"] = 
												{
													["vnav"] = 1,
													["scale"] = 0,
													["vangle"] = 0,
													["angle"] = 0,
													["steer"] = 2,
												}, -- end of ["properties"]
												["speed"] = 155.55555555556,
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
												["ETA"] = 349.12890903278,
												["ETA_locked"] = false,
												["y"] = WP3Y,
												["x"] = WP3X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [4]
											[5] = 
											{
												["alt"] = 3500,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["properties"] = 
												{
													["vnav"] = 1,
													["scale"] = 0,
													["vangle"] = 0,
													["angle"] = 0,
													["steer"] = 2,
												}, -- end of ["properties"]
												["speed"] = 155.55555555556,
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
												["ETA"] = 564.44241411897,
												["ETA_locked"] = false,
												["y"] = WP4Y,
												["x"] = WP4X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [5]
										}, -- end of ["points"]
									}, -- end of ["route"]
								}, --end of ["params"]
							}--end of Mission				
					USAEFCASGROUP:SetTask(Mission)				
				end
			)
		if ( DepartureAirbaseName == "Andersen AFB" ) then
			USAEFCAS:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {162,161}, SPAWN.Takeoff.Hot)
		else
			USAEFCAS:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end
		trigger.action.outText("Close Air Support Mission Launched",15)	
	end
end

function SEF_USAEFASSSPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(USAEFASSGROUPNAME) ~= nil and GROUP:FindByName(USAEFASSGROUPNAME):IsAlive() ) then
		trigger.action.outText("Anti-Shipping Support Is Currently Active, Further Support Is Unavailable",15)	
	else
		USAEFASS_DATA[1].Vec2 = nil
		USAEFASS_DATA[1].TimeStamp = nil
		USAEFASS_DATA[2].Vec2 = nil
		USAEFASS_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		USAEFASS = SPAWN:NewWithAlias("Plane Template", "USAEF F/A-18C"):InitRandomizeTemplate( { "USAEF F/A-18C" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )						
					USAEFASSGROUPNAME = SpawnGroup.GroupName
					USAEFASSGROUPID = Group.getByName(USAEFASSGROUPNAME):getID()
					USAEFASSGROUP = GROUP:FindByName(SpawnGroup.GroupName)							
					
					local DepartureZoneVec2 = SpawnZone:GetVec2()
					local TargetZoneVec2 	= DestinationZone:GetVec2()
					--Spawn Point
					local WP0X = DepartureZoneVec2.x
					local WP0Y = DepartureZoneVec2.y
					--Initialisation Point
					local WP1X = DepartureZoneVec2.x + 1000
					local WP1Y = DepartureZoneVec2.y 
					--Ingress Point
					local WP2X = TargetZoneVec2.x 
					local WP2Y = TargetZoneVec2.y - 50000
					--Target Zone Flyover Point
					local WP3X = TargetZoneVec2.x
					local WP3Y = TargetZoneVec2.y
					--Return Point
					local WP4X = DepartureZoneVec2.x
 					local WP4Y = DepartureZoneVec2.y
								
							--////Anti-Ship Mission Profile, Attack Planes Within 25km, Ships Within 50km Of The Route From The Ingress Point Onwards
							Mission = {
								["id"] = "Mission",
								["params"] = {		
									["route"] = {
										["points"] = {
											[1] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 231.59317779244,
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
																		["id"] = "EPLRS",
																		["params"] = 
																		{
																			["value"] = true,
																			["groupId"] = USAEFASSGROUPID,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [1]															
															[2] = 
															{
																["enabled"] = true,
																["auto"] = false,
																["id"] = "EngageTargets",
																["number"] = 2,
																["params"] = 
																{
																	["targetTypes"] = 
																	{
																		[1] = "Air",
																	}, -- end of ["targetTypes"]
																	["priority"] = 1,
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
																	["maxDist"] = 25000,
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
																			["value"] = 2,
																			["name"] = 1,
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
																			["value"] = true,
																			["name"] = 15,
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
																			["value"] = 65536,
																			["name"] = 10,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [5]
															[6] = 
															{
																["number"] = 6,
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
																			["variantIndex"] = 1,
																			["name"] = 5,
																			["formationIndex"] = 6,
																			["value"] = 393217,
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
												["y"] = WP0Y,
												["x"] = WP0X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [1]
											[2] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 231.59317779244,
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
												["ETA"] = 7.8583458925594,
												["ETA_locked"] = false,
												["y"] = WP1Y,
												["x"] = WP1X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [2]
											[3] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 231.59317779244,
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
																		[1] = "Ships",
																	}, -- end of ["targetTypes"]
																	--["noTargetTypes"] = 
																	--{
																	--	[1] = "Submarines",
																	--}, -- end of ["noTargetTypes"]
																	["value"] = "Ships;",
																	["priority"] = 0,
																	["maxDistEnabled"] = true,
																	["maxDist"] = 50000,
																}, -- end of ["params"]
															}, -- end of [1]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 32.788983863136,
												["ETA_locked"] = false,
												["y"] = WP2Y,
												["x"] = WP2X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [3]
											[4] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 231.59317779244,
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
												["ETA"] = 70.734853282445,
												["ETA_locked"] = false,
												["y"] = WP3Y,
												["x"] = WP3X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [4]
											[5] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 231.59317779244,
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
												["ETA"] = 136.09696113708,
												["ETA_locked"] = false,
												["y"] = WP4Y,
												["x"] = WP4X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [5]
										}, -- end of ["points"]
									}, -- end of ["route"]
								}, --end of ["params"]
							}--end of Mission				
					USAEFASSGROUP:SetTask(Mission)				
				end
			)
		if ( DepartureAirbaseName == "Andersen AFB" ) then
			USAEFASS:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {160,159}, SPAWN.Takeoff.Hot)
		else
			USAEFASS:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end
		trigger.action.outText("Anti-Shipping Mission Launched",15)	
	end
end

function SEF_USAEFPINSPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(USAEFPINGROUPNAME) ~= nil and GROUP:FindByName(USAEFPINGROUPNAME):IsAlive() ) then
		trigger.action.outText("Pinpoint Strike Support Is Currently Active, Further Support Is Unavailable",15)	
	else
		USAEFPIN_DATA[1].Vec2 = nil
		USAEFPIN_DATA[1].TimeStamp = nil
		USAEFPIN_DATA[2].Vec2 = nil
		USAEFPIN_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local TypeSelection = math.random(1,3)
		
		if ( TypeSelection == 1 ) then		
			USAEFPIN = SPAWN:NewWithAlias("Plane Template", "USAEF F-15E"):InitRandomizeTemplate( { "USAEF F-15E" } )
			
				:OnSpawnGroup(
					function( SpawnGroup )						
						USAEFPINGROUPNAME = SpawnGroup.GroupName
						USAEFPINGROUPID = Group.getByName(USAEFPINGROUPNAME):getID()
						USAEFPINGROUP = GROUP:FindByName(SpawnGroup.GroupName)							
						
						local DepartureZoneVec2 = SpawnZone:GetVec2()
						local TargetZoneVec2 	= DestinationZone:GetVec2()
						
						--Spawn Point
						local WP0X = DepartureZoneVec2.x
						local WP0Y = DepartureZoneVec2.y
						
						--WP1
						local WP1X = DepartureZoneVec2.x + 1000
						local WP1Y = DepartureZoneVec2.y 
						
						--Target Acquisition Point --Offset from Target Vector By 25km
						local WP2X = TargetZoneVec2.x - 25000
						local WP2Y = TargetZoneVec2.y
						
						--Target Flyover Point
						local WP3X = TargetZoneVec2.x
						local WP3Y = TargetZoneVec2.y

						--Return Point	
						local WP4X = DepartureZoneVec2.x
						local WP4Y = DepartureZoneVec2.y		
									
								--////Pinpoint Strike Mission Profile
								Mission = {
									["id"] = "Mission",
									["params"] = {		
										["route"] = {
											["points"] = {
												[1] = {
													["alt"] = 5000,
													["action"] = "Turning Point",
													["alt_type"] = "BARO",
													["speed"] = 242.16987839118,
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
													["ETA"] = 0,
													["ETA_locked"] = true,
													["y"] = WP0Y,
													["x"] = WP0X,
													["formation_template"] = "",
													["speed_locked"] = true,
												}, -- end of [1]
												[2] = 
												{
													["alt"] = 5000,
													["action"] = "Turning Point",
													["alt_type"] = "BARO",
													["speed"] = 242.16987839118,
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
																			["id"] = "EPLRS",
																			["params"] = 
																			{
																				["value"] = true,
																				["groupId"] = USAEFPINGROUPID,
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
																				["value"] = 2,
																				["name"] = 1,
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
																				["name"] = 15,
																			}, -- end of ["params"]
																		}, -- end of ["action"]
																	}, -- end of ["params"]
																}, -- end of [3]																
																--RTB on out of ammo guided bombs, not working properly in 2.7
																--[[
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
																				["value"] = 14,
																				["name"] = 10,
																			}, -- end of ["params"]
																		}, -- end of ["action"]
																	}, -- end of ["params"]
																}, -- end of [4]
																]]--
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
																				["name"] = 19,
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
																				["variantIndex"] = 1,
																				["name"] = 5,
																				["formationIndex"] = 6,
																				["value"] = 393217,
																			}, -- end of ["params"]
																		}, -- end of ["action"]
																	}, -- end of ["params"]
																}, -- end of [5]
															}, -- end of ["tasks"]
														}, -- end of ["params"]
													}, -- end of ["task"]
													["type"] = "Turning Point",
													["ETA"] = 5.9436704052568,
													["ETA_locked"] = false,
													["y"] = WP1Y,
													["x"] = WP1X,
													["formation_template"] = "",
													["speed_locked"] = true,
												}, -- end of [2]
												[3] = 
												{
													["alt"] = 5000,
													["action"] = "Turning Point",
													["alt_type"] = "BARO",
													["speed"] = 242.16987839118,
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
																			["id"] = "Script",
																			["params"] = 
																			{
																				["command"] = "SEF_PinpointStrikeTargetAcquisition()",
																			}, -- end of ["params"]
																		}, -- end of ["action"]
																	}, -- end of ["params"]
																}, -- end of [1]
															}, -- end of ["tasks"]
														}, -- end of ["params"]
													}, -- end of ["task"]
													["type"] = "Turning Point",
													["ETA"] = 29.768321504821,
													["ETA_locked"] = false,
													["y"] = WP2Y,
													["x"] = WP2X,
													["formation_template"] = "",
													["speed_locked"] = true,
												}, -- end of [3]
												[4] = 
												{
													["alt"] = 5000,
													["action"] = "Turning Point",
													["alt_type"] = "BARO",
													["speed"] = 242.16987839118,
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
													["ETA"] = 67.432273852435,
													["ETA_locked"] = false,
													["y"] = WP3Y,
													["x"] = WP3X,
													["formation_template"] = "",
													["speed_locked"] = true,
												}, -- end of [4]
												[5] = 
												{
													["alt"] = 5000,
													["action"] = "Turning Point",
													["alt_type"] = "BARO",
													["speed"] = 242.16987839118,
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
													["ETA"] = 131.71119538513,
													["ETA_locked"] = false,
													["y"] = WP4Y,
													["x"] = WP4X,
													["formation_template"] = "",
													["speed_locked"] = true,
												}, -- end of [5]
											}, -- end of ["points"]
										}, -- end of ["route"]
									}, --end of ["params"]
								}--end of Mission				
						USAEFPINGROUP:SetTask(Mission)				
					end
				)
			if ( DepartureAirbaseName == "Andersen AFB" ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {158,157}, SPAWN.Takeoff.Hot)
			else
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
			end			
		elseif ( TypeSelection == 2 ) then		
			USAEFPIN = SPAWN:NewWithAlias("Plane Template", "USAEF F-117A"):InitRandomizeTemplate( { "USAEF F-117A" } )
			
			:OnSpawnGroup(
				function( SpawnGroup )						
					USAEFPINGROUPNAME = SpawnGroup.GroupName
					USAEFPINGROUPID = Group.getByName(USAEFPINGROUPNAME):getID()
					USAEFPINGROUP = GROUP:FindByName(SpawnGroup.GroupName)							
					
					local DepartureZoneVec2 = SpawnZone:GetVec2()
					local TargetZoneVec2 	= DestinationZone:GetVec2()
					
					--Spawn Point
					local WP0X = DepartureZoneVec2.x
					local WP0Y = DepartureZoneVec2.y
					
					--WP1
					local WP1X = DepartureZoneVec2.x + 1000
					local WP1Y = DepartureZoneVec2.y 
					
					--Target Acquisition Point --Offset from Target Vector By 25km
					local WP2X = TargetZoneVec2.x - 25000
					local WP2Y = TargetZoneVec2.y
					
					--Target Flyover Point
					local WP3X = TargetZoneVec2.x
					local WP3Y = TargetZoneVec2.y

					--Return Point	
					local WP4X = DepartureZoneVec2.x
					local WP4Y = DepartureZoneVec2.y		
								
							--////Pinpoint Strike Mission Profile
							Mission = {
								["id"] = "Mission",
								["params"] = {		
									["route"] = {
										["points"] = {
											[1] = {
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
												["ETA"] = 0,
												["ETA_locked"] = true,
												["y"] = WP0Y,
												["x"] = WP0X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [1]
											[2] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
																		["id"] = "EPLRS",
																		["params"] = 
																		{
																			["value"] = true,
																			["groupId"] = USAEFPINGROUPID,
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
																			["value"] = 2,
																			["name"] = 1,
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
																			["name"] = 15,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [3]
															--RTB on out of ammo guided bombs, not working properly in 2.7
															--[[
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
																			["value"] = 14,
																			["name"] = 10,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [4]
															]]--
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
																			["name"] = 19,
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
																			["variantIndex"] = 1,
																			["name"] = 5,
																			["formationIndex"] = 6,
																			["value"] = 393217,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [5]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 5.9436704052568,
												["ETA_locked"] = false,
												["y"] = WP1Y,
												["x"] = WP1X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [2]
											[3] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
																		["id"] = "Script",
																		["params"] = 
																		{
																			["command"] = "SEF_PinpointStrikeTargetAcquisition()",
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [1]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 29.768321504821,
												["ETA_locked"] = false,
												["y"] = WP2Y,
												["x"] = WP2X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [3]
											[4] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
												["ETA"] = 67.432273852435,
												["ETA_locked"] = false,
												["y"] = WP3Y,
												["x"] = WP3X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [4]
											[5] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
												["ETA"] = 131.71119538513,
												["ETA_locked"] = false,
												["y"] = WP4Y,
												["x"] = WP4X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [5]
										}, -- end of ["points"]
									}, -- end of ["route"]
								}, --end of ["params"]
							}--end of Mission				
					USAEFPINGROUP:SetTask(Mission)				
				end
			)
			if ( DepartureAirbaseName == "Andersen AFB" ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {158,157}, SPAWN.Takeoff.Hot)
			else
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
			end			
		else		
			USAEFPIN = SPAWN:NewWithAlias("Plane Template", "RAF Tornado GR4"):InitRandomizeTemplate( { "RAF Tornado GR4" } )
			
			:OnSpawnGroup(
				function( SpawnGroup )						
					USAEFPINGROUPNAME = SpawnGroup.GroupName
					USAEFPINGROUPID = Group.getByName(USAEFPINGROUPNAME):getID()
					USAEFPINGROUP = GROUP:FindByName(SpawnGroup.GroupName)							
					
					local DepartureZoneVec2 = SpawnZone:GetVec2()
					local TargetZoneVec2 	= DestinationZone:GetVec2()
					
					--Spawn Point
					local WP0X = DepartureZoneVec2.x
					local WP0Y = DepartureZoneVec2.y
					
					--WP1
					local WP1X = DepartureZoneVec2.x + 1000
					local WP1Y = DepartureZoneVec2.y 
					
					--Target Acquisition Point --Offset from Target Vector By 25km
					local WP2X = TargetZoneVec2.x - 25000
					local WP2Y = TargetZoneVec2.y
					
					--Target Flyover Point
					local WP3X = TargetZoneVec2.x
					local WP3Y = TargetZoneVec2.y

					--Return Point	
					local WP4X = DepartureZoneVec2.x
					local WP4Y = DepartureZoneVec2.y		
								
							--////Pinpoint Strike Mission Profile
							Mission = {
								["id"] = "Mission",
								["params"] = {		
									["route"] = {
										["points"] = {
											[1] = {
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
												["ETA"] = 0,
												["ETA_locked"] = true,
												["y"] = WP0Y,
												["x"] = WP0X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [1]
											[2] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
																		["id"] = "EPLRS",
																		["params"] = 
																		{
																			["value"] = true,
																			["groupId"] = USAEFPINGROUPID,
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
																			["value"] = 2,
																			["name"] = 1,
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
																			["name"] = 15,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [3]
															--RTB on out of ammo guided bombs, not working properly in 2.7
															--[[
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
																			["value"] = 14,
																			["name"] = 10,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [4]
															]]--
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
																			["name"] = 19,
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
																			["variantIndex"] = 1,
																			["name"] = 5,
																			["formationIndex"] = 6,
																			["value"] = 393217,
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [5]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 5.9436704052568,
												["ETA_locked"] = false,
												["y"] = WP1Y,
												["x"] = WP1X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [2]
											[3] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
																		["id"] = "Script",
																		["params"] = 
																		{
																			["command"] = "SEF_PinpointStrikeTargetAcquisition()",
																		}, -- end of ["params"]
																	}, -- end of ["action"]
																}, -- end of ["params"]
															}, -- end of [1]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 29.768321504821,
												["ETA_locked"] = false,
												["y"] = WP2Y,
												["x"] = WP2X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [3]
											[4] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
												["ETA"] = 67.432273852435,
												["ETA_locked"] = false,
												["y"] = WP3Y,
												["x"] = WP3X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [4]
											[5] = 
											{
												["alt"] = 5000,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 242.16987839118,
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
												["ETA"] = 131.71119538513,
												["ETA_locked"] = false,
												["y"] = WP4Y,
												["x"] = WP4X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [5]
										}, -- end of ["points"]
									}, -- end of ["route"]
								}, --end of ["params"]
							}--end of Mission				
					USAEFPINGROUP:SetTask(Mission)				
				end
			)
			if ( DepartureAirbaseName == "Andersen AFB" ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {158,157}, SPAWN.Takeoff.Hot)
			else
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
			end			
		end		
		trigger.action.outText("Pinpoint Strike Mission Launched",15)	
	end
end

function SEF_USAEFDRONESPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(USAEFDRONEGROUPNAME) ~= nil and GROUP:FindByName(USAEFDRONEGROUPNAME):IsAlive() ) then
		trigger.action.outText("MQ-9 Aerial Drone Is Currently Active, Further Support Is Unavailable",15)	
	else
		USAEFDRONE_DATA[1].Vec2 = nil
		USAEFDRONE_DATA[1].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		local TargetZoneVec2Point = DestinationZone:GetVec2()
		local SpawnX = TargetZoneVec2Point.x - 10000
		local SpawnY = TargetZoneVec2Point.y		
		local DroneStartVec3 = { x = SpawnX, y = 6448, z = SpawnY }
		
		USAEFDRONE = SPAWN:NewWithAlias("Plane Template", "USAEF MQ-9 Aerial Drone"):InitRandomizeTemplate( { "USAEF MQ-9 Aerial Drone" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )						
					USAEFDRONEGROUPNAME = SpawnGroup.GroupName
					USAEFDRONEGROUPID = Group.getByName(USAEFDRONEGROUPNAME):getID()
					USAEFDRONEGROUP = GROUP:FindByName(SpawnGroup.GroupName)							
					
					local DepartureZoneVec2 = SpawnZone:GetVec2()
					local TargetZoneVec2 	= DestinationZone:GetVec2()
					
					local WP0X = TargetZoneVec2.x - 10000
					local WP0Y = TargetZoneVec2.y
										
					local WP1X = WP0X + 1000
					local WP1Y = WP0Y					
					
					--Orbit Start Point
					local WP2X = TargetZoneVec2.x
					local WP2Y = TargetZoneVec2.y								
								
							--////Aerial Drone Mission Profile, Orbit Target Zone For 4 Hours
							Mission = {
								["id"] = "Mission",
								["params"] = {		
									["route"] = 
									{
										["points"] = 
										{
											[1] = 
											{
												["alt"] = 6448,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 86.9444,
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
																["id"] = "FAC",
																["number"] = 1,
																["params"] = 
																{
																	["number"] = 9,
																	["designation"] = "Auto",
																	["modulation"] = 0,
																	["callname"] = 8,
																	["datalink"] = true,
																	["frequency"] = 272000000,
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
																		["id"] = "EPLRS",
																		["params"] = 
																		{
																			["value"] = true,
																			["groupId"] = USAEFDRONEGROUPID,
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
																		["id"] = "SetInvisible",
																		["params"] = 
																		{
																			["value"] = true,
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
																			["value"] = 0,
																			["name"] = 1,
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
												["alt"] = 6448,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 86.9444,
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
												["ETA"] = 53.765858988616,
												["ETA_locked"] = false,
												["y"] = WP1Y,
												["x"] = WP1X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [2]
											[3] = 
											{
												["alt"] = 6448,
												["action"] = "Turning Point",
												["alt_type"] = "BARO",
												["speed"] = 86.9444,
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
																["id"] = "ControlledTask",
																["number"] = 1,
																["params"] = 
																{
																	["task"] = 
																	{
																		["id"] = "Orbit",
																		["params"] = 
																		{
																			["altitude"] = 6448,
																			["pattern"] = "Circle",
																			["speed"] = 66.111111111111,
																			["speedEdited"] = true,
																		}, -- end of ["params"]
																	}, -- end of ["task"]
																	["stopCondition"] = 
																	{
																		["duration"] = 14400,
																	}, -- end of ["stopCondition"]
																}, -- end of ["params"]
															}, -- end of [1]
														}, -- end of ["tasks"]
													}, -- end of ["params"]
												}, -- end of ["task"]
												["type"] = "Turning Point",
												["ETA"] = 269.74317967324,
												["ETA_locked"] = false,
												["y"] = WP2Y,
												["x"] = WP2X,
												["formation_template"] = "",
												["speed_locked"] = true,
											}, -- end of [3]
										}, -- end of ["points"]
									}, -- end of ["route"]
								}, --end of ["params"]
							}--end of Mission				
					USAEFDRONEGROUP:SetTask(Mission)				
				end
			)
		:SpawnFromVec3( DroneStartVec3 )
		trigger.action.outText("MQ-9 Aerial Drone Launched",15)	
	end
end

function SEF_TomahawkStrike(LaunchFrom)
	
	--////Launch Codes - (Cruise Missile 2097152) (Any ASM 4161536 )
	
	local CarrierGroupName = LaunchFrom	
   	
	if ( TomahawkMissilesAvailable > 0 ) then
		--Mission Is Ground Units/Ships
		if (AGTargetTypeStatic == false and AGMissionTarget ~=nil) then
			
			TomahawkTargetGroup = GROUP:FindByName(AGMissionTarget)	
			
			if (GROUP:FindByName(AGMissionTarget):IsAlive() == true) then
			
				--[[
				--TomahawkTargetGroupID = TomahawkTargetGroup:GetID()
								
				local TomahawkStrike = {} 
				TomahawkStrike.groupId = TomahawkTargetGroupID
				TomahawkStrike.weaponType = 2097152
				TomahawkStrike.expend = "One"
				TomahawkStrike.attackQtyLimit = true
				TomahawkStrike.attackQty = 1
				
				local ExecuteStrike = {id = 'AttackGroup', params = TomahawkStrike}		
				Group.getByName(CarrierGroupName):getController():pushTask(ExecuteStrike)
				]]--
				
				TomahawkTargetVec2 = TomahawkTargetGroup:GetCoordinate():GetVec2()
				
				local TomahawkStrikeLocation = {}
				TomahawkStrikeLocation.point = TomahawkTargetVec2
				TomahawkStrikeLocation.radius = 0
				TomahawkStrikeLocation.expendQtyEnabled = true
				TomahawkStrikeLocation.expendQty = 1
				TomahawkStrikeLocation.weaponType = 2097152

				local ExecuteStrike = {id = 'FireAtPoint', params = TomahawkStrikeLocation}
				Group.getByName(CarrierGroupName):getController():pushTask(ExecuteStrike)
								
				TomahawkMissilesAvailable = TomahawkMissilesAvailable - 1
				
				trigger.action.outText(CarrierGroupName.." Fire Control - Tomahawk Missile Firing", 15)				
			else
				trigger.action.outText("Unable To Acquire Tomahawk Target Information, Aborting Strike", 15)
			end
		--Mission Is A Static
		elseif (AGTargetTypeStatic == true and AGMissionTarget ~=nil) then
			
				TomahawkTargetGroup = STATIC:FindByName(AGMissionTarget, false)
				TomahawkTargetVec2 = TomahawkTargetGroup:GetCoordinate():GetVec2()
				
				local TomahawkStrikeLocation = {}
				TomahawkStrikeLocation.point = TomahawkTargetVec2
				TomahawkStrikeLocation.radius = 0
				TomahawkStrikeLocation.expendQtyEnabled = true
				TomahawkStrikeLocation.expendQty = 1
				TomahawkStrikeLocation.weaponType = 2097152

				local ExecuteStrike = {id = 'FireAtPoint', params = TomahawkStrikeLocation}
				Group.getByName(CarrierGroupName):getController():pushTask(ExecuteStrike)
								
				TomahawkMissilesAvailable = TomahawkMissilesAvailable - 1
				
				trigger.action.outText(CarrierGroupName.." Fire Control - Tomahawk Missile Firing", 15)
		else
			trigger.action.outText("Unable To Acquire Tomahawk Target Information, Aborting Strike", 15)
		end
	else
		trigger.action.outText("Tomahawk Missile Strike Unavailable, We're Preparing The Missiles", 15)
	end
end

--////End Support Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////Radio Menu 

function SEF_RadioMenuSetup()
	--////Set Up Menu
	-- table missionCommands.addSubMenuForCoalition(enum coalition.side, string name , table path)
	-- table missionCommands.addCommand(string name, table/nil path, function functionToRun , any anyArguement)
	-- table missionCommands.addCommandForCoalition(enum coalition.side, string name, table/nil path, function functionToRun , any anyArguement)

	--////Setup Submenu For Support Requests
	SupportMenuMain = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Support", nil)
	SupportMenuAbort = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abort Directives", nil)
	SupportMenuCAP  = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Fighter Support", SupportMenuMain)
	SupportMenuCAS  = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Close Air Support", SupportMenuMain)
	SupportMenuSEAD = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request SEAD Support", SupportMenuMain)
	SupportMenuASS = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Anti-Shipping Support", SupportMenuMain)
	SupportMenuPIN = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request A Pinpoint Strike", SupportMenuMain)
	SupportMenuDRONE = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request An MQ-9 Reaper Drone", SupportMenuMain)
	SupportMenuTOMA		= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request A Tomahawk Missile Strike", SupportMenuMain)
	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Launch From CVN-72 Abraham Lincoln", SupportMenuTOMA, function() SEF_TomahawkStrike("CVN-72 Abraham Lincoln") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Launch From CV-59 Forrestal", SupportMenuTOMA, function() SEF_TomahawkStrike("CV-59 Forrestal") end, nil)
	
	--////Setup Menu Option To Get The Current Objective
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Check Current Objective", nil, function() CheckObjectiveRequest() end, nil)
	--////Target Report to get target numbers and coordinates 
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Target Report", nil, function() TargetReport() end, nil)
	--////Drop Smoke On The Target
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Smoke Current Objective", nil, function() SEF_TargetSmoke() end, nil)
	
	--////AI Support Flights Mission Abort Codes
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission Fighter Screen", SupportMenuAbort, function() AbortCAPMission() end, nil)	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission Close Air Support", SupportMenuAbort, function() AbortCASMission() end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission Anti-Shipping", SupportMenuAbort, function() AbortASSMission() end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission SEAD", SupportMenuAbort, function() AbortSEADMission() end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission Pinpoint Strike", SupportMenuAbort, function() AbortPINMission() end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission MQ-9 Reaper Drone", SupportMenuAbort, function() AbortDroneMission() end, nil)	
	
	--////Sea Slug Mission Options
	SeaSlugOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Sea Slug Options", nil)
	SeaSlugCAPOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Sea Slug CAP Options", SeaSlugOptions)
	SeaSlugSNDOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Sea Slug Sound Options", SeaSlugOptions)
	SeaSlugBLUECAPToggle = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Toggle Allied AI CAP Flights", SeaSlugCAPOptions, function() SEF_BLUESQUADRONSTOGGLE() end, nil)	
	SeaSlugToggleCustomSounds = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Toggle Custom Sounds", SeaSlugSNDOptions, function() SEF_ToggleCustomSounds() end, nil)	
	SeaSlugClearCarrierFighters  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Clear Carrier Deck Of Fighters", SeaSlugOptions, function() SEF_ClearAIFightersFromCarrierDeck() end, nil)
	SeaSlugClearCarrierTankers  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Clear Carrier Deck Of Tankers", SeaSlugOptions, function() SEF_ClearAITankersFromCarrierDeck() end, nil)
	SeaSlugPhaseCheck  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Check Battle Phase", SeaSlugOptions, function() SEF_BattlePhaseCheck() end, nil)
	SeaSlugSkipScenario  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Skip This Mission", SeaSlugOptions, function() SEF_SkipScenario() end, nil)	
	
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////CAP FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuCAP_AND = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Andersen AFB", SupportMenuCAP)
		
	--////CAP Support Sector List
	
	SupportMenuCAP_AND_Guam = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Guam Sectors", SupportMenuCAP_AND)
		
	--////DEPARTING ANDERSEN AFB
	
	--////GUAM
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Andersen AFB", SupportMenuCAP_AND_Guam, function() SEF_USAEFCAPSPAWN("Andersen AFB", "Andersen AFB") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Antonio B. Won Pat Intl", SupportMenuCAP_AND_Guam, function() SEF_USAEFCAPSPAWN("Andersen AFB", "Antonio B. Won Pat Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rota Intl", SupportMenuCAP_AND_Guam, function() SEF_USAEFCAPSPAWN("Andersen AFB", "Rota Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Saipan Intl", SupportMenuCAP_AND_Guam, function() SEF_USAEFCAPSPAWN("Andersen AFB", "Saipan Intl") end, nil)	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tinian Intl", SupportMenuCAP_AND_Guam, function() SEF_USAEFCAPSPAWN("Andersen AFB", "Tinian Intl") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////CAS FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuCAS_AND = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Andersen AFB", SupportMenuCAS)
		
	--////CAS Support Sector List
	
	SupportMenuCAS_AND_Guam = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Guam Sectors", SupportMenuCAS_AND)
		
	--////DEPARTING ANDERSEN AFB
	
	--////GUAM
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Andersen AFB", SupportMenuCAS_AND_Guam, function() SEF_USAEFCASSPAWN("Andersen AFB", "Andersen AFB") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Antonio B. Won Pat Intl", SupportMenuCAS_AND_Guam, function() SEF_USAEFCASSPAWN("Andersen AFB", "Antonio B. Won Pat Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rota Intl", SupportMenuCAS_AND_Guam, function() SEF_USAEFCASSPAWN("Andersen AFB", "Rota Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Saipan Intl", SupportMenuCAS_AND_Guam, function() SEF_USAEFCASSPAWN("Andersen AFB", "Saipan Intl") end, nil)	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tinian Intl", SupportMenuCAS_AND_Guam, function() SEF_USAEFCASSPAWN("Andersen AFB", "Tinian Intl") end, nil)	
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////SEAD FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuSEAD_AND = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Andersen AFB", SupportMenuSEAD)
	
	--////SEAD Support Sector List
	
	SupportMenuSEAD_AND_Guam = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Guam Sectors", SupportMenuSEAD_AND)
	
	--////DEPARTING ANDERSEN AFB
	
	--////GUAM
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Andersen AFB", SupportMenuSEAD_AND_Guam, function() SEF_USAEFSEADSPAWN("Andersen AFB", "Andersen AFB") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Antonio B. Won Pat Intl", SupportMenuSEAD_AND_Guam, function() SEF_USAEFSEADSPAWN("Andersen AFB", "Antonio B. Won Pat Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rota Intl", SupportMenuSEAD_AND_Guam, function() SEF_USAEFSEADSPAWN("Andersen AFB", "Rota Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Saipan Intl", SupportMenuSEAD_AND_Guam, function() SEF_USAEFSEADSPAWN("Andersen AFB", "Saipan Intl") end, nil)	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tinian Intl", SupportMenuSEAD_AND_Guam, function() SEF_USAEFSEADSPAWN("Andersen AFB", "Tinian Intl") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////PINPOINT STRIKE FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuPIN_AND = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Andersen AFB", SupportMenuPIN)
	
	--////PIN Support Sector List
	
	SupportMenuPIN_AND_Guam = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Guam Sectors", SupportMenuPIN_AND)
	
	--////DEPARTING ANDERSEN AFB
	
	--////GUAM
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Andersen AFB", SupportMenuPIN_AND_Guam, function() SEF_USAEFPINSPAWN("Andersen AFB", "Andersen AFB") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Antonio B. Won Pat Intl", SupportMenuPIN_AND_Guam, function() SEF_USAEFPINSPAWN("Andersen AFB", "Antonio B. Won Pat Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rota Intl", SupportMenuPIN_AND_Guam, function() SEF_USAEFPINSPAWN("Andersen AFB", "Rota Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Saipan Intl", SupportMenuPIN_AND_Guam, function() SEF_USAEFPINSPAWN("Andersen AFB", "Saipan Intl") end, nil)	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tinian Intl", SupportMenuPIN_AND_Guam, function() SEF_USAEFPINSPAWN("Andersen AFB", "Tinian Intl") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////ANTI SHIPPING FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuASS_AND = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Andersen AFB", SupportMenuASS)
	
	--////ASS Support Sector List
	
	SupportMenuASS_AND_Guam = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Guam Sectors", SupportMenuASS_AND)
		
	--////DEPARTING ANDERSEN AFB
	
	--////GUAM
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Andersen AFB", SupportMenuASS_AND_Guam, function() SEF_USAEFASSSPAWN("Andersen AFB", "Andersen AFB") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Antonio B. Won Pat Intl", SupportMenuASS_AND_Guam, function() SEF_USAEFASSSPAWN("Andersen AFB", "Antonio B. Won Pat Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rota Intl", SupportMenuASS_AND_Guam, function() SEF_USAEFASSSPAWN("Andersen AFB", "Rota Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Saipan Intl", SupportMenuASS_AND_Guam, function() SEF_USAEFASSSPAWN("Andersen AFB", "Saipan Intl") end, nil)	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tinian Intl", SupportMenuASS_AND_Guam, function() SEF_USAEFASSSPAWN("Andersen AFB", "Tinian Intl") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////DRONE FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuDRONE_INC = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Andersen AFB", SupportMenuDRONE)
	
	--////DRONE Support Sector List
	
	SupportMenuDRONE_AND_Guam = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Guam Sectors", SupportMenuDRONE_INC)
	
	--////DEPARTING ANDERSEN AFB
	
	--////GUAM
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Andersen AFB", SupportMenuDRONE_AND_Guam, function() SEF_USAEFDRONESPAWN("Andersen AFB", "Andersen AFB") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Antonio B. Won Pat Intl", SupportMenuDRONE_AND_Guam, function() SEF_USAEFDRONESPAWN("Andersen AFB", "Antonio B. Won Pat Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rota Intl", SupportMenuDRONE_AND_Guam, function() SEF_USAEFDRONESPAWN("Andersen AFB", "Rota Intl") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Saipan Intl", SupportMenuDRONE_AND_Guam, function() SEF_USAEFDRONESPAWN("Andersen AFB", "Saipan Intl") end, nil)	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tinian Intl", SupportMenuDRONE_AND_Guam, function() SEF_USAEFDRONESPAWN("Andersen AFB", "Tinian Intl") end, nil)	
end	

--////End Radio Menu Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////OVERRIDE FUNCTIONS

function SEF_ToggleCustomSounds()

	if ( CustomSoundsEnabled == 0 ) then
		CustomSoundsEnabled = 1
		trigger.action.outText("Custom Sounds Are Now Enabled", 15)
	elseif ( CustomSoundsEnabled == 1 ) then
		CustomSoundsEnabled = 0
		trigger.action.outText("Custom Sounds Are Now Disabled", 15)
	else		
	end
end

function SEF_ClearAITankersFromCarrierDeck()
	if ( GROUP:FindByName(ARCOGROUPNAME) ~= nil and GROUP:FindByName(ARCOGROUPNAME):IsAlive() ) then
		Group.getByName(ARCOGROUPNAME):destroy()
		trigger.action.outText("Tanker Arco Has Been Cleared", 15)
	else
		trigger.action.outText("Tanker Arco Is Not Currently Deployed", 15)
	end	
end

--////End Override Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////BLUE AWACS/TANKER SPAWN

function SEF_USAFAWACS_SCHEDULER()    
	
	if ( GROUP:FindByName(USAFAWACSGROUPNAME) ~= nil and GROUP:FindByName(USAFAWACSGROUPNAME):IsAlive() ) then				
		timer.scheduleFunction(SEF_USAFAWACS_SCHEDULER, nil, timer.getTime() + 300)			
	else
		SEF_USAFAWACS_SPAWN()		
		timer.scheduleFunction(SEF_USAFAWACS_SCHEDULER, nil, timer.getTime() + 300)
	end		
end

function SEF_USAFHAWKEYE_SCHEDULER()    
	
	if ( GROUP:FindByName(USAFHAWKEYEGROUPNAME) ~= nil and GROUP:FindByName(USAFHAWKEYEGROUPNAME):IsAlive() ) then				
		timer.scheduleFunction(SEF_USAFHAWKEYE_SCHEDULER, nil, timer.getTime() + 300)			
	else
		SEF_USAFHAWKEYE_SPAWN()		
		timer.scheduleFunction(SEF_USAFHAWKEYE_SCHEDULER, nil, timer.getTime() + 300)
	end		
end

function SEF_USAFAWACS_SPAWN()

	USAFAWACS_DATA[1].Vec2 = nil
	USAFAWACS_DATA[1].TimeStamp = nil
	
	local Phase = SEF_BattlePhaseCheckSilent()
	
	if ( Phase <= 3 ) then
	
		local SpawnZone = AIRBASE:FindByName("Andersen AFB"):GetZone()
		local OrbitZone1 = ZONE:FindByName("AWACS Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("AWACS Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		USAFAWACS = SPAWN:NewWithAlias("Plane Template", "USAF AWACS"):InitRandomizeTemplate( { "USAF AWACS" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )								
					USAFAWACSGROUPNAME = SpawnGroup.GroupName
					USAFAWACSGROUPID = Group.getByName(USAFAWACSGROUPNAME):getID()
					USAFAWACSGROUP = GROUP:FindByName(SpawnGroup.GroupName)					
					
					Mission = {
						["id"] = "Mission",
						["params"] = {
							["route"] = 
							{
								["routeRelativeTOT"] = true,
								["points"] = 
								{
									--INITIAL WAYPOINT										
									[1] = 
									{
										["alt"] = 9144,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 236.94444444444,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
													--AWACS Tasking
													[1] = 
													{
														["number"] = 1,
														["auto"] = true,
														["id"] = "AWACS",
														["enabled"] = true,
														["params"] = 
														{
														}, -- end of ["params"]
													}, -- end of [1]
													--EPLRS On
													[2] = 
													{
														["number"] = 2,
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
																	["groupId"] = USAFAWACSGROUPID,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [2]
													--REACTION TO THREAT
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
																	["value"] = 0,
																	["name"] = 1,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [3]
													--NO REPORT WAYPOINT PASS ON
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
																	["value"] = true,
																	["name"] = 19,
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
									--WAYPOINT 1
									[2] = 
									{
										["alt"] = 9144,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 236.94444444444,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
													--RACE TRACK ORBIT
													[1] = 
													{
														["enabled"] = true,
														["auto"] = false,
														["id"] = "ControlledTask",
														["number"] = 1,
														["params"] = 
														{
															["task"] = 
															{
																["id"] = "Orbit",
																["params"] = 
																{
																	["altitude"] = 9144,
																	["pattern"] = "Race-Track",
																	["speed"] = 236.94444444444,
																	["speedEdited"] = true,
																}, -- end of ["params"]
															}, -- end of ["task"]
															["stopCondition"] = 
															{
																["duration"] = 14400,
															}, -- end of ["stopCondition"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 77.112869894106,
										["ETA_locked"] = false,
										["y"] = WP1Y, 							
										["x"] = WP1X, 							
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [2]
									--WAYPOINT 2
									[3] = 
									{
										["alt"] = 9144,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 236.94444444444,
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
										["ETA"] = 757.33218001675,
										["ETA_locked"] = false,
										["y"] = WP2Y, 							
										["x"] = WP2X, 							
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [3]
								}, -- end of ["points"]
							}, -- end of ["route"]
						}, --end of ["params"]
					}--end of Mission
					USAFAWACSGROUP:SetTask(Mission)		
				end
			)		
		:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {75}, SPAWN.Takeoff.Hot)
		env.info("AWACS Spawned Phase 1/2", false)
	else		
		local SpawnZone = AIRBASE:FindByName("Andersen AFB"):GetZone()
		local OrbitZone1 = ZONE:FindByName("AWACS Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("AWACS Orbit Point 1")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y
		
		USAFAWACS = SPAWN:NewWithAlias("Plane Template", "USAF AWACS"):InitRandomizeTemplate( { "USAF AWACS" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )								
					USAFAWACSGROUPNAME = SpawnGroup.GroupName
					USAFAWACSGROUPID = Group.getByName(USAFAWACSGROUPNAME):getID()
					USAFAWACSGROUP = GROUP:FindByName(SpawnGroup.GroupName)					
					
					Mission = {
						["id"] = "Mission",
						["params"] = {
							["route"] = 
							{
								["routeRelativeTOT"] = true,
								["points"] = 
								{
									--INITIAL WAYPOINT										
									[1] = 
									{
										["alt"] = 9144,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 236.94444444444,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
													--AWACS Tasking
													[1] = 
													{
														["number"] = 1,
														["auto"] = true,
														["id"] = "AWACS",
														["enabled"] = true,
														["params"] = 
														{
														}, -- end of ["params"]
													}, -- end of [1]
													--EPLRS On
													[2] = 
													{
														["number"] = 2,
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
																	["groupId"] = USAFAWACSGROUPID,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [2]
													--REACTION TO THREAT
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
																	["value"] = 0,
																	["name"] = 1,
																}, -- end of ["params"]
															}, -- end of ["action"]
														}, -- end of ["params"]
													}, -- end of [3]
													--NO REPORT WAYPOINT PASS ON
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
																	["value"] = true,
																	["name"] = 19,
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
									--WAYPOINT 1
									[2] = 
									{
										["alt"] = 9144,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 236.94444444444,
										["task"] = 
										{
											["id"] = "ComboTask",
											["params"] = 
											{
												["tasks"] = 
												{
													--RACE TRACK ORBIT
													[1] = 
													{
														["enabled"] = true,
														["auto"] = false,
														["id"] = "ControlledTask",
														["number"] = 1,
														["params"] = 
														{
															["task"] = 
															{
																["id"] = "Orbit",
																["params"] = 
																{
																	["altitude"] = 9144,
																	["pattern"] = "Race-Track",
																	["speed"] = 236.94444444444,
																	["speedEdited"] = true,
																}, -- end of ["params"]
															}, -- end of ["task"]
															["stopCondition"] = 
															{
																["duration"] = 14400,
															}, -- end of ["stopCondition"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 77.112869894106,
										["ETA_locked"] = false,
										["y"] = WP1Y, 											
										["x"] = WP1X, 											
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [2]
									--WAYPOINT 2
									[3] = 
									{
										["alt"] = 9144,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 236.94444444444,
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
										["ETA"] = 757.33218001675,
										["ETA_locked"] = false,
										["y"] = WP2Y, 											
										["x"] = WP2X, 											
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [3]
								}, -- end of ["points"]
							}, -- end of ["route"]
						}, --end of ["params"]
					}--end of Mission
					USAFAWACSGROUP:SetTask(Mission)		
				end
			)		
		:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {75}, SPAWN.Takeoff.Hot)
		env.info("AWACS Spawned Phase 3/4", false)
	end	
end

function SEF_USAFHAWKEYE_SPAWN()

	USAFHAWKEYE_DATA[1].Vec2 		= nil
	USAFHAWKEYE_DATA[1].TimeStamp 	= nil
	
	local SpawnZone = AIRBASE:FindByName("CV-59 Forrestal"):GetZone()
	local OrbitZone1 = ZONE:FindByName("HAWKEYE Orbit Point 1")
	local OrbitZone2 = ZONE:FindByName("HAWKEYE Orbit Point 2")
		
	local DepartureZoneVec2 = SpawnZone:GetVec2()
	local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
	local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
	
	local WP0X = DepartureZoneVec2.x
	local WP0Y = DepartureZoneVec2.y
	local WP1X = OrbitZone1Vec2.x
	local WP1Y = OrbitZone1Vec2.y
	local WP2X = OrbitZone2Vec2.x
	local WP2Y = OrbitZone2Vec2.y		
	
	USAFHAWKEYE = SPAWN:NewWithAlias("Plane Template", "USAF Hawkeye"):InitRandomizeTemplate( { "USAF Hawkeye" } )
				
		:OnSpawnGroup(
			function( SpawnGroup )								
				USAFHAWKEYEGROUPNAME = SpawnGroup.GroupName
				USAFHAWKEYEGROUPID = Group.getByName(USAFHAWKEYEGROUPNAME):getID()
				USAFHAWKEYEGROUP = GROUP:FindByName(SpawnGroup.GroupName)					
				
				Mission = {
					["id"] = "Mission",
					["params"] = {
						["route"] = 
						{
							["routeRelativeTOT"] = true,
							["points"] = 
							{
								--INITIAL WAYPOINT										
								[1] = 
								{
									["alt"] = 8382,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 166.66666666667,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												--AWACS Tasking
												[1] = 
												{
													["number"] = 1,
													["auto"] = true,
													["id"] = "AWACS",
													["enabled"] = true,
													["params"] = 
													{
													}, -- end of ["params"]
												}, -- end of [1]
												--EPLRS On
												[2] = 
												{
													["number"] = 2,
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
																["groupId"] = USAFHAWKEYEGROUPID,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												--REACTION TO THREAT
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
																["value"] = 0,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [3]
												--NO REPORT WAYPOINT PASS ON
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
																["value"] = true,
																["name"] = 19,
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
								--WAYPOINT 1
								[2] = 
								{
									["alt"] = 8382,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 166.66666666667,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												--RACE TRACK ORBIT
												[1] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "ControlledTask",
													["number"] = 1,
													["params"] = 
													{
														["task"] = 
														{
															["id"] = "Orbit",
															["params"] = 
															{
																["altitude"] = 8382,
																["pattern"] = "Race-Track",
																["speed"] = 166.66666666667,
																["speedEdited"] = true,
															}, -- end of ["params"]
														}, -- end of ["task"]
														["stopCondition"] = 
														{
															["duration"] = 14400,
														}, -- end of ["stopCondition"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 77.112869894106,
									["ETA_locked"] = false,
									["y"] = WP1Y, 							
									["x"] = WP1X, 							
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								--WAYPOINT 2
								[3] = 
								{
									["alt"] = 8382,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 166.66666666667,
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
									["ETA"] = 757.33218001675,
									["ETA_locked"] = false,
									["y"] = WP2Y, 							
									["x"] = WP2X, 							
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission
				USAFHAWKEYEGROUP:SetTask(Mission)		
			end
		)		
	:SpawnAtAirbase( AIRBASE:FindByName( "CV-59 Forrestal" ), SPAWN.Takeoff.Hot )	
	env.info("HAWKEYE Spawned Phase 1/2", false)		
end

function SEF_TEXACO_SCHEDULER()    
	
	if ( GROUP:FindByName(TEXACOGROUPNAME) ~= nil and GROUP:FindByName(TEXACOGROUPNAME):IsAlive() ) then				
		timer.scheduleFunction(SEF_TEXACO_SCHEDULER, nil, timer.getTime() + 300)			
	else
		SEF_TEXACO_SPAWN()		
		timer.scheduleFunction(SEF_TEXACO_SCHEDULER, nil, timer.getTime() + 300)
	end		
end

function SEF_TEXACO_SPAWN()	
			
	TEXACO_DATA[1].Vec2 = nil
	TEXACO_DATA[1].TimeStamp = nil
	
	local Phase = SEF_BattlePhaseCheckSilent()
	
	if ( Phase <= 2 ) then	
		
		local SpawnZone = AIRBASE:FindByName("Andersen AFB"):GetZone()
		local OrbitZone1 = ZONE:FindByName("Texaco Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Texaco Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		TEXACO = SPAWN:NewWithAlias("Plane Template", "22nd ARW Texaco"):InitRandomizeTemplate( { "22nd ARW Texaco" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )								
					TEXACOGROUPNAME = SpawnGroup.GroupName
					TEXACOGROUPID = Group.getByName(TEXACOGROUPNAME):getID()
					TEXACOGROUP = GROUP:FindByName(SpawnGroup.GroupName)					
					TEXACOUNIT = Group.getByName(TEXACOGROUPNAME):getUnit(1)					
					TEXACOUNITID = TEXACOUNIT:getID()					
					
					--Speed 203.41105341598
					--Altitude 4877
					
					Mission = {
						["id"] = "Mission",
						["params"] = {													
							["route"] = 
							{
								["routeRelativeTOT"] = true,
								["points"] = 
								{
									[1] = 
									{
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 203.41105341598,
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
														["id"] = "Tanker",
														["enabled"] = true,
														["params"] = 
														{
														}, -- end of ["params"]
													}, -- end of [1]
													[2] = 
													{
														["number"] = 2,
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
																	["AA"] = true,
																	["callsign"] = "TXC",
																	["modeChannel"] = "Y",
																	["channel"] = 13,
																	["system"] = 5,
																	["unitId"] = TEXACOUNITID,		
																	["bearing"] = true,
																	["frequency"] = 1100000000,
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
																	["name"] = 19,
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
																	["value"] = 0,
																	["name"] = 1,
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
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 203.41105341598,
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
														["id"] = "ControlledTask",
														["number"] = 1,
														["params"] = 
														{
															["task"] = 
															{
																["id"] = "Orbit",
																["params"] = 
																{
																	["altitude"] = 4877,
																	["pattern"] = "Race-Track",
																	["speed"] = 203.33333333333,
																	["speedEdited"] = true,
																}, -- end of ["params"]
															}, -- end of ["task"]
															["stopCondition"] = 
															{
																["duration"] = 14400,
															}, -- end of ["stopCondition"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 233.85122967908,
										["ETA_locked"] = false,
										["y"] = WP1Y, 												
										["x"] = WP1X, 												
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [2]
									[3] = 
									{
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 203.41105341598,
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
										["ETA"] = 630.20431451704,
										["ETA_locked"] = false,
										["y"] = WP2Y, 													
										["x"] = WP2X, 													
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [3]
								}, -- end of ["points"]
							}, -- end of ["route"]														
						}, --end of ["params"]
					}--end of Mission
					TEXACOGROUP:SetTask(Mission)					
				end
			)		
		:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {72}, SPAWN.Takeoff.Hot)
		env.info("TEXACO Spawned Phase 1/2", false)
	else
		local SpawnZone = AIRBASE:FindByName("Andersen AFB"):GetZone()
		local OrbitZone1 = ZONE:FindByName("Texaco Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Texaco Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		TEXACO = SPAWN:NewWithAlias("Plane Template", "22nd ARW Texaco"):InitRandomizeTemplate( { "22nd ARW Texaco" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )								
					TEXACOGROUPNAME = SpawnGroup.GroupName
					TEXACOGROUPID = Group.getByName(TEXACOGROUPNAME):getID()
					TEXACOGROUP = GROUP:FindByName(SpawnGroup.GroupName)					
					TEXACOUNIT = Group.getByName(TEXACOGROUPNAME):getUnit(1)					
					TEXACOUNITID = TEXACOUNIT:getID()					
					
					--Speed 203.41105341598
					--Altitude 4877
					
					Mission = {
						["id"] = "Mission",
						["params"] = {													
							["route"] = 
							{
								["routeRelativeTOT"] = true,
								["points"] = 
								{
									[1] = 
									{
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 203.41105341598,
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
														["id"] = "Tanker",
														["enabled"] = true,
														["params"] = 
														{
														}, -- end of ["params"]
													}, -- end of [1]
													[2] = 
													{
														["number"] = 2,
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
																	["AA"] = true,
																	["callsign"] = "TXC",
																	["modeChannel"] = "Y",
																	["channel"] = 13,
																	["system"] = 5,
																	["unitId"] = TEXACOUNITID,		
																	["bearing"] = true,
																	["frequency"] = 1100000000,
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
																	["name"] = 19,
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
																	["value"] = 0,
																	["name"] = 1,
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
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 203.41105341598,
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
														["id"] = "ControlledTask",
														["number"] = 1,
														["params"] = 
														{
															["task"] = 
															{
																["id"] = "Orbit",
																["params"] = 
																{
																	["altitude"] = 4877,
																	["pattern"] = "Race-Track",
																	["speed"] = 203.33333333333,
																	["speedEdited"] = true,
																}, -- end of ["params"]
															}, -- end of ["task"]
															["stopCondition"] = 
															{
																["duration"] = 14400,
															}, -- end of ["stopCondition"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 233.85122967908,
										["ETA_locked"] = false,
										["y"] = WP1Y, 										
										["x"] = WP1X, 										
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [2]
									[3] = 
									{
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 203.41105341598,
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
										["ETA"] = 630.20431451704,
										["ETA_locked"] = false,
										["y"] = WP2Y, 										
										["x"] = WP2X, 										
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [3]
								}, -- end of ["points"]
							}, -- end of ["route"]														
						}, --end of ["params"]
					}--end of Mission
					TEXACOGROUP:SetTask(Mission)					
				end
			)		
		:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {72}, SPAWN.Takeoff.Hot)
		env.info("TEXACO Spawned Phase 3/4", false)
	end	
end

function SEF_SHELL_SCHEDULER()    
	
	if ( GROUP:FindByName(SHELLGROUPNAME) ~= nil and GROUP:FindByName(SHELLGROUPNAME):IsAlive() ) then				
		timer.scheduleFunction(SEF_SHELL_SCHEDULER, nil, timer.getTime() + 300)			
	else
		SEF_SHELL_SPAWN()		
		timer.scheduleFunction(SEF_SHELL_SCHEDULER, nil, timer.getTime() + 300)
	end		
end

function SEF_SHELL_SPAWN()	
			
	SHELL_DATA[1].Vec2 = nil
	SHELL_DATA[1].TimeStamp = nil
	
	local Phase = SEF_BattlePhaseCheckSilent()
	
	if ( Phase <= 2 ) then
		
		local SpawnZone = AIRBASE:FindByName("Andersen AFB"):GetZone()
		local OrbitZone1 = ZONE:FindByName("Shell Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Shell Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		SHELL = SPAWN:NewWithAlias("Plane Template", "22nd ARW Shell"):InitRandomizeTemplate( { "22nd ARW Shell" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )								
					SHELLGROUPNAME = SpawnGroup.GroupName
					SHELLGROUPID = Group.getByName(SHELLGROUPNAME):getID()
					SHELLGROUP = GROUP:FindByName(SpawnGroup.GroupName)					
					SHELLUNIT = Group.getByName(SHELLGROUPNAME):getUnit(1)					
					SHELLUNITID = SHELLUNIT:getID()					
					
					--Speed 146.11111111111
					--Altitude 4877
					
					Mission = {
						["id"] = "Mission",
						["params"] = {													
							["route"] = 
							{
								["routeRelativeTOT"] = true,
								["points"] = 
								{
									[1] = 
									{
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 146.11111111111,
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
														["id"] = "Tanker",
														["enabled"] = true,
														["params"] = 
														{
														}, -- end of ["params"]
													}, -- end of [1]
													[2] = 
													{
														["number"] = 2,
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
																	["AA"] = true,
																	["callsign"] = "SHL",
																	["modeChannel"] = "Y",
																	["channel"] = 14,
																	["system"] = 5,
																	["unitId"] = SHELLUNITID, 			
																	["bearing"] = true,
																	["frequency"] = 1101000000,
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
																	["name"] = 19,
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
																	["value"] = 0,
																	["name"] = 1,
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
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 146.11111111111,
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
														["id"] = "ControlledTask",
														["number"] = 1,
														["params"] = 
														{
															["task"] = 
															{
																["id"] = "Orbit",
																["params"] = 
																{
																	["altitude"] = 4877,
																	["pattern"] = "Race-Track",
																	["speed"] = 146.11111111111,
																	["speedEdited"] = true,
																}, -- end of ["params"]
															}, -- end of ["task"]
															["stopCondition"] = 
															{
																["duration"] = 14400,
															}, -- end of ["stopCondition"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 393.3185689134,
										["ETA_locked"] = false,
										["y"] = WP1Y, 											
										["x"] = WP1X, 											
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [2]
									[3] = 
									{
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 146.11111111111,
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
										["ETA"] = 982.71000726736,
										["ETA_locked"] = false,
										["y"] = WP2Y, 											
										["x"] = WP2X, 											
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [3]
								}, -- end of ["points"]
							}, -- end of ["route"]														
						}, --end of ["params"]
					}--end of Mission
					SHELLGROUP:SetTask(Mission)
				end
			)		
		:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {48}, SPAWN.Takeoff.Hot)
		env.info("SHELL Spawned Phase 1/2", false)
	else
		
		local SpawnZone = AIRBASE:FindByName("Andersen AFB"):GetZone()
		local OrbitZone1 = ZONE:FindByName("Shell Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Shell Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		SHELL = SPAWN:NewWithAlias("Plane Template", "22nd ARW Shell"):InitRandomizeTemplate( { "22nd ARW Shell" } )
		
			:OnSpawnGroup(
				function( SpawnGroup )								
					SHELLGROUPNAME = SpawnGroup.GroupName
					SHELLGROUPID = Group.getByName(SHELLGROUPNAME):getID()
					SHELLGROUP = GROUP:FindByName(SpawnGroup.GroupName)					
					SHELLUNIT = Group.getByName(SHELLGROUPNAME):getUnit(1)					
					SHELLUNITID = SHELLUNIT:getID()				
					
					--Speed 146.11111111111
					--Altitude 4877
					
					Mission = {
						["id"] = "Mission",
						["params"] = {													
							["route"] = 
							{
								["routeRelativeTOT"] = true,
								["points"] = 
								{
									[1] = 
									{
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 146.11111111111,
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
														["id"] = "Tanker",
														["enabled"] = true,
														["params"] = 
														{
														}, -- end of ["params"]
													}, -- end of [1]
													[2] = 
													{
														["number"] = 2,
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
																	["AA"] = true,
																	["callsign"] = "SHL",
																	["modeChannel"] = "Y",
																	["channel"] = 14,
																	["system"] = 5,
																	["unitId"] = SHELLUNITID, 			
																	["bearing"] = true,
																	["frequency"] = 1101000000,
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
																	["name"] = 19,
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
																	["value"] = 0,
																	["name"] = 1,
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
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 146.11111111111,
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
														["id"] = "ControlledTask",
														["number"] = 1,
														["params"] = 
														{
															["task"] = 
															{
																["id"] = "Orbit",
																["params"] = 
																{
																	["altitude"] = 4877,
																	["pattern"] = "Race-Track",
																	["speed"] = 146.11111111111,
																	["speedEdited"] = true,
																}, -- end of ["params"]
															}, -- end of ["task"]
															["stopCondition"] = 
															{
																["duration"] = 14400,
															}, -- end of ["stopCondition"]
														}, -- end of ["params"]
													}, -- end of [1]
												}, -- end of ["tasks"]
											}, -- end of ["params"]
										}, -- end of ["task"]
										["type"] = "Turning Point",
										["ETA"] = 393.3185689134,
										["ETA_locked"] = false,
										["y"] = WP1Y, 										
										["x"] = WP1X, 										
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [2]
									[3] = 
									{
										["alt"] = 4877,
										["action"] = "Turning Point",
										["alt_type"] = "BARO",
										["speed"] = 146.11111111111,
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
										["ETA"] = 982.71000726736,
										["ETA_locked"] = false,
										["y"] = WP2Y, 										
										["x"] = WP2X, 										
										["formation_template"] = "",
										["speed_locked"] = true,
									}, -- end of [3]
								}, -- end of ["points"]
							}, -- end of ["route"]														
						}, --end of ["params"]
					}--end of Mission
					SHELLGROUP:SetTask(Mission)
				end
			)		
		:SpawnAtParkingSpot(AIRBASE:FindByName("Andersen AFB"), {48}, SPAWN.Takeoff.Hot)		
		env.info("SHELL Spawned Phase 3/4", false)
	end
end

function SEF_ARCO_SCHEDULER()    
	
	if ( GROUP:FindByName(ARCOGROUPNAME) ~= nil and GROUP:FindByName(ARCOGROUPNAME):IsAlive() ) then				
		timer.scheduleFunction(SEF_ARCO_SCHEDULER, nil, timer.getTime() + 300)			
	else
		SEF_ARCO_SPAWN()		
		timer.scheduleFunction(SEF_ARCO_SCHEDULER, nil, timer.getTime() + 300)
	end		
end

function SEF_ARCO_SPAWN()	
			
	ARCO_DATA[1].Vec2 = nil
	ARCO_DATA[1].TimeStamp = nil
	
	local SpawnZone = AIRBASE:FindByName("CVN-72 Abraham Lincoln"):GetZone()
	local OrbitZone1 = ZONE:FindByName("Arco Orbit Point 1")
	local OrbitZone2 = ZONE:FindByName("Arco Orbit Point 2")
		
	local DepartureZoneVec2 = SpawnZone:GetVec2()
	local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
	local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
	
	local WP0X = DepartureZoneVec2.x
	local WP0Y = DepartureZoneVec2.y
	local WP1X = OrbitZone1Vec2.x
	local WP1Y = OrbitZone1Vec2.y
	local WP2X = OrbitZone2Vec2.x
	local WP2Y = OrbitZone2Vec2.y
		
	ARCO = SPAWN:NewWithAlias("Plane Template", "22nd ARW Arco"):InitRandomizeTemplate( { "22nd ARW Arco" } )
	
		:OnSpawnGroup(
			function( SpawnGroup )								
				ARCOGROUPNAME = SpawnGroup.GroupName
				ARCOGROUPID = Group.getByName(ARCOGROUPNAME):getID()				
				ARCOGROUP = GROUP:FindByName(SpawnGroup.GroupName)					
				ARCOUNIT = Group.getByName(ARCOGROUPNAME):getUnit(1)					
				ARCOUNITID = ARCOUNIT:getID()				
				
				Mission = {
					["id"] = "Mission",
					["params"] = {													
						["route"] = 
						{
							["routeRelativeTOT"] = true,
							["points"] = 
							{
								[1] = 
								{
									["alt"] = 2000,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["linkUnit"] = 1,
									["helipadId"] = 1,
									["speed"] = 162.3555157671,
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
													["id"] = "Tanker",
													["enabled"] = true,
													["params"] = 
													{
													}, -- end of ["params"]
												}, -- end of [1]
												[2] = 
												{
													["number"] = 2,
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
																["AA"] = true,
																["callsign"] = "ARC",
																["modeChannel"] = "Y",
																["channel"] = 38,
																["system"] = 5,
																["unitId"] = ARCOUNITID, 			
																["bearing"] = true,
																["frequency"] = 1125000000,
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
																["name"] = 19,
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
																["value"] = 0,
																["name"] = 1,
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
									["alt"] = 2000,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 162.3555157671,
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
													["id"] = "ControlledTask",
													["number"] = 1,
													["params"] = 
													{
														["task"] = 
														{
															["id"] = "Orbit",
															["params"] = 
															{
																["altitude"] = 2000,
																["pattern"] = "Race-Track",
																["speed"] = 162.22222222222,
																["speedEdited"] = true,
															}, -- end of ["params"]
														}, -- end of ["task"]
														["stopCondition"] = 
														{
															["duration"] = 3600,
														}, -- end of ["stopCondition"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 206.45134846902,
									["ETA_locked"] = false,
									["y"] = WP1Y, 														
									["x"] = WP1X, 														
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = 2000,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 162.3555157671,
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
									["ETA"] = 730.21335886926,
									["ETA_locked"] = false,
									["y"] = WP2Y, 														
									["x"] = WP2X, 														
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
							}, -- end of ["points"]
						}, -- end of ["route"]														
					}, --end of ["params"]
				}--end of Mission
				ARCOGROUP:SetTask(Mission)			
			end
		)		
	:SpawnAtAirbase( AIRBASE:FindByName( "CVN-72 Abraham Lincoln" ), SPAWN.Takeoff.Hot )
	env.info("ARCO Spawned", false)
end

--////End Blue Awacs/Tankers Spawn
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////TARGET SMOKE FUNCTIONS

function SEF_TargetSmokeLock()
	TargetSmokeLockout = 1
end

function SEF_TargetSmokeUnlock()
	TargetSmokeLockout = 0
end

function SEF_TargetSmoke()
	
	if ( TargetSmokeLockout == 0 ) then
		if ( AGTargetTypeStatic == false and AGMissionTarget ~= nil ) then
			--TARGET IS NOT STATIC					
			if ( GROUP:FindByName(AGMissionTarget):IsAlive() == true ) then
				--GROUP VALID
				SEFTargetSmokeGroupCoord = GROUP:FindByName(AGMissionTarget):GetCoordinate()
				SEFTargetSmokeGroupCoord:SmokeRed()
				--SEFTargetSmokeGroupCoord:SmokeBlue()
				--SEFTargetSmokeGroupCoord:SmokeGreen()
				--SEFTargetSmokeGroupCoord:SmokeOrange()
				--SEFTargetSmokeGroupCoord:SmokeWhite()
				
				if ( CustomSoundsEnabled == 1) then
					trigger.action.outSound('Target Smoke.ogg')
				else
				end	
				trigger.action.outText("Target Has Been Marked With Red Smoke", 15)
				SEF_TargetSmokeLock()
				timer.scheduleFunction(SEF_TargetSmokeUnlock, 53, timer.getTime() + 300)				
			else			
				trigger.action.outText("Target Smoke Currently Unavailable - Unable To Acquire Target Group", 15)						
			end		
		elseif ( AGTargetTypeStatic == true and AGMissionTarget ~= nil ) then		
			--TARGET IS STATIC		
			if ( StaticObject.getByName(AGMissionTarget) ~= nil and StaticObject.getByName(AGMissionTarget):isExist() == true ) then
				--STATIC IS VALID
				SEFTargetSmokeStaticCoord = STATIC:FindByName(AGMissionTarget):GetCoordinate()
				SEFTargetSmokeStaticCoord:SmokeRed()
				--SEFTargetSmokeStaticCoord:SmokeBlue()
				--SEFTargetSmokeStaticCoord:SmokeGreen()
				--SEFTargetSmokeStaticCoord:SmokeOrange()
				--SEFTargetSmokeStaticCoord:SmokeWhite()
				if ( CustomSoundsEnabled == 1) then
					trigger.action.outSound('Target Smoke.ogg')
				else
				end		
				trigger.action.outText("Target Has Been Marked With Red Smoke", 15)
				SEF_TargetSmokeLock()
				timer.scheduleFunction(SEF_TargetSmokeUnlock, 53, timer.getTime() + 300)				
			else
				trigger.action.outText("Target Smoke Currently Unavailable - Unable To Acquire Target Building", 15)	
			end			
		else		
			trigger.action.outText("Target Smoke Currently Unavailable - No Valid Targets", 15)
		end
	else
		trigger.action.outText("Target Smoke Currently Unavailable - Smoke Shells Are Being Reloaded", 15)
	end	
end

--////End Target Smoke Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////OTHER FUNCTIONS

function SEF_BattlePhaseCheck()

--[[
	"Antonio B. Won Pat Intl"
	"Andersen AFB"
	"Rota Intl"
	"Tinian Intl"
	"Saipan Intl"
]]--	
	
	if ( 		Airbase.getByName("Antonio B. Won Pat Intl"):getCoalition() ~= 2 or
				Airbase.getByName("Andersen AFB"):getCoalition() ~= 2 ) then			
				
				--Then we must be in Phase 1
				trigger.action.outText("Mission Objective\n\nPhase 1 - Secure Southern Guam\n\nThe Following Territories Must Be Captured And Held:\n\nAntonio B. Won Pat Intl\nAndersen AFB", 15)
	
	elseif ( 	Airbase.getByName("Rota Intl"):getCoalition() ~= 2 ) then
				
				--Then we must be in Phase 2
				trigger.action.outText("Mission Objective\n\nPhase 2 - Secure Central Guam\n\nThe Following Territories Must Be Captured And Held:\n\nRota Intl", 15)
				
	elseif (	Airbase.getByName("Tinian Intl"):getCoalition() ~= 2 or
				Airbase.getByName("Saipan Intl"):getCoalition() ~= 2 ) then
	
				--Then we must be in Phase 3
				trigger.action.outText("Mission Objective\n\nPhase 3 - Secure Northern Guam\n\nThe Following Territories Must Be Captured And Held:\n\nTinian Intl\nSaipan Intl", 15)

	elseif (	Airbase.getByName("Antonio B. Won Pat Intl"):getCoalition() == 2 and
				Airbase.getByName("Andersen AFB"):getCoalition() 			== 2 and
				Airbase.getByName("Rota Intl"):getCoalition() 				== 2 and
				Airbase.getByName("Tinian Intl"):getCoalition() 			== 2 and 
				Airbase.getByName("Saipan Intl"):getCoalition() 			== 2 ) then		
				
				--Take And Hold Victory Achieved
				trigger.action.outText("Operation Sea Slug - Operation Has Been Successful - Take And Hold Victory Achieved", 60)
				
				OperationComplete = true
				SEF_VictoryAchieved()
	
	else
		trigger.action.outText("Unable To Determine Phase", 15)
	end
end

function SEF_BattlePhaseCheckSilent()

	if ( 		Airbase.getByName("Antonio B. Won Pat Intl"):getCoalition() ~= 2 or
				Airbase.getByName("Andersen AFB"):getCoalition() 			~= 2 ) then
			
				--Then we must be in Phase 1
				return 1
	
	elseif ( 	Airbase.getByName("Rota Intl"):getCoalition() 				~= 2 ) then
				
				--Then we must be in Phase 2
				return 2
				
	elseif (	Airbase.getByName("Tinian Intl"):getCoalition() 			~= 2 or
				Airbase.getByName("Saipan Intl"):getCoalition() 			~= 2 ) then
	
				--Then we must be in Phase 3
				return 3
				
	elseif (	Airbase.getByName("Antonio B. Won Pat Intl"):getCoalition() == 2 and
				Airbase.getByName("Andersen AFB"):getCoalition() 			== 2 and
				Airbase.getByName("Rota Intl"):getCoalition() 				== 2 and
				Airbase.getByName("Tinian Intl"):getCoalition() 			== 2 and 
				Airbase.getByName("Saipan Intl"):getCoalition() 			== 2 ) then		
				
				--Then we have completed Phase 3
				return 4
	else
		return 1
	end
end

function SEF_TestMissionList()

	--This function should only be run to perform integrity check on the mission list before any targets are killed
	MissionListErrors = 0
	
	for i = 1, #OperationSeaSlug_AG do		
		--trigger.action.outText("Looking at element "..i,15)
		if ( OperationSeaSlug_AG[i].TargetStatic == true ) then
			if ( StaticObject.getByName(OperationSeaSlug_AG[i].TargetName) ~= nil ) then
				--Pass
			else
				trigger.action.outText("Static "..OperationSeaSlug_AG[i].TargetName.." Could Not Be Found", 15)
				MissionListErrors = MissionListErrors + 1
			end			
		else
			if ( Group.getByName(OperationSeaSlug_AG[i].TargetName) ~=nil ) then
				--Pass
			else
				trigger.action.outText("Group "..OperationSeaSlug_AG[i].TargetName.." Could Not Be Found", 15)
				MissionListErrors = MissionListErrors + 1
			end			
		end	
	end
	
	if MissionListErrors > 0 then
		trigger.action.outText("Warning - Mission List "..MissionListErrors.." Errors", 15)
	else
		trigger.action.outText("Mission List Passed Integrity Check", 15)
	end		
end

function SEF_TomahawkRegen()
	
	TomahawkMissilesAvailable = TomahawkMissilesAvailable + 1
	
	trigger.action.outText("Tomahawk Missile Strike Ready, We Have "..TomahawkMissilesAvailable.." Available", 15)
	
	timer.scheduleFunction(SEF_TomahawkRegen, nil, timer.getTime() + 1800)
end

function SEF_ScudStrike()
	
	--It takes about 30 minutes to reload a Scud once it is fired, and about 8 minutes or so to launch them ... roughly.
	--////Launch Codes - (Cruise Missile 2097152) (Any ASM 4161536 )
	
	local ScudGroupName = nil
	
	if ( GROUP:FindByName("Sinapalu - Scud Launcher"):IsAlive() == true ) then		
		ScudGroupName = "Sinapalu - Scud Launcher"	
	elseif ( GROUP:FindByName("Puetto - Scud Launcher"):IsAlive() == true ) then		
		ScudGroupName = "Puetto - Scud Launcher"	
	elseif ( GROUP:FindByName("Susupe - Scud Launcher"):IsAlive() == true ) then	
		ScudGroupName = "Susupe - Scud Launcher"		
	else
		--Scud Launchers Are All Dead ... Oh Well
		ScudGroupName = nil
		trigger.action.outText("Fail!", 15)
	end
	
	if ( ScudGroupName ~= nil ) then
	
		local Randomiser = math.random(1, #ScudTargets)
		local ScudTargetZone = ScudTargets[Randomiser]
					
		ScudTargetZoneVec2 = ZONE:FindByName(ScudTargetZone):GetVec2()		
		
		local ScudStrikeLocation = {}
		ScudStrikeLocation.point = ScudTargetZoneVec2
		ScudStrikeLocation.radius = 250
		ScudStrikeLocation.expendQtyEnabled = true
		ScudStrikeLocation.expendQty = 4
		ScudStrikeLocation.weaponType = 4161536

		local ExecuteStrike = {id = 'FireAtPoint', params = ScudStrikeLocation}
		Group.getByName(ScudGroupName):getController():pushTask(ExecuteStrike)
						
		trigger.action.outText("The North Koreans Are Preparing To Launch Scud Missiles!", 15)
	
		timer.scheduleFunction(SEF_ScudStrike, nil, timer.getTime() + math.random(2700, 3600))
	else
	end
end

--////End Other Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MAIN
	
	trigger.action.outSound('Background Chatter.ogg')
	
	--////GLOBAL VARIABLE INITIALISATION	
	NumberOfCompletedMissions = 0
	TotalScenarios = 60
	OperationComplete = false
	CustomSoundsEnabled = 1
	SoundLockout = 0
	TargetSmokeLockout = 0	
						
	--////FUNCTIONS
	SEF_InitializeMissionTable()
	--SEF_TestMissionList()
	timer.scheduleFunction(SEF_MissionSelector, 53, timer.getTime() + 16)
	SEF_RadioMenuSetup()
	
	--////START SUPPORT FLIGHT SCHEDULERS, DELAY ARCO BY 15 MINUTES TO ALLOW CARRIER PLANES TO SPAWN AND CLEAR DECK
	SEF_USAFAWACS_SCHEDULER()	
	SEF_TEXACO_SCHEDULER()
	SEF_SHELL_SCHEDULER()	
	
	--timer.scheduleFunction(SEF_USAFHAWKEYE_SCHEDULER, nil, timer.getTime() + 60)
	timer.scheduleFunction(SEF_ARCO_SCHEDULER, nil, timer.getTime() + 900)
		
	--////SCHEDULERS
	--MISSION TARGET STATUS
	timer.scheduleFunction(SEF_MissionTargetStatus, 53, timer.getTime() + 26)
	--START TOMAHAWK REGEN
	timer.scheduleFunction(SEF_TomahawkRegen, nil, timer.getTime() + 27)	
	--MISSION STATUS
	timer.scheduleFunction(SEF_MissionStatus, nil, timer.getTime() + 300)
	--HILARIOUSLY BAD SCUD STRIKES
	timer.scheduleFunction(SEF_ScudStrike, nil, timer.getTime() + 600)	
	
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--[[

998 Kunlun Shan							CR16
Russian SAG 1							BS68
Chinese SAG 1							DR39
Chinese SAG 2							CS57
980 Longhu Shan							CS68
Rota - SA-2								CR06
Sinapalu - SA-2							CR16
Sinapalu - SA-3							CR06
Aguijan - HQ-7							CS44
Koblerville - SA-10						CS67
Saipan - SA-15							CS67
Tinian - SA-15							CS55
San Jose - Cargo Ship					CS55
Puerto Rico - Cargo Ship				CS68
Rota - Speedboat						CR06/CR16
Songsong - Speedboat					BR96/CR06
Songsong - Armor						BR96
Rota - SA-15							CR06
Puetto - SA-11							CS55
Sinapalu - AAA							CR06/CR16
Rota - AAA								CR06
B-262 Stary Oskoi						BT97
B-871 Alrosa							ZB19
403 Changzheng 3						DS88
404 Changzheng 4						DR83
Seawise Giant							CR18
Handy Wind								CS43
Rota - Communications Tower				CR06
Sinapalu - Scud Launcher				CR16
Sinapalu - SA-15						CR16	
San Jose - Silkworm						CS55
Tinian - AAA							CS55
Puerto Rico - SA-11						CS68
Sinapalu - EWR							CR16
Tinian - EWR							CS55
Saipan - EWR							CS67
Tinian - Communications Tower			CS56
Garapan - SA-15							CS68
Garapan - AAA							CS68
Puerto Rico - Speedboat					CS68
San Jose - SA-8							CS55
San Jose - AAA							CS55
Puetto - AAA							CS55
Puetto - Scud Launcher					CS55
Sinapalu - Armor						CR16
Tachungnya - Armor						CS55
Tachungnya - Mi-8MTV2					CS55
Tachungnya - AAA						CS55	
Puetto - Armor							CS55
San Jose - Armor						CS55
Puerto Rico - Armor						CS68
Susupe - Scud Launcher					CS67
Susupe - SA-19							CS67
Garapan - Armor							CS68
Tinian - Armor							CS55
Mulatu - AAA							CS56
Mulatu - Armor							CS56
Mulatu - SA-19							CS56
Susupe - Armor							CS67
Saipan - AAA							CS67

]]--
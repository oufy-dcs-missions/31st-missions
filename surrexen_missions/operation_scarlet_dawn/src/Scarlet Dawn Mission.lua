--////////////////////////////////////////////////////////////////
-- Name: Operation Scarlet Dawn - Mission Logic Module
-- Author: Surrexen    ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ 
--////////////////////////////////////////////////////////////////

--////VARIABLES

USAEFCAPGROUPNAME 			= ""
USAEFSEADGROUPNAME 			= ""
USAEFCASGROUPNAME 			= ""
USAEFASSGROUPNAME 			= ""
USAEFPINGROUPNAME 			= ""
USAEFDRONEGROUPNAME 		= ""
USAFAWACSGROUPNAME 			= ""
USAFHAWKEYEGROUPNAME 		= ""
TEXACOGROUPNAME 			= ""
SHELLGROUPNAME 				= ""
ARCOGROUPNAME 				= ""

TomahawkMissilesAvailable 	= 0
TomahawkCooldown			= 1800

function SEF_VictoryAchieved()	
	
	timer.scheduleFunction(SEF_DeleteCampaignProgress, nil, timer.getTime() + 59)
	
	--VICTORY -- SET FLAG FOR MISSION EDITOR TRIGGER RESTART
	trigger.action.setUserFlag(1337,1)
	trigger.action.outText("Operation Scarlet Dawn - Mission Will Restart In 1 Minute", 60)
end

function SEF_DeleteCampaignProgress()
	
	--WRITE PROGRESS TABLES TO EMPTY AND SAVE WITH NO ARGUMENTS
	ScarletDawnUnitInterment 				= {}
	ScarletDawnStaticInterment 				= {}
	ScarletDawnAirbases 					= {}
	ScarletDawnConstructions 				= {}
	
	SEF_SaveUnitIntermentTableNoArgs()	
	SEF_SaveStaticIntermentTableNoArgs()	
	SEF_SaveAirbasesTableNoArgs()	
	SEF_SaveConstructedItemsTableNoArgs()
end

--////MISSION LOGIC FUNCTIONS
function SEF_MissionSelector()	
	
	if ( NumberOfCompletedMissions >= TotalScenarios ) then	
		OperationComplete = true
		trigger.action.outText("Operation Scarlet Dawn - Operation Has Been Successful - Annihilation Victory Achieved", 60)		
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
	AGMissionTarget = OperationScarletDawn_AG[MissionNumber].TargetName
	AGTargetTypeStatic = OperationScarletDawn_AG[MissionNumber].TargetStatic
	AGMissionBriefingText = OperationScarletDawn_AG[MissionNumber].TargetBriefing		
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
	
	if ( Phase == 5 ) then	
		SEF_VictoryAchieved()	
	else
	end
	
	return time + 300
end

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MISSION TARGET TABLE

function SEF_InitializeMissionTable()
	
	OperationScarletDawn_AG = {}	
	
	--////EWR
	OperationScarletDawn_AG[1] = {				
		TargetName = "Aleppo - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Aleppo\nAleppo Sector - Grid CA40",
	}
	OperationScarletDawn_AG[2] = {				
		TargetName = "Al Bab - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Al Bab\nAleppo Sector - Grid CA52",
	}
	OperationScarletDawn_AG[3] = {				
		TargetName = "Dar Ta'izzah - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Dar Ta'izzah\nAleppo Sector - Grid CA01",
	}
	OperationScarletDawn_AG[4] = {				
		TargetName = "Idlib - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar North-West Of Idlib\nIdlib Sector - Grid BV79",
	}
	OperationScarletDawn_AG[5] = {				
		TargetName = "Tabqa - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Tabqa Airfield\nTabqa Sector - Grid DV65",
	}	
	OperationScarletDawn_AG[6] = {				
		TargetName = "Qaranjah - EWR South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Qaranjah\nLatakia Sector - Grid YE56",
	}
	OperationScarletDawn_AG[7] = {				
		TargetName = "Sett Markho - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Sett Markho\nLatakia Sector - Grid YE54",
	}
	OperationScarletDawn_AG[8] = {				
		TargetName = "Baniyas - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Baniyas\nBaniyas Sector - Grid YD79",
	}
	OperationScarletDawn_AG[9] = {				
		TargetName = "Tartus - EWR East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Tartus\nTartus Sector - Grid YD76",
	}
	OperationScarletDawn_AG[10] = {				
		TargetName = "Homs - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Homs\nHoms Sector - Grid BU93",
	}
	OperationScarletDawn_AG[11] = {				
		TargetName = "Hama - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Hama\nHama Sector - Grid BU97",
	}
 	OperationScarletDawn_AG[12] = {				
		TargetName = "Palmyra - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Palmyra\nPalmyra Sector - Grid DU32",
	}			
 	OperationScarletDawn_AG[13] = {				
		TargetName = "Busra - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Busra\nGolan Heights Sector - Grid BS53",
	}					
 	OperationScarletDawn_AG[14] = {				
		TargetName = "Marj Ruhayyil - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar At Marj Ruhayyil\nDamascus Sector - Grid BS58",
	}					
 	OperationScarletDawn_AG[15] = {				
		TargetName = "Damascus - EWR South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Southern Early Warning Radar At Damascus\nDamascus Sector - Grid BS49",
	}				
 	OperationScarletDawn_AG[16] = {				
		TargetName = "Damascus - EWR North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Northern Early Warning Radar At Damascus\nDamascus Sector - Grid BT41",
	}						
 	OperationScarletDawn_AG[17] = {				
		TargetName = "Damascus - EWR East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Eastern Early Warning Radar At Damascus\nDamascus Sector - Grid BT60",
	}						
 	OperationScarletDawn_AG[18] = {				
		TargetName = "Al Dumayr - EWR North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Northern Early Warning Radar At Al-Dumayr\nDuma Sector - Grid BT92",
	}					
 	OperationScarletDawn_AG[19] = {				
		TargetName = "Al Dumayr - EWR South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Southern Early Warning Radar At Al-Dumayr\nDuma Sector - Grid BT92",
	}					
 	OperationScarletDawn_AG[20] = {				
		TargetName = "Al Dumayr - EWR West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Western Early Warning Radar At Al-Dumayr\nDuma Sector - Grid BT71",
	} 				
 	--////SA-5 SITES			
	OperationScarletDawn_AG[21] = {				
		TargetName = "Damascus - SA-5",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-5 Site At Damascus\nDamascus Sector - Grid BT81",
	}
	OperationScarletDawn_AG[22] = {				
		TargetName = "Khalkhalah - SA-5",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-5 Site At Khalkhalah\nKhalkhalah Sector - Grid BS77",
	}
	OperationScarletDawn_AG[23] = {				
		TargetName = "Homs - SA-5",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-5 Site At Homs\nHoms Sector - Grid BU93",
	}
	OperationScarletDawn_AG[24] = {				
		TargetName = "Masyaf - SA-5",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-5 Site At Masyaf\nMasyaf Sector - Grid BU59",
	}
	--////SA-2 SITES
	OperationScarletDawn_AG[25] = {				
		TargetName = "Al Safirah - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site At Al Safirah\nAleppo Sector - Grid CV59",
	}	
	OperationScarletDawn_AG[26] = {				
		TargetName = "Latakia - SA-2 North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site North Of Latakia\nLatakia Sector - Grid YE55",
	}
	OperationScarletDawn_AG[27] = {				
		TargetName = "Bassel Al-Assad - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site At Bassel Al-Assad Airbase\nBassel Al-Assad Sector - Grid YE62",
	}
	OperationScarletDawn_AG[28] = {				
		TargetName = "Tartus - SA-2 South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site At Tartus\nTartus Sector - Grid YD65",
	}
	OperationScarletDawn_AG[29] = {				
		TargetName = "Hama - SA-2 North-West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site North-West Of Hama\nHama Sector - Grid BU89",
	}
	OperationScarletDawn_AG[30] = {				
		TargetName = "Homs - SA-2 West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site West Of Homs\nHoms Sector - Grid BU74",
	}
	OperationScarletDawn_AG[31] = {				
		TargetName = "Khirbet Ghazaleh - SA-2 North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site North Of Khirbet Ghazaleh\nGolan Heights Sector - Grid BS33",
	}
	OperationScarletDawn_AG[32] = {				
		TargetName = "Al Dumayr - SA-2 East 1",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site East Of Al-Dumayr\nDuma Sector - Grid CT02",
	}
	OperationScarletDawn_AG[33] = {				
		TargetName = "Damascus - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site At Damascus\nDamascus Sector - Grid BT60",
	}
	OperationScarletDawn_AG[34] = {				
		TargetName = "Mezzeh - SA-2 West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site West Of Mezzeh Airbase\nMezzeh Sector - Grid BS39",
	} 				
 	--////SA-3 SITES			
	OperationScarletDawn_AG[35] = {				
		TargetName = "Latakia - SA-3 South-East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site South-East Of Latakia\nLatakia Sector - Grid YE53",
	} 
	OperationScarletDawn_AG[36] = {				
		TargetName = "Bassel Al-Assad - SA-3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site At Bassel Al-Assad Airbase\nBassel Al-Assad Sector - Grid YE62",
	} 
	OperationScarletDawn_AG[37] = {				
		TargetName = "Tartus - SA-3 South-East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site South-East Of Tartus\nTartus Sector - Grid YD76",
	} 
	OperationScarletDawn_AG[38] = {				
		TargetName = "Homs - SA-3 East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site East Of Homs\nHoms Sector - Grid BU94",
	}
	OperationScarletDawn_AG[39] = {				
		TargetName = "Hama - SA-3 North-East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site North-East Of Hama\nHama Sector - Grid CV01",
	}
	OperationScarletDawn_AG[40] = {				
		TargetName = "Aleppo - SA-3 East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site East Of Aleppo\nAleppo Sector - Grid CA60",
	}
	OperationScarletDawn_AG[41] = {				
		TargetName = "El Hajar Al Aswad - SA-3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site East At El Hajar Al Aswad\nDamascus Sector - Grid BT50",
	}
 	OperationScarletDawn_AG[42] = {				
		TargetName = "Hayjanah - SA-3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site At Hayjanah\nDamascus Sector - Grid BS79",
	}			
	OperationScarletDawn_AG[43] = {				
		TargetName = "Al Dumayr - SA-3 South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site South Of Al-Dumayr\nDuma Sector - Grid BT91",
	}
	OperationScarletDawn_AG[44] = {				
		TargetName = "Jasim - SA-3 South-East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site South-East Of Jasim\nGolan Heights Sector - Grid BS34",
	}	
	--////SA-6 SITES
	OperationScarletDawn_AG[45] = {				
		TargetName = "Homs - SA-6 South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site South Of Homs\nHoms Sector - Grid BU93",
	}
	OperationScarletDawn_AG[46] = {				
		TargetName = "Hama - SA-6 South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site South Of Hama\nHama Sector - Grid BU98",
	}
	OperationScarletDawn_AG[47] = {				
		TargetName = "Mezzeh - SA-6 South-West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site South-West Of Mezzeh Airbase\nMezzeh Sector - Grid BS39",
	}
	OperationScarletDawn_AG[48] = {				
		TargetName = "Otaybah - SA-6 North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site North Of Otaybah\nDamascus Sector - Grid BT71",
	}
	OperationScarletDawn_AG[49] = {				
		TargetName = "Otaybah - SA-6 South-East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site South-East Of Otaybah\nDamascus Sector - Grid BT80",
	}
	OperationScarletDawn_AG[50] = {				
		TargetName = "Kanaker - SA-6 East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site East Of Kanaker\nDamascus Sector - Grid BS38",
	}
	OperationScarletDawn_AG[51] = {				
		TargetName = "Izra - SA-6 East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site East Of Izra\nGolan Heights Sector - Grid BS43",
	}
	OperationScarletDawn_AG[52] = {				
		TargetName = "Izra - SA-6 West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site West Of Izra\nGolan Heights Sector - Grid BS43",
	}
	--////SA-8 SITES
	OperationScarletDawn_AG[53] = {				
		TargetName = "Al Qutayfah - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 At Al Qutayfah\nAn Nasiriyah Sector - Grid BT83",
	}
	OperationScarletDawn_AG[54] = {				
		TargetName = "Damascus - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 At Damascus\nDamascus Sector - Grid BT41",
	}
	OperationScarletDawn_AG[55] = {				
		TargetName = "Mezzeh - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 At Mezzeh Airbase\nMezzeh Sector - Grid BT40",
	}	
	OperationScarletDawn_AG[56] = {				
		TargetName = "Latakia - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 North Of Latakia\nLatakia Sector - Grid YE55",
	}
	--////SA-13 SITES
	OperationScarletDawn_AG[57] = {				
		TargetName = "An Nasiriyah - SA-13",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-13 At An Nasiriyah\nAn Nasiriyah Sector - Grid CT05",
	}
	OperationScarletDawn_AG[58] = {				
		TargetName = "Khalkhalah - SA-13",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-13 At Khalkhalah\nKhalkhalah Sector - Grid BS76",
	}	
	--////SHIPPING
	OperationScarletDawn_AG[59] = {				
		TargetName = "Latakia - Navy",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Warships Patrolling Near Latakia\nLatakia Sector - Grid YE",
	}
	OperationScarletDawn_AG[60] = {				
		TargetName = "Tartus - Navy",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Warships Patrolling Near Tartus\nTartus Sector - Grid YE/YD",
	}
	OperationScarletDawn_AG[61] = {				
		TargetName = "Latakia - Speedboat",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armed Speedboats At Latakia\nLatakia Sector - Grid YE43/53",
	}
	OperationScarletDawn_AG[62] = {				
		TargetName = "Tartus - Speedboat",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armed Speedboats At Tartus\nTartus Sector - Grid YD66",
	}
	OperationScarletDawn_AG[63] = {				
		TargetName = "Latakia - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships At Latakia\nLatakia Sector - Grid YE53",
	}
	OperationScarletDawn_AG[64] = {				
		TargetName = "Tartus - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships At Tartus\nTartus Sector - Grid YD66",
	}
	--////COMMS TOWERS
	OperationScarletDawn_AG[65] = {				
		TargetName = "Aleppo - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower At Aleppo\nAleppo Sector - Grid CA30",
	}	
	OperationScarletDawn_AG[66] = {				
		TargetName = "Latakia - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower At Latakia\nLatakia Sector - Grid YE53",
	}
	OperationScarletDawn_AG[67] = {				
		TargetName = "Tartus - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower At Tartus\nTartus Sector - Grid YD66",
	}
	OperationScarletDawn_AG[68] = {				
		TargetName = "Homs - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower At Homs\nHoms Sector - Grid BU84",
	}
	OperationScarletDawn_AG[69] = {				
		TargetName = "Hama - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower At Hama\nHama Sector - Grid BU96",
	}
	OperationScarletDawn_AG[70] = {				
		TargetName = "Damascus - Communications West",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Western Communications Tower At Damascus\nDamascus Sector - Grid BT41",
	}
	OperationScarletDawn_AG[71] = {				
		TargetName = "Damascus - Communications East",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Eastern Communications Tower At Damascus\nDamascus Sector - Grid BT60",
	}
	OperationScarletDawn_AG[72] = {				
		TargetName = "Golan Heights - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Near The Golan Heights\nGolan Heights Sector - Grid YB65",
	}
	--////AAA
	OperationScarletDawn_AG[73] = {				
		TargetName = "Aleppo - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Aleppo\nAleppo Sector - Grid CA20/21/30/31",
	}
	OperationScarletDawn_AG[74] = {				
		TargetName = "Al Safira - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Al Safira\nAleppo Sector - Grid CV49/59",
	}
	OperationScarletDawn_AG[75] = {				
		TargetName = "Latakia - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Latakia\nLatakia Sector - Grid YE43/53",
	}
	OperationScarletDawn_AG[76] = {				
		TargetName = "Latakia - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Tartus\nTartus Sector - Grid YD66",
	}
	OperationScarletDawn_AG[77] = {				
		TargetName = "Homs - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Homs\nHoms Sector - Grid BU84/94",
	}
	OperationScarletDawn_AG[78] = {				
		TargetName = "Homs - AAA South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets South Of Homs\nHoms Sector - Grid BU93",
	}
	OperationScarletDawn_AG[79] = {				
		TargetName = "Hama - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Hama\nHama Sector - Grid BU89/98/99",
	}
	OperationScarletDawn_AG[80] = {				
		TargetName = "Mezzeh - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Mezzeh\nMezzeh Sector - Grid BS39/49/BT40/50",
	}
	OperationScarletDawn_AG[81] = {				
		TargetName = "Damascus - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Damascus\nDamascus Sector - Grid BT41/50/60",
	}
	OperationScarletDawn_AG[82] = {				
		TargetName = "Al Dumayr - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Al Dumayr\nDuma Sector - Grid BT81/91",
	}
	OperationScarletDawn_AG[83] = {				
		TargetName = "Golan Heights - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At The Golan Heights\nGolan Heights Sector - Grid BS33/34/43",
	}
	OperationScarletDawn_AG[84] = {				
		TargetName = "Bassel Al-Assad - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Bassel Al-Assad\nBassel Al-Assad Sector - Grid YE62",
	}
	OperationScarletDawn_AG[85] = {				
		TargetName = "Khalkhalah - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Khalkhalah\nKhalkhalah Sector - Grid BS76",
	}
	--////ARMOR
	OperationScarletDawn_AG[86] = {				
		TargetName = "Aleppo - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Aleppo\nAleppo Sector - Grid CA20/31/40",
	}
	OperationScarletDawn_AG[87] = {				
		TargetName = "Latakia - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Latakia\nLatakia Sector - Grid YE53",
	}
	OperationScarletDawn_AG[88] = {				
		TargetName = "Tartus - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Tartus\nTartus Sector - Grid YD66",
	}
	OperationScarletDawn_AG[89] = {				
		TargetName = "Homs - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Homs\nHoms Sector - Grid BU74/94",
	}
	OperationScarletDawn_AG[90] = {				
		TargetName = "Homs - Armor South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles South Of Homs\nHoms Sector - Grid BU93",
	}
	OperationScarletDawn_AG[91] = {				
		TargetName = "Hama - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Hama\nHama Sector - Grid BU89/98/99",
	}
	OperationScarletDawn_AG[92] = {				
		TargetName = "Mezzeh - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Mezzeh\nMezzeh Sector - Grid BT30",
	}
	OperationScarletDawn_AG[93] = {				
		TargetName = "Al Dumayr - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Al Dumayr\nDuma Sector - Grid BT82",
	}
	OperationScarletDawn_AG[94] = {				
		TargetName = "Damascus - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Damascus\nDamascus Sector - Grid BS49/59",
	}
	OperationScarletDawn_AG[95] = {				
		TargetName = "Khirbet Ghazaleh - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Khirbet Ghazaleh\nGolan Heights Sector - Grid BS32",
	}
	--////ARTILLERY AND Missiles
	OperationScarletDawn_AG[96] = {				
		TargetName = "Latakia - Silkworm",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Silkworm Site At Latakia\nLatakia Sector - Grid YE43/53",
	}
	OperationScarletDawn_AG[97] = {				
		TargetName = "Tartus - Silkworm",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Silkworm Site At Tartus\nTartus Sector - Grid YD67",
	}	
	OperationScarletDawn_AG[98] = {				
		TargetName = "Mezzeh - Scud Launcher",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Scud Launchers At The Artillery Base Near Mezzeh\nMezzeh Sector - Grid BT30",
	}
	OperationScarletDawn_AG[99] = {				
		TargetName = "Homs - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets At Homs\nHoms Sector - Grid BU93",
	}
	OperationScarletDawn_AG[100] = {				
		TargetName = "Hama - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets At Hama\nHama Sector - Grid BU98",
	}
	OperationScarletDawn_AG[101] = {				
		TargetName = "Aleppo - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets At Aleppo\nAleppo Sector - Grid CA40",
	}
	OperationScarletDawn_AG[102] = {				
		TargetName = "Izra - Scud Launcher",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Scud Launchers At Izra\nGolan Heights Sector - Grid BS43",
	}
	OperationScarletDawn_AG[103] = {				
		TargetName = "Al Dumayr - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets At Al-Dumayr\nDuma Sector - Grid BT92",
	}
	--////Statics
	OperationScarletDawn_AG[104] = {				
		TargetName = "Al Safirah - Barracks",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military Barracks At Al Safirah\nAleppo Sector - Grid CV59",
	}
	OperationScarletDawn_AG[105] = {				
		TargetName = "Al Safirah - Research Hangar",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Research Hangar At Al Safirah\nAleppo Sector - Grid CV58",
	}
	OperationScarletDawn_AG[106] = {				
		TargetName = "Latakia - Naval Warehouse",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Warehouse At Latakia\nLatakia Sector - Grid YE53",
	}
	OperationScarletDawn_AG[107] = {				
		TargetName = "Tartus - Naval Warehouse",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Warehouse At Tartus\nTartus Sector - Grid YD66",
	}
	OperationScarletDawn_AG[108] = {				
		TargetName = "Homs - Military HQ",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military HQ At Homs\nHoms Sector - Grid BU93",
	}
	OperationScarletDawn_AG[109] = {				
		TargetName = "Mezzeh - Missile Storage",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Missile Storage Facility At Mezzeh\nMezzeh Sector - Grid BT30",
	}
	OperationScarletDawn_AG[110] = {				
		TargetName = "Alsqublh - Barracks",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military Barracks North-East Of Alsqublh\nMasyaf Sector - Grid BU39",
	}
	OperationScarletDawn_AG[111] = {				
		TargetName = "Alsqublh - Military HQ",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military HQ North-East Of Alsqublh\nMasyaf Sector - Grid BU39",
	}
	OperationScarletDawn_AG[112] = {				
		TargetName = "Barisha - Compound",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgent Compound At Barisha\nBarisha Sector - Grid BA80",
	}
	OperationScarletDawn_AG[113] = {				
		TargetName = "Jarmaya - Weapons Hangar",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Weapons Hangar At Jarmaya\nDamascus Sector - Grid BT41",
	}
	OperationScarletDawn_AG[114] = {				
		TargetName = "Masyaf - Weapons Hangar South",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Weapons Hangar South-West Of Masyaf\nMasyaf Sector - Grid BU58",
	}
	OperationScarletDawn_AG[115] = {				
		TargetName = "Masyaf - Weapons Hangar North",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Weapons Hangar North Of Masyaf\nMasyaf Sector - Grid BU58",
	}
	OperationScarletDawn_AG[116] = {				
		TargetName = "Aleppo - Repair Workshop",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Repair Workshop At Aleppo\nAleppo Sector - Grid CA40",
	}
	OperationScarletDawn_AG[117] = {				
		TargetName = "Latakia - Ammunition Warehouse",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Ammunition Storage Warehouse At Latakia\nLatakia Sector - Grid YE53",
	}
	OperationScarletDawn_AG[118] = {				
		TargetName = "Raqqa - Military HQ",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgent Headquarters At Raqqa\nRaqqa Sector - Grid EV07",
	}
	OperationScarletDawn_AG[119] = {				
		TargetName = "Hama - Warehouse",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Weapons Storage Warehouse At Hama\nHama Sector - Grid BU98",
	}
	--////UNARMED
	OperationScarletDawn_AG[120] = {				
		TargetName = "Masyaf - Supply Truck South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks South-West Of Masyaf\nMasyaf Sector - Grid BU58",
	}
	OperationScarletDawn_AG[121] = {				
		TargetName = "Masyaf - Supply Truck North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks North Of Masyaf\nMasyaf Sector - Grid BU58",
	}
	OperationScarletDawn_AG[122] = {				
		TargetName = "Hama - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks At Hama\nHama Sector - Grid BU98",
	}
	OperationScarletDawn_AG[123] = {				
		TargetName = "Al Safirah - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks At Al Safira\nAleppo Sector - Grid BV59",
	}	
	OperationScarletDawn_AG[124] = {				
		TargetName = "Mezzeh - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks At Mezzeh\nMezzeh Sector - Grid BT30",
	}
	--////SPECIAL NAMED
	OperationScarletDawn_AG[125] = {				
		TargetName = "Abu Bakr al-Baghdadi",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Seek And Destroy High Priority Target: Abu Bark al-Baghdadi. Intelligence Reports Target Is Located Near Barisha\nBarisha Sector - Grid BA80",
	}	
	OperationScarletDawn_AG[126] = {				
		TargetName = "Abu Muhammad al-Halabi",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Seek And Destroy High Priority Target: Abu Muhammad al-Halabi. Intelligence Reports Target Is Located Near Barisha\nBarisha Sector - Grid BA80",
	}	
	--////SPECIAL GROUPS
	OperationScarletDawn_AG[127] = {				
		TargetName = "Barisha - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Insurgent Units Reported Near Barisha\nBarisha Sector - Grid BA80",
	}
	OperationScarletDawn_AG[128] = {				
		TargetName = "Raqqa - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Insurgent Armored Units At Raqqa\nRaqqa Sector - Grid EV07",
	}
	OperationScarletDawn_AG[129] = {				
		TargetName = "Raqqa - Igla",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Insurgent Anti-Aircraft Infantry At Raqqa\nRaqqa Sector - Grid EV07",
	}
	OperationScarletDawn_AG[130] = {				
		TargetName = "Raqqa - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Insurgent AAA Assets At Raqqa\nRaqqa Sector - Grid DV97/EV07",
	}	
	--////XPACK1
	OperationScarletDawn_AG[131] = {				
		TargetName = "Saraqib - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site At Saraqib\nIdlib Sector - Grid CV07",
	}
	OperationScarletDawn_AG[132] = {				
		TargetName = "Abu al-Duhur - SA-3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site At Abu al-Duhur\nIdlib Sector - Grid CV25",
	}
	OperationScarletDawn_AG[133] = {				
		TargetName = "Idlib - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Idlib\nIdlib Sector - Grid BV87",
	}
	OperationScarletDawn_AG[134] = {				
		TargetName = "Idlib - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles At Idlib\nIdlib Sector - Grid BV87",
	}
	OperationScarletDawn_AG[135] = {				
		TargetName = "Idlib - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks At Idlib\nIdlib Sector - Grid BV87",
	}
	OperationScarletDawn_AG[136] = {				
		TargetName = "Idlib - Military HQ",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgent Headquarters At Idlib\nIdlib Sector - Grid BV87",
	}
	--////SA-15
	OperationScarletDawn_AG[137] = {				
		TargetName = "Latakia - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 At Latakia\nLatakia Sector - Grid YE53",
	}
	OperationScarletDawn_AG[138] = {				
		TargetName = "Tartus - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 At Tartus\nTartus Sector - Grid YD65",
	}
	OperationScarletDawn_AG[139] = {				
		TargetName = "Aleppo - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 At Aleppo\nAleppo Sector - Grid CA50",
	}
	OperationScarletDawn_AG[140] = {				
		TargetName = "Damascus - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 At Damascus\nDamascus Sector - Grid BT50",
	}
	OperationScarletDawn_AG[141] = {				
		TargetName = "Izra - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 At Izra\nGolan Heights Sector - Grid BS33",
	}
	OperationScarletDawn_AG[142] = {				
		TargetName = "Aleppo - SA-2 South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site South Of Aleppo\nAleppo Sector - Grid CV39",
	}	
	OperationScarletDawn_AG[143] = {				
		TargetName = "Aleppo - SA-3 West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site On The Western Side Of Aleppo\nAleppo Sector - Grid CA20/21",
	}
	--////2.7 EXPANSION PART 1
	OperationScarletDawn_AG[144] = {				
		TargetName = "Tiyas - SA-2 West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site On The Western Side Of Tiyas\nTiyas Sector - Grid CU62",
	}
	OperationScarletDawn_AG[145] = {				
		TargetName = "Tiyas - SA-2 South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site On The Southern Side Of Tiyas\nTiyas Sector - Grid CU71",
	}
	OperationScarletDawn_AG[146] = {				
		TargetName = "Tiyas - SA-2 North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site On The Northern Side Of Tiyas\nTiyas Sector - Grid CU63",
	}
	OperationScarletDawn_AG[147] = {				
		TargetName = "Tiyas - SA-3 West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site On The Western Side Of Tiyas\nTiyas Sector - Grid CU72",
	}
	OperationScarletDawn_AG[148] = {				
		TargetName = "Tiyas - SA-3 North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site On The Northern Side Of Tiyas\nTiyas Sector - Grid CU72",
	}
	OperationScarletDawn_AG[149] = {				
		TargetName = "Tiyas - SA-3 East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site On The Eastern Side Of Tiyas\nTiyas Sector - Grid CU72",
	}
	OperationScarletDawn_AG[150] = {				
		TargetName = "Tiyas - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Tiyas\nTiyas Sector - Grid CU72",
	}
	OperationScarletDawn_AG[151] = {				
		TargetName = "Tiyas - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Tiyas\nTiyas Sector - Grid CU62",
	}
	OperationScarletDawn_AG[152] = {				
		TargetName = "Tiyas - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Tiyas\nTiyas Sector - Grid CU72",
	}
	OperationScarletDawn_AG[153] = {				
		TargetName = "Shayrat - SA-6 North",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site On The Northern Side Of Shayrat\nShayrat Sector - Grid CU12",
	}
	OperationScarletDawn_AG[154] = {				
		TargetName = "Shayrat - SA-6 East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site On The Eastern Side Of Shayrat\nShayrat Sector - Grid CU11",
	}
	OperationScarletDawn_AG[155] = {				
		TargetName = "Shayrat - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Shayrat\nShayrat Sector - Grid CU01",
	}
	OperationScarletDawn_AG[156] = {				
		TargetName = "Sayqal - SA-2 South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site On The Southern Side Of Sayqal\nSayqal Sector - Grid CT31/32",
	}
	OperationScarletDawn_AG[157] = {				
		TargetName = "Sayqal - SA-2 East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site On The Eastern Side Of Sayqal\nSayqal Sector - Grid CT43",
	}
 	OperationScarletDawn_AG[158] = {				
		TargetName = "Sayqal - SA-3 South",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site On The Southern Side Of Sayqal\nSayqal Sector - Grid CT32",
	}	
	OperationScarletDawn_AG[159] = {				
		TargetName = "Sayqal - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Sayqal\nSayqal Sector - Grid CT32",
	}
	OperationScarletDawn_AG[160] = {				
		TargetName = "Al Qusayr - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Al Qusayr\nAl Qusayr Sector - Grid BU72",
	}
	OperationScarletDawn_AG[161] = {				
		TargetName = "Tha'lah - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Tha'lah\nTha'lah Sector - Grid BS52",
	}
	OperationScarletDawn_AG[162] = {				
		TargetName = "B-871 Alrosa",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Submarine B-871 Alrosa\nMediterranean Sea Sector - Grid VB09",
	}
	OperationScarletDawn_AG[163] = {				
		TargetName = "B-262 Stary Oskoi",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Submarine B-262 Stary Oskoi\nMediterranean Sea Sector - Grid UC54/55",
	}
	OperationScarletDawn_AG[164] = {				
		TargetName = "Rene Mouawad - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Rene Mouawad\nRene Mouawad Sector - Grid BU23",
	}
	OperationScarletDawn_AG[165] = {				
		TargetName = "Rene Mouawad - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Rene Mouawad\nRene Mouawad Sector - Grid BU23",
	}
	OperationScarletDawn_AG[166] = {				
		TargetName = "Golan Heights - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located Near Golan Heights\nGolan Heights Sector - Grid YB64",
	}
	OperationScarletDawn_AG[167] = {				
		TargetName = "Altinozu - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgents Located At Altinozu\nLondon Sector - Grid BA50/BV59",
	}
	OperationScarletDawn_AG[168] = {				
		TargetName = "Avsuya - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgents Located At Avsuya\nLondon Sector - Grid BA50",
	}
	OperationScarletDawn_AG[169] = {				
		TargetName = "Bohsin - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgents Located At Bohsin\nHatay Sector - Grid BA61",
	}
	OperationScarletDawn_AG[170] = {				
		TargetName = "Karbeyaz - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgents Located At Karbeyaz\nLondon Sector - Grid BV58",
	}
	OperationScarletDawn_AG[171] = {				
		TargetName = "Taftanaz - SA-9",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-9 Located At Taftanaz\nTaftanaz Sector - Grid BV98",
	}
	OperationScarletDawn_AG[172] = {				
		TargetName = "Taftanaz - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Taftanaz\nTaftanaz Sector - Grid BV98/CV08",
	}
	OperationScarletDawn_AG[173] = {				
		TargetName = "Taftanaz - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Taftanaz\nTaftanaz Sector - Grid BV98/CV08",
	}
	OperationScarletDawn_AG[174] = {				
		TargetName = "Saidah - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Saidah\nGolan Heights Sector - Grid YB64",
	}
	OperationScarletDawn_AG[175] = {				
		TargetName = "Altinkaya - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgents Located At Altinkaya\nLondon Sector - Grid BA50",
	}
	OperationScarletDawn_AG[176] = {				
		TargetName = "Toprakhisar - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgents Located At Toprakhisar\nLondon Sector - Grid BA50",
	}
	OperationScarletDawn_AG[177] = {				
		TargetName = "Salqin - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgents Located At Salqin\nTaftanaz Sector - Grid BA70",
	}
	OperationScarletDawn_AG[178] = {				
		TargetName = "Azmarin - Insurgents",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Insurgents Located At Azmarin\nTaftanaz Sector - Grid BV69",
	}
	OperationScarletDawn_AG[179] = {				
		TargetName = "Seawise Giant",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Seawise Giant\nTartus Sector - Grid YD58",
	}
	OperationScarletDawn_AG[180] = {				
		TargetName = "Handy Wind",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Handy Wind\nBeirut-Rafic Hariri Sector - Grid YC26",
	}
	OperationScarletDawn_AG[181] = {				
		TargetName = "Mediterranean Sea - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Located North Of Cyprus\nPinarbashi Sector - Grid WE24",
	}
	--////APACHE UPDATE
	OperationScarletDawn_AG[182] = {				
		TargetName = "Tal Siman - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Tal Siman\nTal Siman Sector - Grid DA91",
	}
	OperationScarletDawn_AG[183] = {				
		TargetName = "Tal Siman - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Tal Siman\nTal Siman Sector - Grid DA91",
	}
	OperationScarletDawn_AG[184] = {				
		TargetName = "Tabqa - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Tabqa\nTabqa Sector - Grid DV55/65",
	}
	OperationScarletDawn_AG[185] = {				
		TargetName = "Tabqa - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Tabqa\nTabqa Sector - Grid DV55",
	}	
	OperationScarletDawn_AG[186] = {				
		TargetName = "Palmyra - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Palmyra\nPalmyra Sector - Grid DU32",
	}
	OperationScarletDawn_AG[187] = {				
		TargetName = "Palmyra - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Palmyra\nPalmyra Sector - Grid DU32",
	}
	OperationScarletDawn_AG[188] = {				
		TargetName = "Palmyra - SA-19",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-19 Located At Palmyra\nPalmyra Sector - Grid DU32",
	}
	OperationScarletDawn_AG[189] = {				
		TargetName = "Palmyra - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Palmyra\nPalmyra Sector - Grid DU32",
	}	
	OperationScarletDawn_AG[190] = {				
		TargetName = "Jirah - SA-9",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-9 Located At Jirah\nJirah Sector - Grid DV09",
	}
	OperationScarletDawn_AG[191] = {				
		TargetName = "Jirah - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Jirah\nJirah Sector - Grid DV09",
	}	
	OperationScarletDawn_AG[192] = {				
		TargetName = "Jirah - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Jirah\nJirah Sector - Grid DV09",
	}
	OperationScarletDawn_AG[193] = {				
		TargetName = "Buhayrat Al Asad - Speedboat",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Speedboats Located At Lake Assad\nJirah Sector - Grid DA21",
	}	
	OperationScarletDawn_AG[194] = {				
		TargetName = "Tabqa - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Located North Of Tabqa\nTabqa Sector - Grid DV56",
	}
	OperationScarletDawn_AG[195] = {				
		TargetName = "Tabqa - SA-18",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Anti-Air Infantry Located North Of Tabqa\nTabqa Sector - Grid DV66",
	}	
	OperationScarletDawn_AG[196] = {				
		TargetName = "Maqha Ash Shami - SA-18",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Anti-Air Infantry Located At Maqha Ash Shami\nAt Tanf Sector - Grid DT02/03",
	}
	OperationScarletDawn_AG[197] = {				
		TargetName = "Maqha Ash Shami - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Maqha Ash Shami\nAt Tanf Sector - Grid DT02/03",
	}
	OperationScarletDawn_AG[198] = {				
		TargetName = "Maqha Ash Shami - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Maqha Ash Shami\nAt Tanf Sector - Grid DT02/03",
	}
	OperationScarletDawn_AG[199] = {				
		TargetName = "Maqha Ash Shami - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Maqha Ash Shami\nAt Tanf Sector - Grid DT02/03",
	}
	OperationScarletDawn_AG[200] = {				
		TargetName = "Maqha Ash Shami - SA-13",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-13 Located At Maqha Ash Shami\nAt Tanf Sector - Grid DT02/03",
	}
	OperationScarletDawn_AG[201] = {				
		TargetName = "Maqha Ash Shami - Infantry",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Infantry Located At Maqha Ash Shami\nAt Tanf Sector - Grid DT02/03",
	}	
	OperationScarletDawn_AG[202] = {				
		TargetName = "Al Ulayyaniyah - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Al Ulayyaniyah\nAt Tanf Sector - Grid DT16",
	}
	OperationScarletDawn_AG[203] = {				
		TargetName = "Al Ulayyaniyah - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Al Ulayyaniyah\nAt Tanf Sector - Grid DT16",
	}
	OperationScarletDawn_AG[204] = {				
		TargetName = "Al Ulayyaniyah - SA-9",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-9 Located At Al Ulayyaniyah\nAt Tanf Sector - Grid DT16",
	}
	OperationScarletDawn_AG[205] = {				
		TargetName = "Al Ulayyaniyah - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Al Ulayyaniyah\nAt Tanf Sector - Grid DT16",
	}
	OperationScarletDawn_AG[206] = {				
		TargetName = "Al Ulayyaniyah - Infantry",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Infantry Located At Al Ulayyaniyah\nAt Tanf Sector - Grid DT16",
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
		if ( DepartureAirbaseName == "Ramat David" ) then
			USAEFCAP:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
		elseif ( DepartureAirbaseName == "Incirlik" ) then
			USAEFCAP:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {59,60}, SPAWN.Takeoff.Hot)		
		else
			USAEFCAP:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end		
		--:SpawnInZone( SpawnZone, false, 7000, 7000 )
		--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--:SpawnAtAirbase( AIRBASE:FindByName( "Ramat David" ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
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
		if ( DepartureAirbaseName == "Ramat David" ) then
			USAEFSEAD:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
		elseif ( DepartureAirbaseName == "Incirlik" ) then
			USAEFSEAD:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {61,62}, SPAWN.Takeoff.Hot)
		else
			USAEFSEAD:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end		
		--:SpawnInZone( SpawnZone, false, 6000, 6000 )
		--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		--:SpawnAtAirbase( AIRBASE:FindByName( "Ramat David" ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
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
		if ( DepartureAirbaseName == "Ramat David" ) then
			USAEFCAS:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
		elseif ( DepartureAirbaseName == "Incirlik" ) then
			USAEFCAS:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {66,115}, SPAWN.Takeoff.Hot)
		else
			USAEFCAS:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end
		--:SpawnInZone( SpawnZone, false, 3500, 3500 )
		--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )		
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
		if ( DepartureAirbaseName == "Ramat David" ) then
			USAEFASS:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
		elseif ( DepartureAirbaseName == "Incirlik" ) then
			USAEFASS:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {69,113}, SPAWN.Takeoff.Hot)
		else
			USAEFASS:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
		end
		--:SpawnInZone( SpawnZone, false, 3000, 3000 )
		--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
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
			if ( DepartureAirbaseName == "Ramat David" ) then
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
			elseif ( DepartureAirbaseName == "Incirlik" ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {114,68}, SPAWN.Takeoff.Hot)
			else
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
			end
			--:SpawnInZone( SpawnZone, false, 5000, 5000 )
			--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
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
			if ( DepartureAirbaseName == "Ramat David" ) then
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
			elseif ( DepartureAirbaseName == "Incirlik" ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {114,68}, SPAWN.Takeoff.Hot)
			else
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
			end
			--:SpawnInZone( SpawnZone, false, 5000, 5000 )
			--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
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
			if ( DepartureAirbaseName == "Ramat David" ) then
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig )
			elseif ( DepartureAirbaseName == "Incirlik" ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {114,68}, SPAWN.Takeoff.Hot)
			else
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
			end
			--:SpawnInZone( SpawnZone, false, 5000, 5000 )
			--:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
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
		--:SpawnInZone( SpawnZone, false, 6448, 6448 )
		:SpawnFromVec3( DroneStartVec3 )
		--SPAWN:SpawnFromVec3(Vec3, SpawnIndex) --Vec3 point to spawn at(just south of target group) SpawnIndex is optional
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
	SupportMenuMain 	= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Support", nil)
	SupportMenuAbort 	= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abort Directives", nil)
	SupportMenuCAP  	= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Fighter Support", SupportMenuMain)
	SupportMenuCAS  	= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Close Air Support", SupportMenuMain)
	SupportMenuSEAD 	= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request SEAD Support", SupportMenuMain)
	SupportMenuASS 		= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Anti-Shipping Support", SupportMenuMain)
	SupportMenuPIN 		= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request A Pinpoint Strike", SupportMenuMain)
	SupportMenuDRONE 	= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request An MQ-9 Reaper Drone", SupportMenuMain)
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
	
	--////Scarlet Dawn Mission Options
	ScarletDawnOptions 				= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Scarlet Dawn Options", nil)
	ScarletDawnCAPOptions 			= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Scarlet Dawn CAP Options", ScarletDawnOptions)
	ScarletDawnSNDOptions 			= missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Scarlet Dawn Sound Options", ScarletDawnOptions)
	ScarletDawnBLUECAPToggle 		= missionCommands.addCommandForCoalition(coalition.side.BLUE, "Toggle Allied AI CAP Flights", ScarletDawnCAPOptions, function() SEF_BLUESQUADRONSTOGGLE() end, nil)	
	ScarletDawnToggleCustomSounds 	= missionCommands.addCommandForCoalition(coalition.side.BLUE, "Toggle Custom Sounds", ScarletDawnSNDOptions, function() SEF_ToggleCustomSounds() end, nil)	
	ScarletDawnClearCarrierFighters = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Clear Carrier Deck Of Fighters", ScarletDawnOptions, function() SEF_ClearAIFightersFromCarrierDeck() end, nil)
	ScarletDawnClearCarrierTankers  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Clear Carrier Deck Of Tankers", ScarletDawnOptions, function() SEF_ClearAITankersFromCarrierDeck() end, nil)
	ScarletDawnPhaseCheck  			= missionCommands.addCommandForCoalition(coalition.side.BLUE, "Check Battle Phase", ScarletDawnOptions, function() SEF_BattlePhaseCheck() end, nil)
	ScarletDawnSkipScenario  		= missionCommands.addCommandForCoalition(coalition.side.BLUE, "Skip This Mission", ScarletDawnOptions, function() SEF_SkipScenario() end, nil)	
	
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////CAP FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuCAP_INC = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Incirlik", SupportMenuCAP)
	SupportMenuCAP_RD = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Ramat David", SupportMenuCAP)
	
	--////CAP Support Sector List
	
	SupportMenuCAP_INC_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuCAP_INC)
	SupportMenuCAP_INC_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuCAP_INC)
	SupportMenuCAP_INC_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuCAP_INC)
	SupportMenuCAP_INC_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuCAP_INC)
	SupportMenuCAP_INC_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuCAP_INC)
	SupportMenuCAP_INC_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuCAP_INC)
	
	SupportMenuCAP_RD_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuCAP_RD)
	SupportMenuCAP_RD_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuCAP_RD)
	SupportMenuCAP_RD_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuCAP_RD)
	SupportMenuCAP_RD_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuCAP_RD)
	SupportMenuCAP_RD_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuCAP_RD)
	SupportMenuCAP_RD_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuCAP_RD)
	
	--////DEPARTING INCIRLIK
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuCAP_INC_Turkey, function() SEF_USAEFCAPSPAWN("Incirlik", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuCAP_INC_Turkey, function() SEF_USAEFCAPSPAWN("Incirlik", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuCAP_INC_Turkey, function() SEF_USAEFCAPSPAWN("Incirlik", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuCAP_INC_Turkey, function() SEF_USAEFCAPSPAWN("Incirlik", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuCAP_INC_Turkey, function() SEF_USAEFCAPSPAWN("Incirlik", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuCAP_INC_Turkey, function() SEF_USAEFCAPSPAWN("Incirlik", "Sanliurfa") end, nil)
		
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuCAP_INC_Isreal, function() SEF_USAEFCAPSPAWN("Incirlik", "Ramat David") end, nil)
	SupportMenuCAP_INC_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAP_INC_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuCAP_INC_IsrealMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuCAP_INC_IsrealMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuCAP_INC_IsrealMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuCAP_INC_IsrealMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuCAP_INC_North, function() SEF_USAEFCAPSPAWN("Incirlik", "Palmyra") end, nil)
	SupportMenuCAP_INC_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAP_INC_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuCAP_INC_NorthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuCAP_INC_NorthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuCAP_INC_NorthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuCAP_INC_NorthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuCAP_INC_NorthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuCAP_INC_NorthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuCAP_INC_South, function() SEF_USAEFCAPSPAWN("Incirlik", "Qabr as Sitt") end, nil)
	SupportMenuCAP_INC_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAP_INC_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuCAP_INC_SouthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuCAP_INC_SouthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuCAP_INC_SouthMore, function() SEF_USAEFCAPSPAWN("Incirlik", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuCAP_INC_Iraq, function() SEF_USAEFCAPSPAWN("Incirlik", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuCAP_INC_Iraq, function() SEF_USAEFCAPSPAWN("Incirlik", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuCAP_INC_Iraq, function() SEF_USAEFCAPSPAWN("Incirlik", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuCAP_INC_Iraq, function() SEF_USAEFCAPSPAWN("Incirlik", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuCAP_INC_Cyprus, function() SEF_USAEFCAPSPAWN("Incirlik", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuCAP_INC_Cyprus, function() SEF_USAEFCAPSPAWN("Incirlik", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuCAP_INC_Cyprus, function() SEF_USAEFCAPSPAWN("Incirlik", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuCAP_INC_Cyprus, function() SEF_USAEFCAPSPAWN("Incirlik", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuCAP_INC_Cyprus, function() SEF_USAEFCAPSPAWN("Incirlik", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuCAP_INC_Cyprus, function() SEF_USAEFCAPSPAWN("Incirlik", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuCAP_INC_Cyprus, function() SEF_USAEFCAPSPAWN("Incirlik", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuCAP_INC_Cyprus, function() SEF_USAEFCAPSPAWN("Incirlik", "Pinarbashi") end, nil)
		
	--////DEPARTING RAMAT DAVID
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuCAP_RD_Turkey, function() SEF_USAEFCAPSPAWN("Ramat David", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuCAP_RD_Turkey, function() SEF_USAEFCAPSPAWN("Ramat David", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuCAP_RD_Turkey, function() SEF_USAEFCAPSPAWN("Ramat David", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuCAP_RD_Turkey, function() SEF_USAEFCAPSPAWN("Ramat David", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuCAP_RD_Turkey, function() SEF_USAEFCAPSPAWN("Ramat David", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuCAP_RD_Turkey, function() SEF_USAEFCAPSPAWN("Ramat David", "Sanliurfa") end, nil)
	
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuCAP_RD_Isreal, function() SEF_USAEFCAPSPAWN("Ramat David", "Ramat David") end, nil)
	SupportMenuCAP_RD_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAP_RD_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuCAP_RD_IsrealMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuCAP_RD_IsrealMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuCAP_RD_IsrealMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuCAP_RD_IsrealMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuCAP_RD_North, function() SEF_USAEFCAPSPAWN("Ramat David", "Palmyra") end, nil)
	SupportMenuCAP_RD_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAP_RD_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuCAP_RD_NorthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuCAP_RD_NorthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuCAP_RD_NorthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuCAP_RD_NorthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuCAP_RD_NorthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuCAP_RD_NorthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuCAP_RD_South, function() SEF_USAEFCAPSPAWN("Ramat David", "Qabr as Sitt") end, nil)
	SupportMenuCAP_RD_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAP_RD_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuCAP_RD_SouthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuCAP_RD_SouthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuCAP_RD_SouthMore, function() SEF_USAEFCAPSPAWN("Ramat David", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuCAP_RD_Iraq, function() SEF_USAEFCAPSPAWN("Ramat David", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuCAP_RD_Iraq, function() SEF_USAEFCAPSPAWN("Ramat David", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuCAP_RD_Iraq, function() SEF_USAEFCAPSPAWN("Ramat David", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuCAP_RD_Iraq, function() SEF_USAEFCAPSPAWN("Ramat David", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuCAP_RD_Cyprus, function() SEF_USAEFCAPSPAWN("Ramat David", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuCAP_RD_Cyprus, function() SEF_USAEFCAPSPAWN("Ramat David", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuCAP_RD_Cyprus, function() SEF_USAEFCAPSPAWN("Ramat David", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuCAP_RD_Cyprus, function() SEF_USAEFCAPSPAWN("Ramat David", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuCAP_RD_Cyprus, function() SEF_USAEFCAPSPAWN("Ramat David", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuCAP_RD_Cyprus, function() SEF_USAEFCAPSPAWN("Ramat David", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuCAP_RD_Cyprus, function() SEF_USAEFCAPSPAWN("Ramat David", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuCAP_RD_Cyprus, function() SEF_USAEFCAPSPAWN("Ramat David", "Pinarbashi") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////CAS FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuCAS_INC = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Incirlik", SupportMenuCAS)
	SupportMenuCAS_RD = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Ramat David", SupportMenuCAS)
	
	--////CAS Support Sector List
	
	SupportMenuCAS_INC_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuCAS_INC)
	SupportMenuCAS_INC_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuCAS_INC)
	SupportMenuCAS_INC_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuCAS_INC)
	SupportMenuCAS_INC_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuCAS_INC)
	SupportMenuCAS_INC_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuCAS_INC)
	SupportMenuCAS_INC_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuCAS_INC)
	
	SupportMenuCAS_RD_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuCAS_RD)
	SupportMenuCAS_RD_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuCAS_RD)
	SupportMenuCAS_RD_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuCAS_RD)
	SupportMenuCAS_RD_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuCAS_RD)
	SupportMenuCAS_RD_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuCAS_RD)
	SupportMenuCAS_RD_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuCAS_RD)
	
	--////DEPARTING INCIRLIK
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuCAS_INC_Turkey, function() SEF_USAEFCASSPAWN("Incirlik", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuCAS_INC_Turkey, function() SEF_USAEFCASSPAWN("Incirlik", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuCAS_INC_Turkey, function() SEF_USAEFCASSPAWN("Incirlik", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuCAS_INC_Turkey, function() SEF_USAEFCASSPAWN("Incirlik", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuCAS_INC_Turkey, function() SEF_USAEFCASSPAWN("Incirlik", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuCAS_INC_Turkey, function() SEF_USAEFCASSPAWN("Incirlik", "Sanliurfa") end, nil)
		
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuCAS_INC_Isreal, function() SEF_USAEFCASSPAWN("Incirlik", "Ramat David") end, nil)
	SupportMenuCAS_INC_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAS_INC_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuCAS_INC_IsrealMore, function() SEF_USAEFCASSPAWN("Incirlik", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuCAS_INC_IsrealMore, function() SEF_USAEFCASSPAWN("Incirlik", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuCAS_INC_IsrealMore, function() SEF_USAEFCASSPAWN("Incirlik", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuCAS_INC_IsrealMore, function() SEF_USAEFCASSPAWN("Incirlik", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuCAS_INC_North, function() SEF_USAEFCASSPAWN("Incirlik", "Palmyra") end, nil)
	SupportMenuCAS_INC_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAS_INC_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuCAS_INC_NorthMore, function() SEF_USAEFCASSPAWN("Incirlik", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuCAS_INC_NorthMore, function() SEF_USAEFCASSPAWN("Incirlik", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuCAS_INC_NorthMore, function() SEF_USAEFCASSPAWN("Incirlik", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuCAS_INC_NorthMore, function() SEF_USAEFCASSPAWN("Incirlik", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuCAS_INC_NorthMore, function() SEF_USAEFCASSPAWN("Incirlik", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuCAS_INC_NorthMore, function() SEF_USAEFCASSPAWN("Incirlik", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuCAS_INC_South, function() SEF_USAEFCASSPAWN("Incirlik", "Qabr as Sitt") end, nil)
	SupportMenuCAS_INC_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAS_INC_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuCAS_INC_SouthMore, function() SEF_USAEFCASSPAWN("Incirlik", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuCAS_INC_SouthMore, function() SEF_USAEFCASSPAWN("Incirlik", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuCAS_INC_SouthMore, function() SEF_USAEFCASSPAWN("Incirlik", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuCAS_INC_Iraq, function() SEF_USAEFCASSPAWN("Incirlik", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuCAS_INC_Iraq, function() SEF_USAEFCASSPAWN("Incirlik", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuCAS_INC_Iraq, function() SEF_USAEFCASSPAWN("Incirlik", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuCAS_INC_Iraq, function() SEF_USAEFCASSPAWN("Incirlik", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuCAS_INC_Cyprus, function() SEF_USAEFCASSPAWN("Incirlik", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuCAS_INC_Cyprus, function() SEF_USAEFCASSPAWN("Incirlik", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuCAS_INC_Cyprus, function() SEF_USAEFCASSPAWN("Incirlik", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuCAS_INC_Cyprus, function() SEF_USAEFCASSPAWN("Incirlik", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuCAS_INC_Cyprus, function() SEF_USAEFCASSPAWN("Incirlik", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuCAS_INC_Cyprus, function() SEF_USAEFCASSPAWN("Incirlik", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuCAS_INC_Cyprus, function() SEF_USAEFCASSPAWN("Incirlik", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuCAS_INC_Cyprus, function() SEF_USAEFCASSPAWN("Incirlik", "Pinarbashi") end, nil)
	
	--////DEPARTING RAMAT DAVID
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuCAS_RD_Turkey, function() SEF_USAEFCASSPAWN("Ramat David", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuCAS_RD_Turkey, function() SEF_USAEFCASSPAWN("Ramat David", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuCAS_RD_Turkey, function() SEF_USAEFCASSPAWN("Ramat David", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuCAS_RD_Turkey, function() SEF_USAEFCASSPAWN("Ramat David", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuCAS_RD_Turkey, function() SEF_USAEFCASSPAWN("Ramat David", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuCAS_RD_Turkey, function() SEF_USAEFCASSPAWN("Ramat David", "Sanliurfa") end, nil)
	
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuCAS_RD_Isreal, function() SEF_USAEFCASSPAWN("Ramat David", "Ramat David") end, nil)
	SupportMenuCAS_RD_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAS_RD_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuCAS_RD_IsrealMore, function() SEF_USAEFCASSPAWN("Ramat David", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuCAS_RD_IsrealMore, function() SEF_USAEFCASSPAWN("Ramat David", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuCAS_RD_IsrealMore, function() SEF_USAEFCASSPAWN("Ramat David", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuCAS_RD_IsrealMore, function() SEF_USAEFCASSPAWN("Ramat David", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuCAS_RD_North, function() SEF_USAEFCASSPAWN("Ramat David", "Palmyra") end, nil)
	SupportMenuCAS_RD_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAS_RD_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuCAS_RD_NorthMore, function() SEF_USAEFCASSPAWN("Ramat David", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuCAS_RD_NorthMore, function() SEF_USAEFCASSPAWN("Ramat David", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuCAS_RD_NorthMore, function() SEF_USAEFCASSPAWN("Ramat David", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuCAS_RD_NorthMore, function() SEF_USAEFCASSPAWN("Ramat David", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuCAS_RD_NorthMore, function() SEF_USAEFCASSPAWN("Ramat David", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuCAS_RD_NorthMore, function() SEF_USAEFCASSPAWN("Ramat David", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuCAS_RD_South, function() SEF_USAEFCASSPAWN("Ramat David", "Qabr as Sitt") end, nil)
	SupportMenuCAS_RD_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuCAS_RD_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuCAS_RD_SouthMore, function() SEF_USAEFCASSPAWN("Ramat David", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuCAS_RD_SouthMore, function() SEF_USAEFCASSPAWN("Ramat David", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuCAS_RD_SouthMore, function() SEF_USAEFCASSPAWN("Ramat David", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuCAS_RD_Iraq, function() SEF_USAEFCASSPAWN("Ramat David", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuCAS_RD_Iraq, function() SEF_USAEFCASSPAWN("Ramat David", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuCAS_RD_Iraq, function() SEF_USAEFCASSPAWN("Ramat David", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuCAS_RD_Iraq, function() SEF_USAEFCASSPAWN("Ramat David", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuCAS_RD_Cyprus, function() SEF_USAEFCASSPAWN("Ramat David", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuCAS_RD_Cyprus, function() SEF_USAEFCASSPAWN("Ramat David", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuCAS_RD_Cyprus, function() SEF_USAEFCASSPAWN("Ramat David", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuCAS_RD_Cyprus, function() SEF_USAEFCASSPAWN("Ramat David", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuCAS_RD_Cyprus, function() SEF_USAEFCASSPAWN("Ramat David", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuCAS_RD_Cyprus, function() SEF_USAEFCASSPAWN("Ramat David", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuCAS_RD_Cyprus, function() SEF_USAEFCASSPAWN("Ramat David", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuCAS_RD_Cyprus, function() SEF_USAEFCASSPAWN("Ramat David", "Pinarbashi") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////SEAD FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuSEAD_INC = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Incirlik", SupportMenuSEAD)
	SupportMenuSEAD_RD = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Ramat David", SupportMenuSEAD)
	
	--////SEAD Support Sector List
	
	SupportMenuSEAD_INC_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuSEAD_INC)
	SupportMenuSEAD_INC_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuSEAD_INC)
	SupportMenuSEAD_INC_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuSEAD_INC)
	SupportMenuSEAD_INC_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuSEAD_INC)
	SupportMenuSEAD_INC_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuSEAD_INC)
	SupportMenuSEAD_INC_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuSEAD_INC)
	
	SupportMenuSEAD_RD_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuSEAD_RD)
	SupportMenuSEAD_RD_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuSEAD_RD)
	SupportMenuSEAD_RD_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuSEAD_RD)
	SupportMenuSEAD_RD_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuSEAD_RD)
	SupportMenuSEAD_RD_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuSEAD_RD)
	SupportMenuSEAD_RD_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuSEAD_RD)
	
	--////DEPARTING INCIRLIK
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuSEAD_INC_Turkey, function() SEF_USAEFSEADSPAWN("Incirlik", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuSEAD_INC_Turkey, function() SEF_USAEFSEADSPAWN("Incirlik", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuSEAD_INC_Turkey, function() SEF_USAEFSEADSPAWN("Incirlik", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuSEAD_INC_Turkey, function() SEF_USAEFSEADSPAWN("Incirlik", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuSEAD_INC_Turkey, function() SEF_USAEFSEADSPAWN("Incirlik", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuSEAD_INC_Turkey, function() SEF_USAEFSEADSPAWN("Incirlik", "Sanliurfa") end, nil)
		
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuSEAD_INC_Isreal, function() SEF_USAEFSEADSPAWN("Incirlik", "Ramat David") end, nil)
	SupportMenuSEAD_INC_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuSEAD_INC_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuSEAD_INC_IsrealMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuSEAD_INC_IsrealMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuSEAD_INC_IsrealMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuSEAD_INC_IsrealMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuSEAD_INC_North, function() SEF_USAEFSEADSPAWN("Incirlik", "Palmyra") end, nil)
	SupportMenuSEAD_INC_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuSEAD_INC_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuSEAD_INC_NorthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuSEAD_INC_NorthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuSEAD_INC_NorthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuSEAD_INC_NorthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuSEAD_INC_NorthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuSEAD_INC_NorthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuSEAD_INC_South, function() SEF_USAEFSEADSPAWN("Incirlik", "Qabr as Sitt") end, nil)
	SupportMenuSEAD_INC_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuSEAD_INC_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuSEAD_INC_SouthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuSEAD_INC_SouthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuSEAD_INC_SouthMore, function() SEF_USAEFSEADSPAWN("Incirlik", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuSEAD_INC_Iraq, function() SEF_USAEFSEADSPAWN("Incirlik", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuSEAD_INC_Iraq, function() SEF_USAEFSEADSPAWN("Incirlik", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuSEAD_INC_Iraq, function() SEF_USAEFSEADSPAWN("Incirlik", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuSEAD_INC_Iraq, function() SEF_USAEFSEADSPAWN("Incirlik", "Ruwayshid") end, nil)	
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuSEAD_INC_Cyprus, function() SEF_USAEFSEADSPAWN("Incirlik", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuSEAD_INC_Cyprus, function() SEF_USAEFSEADSPAWN("Incirlik", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuSEAD_INC_Cyprus, function() SEF_USAEFSEADSPAWN("Incirlik", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuSEAD_INC_Cyprus, function() SEF_USAEFSEADSPAWN("Incirlik", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuSEAD_INC_Cyprus, function() SEF_USAEFSEADSPAWN("Incirlik", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuSEAD_INC_Cyprus, function() SEF_USAEFSEADSPAWN("Incirlik", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuSEAD_INC_Cyprus, function() SEF_USAEFSEADSPAWN("Incirlik", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuSEAD_INC_Cyprus, function() SEF_USAEFSEADSPAWN("Incirlik", "Pinarbashi") end, nil)
	
	--////DEPARTING RAMAT DAVID
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuSEAD_RD_Turkey, function() SEF_USAEFSEADSPAWN("Ramat David", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuSEAD_RD_Turkey, function() SEF_USAEFSEADSPAWN("Ramat David", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuSEAD_RD_Turkey, function() SEF_USAEFSEADSPAWN("Ramat David", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuSEAD_RD_Turkey, function() SEF_USAEFSEADSPAWN("Ramat David", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuSEAD_RD_Turkey, function() SEF_USAEFSEADSPAWN("Ramat David", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuSEAD_RD_Turkey, function() SEF_USAEFSEADSPAWN("Ramat David", "Sanliurfa") end, nil)
	
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuSEAD_RD_Isreal, function() SEF_USAEFSEADSPAWN("Ramat David", "Ramat David") end, nil)
	SupportMenuSEAD_RD_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuSEAD_RD_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuSEAD_RD_IsrealMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuSEAD_RD_IsrealMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuSEAD_RD_IsrealMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuSEAD_RD_IsrealMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuSEAD_RD_North, function() SEF_USAEFSEADSPAWN("Ramat David", "Palmyra") end, nil)
	SupportMenuSEAD_RD_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuSEAD_RD_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuSEAD_RD_NorthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuSEAD_RD_NorthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuSEAD_RD_NorthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuSEAD_RD_NorthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuSEAD_RD_NorthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuSEAD_RD_NorthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuSEAD_RD_South, function() SEF_USAEFSEADSPAWN("Ramat David", "Qabr as Sitt") end, nil)
	SupportMenuSEAD_RD_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuSEAD_RD_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuSEAD_RD_SouthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuSEAD_RD_SouthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuSEAD_RD_SouthMore, function() SEF_USAEFSEADSPAWN("Ramat David", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuSEAD_RD_Iraq, function() SEF_USAEFSEADSPAWN("Ramat David", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuSEAD_RD_Iraq, function() SEF_USAEFSEADSPAWN("Ramat David", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuSEAD_RD_Iraq, function() SEF_USAEFSEADSPAWN("Ramat David", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuSEAD_RD_Iraq, function() SEF_USAEFSEADSPAWN("Ramat David", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuSEAD_RD_Cyprus, function() SEF_USAEFSEADSPAWN("Ramat David", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuSEAD_RD_Cyprus, function() SEF_USAEFSEADSPAWN("Ramat David", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuSEAD_RD_Cyprus, function() SEF_USAEFSEADSPAWN("Ramat David", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuSEAD_RD_Cyprus, function() SEF_USAEFSEADSPAWN("Ramat David", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuSEAD_RD_Cyprus, function() SEF_USAEFSEADSPAWN("Ramat David", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuSEAD_RD_Cyprus, function() SEF_USAEFSEADSPAWN("Ramat David", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuSEAD_RD_Cyprus, function() SEF_USAEFSEADSPAWN("Ramat David", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuSEAD_RD_Cyprus, function() SEF_USAEFSEADSPAWN("Ramat David", "Pinarbashi") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////PINPOINT STRIKE FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuPIN_INC = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Incirlik", SupportMenuPIN)
	SupportMenuPIN_RD = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Ramat David", SupportMenuPIN)
	
	--////PIN Support Sector List
	
	SupportMenuPIN_INC_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuPIN_INC)
	SupportMenuPIN_INC_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuPIN_INC)
	SupportMenuPIN_INC_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuPIN_INC)
	SupportMenuPIN_INC_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuPIN_INC)
	SupportMenuPIN_INC_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuPIN_INC)
	SupportMenuPIN_INC_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuPIN_INC)
	
	SupportMenuPIN_RD_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuPIN_RD)
	SupportMenuPIN_RD_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuPIN_RD)
	SupportMenuPIN_RD_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuPIN_RD)
	SupportMenuPIN_RD_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuPIN_RD)
	SupportMenuPIN_RD_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuPIN_RD)
	SupportMenuPIN_RD_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuPIN_RD)
	
	--////DEPARTING INCIRLIK
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuPIN_INC_Turkey, function() SEF_USAEFPINSPAWN("Incirlik", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuPIN_INC_Turkey, function() SEF_USAEFPINSPAWN("Incirlik", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuPIN_INC_Turkey, function() SEF_USAEFPINSPAWN("Incirlik", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuPIN_INC_Turkey, function() SEF_USAEFPINSPAWN("Incirlik", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuPIN_INC_Turkey, function() SEF_USAEFPINSPAWN("Incirlik", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuPIN_INC_Turkey, function() SEF_USAEFPINSPAWN("Incirlik", "Sanliurfa") end, nil)
		
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuPIN_INC_Isreal, function() SEF_USAEFPINSPAWN("Incirlik", "Ramat David") end, nil)
	SupportMenuPIN_INC_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuPIN_INC_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuPIN_INC_IsrealMore, function() SEF_USAEFPINSPAWN("Incirlik", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuPIN_INC_IsrealMore, function() SEF_USAEFPINSPAWN("Incirlik", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuPIN_INC_IsrealMore, function() SEF_USAEFPINSPAWN("Incirlik", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuPIN_INC_IsrealMore, function() SEF_USAEFPINSPAWN("Incirlik", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuPIN_INC_North, function() SEF_USAEFPINSPAWN("Incirlik", "Palmyra") end, nil)
	SupportMenuPIN_INC_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuPIN_INC_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuPIN_INC_NorthMore, function() SEF_USAEFPINSPAWN("Incirlik", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuPIN_INC_NorthMore, function() SEF_USAEFPINSPAWN("Incirlik", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuPIN_INC_NorthMore, function() SEF_USAEFPINSPAWN("Incirlik", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuPIN_INC_NorthMore, function() SEF_USAEFPINSPAWN("Incirlik", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuPIN_INC_NorthMore, function() SEF_USAEFPINSPAWN("Incirlik", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuPIN_INC_NorthMore, function() SEF_USAEFPINSPAWN("Incirlik", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuPIN_INC_South, function() SEF_USAEFPINSPAWN("Incirlik", "Qabr as Sitt") end, nil)
	SupportMenuPIN_INC_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuPIN_INC_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuPIN_INC_SouthMore, function() SEF_USAEFPINSPAWN("Incirlik", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuPIN_INC_SouthMore, function() SEF_USAEFPINSPAWN("Incirlik", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuPIN_INC_SouthMore, function() SEF_USAEFPINSPAWN("Incirlik", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuPIN_INC_Iraq, function() SEF_USAEFPINSPAWN("Incirlik", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuPIN_INC_Iraq, function() SEF_USAEFPINSPAWN("Incirlik", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuPIN_INC_Iraq, function() SEF_USAEFPINSPAWN("Incirlik", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuPIN_INC_Iraq, function() SEF_USAEFPINSPAWN("Incirlik", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuPIN_INC_Cyprus, function() SEF_USAEFPINSPAWN("Incirlik", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuPIN_INC_Cyprus, function() SEF_USAEFPINSPAWN("Incirlik", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuPIN_INC_Cyprus, function() SEF_USAEFPINSPAWN("Incirlik", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuPIN_INC_Cyprus, function() SEF_USAEFPINSPAWN("Incirlik", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuPIN_INC_Cyprus, function() SEF_USAEFPINSPAWN("Incirlik", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuPIN_INC_Cyprus, function() SEF_USAEFPINSPAWN("Incirlik", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuPIN_INC_Cyprus, function() SEF_USAEFPINSPAWN("Incirlik", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuPIN_INC_Cyprus, function() SEF_USAEFPINSPAWN("Incirlik", "Pinarbashi") end, nil)
	
	--////DEPARTING RAMAT DAVID
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuPIN_RD_Turkey, function() SEF_USAEFPINSPAWN("Ramat David", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuPIN_RD_Turkey, function() SEF_USAEFPINSPAWN("Ramat David", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuPIN_RD_Turkey, function() SEF_USAEFPINSPAWN("Ramat David", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuPIN_RD_Turkey, function() SEF_USAEFPINSPAWN("Ramat David", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuPIN_RD_Turkey, function() SEF_USAEFPINSPAWN("Ramat David", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuPIN_RD_Turkey, function() SEF_USAEFPINSPAWN("Ramat David", "Sanliurfa") end, nil)
	
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuPIN_RD_Isreal, function() SEF_USAEFPINSPAWN("Ramat David", "Ramat David") end, nil)
	SupportMenuPIN_RD_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuPIN_RD_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuPIN_RD_IsrealMore, function() SEF_USAEFPINSPAWN("Ramat David", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuPIN_RD_IsrealMore, function() SEF_USAEFPINSPAWN("Ramat David", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuPIN_RD_IsrealMore, function() SEF_USAEFPINSPAWN("Ramat David", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuPIN_RD_IsrealMore, function() SEF_USAEFPINSPAWN("Ramat David", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuPIN_RD_North, function() SEF_USAEFPINSPAWN("Ramat David", "Palmyra") end, nil)
	SupportMenuPIN_RD_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuPIN_RD_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuPIN_RD_NorthMore, function() SEF_USAEFPINSPAWN("Ramat David", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuPIN_RD_NorthMore, function() SEF_USAEFPINSPAWN("Ramat David", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuPIN_RD_NorthMore, function() SEF_USAEFPINSPAWN("Ramat David", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuPIN_RD_NorthMore, function() SEF_USAEFPINSPAWN("Ramat David", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuPIN_RD_NorthMore, function() SEF_USAEFPINSPAWN("Ramat David", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuPIN_RD_NorthMore, function() SEF_USAEFPINSPAWN("Ramat David", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuPIN_RD_South, function() SEF_USAEFPINSPAWN("Ramat David", "Qabr as Sitt") end, nil)
	SupportMenuPIN_RD_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuPIN_RD_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuPIN_RD_SouthMore, function() SEF_USAEFPINSPAWN("Ramat David", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuPIN_RD_SouthMore, function() SEF_USAEFPINSPAWN("Ramat David", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuPIN_RD_SouthMore, function() SEF_USAEFPINSPAWN("Ramat David", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuPIN_RD_Iraq, function() SEF_USAEFPINSPAWN("Ramat David", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuPIN_RD_Iraq, function() SEF_USAEFPINSPAWN("Ramat David", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuPIN_RD_Iraq, function() SEF_USAEFPINSPAWN("Ramat David", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuPIN_RD_Iraq, function() SEF_USAEFPINSPAWN("Ramat David", "Ruwayshid") end, nil)	
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuPIN_RD_Cyprus, function() SEF_USAEFPINSPAWN("Ramat David", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuPIN_RD_Cyprus, function() SEF_USAEFPINSPAWN("Ramat David", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuPIN_RD_Cyprus, function() SEF_USAEFPINSPAWN("Ramat David", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuPIN_RD_Cyprus, function() SEF_USAEFPINSPAWN("Ramat David", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuPIN_RD_Cyprus, function() SEF_USAEFPINSPAWN("Ramat David", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuPIN_RD_Cyprus, function() SEF_USAEFPINSPAWN("Ramat David", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuPIN_RD_Cyprus, function() SEF_USAEFPINSPAWN("Ramat David", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuPIN_RD_Cyprus, function() SEF_USAEFPINSPAWN("Ramat David", "Pinarbashi") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////ANTI SHIPPING FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuASS_INC = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Incirlik", SupportMenuASS)
	SupportMenuASS_RD = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Ramat David", SupportMenuASS)
	
	--////ASS Support Sector List
	
	SupportMenuASS_INC_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuASS_INC)
	SupportMenuASS_INC_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuASS_INC)
	SupportMenuASS_INC_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuASS_INC)
	SupportMenuASS_INC_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuASS_INC)
	SupportMenuASS_INC_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuASS_INC)
	SupportMenuASS_INC_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuASS_INC)
	
	SupportMenuASS_RD_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuASS_RD)
	SupportMenuASS_RD_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuASS_RD)
	SupportMenuASS_RD_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuASS_RD)
	SupportMenuASS_RD_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuASS_RD)
	SupportMenuASS_RD_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuASS_RD)
	SupportMenuASS_RD_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuASS_RD)
	
	--////DEPARTING INCIRLIK
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuASS_INC_Turkey, function() SEF_USAEFASSSPAWN("Incirlik", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuASS_INC_Turkey, function() SEF_USAEFASSSPAWN("Incirlik", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuASS_INC_Turkey, function() SEF_USAEFASSSPAWN("Incirlik", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuASS_INC_Turkey, function() SEF_USAEFASSSPAWN("Incirlik", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuASS_INC_Turkey, function() SEF_USAEFASSSPAWN("Incirlik", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuASS_INC_Turkey, function() SEF_USAEFASSSPAWN("Incirlik", "Sanliurfa") end, nil)
		
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuASS_INC_Isreal, function() SEF_USAEFASSSPAWN("Incirlik", "Ramat David") end, nil)
	SupportMenuASS_INC_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuASS_INC_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuASS_INC_IsrealMore, function() SEF_USAEFASSSPAWN("Incirlik", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuASS_INC_IsrealMore, function() SEF_USAEFASSSPAWN("Incirlik", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuASS_INC_IsrealMore, function() SEF_USAEFASSSPAWN("Incirlik", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuASS_INC_IsrealMore, function() SEF_USAEFASSSPAWN("Incirlik", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuASS_INC_North, function() SEF_USAEFASSSPAWN("Incirlik", "Palmyra") end, nil)
	SupportMenuASS_INC_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuASS_INC_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuASS_INC_NorthMore, function() SEF_USAEFASSSPAWN("Incirlik", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuASS_INC_NorthMore, function() SEF_USAEFASSSPAWN("Incirlik", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuASS_INC_NorthMore, function() SEF_USAEFASSSPAWN("Incirlik", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuASS_INC_NorthMore, function() SEF_USAEFASSSPAWN("Incirlik", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuASS_INC_NorthMore, function() SEF_USAEFASSSPAWN("Incirlik", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuASS_INC_NorthMore, function() SEF_USAEFASSSPAWN("Incirlik", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuASS_INC_South, function() SEF_USAEFASSSPAWN("Incirlik", "Qabr as Sitt") end, nil)
	SupportMenuASS_INC_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuASS_INC_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuASS_INC_SouthMore, function() SEF_USAEFASSSPAWN("Incirlik", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuASS_INC_SouthMore, function() SEF_USAEFASSSPAWN("Incirlik", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuASS_INC_SouthMore, function() SEF_USAEFASSSPAWN("Incirlik", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuASS_INC_Iraq, function() SEF_USAEFASSSPAWN("Incirlik", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuASS_INC_Iraq, function() SEF_USAEFASSSPAWN("Incirlik", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuASS_INC_Iraq, function() SEF_USAEFASSSPAWN("Incirlik", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuASS_INC_Iraq, function() SEF_USAEFASSSPAWN("Incirlik", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuASS_INC_Cyprus, function() SEF_USAEFASSSPAWN("Incirlik", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuASS_INC_Cyprus, function() SEF_USAEFASSSPAWN("Incirlik", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuASS_INC_Cyprus, function() SEF_USAEFASSSPAWN("Incirlik", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuASS_INC_Cyprus, function() SEF_USAEFASSSPAWN("Incirlik", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuASS_INC_Cyprus, function() SEF_USAEFASSSPAWN("Incirlik", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuASS_INC_Cyprus, function() SEF_USAEFASSSPAWN("Incirlik", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuASS_INC_Cyprus, function() SEF_USAEFASSSPAWN("Incirlik", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuASS_INC_Cyprus, function() SEF_USAEFASSSPAWN("Incirlik", "Pinarbashi") end, nil)
	
	--////DEPARTING RAMAT DAVID
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuASS_RD_Turkey, function() SEF_USAEFASSSPAWN("Ramat David", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuASS_RD_Turkey, function() SEF_USAEFASSSPAWN("Ramat David", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuASS_RD_Turkey, function() SEF_USAEFASSSPAWN("Ramat David", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuASS_RD_Turkey, function() SEF_USAEFASSSPAWN("Ramat David", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuASS_RD_Turkey, function() SEF_USAEFASSSPAWN("Ramat David", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuASS_RD_Turkey, function() SEF_USAEFASSSPAWN("Ramat David", "Sanliurfa") end, nil)
	
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuASS_RD_Isreal, function() SEF_USAEFASSSPAWN("Ramat David", "Ramat David") end, nil)
	SupportMenuASS_RD_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuASS_RD_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuASS_RD_IsrealMore, function() SEF_USAEFASSSPAWN("Ramat David", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuASS_RD_IsrealMore, function() SEF_USAEFASSSPAWN("Ramat David", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuASS_RD_IsrealMore, function() SEF_USAEFASSSPAWN("Ramat David", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuASS_RD_IsrealMore, function() SEF_USAEFASSSPAWN("Ramat David", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuASS_RD_North, function() SEF_USAEFASSSPAWN("Ramat David", "Palmyra") end, nil)
	SupportMenuASS_RD_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuASS_RD_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuASS_RD_NorthMore, function() SEF_USAEFASSSPAWN("Ramat David", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuASS_RD_NorthMore, function() SEF_USAEFASSSPAWN("Ramat David", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuASS_RD_NorthMore, function() SEF_USAEFASSSPAWN("Ramat David", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuASS_RD_NorthMore, function() SEF_USAEFASSSPAWN("Ramat David", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuASS_RD_NorthMore, function() SEF_USAEFASSSPAWN("Ramat David", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuASS_RD_NorthMore, function() SEF_USAEFASSSPAWN("Ramat David", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuASS_RD_South, function() SEF_USAEFASSSPAWN("Ramat David", "Qabr as Sitt") end, nil)
	SupportMenuASS_RD_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuASS_RD_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuASS_RD_SouthMore, function() SEF_USAEFASSSPAWN("Ramat David", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuASS_RD_SouthMore, function() SEF_USAEFASSSPAWN("Ramat David", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuASS_RD_SouthMore, function() SEF_USAEFASSSPAWN("Ramat David", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuASS_RD_Iraq, function() SEF_USAEFASSSPAWN("Ramat David", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuASS_RD_Iraq, function() SEF_USAEFASSSPAWN("Ramat David", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuASS_RD_Iraq, function() SEF_USAEFASSSPAWN("Ramat David", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuASS_RD_Iraq, function() SEF_USAEFASSSPAWN("Ramat David", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuASS_RD_Cyprus, function() SEF_USAEFASSSPAWN("Ramat David", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuASS_RD_Cyprus, function() SEF_USAEFASSSPAWN("Ramat David", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuASS_RD_Cyprus, function() SEF_USAEFASSSPAWN("Ramat David", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuASS_RD_Cyprus, function() SEF_USAEFASSSPAWN("Ramat David", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuASS_RD_Cyprus, function() SEF_USAEFASSSPAWN("Ramat David", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuASS_RD_Cyprus, function() SEF_USAEFASSSPAWN("Ramat David", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuASS_RD_Cyprus, function() SEF_USAEFASSSPAWN("Ramat David", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuASS_RD_Cyprus, function() SEF_USAEFASSSPAWN("Ramat David", "Pinarbashi") end, nil)
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////DRONE FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuDRONE_INC = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Incirlik", SupportMenuDRONE)
	SupportMenuDRONE_RD = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Ramat David", SupportMenuDRONE)
	
	--////DRONE Support Sector List
	
	SupportMenuDRONE_INC_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuDRONE_INC)
	SupportMenuDRONE_INC_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuDRONE_INC)
	SupportMenuDRONE_INC_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuDRONE_INC)
	SupportMenuDRONE_INC_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuDRONE_INC)
	SupportMenuDRONE_INC_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuDRONE_INC)
	SupportMenuDRONE_INC_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuDRONE_INC)
	
	SupportMenuDRONE_RD_Turkey = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Turkish Sectors", SupportMenuDRONE_RD)
	SupportMenuDRONE_RD_Isreal = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Israeli Jordanian And Lebanese Sectors", SupportMenuDRONE_RD)
	SupportMenuDRONE_RD_North = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Northern And Central Syrian Sectors", SupportMenuDRONE_RD)
	SupportMenuDRONE_RD_South = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Southern Syrian Sectors", SupportMenuDRONE_RD)
	SupportMenuDRONE_RD_Iraq = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Iraqi Sectors", SupportMenuDRONE_RD)
	SupportMenuDRONE_RD_Cyprus = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Cyprian Sectors", SupportMenuDRONE_RD)
	
	--////DEPARTING INCIRLIK
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuDRONE_INC_Turkey, function() SEF_USAEFDRONESPAWN("Incirlik", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuDRONE_INC_Turkey, function() SEF_USAEFDRONESPAWN("Incirlik", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuDRONE_INC_Turkey, function() SEF_USAEFDRONESPAWN("Incirlik", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuDRONE_INC_Turkey, function() SEF_USAEFDRONESPAWN("Incirlik", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuDRONE_INC_Turkey, function() SEF_USAEFDRONESPAWN("Incirlik", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuDRONE_INC_Turkey, function() SEF_USAEFDRONESPAWN("Incirlik", "Sanliurfa") end, nil)
		
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuDRONE_INC_Isreal, function() SEF_USAEFDRONESPAWN("Incirlik", "Ramat David") end, nil)
	SupportMenuDRONE_INC_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuDRONE_INC_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuDRONE_INC_IsrealMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuDRONE_INC_IsrealMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuDRONE_INC_IsrealMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuDRONE_INC_IsrealMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuDRONE_INC_North, function() SEF_USAEFDRONESPAWN("Incirlik", "Palmyra") end, nil)
	SupportMenuDRONE_INC_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuDRONE_INC_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuDRONE_INC_NorthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuDRONE_INC_NorthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuDRONE_INC_NorthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuDRONE_INC_NorthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuDRONE_INC_NorthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuDRONE_INC_NorthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuDRONE_INC_South, function() SEF_USAEFDRONESPAWN("Incirlik", "Qabr as Sitt") end, nil)
	SupportMenuDRONE_INC_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuDRONE_INC_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuDRONE_INC_SouthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuDRONE_INC_SouthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuDRONE_INC_SouthMore, function() SEF_USAEFDRONESPAWN("Incirlik", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuDRONE_INC_Iraq, function() SEF_USAEFDRONESPAWN("Incirlik", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuDRONE_INC_Iraq, function() SEF_USAEFDRONESPAWN("Incirlik", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuDRONE_INC_Iraq, function() SEF_USAEFDRONESPAWN("Incirlik", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuDRONE_INC_Iraq, function() SEF_USAEFDRONESPAWN("Incirlik", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuDRONE_INC_Cyprus, function() SEF_USAEFDRONESPAWN("Incirlik", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuDRONE_INC_Cyprus, function() SEF_USAEFDRONESPAWN("Incirlik", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuDRONE_INC_Cyprus, function() SEF_USAEFDRONESPAWN("Incirlik", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuDRONE_INC_Cyprus, function() SEF_USAEFDRONESPAWN("Incirlik", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuDRONE_INC_Cyprus, function() SEF_USAEFDRONESPAWN("Incirlik", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuDRONE_INC_Cyprus, function() SEF_USAEFDRONESPAWN("Incirlik", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuDRONE_INC_Cyprus, function() SEF_USAEFDRONESPAWN("Incirlik", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuDRONE_INC_Cyprus, function() SEF_USAEFDRONESPAWN("Incirlik", "Pinarbashi") end, nil)
	
	--////DEPARTING RAMAT DAVID
	
	--////TURKEY
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Adana Sakirpasa", SupportMenuDRONE_RD_Turkey, function() SEF_USAEFDRONESPAWN("Ramat David", "Adana Sakirpasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gaziantep", SupportMenuDRONE_RD_Turkey, function() SEF_USAEFDRONESPAWN("Ramat David", "Gaziantep") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gazipasa", SupportMenuDRONE_RD_Turkey, function() SEF_USAEFDRONESPAWN("Ramat David", "Gazipasa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hatay", SupportMenuDRONE_RD_Turkey, function() SEF_USAEFDRONESPAWN("Ramat David", "Hatay") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Incirlik", SupportMenuDRONE_RD_Turkey, function() SEF_USAEFDRONESPAWN("Ramat David", "Incirlik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sanliurfa", SupportMenuDRONE_RD_Turkey, function() SEF_USAEFDRONESPAWN("Ramat David", "Sanliurfa") end, nil)
	
	--////ISREAL JORDAN LEBANON
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beirut", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "Beirut-Rafic Hariri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Eyn Shemer", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "Eyn Shemer") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H4", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "H4") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Haifa", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "Haifa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector King Hussein Air College", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "King Hussein Air College") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kiryat Shmona", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "Kiryat Shmona") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Megiddo", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "Megiddo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Naqoura", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "Naqoura") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ramat David", SupportMenuDRONE_RD_Isreal, function() SEF_USAEFDRONESPAWN("Ramat David", "Ramat David") end, nil)
	SupportMenuDRONE_RD_IsrealMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuDRONE_RD_Isreal)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rayak", SupportMenuDRONE_RD_IsrealMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Rayak") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rene Mouawad", SupportMenuDRONE_RD_IsrealMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Rene Mouawad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Rosh Pina", SupportMenuDRONE_RD_IsrealMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Rosh Pina") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Wujah Al Hajar", SupportMenuDRONE_RD_IsrealMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Wujah Al Hajar") end, nil)
	
	--////NORTHERN AND CENTRAL SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu al-Duhur", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Abu al-Duhur") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Aleppo", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Aleppo") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al Qusayr", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Al Qusayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bassel Al-Assad", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Bassel Al-Assad") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Hama", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Hama") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Jirah", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Jirah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kuweires", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Kuweires") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minakh", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Minakh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Palmyra", SupportMenuDRONE_RD_North, function() SEF_USAEFDRONESPAWN("Ramat David", "Palmyra") end, nil)
	SupportMenuDRONE_RD_NorthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuDRONE_RD_North)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Shayrat", SupportMenuDRONE_RD_NorthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Shayrat") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tabqa", SupportMenuDRONE_RD_NorthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Tabqa") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Taftanaz", SupportMenuDRONE_RD_NorthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Taftanaz") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tal Siman", SupportMenuDRONE_RD_NorthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Tal Siman") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tiyas", SupportMenuDRONE_RD_NorthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Tiyas") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kharab Ishk", SupportMenuDRONE_RD_NorthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Kharab Ishk") end, nil)
		
	--////SOUTHERN SYRIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Al-Dumayr", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "Al-Dumayr") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector An Nasiriyah", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "An Nasiriyah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Damascus", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "Damascus") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Khalkhalah", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "Khalkhalah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan North", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "Marj as Sultan North") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj as Sultan South", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "Marj as Sultan South") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Marj Ruhayyil", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "Marj Ruhayyil") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mezzeh", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "Mezzeh") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qabr as Sitt", SupportMenuDRONE_RD_South, function() SEF_USAEFDRONESPAWN("Ramat David", "Qabr as Sitt") end, nil)
	SupportMenuDRONE_RD_SouthMore = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "More Sectors", SupportMenuDRONE_RD_South)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sayqal", SupportMenuDRONE_RD_SouthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Sayqal") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tha'lah", SupportMenuDRONE_RD_SouthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "Tha'lah") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector At Tanf", SupportMenuDRONE_RD_SouthMore, function() SEF_USAEFDRONESPAWN("Ramat David", "At Tanf") end, nil)
	
	--////IRAQ
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3", SupportMenuDRONE_RD_Iraq, function() SEF_USAEFDRONESPAWN("Ramat David", "H3") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Northwest", SupportMenuDRONE_RD_Iraq, function() SEF_USAEFDRONESPAWN("Ramat David", "H3 Northwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector H3 Southwest", SupportMenuDRONE_RD_Iraq, function() SEF_USAEFDRONESPAWN("Ramat David", "H3 Southwest") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ruwayshid", SupportMenuDRONE_RD_Iraq, function() SEF_USAEFDRONESPAWN("Ramat David", "Ruwayshid") end, nil)
	
	--////CYPRUS	
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Akrotiri", SupportMenuDRONE_RD_Cyprus, function() SEF_USAEFDRONESPAWN("Ramat David", "Akrotiri") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ercan", SupportMenuDRONE_RD_Cyprus, function() SEF_USAEFDRONESPAWN("Ramat David", "Ercan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gecitkale", SupportMenuDRONE_RD_Cyprus, function() SEF_USAEFDRONESPAWN("Ramat David", "Gecitkale") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kingsfield", SupportMenuDRONE_RD_Cyprus, function() SEF_USAEFDRONESPAWN("Ramat David", "Kingsfield") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Lakatamia", SupportMenuDRONE_RD_Cyprus, function() SEF_USAEFDRONESPAWN("Ramat David", "Lakatamia") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larnaca", SupportMenuDRONE_RD_Cyprus, function() SEF_USAEFDRONESPAWN("Ramat David", "Larnaca") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Paphos", SupportMenuDRONE_RD_Cyprus, function() SEF_USAEFDRONESPAWN("Ramat David", "Paphos") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Pinarbashi", SupportMenuDRONE_RD_Cyprus, function() SEF_USAEFDRONESPAWN("Ramat David", "Pinarbashi") end, nil)
	
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
	
	if ( Phase <= 2 ) then
	
		local SpawnZone = AIRBASE:FindByName("Incirlik"):GetZone()
		local OrbitZone1 = ZONE:FindByName("AWACS North Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("AWACS North Orbit Point 2")
			
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
		:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {51}, SPAWN.Takeoff.Hot)
		env.info("AWACS Spawned Phase 1/2", false)
	else
		
		local SpawnZone = AIRBASE:FindByName("Incirlik"):GetZone()
		local OrbitZone1 = ZONE:FindByName("AWACS North Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("AWACS North Orbit Point 2")
			
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
		:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {51}, SPAWN.Takeoff.Hot)
		env.info("AWACS Spawned Phase 3/4", false)
	end	
end

function SEF_USAFHAWKEYE_SPAWN()

	USAFHAWKEYE_DATA[1].Vec2 		= nil
	USAFHAWKEYE_DATA[1].TimeStamp 	= nil
	
	local SpawnZone = AIRBASE:FindByName("CV-59 Forrestal"):GetZone()
	local OrbitZone1 = ZONE:FindByName("AWACS South Orbit Point 1")
	local OrbitZone2 = ZONE:FindByName("AWACS South Orbit Point 2")
		
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
		
		local SpawnZone = AIRBASE:FindByName("Incirlik"):GetZone()
		local OrbitZone1 = ZONE:FindByName("Texaco North Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Texaco North Orbit Point 2")
			
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
		:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {50}, SPAWN.Takeoff.Hot)
		env.info("TEXACO Spawned Phase 1/2", false)
	else
		local SpawnZone = AIRBASE:FindByName("Incirlik"):GetZone()
		local OrbitZone1 = ZONE:FindByName("Texaco North Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Texaco North Orbit Point 2")
			
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
		:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {50}, SPAWN.Takeoff.Hot)
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
		
		local SpawnZone = AIRBASE:FindByName("Incirlik"):GetZone()
		local OrbitZone1 = ZONE:FindByName("Shell North Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Shell North Orbit Point 2")
			
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
		:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {49}, SPAWN.Takeoff.Hot)
		env.info("SHELL Spawned Phase 1/2", false)
	else
		
		local SpawnZone = AIRBASE:FindByName("Incirlik"):GetZone()
		local OrbitZone1 = ZONE:FindByName("Shell North Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Shell North Orbit Point 2")
			
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
		:SpawnAtParkingSpot(AIRBASE:FindByName("Incirlik"), {49}, SPAWN.Takeoff.Hot)		
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
	local OrbitZone1 = ZONE:FindByName("Arco West Orbit Point 1")
	local OrbitZone2 = ZONE:FindByName("Arco West Orbit Point 2")
		
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
				timer.scheduleFunction(SEF_TargetSmokeUnlock, nil, timer.getTime() + 300)				
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
				timer.scheduleFunction(SEF_TargetSmokeUnlock, nil, timer.getTime() + 300)				
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
	"Palmyra"
	"Qabr as Sitt"
	"Ramat David"
	"Rayak"
	"Rene Mouawad"
	"Tabqa"
	"Taftanaz"
	"Wujah Al Hajar"
]]--	
	
	if ( 		Airbase.getByName("Adana Sakirpasa"):getCoalition() 			~= 2 or
				Airbase.getByName("Eyn Shemer"):getCoalition() 					~= 2 or
				Airbase.getByName("Gaziantep"):getCoalition() 					~= 2 or
				Airbase.getByName("Gazipasa"):getCoalition() 					~= 2 or
				Airbase.getByName("Haifa"):getCoalition() 						~= 2 or
				Airbase.getByName("Hatay"):getCoalition() 						~= 2 or				
				Airbase.getByName("Kiryat Shmona"):getCoalition() 				~= 2 or
				Airbase.getByName("Megiddo"):getCoalition() 					~= 2 or
				Airbase.getByName("Rosh Pina"):getCoalition() 					~= 2 ) then			
				
				--Then we must be in Phase 1
				trigger.action.outText("Mission Objective\n\nPhase 1 - Secure Turkey And Israel\n\nThe Following Territories Must Be Captured And Held:\n\nAdana Sakirpasa\nEyn Shemer\nGaziantep\nGazipasa\nHaifa\nHatay\nKiryat Shmona\nMegiddo\nRosh Pina", 15)
	
	elseif ( 	Airbase.getByName("Beirut-Rafic Hariri"):getCoalition() 		~= 2 or
				Airbase.getByName("H4"):getCoalition() 							~= 2 or
				Airbase.getByName("King Hussein Air College"):getCoalition() 	~= 2 or
				Airbase.getByName("Rayak"):getCoalition() 						~= 2 or
				Airbase.getByName("Rene Mouawad"):getCoalition() 				~= 2 or
				Airbase.getByName("Wujah Al Hajar"):getCoalition() 				~= 2 ) then
				
				--Then we must be in Phase 2
				trigger.action.outText("Mission Objective\n\nPhase 2 - Secure Lebanon And Jordan\n\nThe Following Territories Must Be Captured And Held:\n\nBeirut-Rafic Hariri\nH4\nKing Hussein Air College\nRayak\nRene Mouawad\nWujah Al Hajar", 15)
				
	elseif (	Airbase.getByName("Minakh"):getCoalition() 						~= 2 or
				Airbase.getByName("Taftanaz"):getCoalition() 					~= 2 or
				Airbase.getByName("Abu al-Duhur"):getCoalition() 				~= 2 or 
				Airbase.getByName("Aleppo"):getCoalition() 						~= 2 or
				Airbase.getByName("Kuweires"):getCoalition() 					~= 2 or
				Airbase.getByName("Jirah"):getCoalition() 						~= 2 or
				Airbase.getByName("Bassel Al-Assad"):getCoalition() 			~= 2 or
				Airbase.getByName("Hama"):getCoalition() 						~= 2 or
				Airbase.getByName("Palmyra"):getCoalition() 					~= 2 or
				Airbase.getByName("Shayrat"):getCoalition() 					~= 2 or
				Airbase.getByName("Tabqa"):getCoalition() 						~= 2 or
				Airbase.getByName("Tal Siman"):getCoalition() 					~= 2 or
				Airbase.getByName("Tiyas"):getCoalition() 						~= 2 or
				Airbase.getByName("Al Qusayr"):getCoalition() 					~= 2 ) then
	
				--Then we must be in Phase 3
				trigger.action.outText("Mission Objective\n\nPhase 3 - Occupation Of Syria\n\nThe Following Territories Must Be Captured And Held:\n\nMinakh\nTaftanaz\nAbu al-Duhur\nAleppo\nKuweires\nJirah\nBassel Al-Assad\nHama\nPalmyra\nShayrat\nTiyas\nAl Qusayr\nTabqa\nTal Siman", 15)
				
	elseif (	Airbase.getByName("Khalkhalah"):getCoalition() 					~= 2 or
				Airbase.getByName("Marj Ruhayyil"):getCoalition() 				~= 2 or
				Airbase.getByName("Damascus"):getCoalition() 					~= 2 or
				Airbase.getByName("Mezzeh"):getCoalition() 						~= 2 or
				Airbase.getByName("Qabr as Sitt"):getCoalition() 				~= 2 or
				Airbase.getByName("Marj as Sultan North"):getCoalition() 		~= 2 or
				Airbase.getByName("Marj as Sultan South"):getCoalition() 		~= 2 or
				Airbase.getByName("Al-Dumayr"):getCoalition() 					~= 2 or
				Airbase.getByName("Sayqal"):getCoalition() 						~= 2 or
				Airbase.getByName("Tha'lah"):getCoalition() 					~= 2 or
				Airbase.getByName("An Nasiriyah"):getCoalition() 				~= 2 ) then
				
				--Then we must be in Phase 4
				trigger.action.outText("Mission Objective\n\nPhase 4 - Invasion Of Damascus\n\nThe Following Territories Must Be Captured And Held:\n\nKhalkhalah\nMarj Ruhayyil\nDamascus\nMezzeh\nQabr as Sitt\nMarj as Sultan North\nMarj as Sultan South\nAl-Dumayr\nSayqal\nTha'lah\nAn Nasiriyah", 15)
	
	elseif (	Airbase.getByName("Adana Sakirpasa"):getCoalition() 			== 2 and
				Airbase.getByName("Eyn Shemer"):getCoalition() 					== 2 and
				Airbase.getByName("Gaziantep"):getCoalition() 					== 2 and
				Airbase.getByName("Gazipasa"):getCoalition() 					== 2 and
				Airbase.getByName("H4"):getCoalition() 							== 2 and
				Airbase.getByName("Haifa"):getCoalition() 						== 2 and
				Airbase.getByName("Hatay"):getCoalition() 						== 2 and			
				Airbase.getByName("King Hussein Air College"):getCoalition() 	== 2 and
				Airbase.getByName("Kiryat Shmona"):getCoalition() 				== 2 and
				Airbase.getByName("Megiddo"):getCoalition() 					== 2 and
				Airbase.getByName("Rosh Pina"):getCoalition() 					== 2 and
				Airbase.getByName("Beirut-Rafic Hariri"):getCoalition() 		== 2 and
				Airbase.getByName("Rayak"):getCoalition() 						== 2 and
				Airbase.getByName("Rene Mouawad"):getCoalition() 				== 2 and
				Airbase.getByName("Wujah Al Hajar"):getCoalition() 				== 2 and
				Airbase.getByName("Minakh"):getCoalition() 						== 2 and
				Airbase.getByName("Taftanaz"):getCoalition() 					== 2 and
				Airbase.getByName("Abu al-Duhur"):getCoalition() 				== 2 and 
				Airbase.getByName("Aleppo"):getCoalition() 						== 2 and
				Airbase.getByName("Kuweires"):getCoalition() 					== 2 and
				Airbase.getByName("Jirah"):getCoalition() 						== 2 and
				Airbase.getByName("Bassel Al-Assad"):getCoalition() 			== 2 and
				Airbase.getByName("Hama"):getCoalition() 						== 2 and
				Airbase.getByName("Palmyra"):getCoalition() 					== 2 and
				Airbase.getByName("Shayrat"):getCoalition() 					== 2 and
				Airbase.getByName("Tabqa"):getCoalition() 						== 2 and
				Airbase.getByName("Tal Siman"):getCoalition() 					== 2 and
				Airbase.getByName("Tiyas"):getCoalition()						== 2 and
				Airbase.getByName("Al Qusayr"):getCoalition() 					== 2 and
				Airbase.getByName("Khalkhalah"):getCoalition()					== 2 and
				Airbase.getByName("Marj Ruhayyil"):getCoalition() 				== 2 and
				Airbase.getByName("Damascus"):getCoalition() 					== 2 and
				Airbase.getByName("Mezzeh"):getCoalition() 						== 2 and
				Airbase.getByName("Qabr as Sitt"):getCoalition() 				== 2 and
				Airbase.getByName("Marj as Sultan North"):getCoalition() 		== 2 and
				Airbase.getByName("Marj as Sultan South"):getCoalition() 		== 2 and
				Airbase.getByName("Al-Dumayr"):getCoalition() 					== 2 and
				Airbase.getByName("Sayqal"):getCoalition() 						== 2 and
				Airbase.getByName("Tha'lah"):getCoalition() 					== 2 and
				Airbase.getByName("An Nasiriyah"):getCoalition() 				== 2 ) then
	
				--Take And Hold Victory Achieved
				trigger.action.outText("Operation Scarlet Dawn - Operation Has Been Successful - Take And Hold Victory Achieved", 60)
				
				OperationComplete = true
				SEF_VictoryAchieved()				
	else
		trigger.action.outText("Unable To Determine Phase", 15)
	end
end

function SEF_BattlePhaseCheckSilent()

	if ( 		Airbase.getByName("Adana Sakirpasa"):getCoalition() 			~= 2 or
				Airbase.getByName("Eyn Shemer"):getCoalition() 					~= 2 or
				Airbase.getByName("Gaziantep"):getCoalition() 					~= 2 or
				Airbase.getByName("Gazipasa"):getCoalition() 					~= 2 or	
				Airbase.getByName("Haifa"):getCoalition() 						~= 2 or
				Airbase.getByName("Hatay"):getCoalition() 						~= 2 or				
				Airbase.getByName("Kiryat Shmona"):getCoalition() 				~= 2 or
				Airbase.getByName("Megiddo"):getCoalition() 					~= 2 or
				Airbase.getByName("Rosh Pina"):getCoalition() 					~= 2 ) then
			
				--Then we must be in Phase 1
				return 1
	
	elseif ( 	Airbase.getByName("Beirut-Rafic Hariri"):getCoalition() 		~= 2 or
				Airbase.getByName("H4"):getCoalition() 							~= 2 or
				Airbase.getByName("King Hussein Air College"):getCoalition() 	~= 2 or
				Airbase.getByName("Rayak"):getCoalition() 						~= 2 or
				Airbase.getByName("Rene Mouawad"):getCoalition() 				~= 2 or
				Airbase.getByName("Wujah Al Hajar"):getCoalition() 				~= 2 ) then
				
				--Then we must be in Phase 2
				return 2
				
	elseif (	Airbase.getByName("Minakh"):getCoalition() 						~= 2 or
				Airbase.getByName("Taftanaz"):getCoalition() 					~= 2 or
				Airbase.getByName("Abu al-Duhur"):getCoalition() 				~= 2 or 
				Airbase.getByName("Aleppo"):getCoalition() 						~= 2 or
				Airbase.getByName("Kuweires"):getCoalition() 					~= 2 or
				Airbase.getByName("Jirah"):getCoalition() 						~= 2 or
				Airbase.getByName("Bassel Al-Assad"):getCoalition() 			~= 2 or
				Airbase.getByName("Hama"):getCoalition() 						~= 2 or
				Airbase.getByName("Palmyra"):getCoalition() 					~= 2 or
				Airbase.getByName("Shayrat"):getCoalition() 					~= 2 or
				Airbase.getByName("Tiyas"):getCoalition() 						~= 2 or
				Airbase.getByName("Tabqa"):getCoalition() 						~= 2 or
				Airbase.getByName("Tal Siman"):getCoalition() 					~= 2 or
				Airbase.getByName("Al Qusayr"):getCoalition() 					~= 2 ) then
	
				--Then we must be in Phase 3
				return 3
				
	elseif (	Airbase.getByName("Khalkhalah"):getCoalition() 					~= 2 or
				Airbase.getByName("Marj Ruhayyil"):getCoalition() 				~= 2 or
				Airbase.getByName("Damascus"):getCoalition() 					~= 2 or
				Airbase.getByName("Mezzeh"):getCoalition() 						~= 2 or
				Airbase.getByName("Qabr as Sitt"):getCoalition() 				~= 2 or
				Airbase.getByName("Marj as Sultan North"):getCoalition() 		~= 2 or
				Airbase.getByName("Marj as Sultan South"):getCoalition() 		~= 2 or
				Airbase.getByName("Al-Dumayr"):getCoalition() 					~= 2 or
				Airbase.getByName("Sayqal"):getCoalition() 						~= 2 or
				Airbase.getByName("Tha'lah"):getCoalition() 					~= 2 or
				Airbase.getByName("An Nasiriyah"):getCoalition() 				~= 2 ) then
				
				--Then we must be in Phase 4
				return 4
				
	elseif (	Airbase.getByName("Adana Sakirpasa"):getCoalition() 			== 2 and
				Airbase.getByName("Eyn Shemer"):getCoalition() 					== 2 and
				Airbase.getByName("Gaziantep"):getCoalition() 					== 2 and
				Airbase.getByName("Gazipasa"):getCoalition() 					== 2 and
				Airbase.getByName("H4"):getCoalition() 							== 2 and
				Airbase.getByName("Haifa"):getCoalition() 						== 2 and
				Airbase.getByName("Hatay"):getCoalition() 						== 2 and			
				Airbase.getByName("King Hussein Air College"):getCoalition() 	== 2 and
				Airbase.getByName("Kiryat Shmona"):getCoalition() 				== 2 and
				Airbase.getByName("Megiddo"):getCoalition() 					== 2 and
				Airbase.getByName("Rosh Pina"):getCoalition() 					== 2 and
				Airbase.getByName("Beirut-Rafic Hariri"):getCoalition() 		== 2 and
				Airbase.getByName("Rayak"):getCoalition() 						== 2 and
				Airbase.getByName("Rene Mouawad"):getCoalition() 				== 2 and
				Airbase.getByName("Wujah Al Hajar"):getCoalition() 				== 2 and
				Airbase.getByName("Minakh"):getCoalition() 						== 2 and
				Airbase.getByName("Taftanaz"):getCoalition() 					== 2 and
				Airbase.getByName("Abu al-Duhur"):getCoalition() 				== 2 and 
				Airbase.getByName("Aleppo"):getCoalition() 						== 2 and
				Airbase.getByName("Kuweires"):getCoalition() 					== 2 and
				Airbase.getByName("Jirah"):getCoalition() 						== 2 and
				Airbase.getByName("Bassel Al-Assad"):getCoalition() 			== 2 and
				Airbase.getByName("Hama"):getCoalition() 						== 2 and
				Airbase.getByName("Palmyra"):getCoalition() 					== 2 and
				Airbase.getByName("Shayrat"):getCoalition() 					== 2 and
				Airbase.getByName("Tiyas"):getCoalition()						== 2 and
				Airbase.getByName("Tabqa"):getCoalition() 						== 2 and
				Airbase.getByName("Tal Siman"):getCoalition() 					== 2 and
				Airbase.getByName("Al Qusayr"):getCoalition() 					== 2 and
				Airbase.getByName("Khalkhalah"):getCoalition()					== 2 and
				Airbase.getByName("Marj Ruhayyil"):getCoalition() 				== 2 and
				Airbase.getByName("Damascus"):getCoalition() 					== 2 and
				Airbase.getByName("Mezzeh"):getCoalition() 						== 2 and
				Airbase.getByName("Qabr as Sitt"):getCoalition() 				== 2 and
				Airbase.getByName("Marj as Sultan North"):getCoalition() 		== 2 and
				Airbase.getByName("Marj as Sultan South"):getCoalition() 		== 2 and
				Airbase.getByName("Al-Dumayr"):getCoalition() 					== 2 and
				Airbase.getByName("Sayqal"):getCoalition() 						== 2 and
				Airbase.getByName("Tha'lah"):getCoalition() 					== 2 and
				Airbase.getByName("An Nasiriyah"):getCoalition() 				== 2 ) then
	
				--Then We Have Completed A Take And Hold Victory, Return 5 To Trigger Victory In The Status Watcher
				return 5
	else
		return 1
	end
end

function SEF_TestMissionList()

	--This function should only be run to perform integrity check on the mission list before any targets are killed
	MissionListErrors = 0
	
	for i = 1, #OperationScarletDawn_AG do		
		--trigger.action.outText("Looking at element "..i,15)
		if ( OperationScarletDawn_AG[i].TargetStatic == true ) then
			if ( StaticObject.getByName(OperationScarletDawn_AG[i].TargetName) ~= nil ) then
				--Pass
			else
				trigger.action.outText("Static "..OperationScarletDawn_AG[i].TargetName.." Could Not Be Found", 15)
				MissionListErrors = MissionListErrors + 1
			end			
		else
			if ( Group.getByName(OperationScarletDawn_AG[i].TargetName) ~=nil ) then
				--Pass
			else
				trigger.action.outText("Group "..OperationScarletDawn_AG[i].TargetName.." Could Not Be Found", 15)
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

--////End Other Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MAIN

	trigger.action.outSound('Background Chatter.ogg')
	
	--////GLOBAL VARIABLE INITIALISATION	
	NumberOfCompletedMissions = 0
	TotalScenarios = 206
	OperationComplete = false
	CustomSoundsEnabled = 1
	SoundLockout = 0
	TargetSmokeLockout = 0	
						
	--////FUNCTIONS
	SEF_InitializeMissionTable()
	--SEF_TestMissionList()
	timer.scheduleFunction(SEF_MissionSelector, nil, timer.getTime() + 16)
	SEF_RadioMenuSetup()
	
	--////START SUPPORT FLIGHT SCHEDULERS, DELAY ARCO BY 15 MINUTES TO ALLOW CARRIER PLANES TO SPAWN AND CLEAR DECK
	SEF_USAFAWACS_SCHEDULER()
	SEF_TEXACO_SCHEDULER()
	SEF_SHELL_SCHEDULER()	
	
	--timer.scheduleFunction(SEF_USAFHAWKEYE_SCHEDULER, nil, timer.getTime() + 60)
	timer.scheduleFunction(SEF_ARCO_SCHEDULER, nil, timer.getTime() + 900)
		
	--////SCHEDULERS
	--MISSION TARGET STATUS
	timer.scheduleFunction(SEF_MissionTargetStatus, nil, timer.getTime() + 26)
	--START TOMAHAWK REGEN
	timer.scheduleFunction(SEF_TomahawkRegen, nil, timer.getTime() + 27)
	--MISSION STATUS
	timer.scheduleFunction(SEF_MissionStatus, nil, timer.getTime() + 300)	
	
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--[[

--////EARLY WARNING RADARS - 20 (20 units)

Al Bab - EWR 						CA52	*
Aleppo - EWR 						CA40	*
Tabqa - EWR 						DV65	*
Dar Ta'izzah - EWR 					CA01	*
Idlib - EWR 						BV79	*
Qaranjah - EWR South 				YE56	*
Sett Markho - EWR 					YE54	*
Baniyas - EWR 						YD79	*
Tartus - EWR East 					YD76	*
Homs - EWR 							BU93	*
Hama - EWR 							BU97	*
Palmyra - EWR 						DU32	*
Busra - EWR 						BS53	*
Marj Ruhayyil - EWR 				BS58	*
Damascus - EWR South 				BS49	*
Damascus - EWR North 				BT41	*
Damascus - EWR East 				BT60	*
Al Dumayr - EWR North 				BT92	*
Al Dumayr - EWR South 				BT92	*
Al Dumayr - EWR West 				BT71	*

--////SA-5 SITES - 4 (56 units)

Damascus - SA-5 					BT81	*	
Khalkhalah - SA-5 					BS77	*
Homs - SA-5 						BU93	*
Masyaf - SA-5 						BU59	*

--////SA-2 SITES - 11 (97 units)

Latakia - SA-2 North 				YE55	*
Bassel Al-Assad - SA-2 				YE62	*
Tartus - SA-2 South 				YD65	*
Al Safirah - SA-2 					CV59	*
Hama - SA-2 North-West 				BU89	*
Homs - SA-2 West 					BU74	*
Khirbet Ghazaleh - SA-2 North 		BS33	*
Al Dumayr - SA-2 East 1 			CT02	*
Damascus - SA-2 					BT60	*
Mezzeh - SA-2 West 					BS39	*
Saraqib - SA-2						CV07	*
Aleppo - SA-2 South					CV39	*

--////SA-3 SITES - 11 (67 units)

Latakia - SA-3 South-East 			YE53	*
Bassel Al-Assad - SA-3 				YE62	*
Tartus - SA-3 South-East 			YD76	*
Homs - SA-3 East 					BU94	*
Hama - SA-3 North-East 				CV01	*
Aleppo - SA-3 East 					CA60	*
El Hajar Al Aswad - SA-3 			BT50	*
Hayjanah - SA-3 					BS79	*
Al Dumayr - SA-3 South 				BT91	*
Jasim - SA-3 South-East 			BS34	*
Abu al-Duhur - SA-3					CV25	*
Aleppo - SA-3 West					CA20/21	*

--////SA-6 SITES - 8 (48 units)

Homs - SA-6 South 					BU93	*
Hama - SA-6 South 					BU98	*
Mezzeh - SA-6 South-West 			BS39	*
Otaybah - SA-6 North 				BT71	*
Otaybah - SA-6 South-East 			BT80	*
Kanaker - SA-6 East 				BS38	*
Izra - SA-6 East 					BS43	*
Izra - SA-6 West 					BS43	*

--////SA-8 SITES - 4 (4 units)

Al Qutayfah - SA-8 					BT83	*
Damascus - SA-8 					BT41	*
Mezzeh - SA-8 						BT40	*
Latakia - SA-8 						YE55	*


--////SA-13 SITES - 2 (2 units)

An Nasiriyah - SA-13 				CT05	*
Khalkhalah - SA-13 					BS76	*


--////SAMS AND EWR TOTAL 276 UNITS


--////SHIPPING - 6 (17 units)

Latakia - Navy 						YE			*
Tartus - Navy 						YE/YD		*
Latakia - Speedboat 				YE43/53		*
Tartus - Speedboat 					YD66		*
Latakia - Cargo Ship 				YE53		*
Tartus - Cargo Ship 				YD66		*

--////COMMS TOWERS - 8 (8 Statics)

Aleppo - Communications 			CA30	*
Latakia - Communications 			YE53	*
Tartus - Communications 			YD66	*
Homs - Communications 				BU84	*
Hama - Communications 				BU96	*
Damascus - Communications West 		BT41	*
Damascus - Communications East 		BT60	*
Golan Heights - Communications 		YB65	*


--////AAA - 13 (50 Units)

Aleppo - AAA						CA20/21/30/31	5 units		*
Al Safira - AAA						CV49/59			3 units		*
Latakia - AAA						YE43/53			5 units		*
Tartus - AAA						YD66			3 units		*
Homs - AAA							BU84/94			5 units		*
Homs - AAA South					BU93			3 units		*
Hama - AAA							BU89/98/99		5 units		*
Mezzeh - AAA						BS39/49/BT40/50	4 units		*
Damascus - AAA						BT41/50/60		5 units		*
Al Dumayr - AAA						BT81/91			3 units		*
Golan Heights - AAA					BS33/34/43		4 units		*
Bassel Al-Assad - AAA				YE62			3 units		*
Khalkhalah - AAA					BS76			2 units		*

--////ARMOR - 10 (54 Units)

Aleppo - Armor						CA20/31/40		12 units	*
Latakia - Armor						YE53			3 units		*
Tartus - Armor						YD66			3 units		*
Homs - Armor						BU74/94			6 units		*
Homs - Armor South					BU93			2 units		*
Hama - Armor						BU89/98/99		8 units		*
Mezzeh - Armor						BT30			4 units		*
Al Dumayr - Armor					BT82			3 units		*
Damascus - Armor					BS49/59			7 units		*
Khirbet Ghazaleh - Armor			BS32			6 units		*


--////ARTILLERY AND MISSILES - 8 (30 Units)

Latakia - Silkworm					YE43/53			5 units		*
Tartus - Silkworm					YD67			5 units		*
Mezzeh - Scud Launcher				BT30			4 units		*
Homs - Artillery					BU93			3 units		*
Hama - Artillery					BU98			3 units		*
Aleppo - Artillery					CA40			4 units		*
Izra - Scud Launcher				BS43			4 units		*
Al Dumayr - Artillery				BT92			2 units		*

--////INFANTRY - 6 (20 units)

Aleppo - Igla						CA30/40			3 units		Do Not Include In List	
Damascus - Igla						BT41			3 units		Do Not Include In List
Homs - Igla							BU94			3 units		Do Not Include In List
Hama - Igla							BU98/99			3 units		Do Not Include In List	
Latakia - Igla						YE53			2 units		Do Not Include In List
Tartus - Igla						YD66			2 units		Do Not Include In List

--////STATICS - 16 (16 Units)

Al Safirah - Barracks				CV59	*
Al Safirah - Research Hangar		CV58	*
Latakia - Naval Warehouse			YE53	*
Tartus - Naval Warehouse			YD66	*
Homs - Military HQ					BU93	*
Mezzeh - Missile Storage			BT30	*
Alsqublh - Barracks					BU39	*
Alsqublh - Military HQ				BU39	*
Barisha - Compound					BA80	*
Jarmaya - Weapons Hangar			BT41	*
Masyaf - Weapons Hangar	South		BU58	*
Masyaf - Weapons Hangar North		BU58	*
Aleppo - Repair Workshop			CA40	*
Latakia - Ammunition Warehouse		YE53	*
Raqqa - Military HQ					EV07	*
Hama - Warehouse					BU98	*



--////UNARMED - 5 (12 Units)

Masyaf - Supply Truck South			BU58 2 Units	*
Masyaf - Supply Truck North			BU58 3 Units	*
Hama - Supply Truck					BU98 3 Units	*
Al Safirah - Supply Truck			CV59 2 Units	*
Mezzeh - Supply Truck				BT30 2 Units	*


--////SPECIAL NAMED UNITS - 2 (2 Units)

Abu Bakr al-Baghdadi				BA80 1 Unit		*	
Abu Muhammad al-Halabi				BA80 1 Unit		*


--////SPECIAL GROUPS - 4 (14 Units)

Barisha - Insurgents 				BA80 5 units		*
Raqqa - Armor						EV07 4 units		*
Raqqa - Igla						EV07 2 units		*
Raqqa - AAA							DV97/EV07 3 units	*



--////IDLIB

Idlib - AAA							BV87 3 units	*
Idlib - Armor						BV87 6 units	*
Idlib - Supply Truck				BV87 3 units	*
Idlib - Military HQ					BV87 1 static	*
Idlib - Igla						BV87 2 units	Do Not Include



--////SA-15

Latakia - SA-15						YE53 (1 unit)
Tartus - SA-15						YD65 (1 unit)
Aleppo - SA-15						CA50 (1 unit)
Damascus - SA-15					BT50 (1 unit)
Izra - SA-15						BS33 (1 unit)


Idlib - Igla Supply
Aleppo - Igla Supply
Latakia - Igla Supply
Tartus - Igla Supply
Damascus - Igla Supply
Homs - Igla Supply
Hama - Igla Supply
Raqqa - Supply Truck



--AAA
--ARMOR
--ARTILLERY AND MISSILES
--INFANTRY
--UNARMED
--STATICS

ALEPPO
LATAKIA
TARTUS
HOMS
HAMA
MEZZEH
DAMASCUS
AL-DUMAYR
GOLAN HEIGHTS



Expansion I

Tiyas - SA-2 West					CU62 (9 units)
Tiyas - SA-2 South					CU71 (9 units)
Tiyas - SA-2 North					CU63 (9 units)
Tiyas - SA-3 West					CU72 (6 units)
Tiyas - SA-3 North					CU72 (6 units)
Tiyas - SA-3 East					CU72 (6 units)
Tiyas - EWR							CU72 (1 unit)
Tiyas - SA-15						CU62 (1 unit)
Tiyas - Supply Truck				CU62 (1 unit)
Tiyas - AAA							CU72 (3 units)
Shayrat - SA-6 North				CU12 (6 units)
Shayrat - SA-6 East					CU11 (6 units)
Shayrat - Armor						CU01 (4 units)
Sayqal - SA-2 South					CT31/32 (9 units)
Sayqal - SA-2 East					CT43 (9 units)
Sayqal - SA-3 South					CT32 (9 units)
Sayqal - AAA						CT32 (3 units)
Al Qusayr - AAA						BU72 (3 units)

Expansion II

Tha'lah - SA-2						BS52 	  (8 units)
B-871 Alrosa						VB09 	  (1 unit)
B-262 Stary Oskoi					UC54/55   (1 unit)
Rene Mouawad - AAA					BU23 	  (3 units)
Rene Mouawad - Armor				BU23 	  (4 units)
Golan Heights - Armor				YB64 	  (5 units)
Altinozu - Insurgents				BA50/BV59 (6 units)
Avsuya - Insurgents					BA50 	  (8 units)
Bohsin - Insurgents					BA61 	  (8 units)
Karbeyaz - Insurgents				BV58 	  (8 units)
Taftanaz - SA-9						BV98 	  (1 unit)
Taftanaz - AAA						BV98/CV08 (3 units)
Taftanaz - Supply Truck				BV98/CV08 (2 units)
Saidah - Armor						YB64	  (5 units)
Altinkaya - Insurgents				BA50	  (8 units)
Toprakhisar - Insurgents			BA50	  (8 units)
Salqin - Insurgents					BA70	  (8 units)
Azmarin - Insurgents				BV69	  (6 units)
Seawise Giant						YD58	  (1 unit)
Handy Wind							YC26	  (1 unit)
Mediterranean Sea - Cargo Ship		WE24	  (3 units)

Expansion III

Tal Siman - AAA						DA91
Tal Siman - Supply Truck			DA91
Tabqa - Armor						DV55/65
Tabqa - SA-2						DV55
Palmyra - AAA						DU32			
Palmyra - Armor						DU32
Palmyra - SA-19						DU32
Palmyra - Supply Truck				DU32
Jirah - SA-9						DV09
Jirah - Armor						DV09
Jirah - Supply Truck				DV09
Buhayrat Al Asad - Speedboat		DA21
Tabqa - Communications				DV56
Tabqa - SA-18						DV66
Maqha Ash Shami - SA-18				DT02/03
Maqha Ash Shami - AAA				DT02/03
Maqha Ash Shami - Armor				DT02/03	
Maqha Ash Shami - Supply Truck		DT02/03	
Maqha Ash Shami - SA-13				DT02/03
Maqha Ash Shami - Infantry			DT02/03
Al Ulayyaniyah - AAA				DT16
Al Ulayyaniyah - Supply Truck		DT16
Al Ulayyaniyah - SA-9				DT16
Al Ulayyaniyah - Armor				DT16
Al Ulayyaniyah - Infantry			DT16	


]]--
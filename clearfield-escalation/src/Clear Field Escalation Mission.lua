--////////////////////////////////////////////////////////////////
-- Name: Operation Clear Field Escalation - Mission Logic Module
-- Author: Surrexen    ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ 
--////////////////////////////////////////////////////////////////

--////VARIABLES

USAEFCAPGROUPNAME = ""
USAEFSEADGROUPNAME = ""
USAEFCASGROUPNAME = ""
USAEFASSGROUPNAME = ""
USAEFPINGROUPNAME = ""
USAEFDRONEGROUPNAME = ""
USAFAWACSGROUPNAME = ""
TEXACOGROUPNAME = ""
SHELLGROUPNAME = ""
ARCOGROUPNAME = ""

--////MISSION LOGIC FUNCTIONS
function SEF_MissionSelector()	
	
	if ( NumberOfCompletedMissions >= TotalScenarios ) then
			
		OperationComplete = true
		trigger.action.outText("Operation Clear Field Escalation - Operation Has Been Successful", 60)
		--WRITE PROGRESS TABLES TO EMPTY AND SAVE WITH NO ARGUMENTS
		ClearFieldMkIIUnitInterment = {}
		SEF_SaveUnitIntermentTableNoArgs()
		ClearFieldMkIIStaticInterment = {}
		SEF_SaveStaticIntermentTableNoArgs()
		ClearFieldMkIIAirbases = {}
		SEF_SaveAirbasesTableNoArgs()
		--VICTORY -- SET FLAG FOR MISSION EDITOR TRIGGER RESTART
		trigger.action.setUserFlag(1337,1)
		--trigger.action.outText("Operation Clear Field Escalation - Server Will Restart In 5 Minutes", 60)
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
	AGMissionTarget = OperationClearFieldMkII_AG[MissionNumber].TargetName
	AGTargetTypeStatic = OperationClearFieldMkII_AG[MissionNumber].TargetStatic
	AGMissionBriefingText = OperationClearFieldMkII_AG[MissionNumber].TargetBriefing		
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

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MISSION TARGET TABLE

function SEF_InitializeMissionTable()
	
	OperationClearFieldMkII_AG = {}	
	
	OperationClearFieldMkII_AG[1] = {				
		TargetName = "Adler - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Located At Adler\nSochi-Adler Sector - Grid EJ70",
	}
	OperationClearFieldMkII_AG[2] = {				
		TargetName = "Adygeysk - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Adygeysk\nKrasnodar-Pashkovsky Sector - Grid EK17",
	}
	OperationClearFieldMkII_AG[3] = {				
		TargetName = "Adygeysk - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Adygeysk\nKrasnodar-Pashkovsky Sector - Grid EK16",
	}
	OperationClearFieldMkII_AG[4] = {				
		TargetName = "Adzhapsha - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Adzhapsha\nGudauta Sector - Grid FH47",
	}
	OperationClearFieldMkII_AG[5] = {				
		TargetName = "Adzhapsha - SA-10",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-10 Site Located At Adzhapsha\nGudauta Sector - Grid FH47",
	}
	OperationClearFieldMkII_AG[6] = {				
		TargetName = "Anapskaya - SA-10",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-10 Site Located At Anapskaya\nAnapa-Vityazevo Sector - Grid CK77",
	}
	OperationClearFieldMkII_AG[7] = {				
		TargetName = "Baksan - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Baksan\nNalchik Sector - Grid LP63",
	}
	OperationClearFieldMkII_AG[8] = {				
		TargetName = "Beslan - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Beslan\nBeslan Sector - Grid MN68",
	}
	OperationClearFieldMkII_AG[9] = {				
		TargetName = "Beslan - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Armored Vehicles Located At Beslan\nBeslan Sector - Grid MN68",
	}
	OperationClearFieldMkII_AG[10] = {				
		TargetName = "Beslan - SA-19",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-19 Located At Beslan\nBeslan Sector - Grid MN68",
	}
	OperationClearFieldMkII_AG[11] = {				
		TargetName = "Beslan - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Beslan\nBeslan Sector - Grid MN68",
	}
	OperationClearFieldMkII_AG[12] = {				
		TargetName = "Chernigovskoe - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Chernigovskoe\nMaykop-Khanskaya Sector - Grid EK50",
	}
	OperationClearFieldMkII_AG[13] = {				
		TargetName = "Chikola SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Chikola\nBeslan Sector - Grid MN28",
	}
	OperationClearFieldMkII_AG[14] = {				
		TargetName = "Chuburhindzhi - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets At Chuburhindzhi\nZugdidi Sector - Grid GH31",
	}
	OperationClearFieldMkII_AG[15] = {				
		TargetName = "Chuburhindzhi - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Armored Vehicles Located At Chuburhindzhi\nZugdidi Sector - Grid GH31",
	}
	OperationClearFieldMkII_AG[16] = {				
		TargetName = "Chuburhindzhi - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets Located At Chuburhindzhi\nZugdidi Sector - Grid GH31",
	}
	OperationClearFieldMkII_AG[17] = {				
		TargetName = "Chuburhindzhi - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 Located At Chuburhindzhi\nZugdidi Sector - Grid GH31",
	}
	OperationClearFieldMkII_AG[18] = {				
		TargetName = "Chuburhindzhi - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Chuburhindzhi\nZugdidi Sector - Grid GH31",
	}
	OperationClearFieldMkII_AG[19] = {				
		TargetName = "CV 1143.5 Admiral Kuznetsov",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Sink The Black Sea Fleet!\nNovorossiysk Sector - Grid CK93",
	}
	OperationClearFieldMkII_AG[20] = {				
		TargetName = "Dagomys - SA-11",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-11 Site Located At Dagomys\nSochi-Adler Sector - Grid EJ53",
	}
	OperationClearFieldMkII_AG[21] = {				
		TargetName = "Dzhubga - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Dzhubga\nGelendzhik Sector - Grid DK70",
	}
	OperationClearFieldMkII_AG[22] = {				
		TargetName = "Enguri Dam - SA-18",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Anti-Air Infantry Located At The Enguri Dam\nZugdidi Sector - Grid KN53",
	}
	OperationClearFieldMkII_AG[23] = {				
		TargetName = "Enguri Dam - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At The Enguri Dam\nZugdidi Sector - Grid KN53",
	}
	OperationClearFieldMkII_AG[24] = {				
		TargetName = "Gali - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Armored Vehicles Located At Gali\nZugdidi Sector - Grid GH22",
	}
	OperationClearFieldMkII_AG[25] = {				
		TargetName = "Gali - Infantry",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Infantry Located At Gali\nZugdidi Sector - Grid GH22",
	}
	OperationClearFieldMkII_AG[26] = {				
		TargetName = "Gali - Military Barracks",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military Barracks Located At Gali\nZugdidi Sector - Grid GH22",
	}
	OperationClearFieldMkII_AG[27] = {				
		TargetName = "Gali - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Gali\nZugdidi Sector - Grid GH22",
	}
	OperationClearFieldMkII_AG[28] = {				
		TargetName = "Gelendzhik - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Gelendzhik\nGelendzhik Sector - Grid DK23",
	}
	OperationClearFieldMkII_AG[29] = {				
		TargetName = "Gelendzhik - EWR East",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Eastern Early Warning Radar Located At Gelendzhik\nGelendzhik Sector - Grid DK14",
	}
	OperationClearFieldMkII_AG[30] = {				
		TargetName = "Gelendzhik - EWR West",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Western Early Warning Radar Located At Gelendzhik\nGelendzhik Sector - Grid DK14",
	}
	OperationClearFieldMkII_AG[31] = {				
		TargetName = "Gelendzhik - SA-10",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-10 Site Located At Gelendzhik\nGelendzhik Sector - Grid DK23",
	}
	OperationClearFieldMkII_AG[32] = {				
		TargetName = "Glebovskoe - SA-3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site Located South Of Glebovskoe\nNovorossiysk Sector - Grid CK94",
	}
	OperationClearFieldMkII_AG[33] = {				
		TargetName = "Gori - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Gori\nGori Sector - Grid MM24/25",
	}
	OperationClearFieldMkII_AG[34] = {				
		TargetName = "Gori - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Gori\nGori Sector - Grid MM24",
	}
	OperationClearFieldMkII_AG[35] = {				
		TargetName = "Gori - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets Located At Gori\nGori Sector - Grid MM24/25",
	}
	OperationClearFieldMkII_AG[36] = {				
		TargetName = "Gori - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Gori\nGori Sector - Grid MM25",
	}
	OperationClearFieldMkII_AG[37] = {				
		TargetName = "Gori - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 Located At Gori\nGori Sector - Grid MM25",
	}
	OperationClearFieldMkII_AG[38] = {				
		TargetName = "Gori - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Gori\nGori Sector - Grid MM24/25",
	}
	OperationClearFieldMkII_AG[39] = {				
		TargetName = "Gudauta - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Gudauta\nGudauta Sector - Grid FH27",
	}
	OperationClearFieldMkII_AG[40] = {				
		TargetName = "Gudauta - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Gudauta\nGudauta Sector - Grid FH27",
	}
	OperationClearFieldMkII_AG[41] = {				
		TargetName = "Gudauta - Navy",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Warships Patrolling The Coast Near Gudauta\nGudauta Sector - Grid EH97",
	}
	OperationClearFieldMkII_AG[42] = {				
		TargetName = "Gudauta - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Gudauta\nGudauta Sector - Grid FH37",
	}
	OperationClearFieldMkII_AG[43] = {				
		TargetName = "Gulripshi - SA-10",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-10 Site Located At Gulripshi\nSukhumi-Babushara Sector - Grid FH75",
	}
	OperationClearFieldMkII_AG[44] = {				
		TargetName = "Gvandra - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Gvandra\nZemo-Azhara Sector - Grid GH37",
	}
	OperationClearFieldMkII_AG[45] = {				
		TargetName = "Gvandra - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Gvandra\nZemo-Azhara Sector - Grid GH37",
	}
	OperationClearFieldMkII_AG[46] = {				
		TargetName = "Gvandra - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artiller Assets Located At Gvandra\nZemo-Azhara Sector - Grid GH37",
	}
	OperationClearFieldMkII_AG[47] = {				
		TargetName = "Gvandra - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Gvandra\nZemo-Azhara Sector - Grid GH37",
	}
	OperationClearFieldMkII_AG[48] = {				
		TargetName = "Kirovo - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Kirovo\nBeslan Sector - Grid MN57",
	}
	OperationClearFieldMkII_AG[49] = {				
		TargetName = "Krasnodar Center - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Krasnodar Center\nKrasnodar-Center Sector - Grid DK99",
	}
	OperationClearFieldMkII_AG[50] = {				
		TargetName = "Krasnodar Center - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Krasnodar Center\nKrasnodar-Center Sector - Grid DK99",
	}
	OperationClearFieldMkII_AG[51] = {				
		TargetName = "Krasnodar Center - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Krasnodar Center\nKrasnodar-Center Sector - Grid DK99",
	}
	OperationClearFieldMkII_AG[52] = {				
		TargetName = "Krasnodar Center - SA-9",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-9 Located At Krasnodar Center\nKrasnodar-Center Sector - Grid DK99",
	}
	OperationClearFieldMkII_AG[53] = {				
		TargetName = "Krasnodar Center - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Krasnodar Center\nKrasnodar-Center Sector - Grid DK99",
	}
	OperationClearFieldMkII_AG[54] = {				
		TargetName = "Krasnodar Pashkovsky - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Krasnodar Pashkovsky\nKrasnodar-Pashkovsky Sector - Grid EK18",
	}
	OperationClearFieldMkII_AG[55] = {				
		TargetName = "Krasnodar Pashkovsky - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Krasnodar Pashkovsky\nKrasnodar-Pashkovsky Sector - Grid EK18",
	}
	OperationClearFieldMkII_AG[56] = {				
		TargetName = "Krasnodar Pashkovsky - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Krasnodar Pashkovsky\nKrasnodar-Pashkovsky Sector - Grid EK18",
	}
	OperationClearFieldMkII_AG[57] = {				
		TargetName = "Krymsk - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Krymsk\nKrymsk Sector - Grid DK17/28",
	}
	OperationClearFieldMkII_AG[58] = {				
		TargetName = "Krymsk - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Krymsk\nKrymsk Sector - Grid DK17/28",
	}
	OperationClearFieldMkII_AG[59] = {				
		TargetName = "Krymsk - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Krymsk\nKrymsk Sector - Grid DK28",
	}
	OperationClearFieldMkII_AG[60] = {				
		TargetName = "Krymsk - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Krymsk\nKrymsk Sector - Grid DK27",
	}
	OperationClearFieldMkII_AG[61] = {				
		TargetName = "Krymsk - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Krymsk\nKrymsk Sector - Grid DK17",
	}
	OperationClearFieldMkII_AG[62] = {				
		TargetName = "Krymsk - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Krymsk\nKrymsk Sector - Grid DK27/28",
	}
	OperationClearFieldMkII_AG[63] = {				
		TargetName = "Leselidze - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Leselidze\nSochi-Adler Sector - Grid EJ80",
	}
	OperationClearFieldMkII_AG[64] = {				
		TargetName = "Magri - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Magri\nSochi-Adler Sector - Grid EJ17",
	}
	OperationClearFieldMkII_AG[65] = {				
		TargetName = "Maykop - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Maykop Khanskaya\nMaykop-Khanskaya Sector - Grid EK84",
	}
	OperationClearFieldMkII_AG[66] = {				
		TargetName = "Maykop Khanskaya - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Maykop Khanskaya\nMaykop-Khanskaya Sector - Grid EK84",
	}
	OperationClearFieldMkII_AG[67] = {				
		TargetName = "Maykop Khanskaya - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Maykop Khanskaya\nMaykop-Khanskaya Sector - Grid EK84",
	}
	OperationClearFieldMkII_AG[68] = {				
		TargetName = "Maykop Khanskaya - SA-13",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-13 Located At Maykop Khanskaya\nMaykop-Khanskaya Sector - Grid EK84",
	}
	OperationClearFieldMkII_AG[69] = {				
		TargetName = "Maykop Khanskaya - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Maykop Khanskaya\nMaykop-Khanskaya Sector - Grid EK84",
	}
	OperationClearFieldMkII_AG[70] = {				
		TargetName = "Maykop Khanskaya - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Maykop Khanskaya\nMaykop-Khanskaya Sector - Grid EK84",
	}
	OperationClearFieldMkII_AG[71] = {				
		TargetName = "Medvedovskaya - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Medvedovskaya\nKrasnodar-Center Sector - Grid EL02",
	}
	OperationClearFieldMkII_AG[72] = {				
		TargetName = "Mineralnye Vody - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Mineralnye Vody\nMineralnye Vody Sector - Grid LP49",
	}
	OperationClearFieldMkII_AG[73] = {				
		TargetName = "Mineralnye Vody - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Mineralnye Vody\nMineralnye Vody Sector - Grid LP49",
	}
	OperationClearFieldMkII_AG[74] = {				
		TargetName = "Mineralnye Vody - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Located At Mineralnye Vody\nMineralnye Vody Sector - Grid LP49",
	}
	OperationClearFieldMkII_AG[75] = {				
		TargetName = "Mineralnye Vody - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Mineralnye Vody\nMineralnye Vody Sector - Grid LP49",
	}
	OperationClearFieldMkII_AG[76] = {				
		TargetName = "Mineralnye Vody - SA-18",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Anti-Air Infantry Located At Mineralnye Vody\nMineralnye Vody Sector - Grid LP49",
	}
	OperationClearFieldMkII_AG[77] = {				
		TargetName = "Mineralnye Vody - SA-6",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-6 Site Located At Mineralnye Vody\nMineralnye Vody Sector - Grid LP49",
	}
	OperationClearFieldMkII_AG[78] = {				
		TargetName = "Mineralnye Vody - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Mineralnye Vody\nMineralnye Vody Sector - Grid LP49",
	}
	OperationClearFieldMkII_AG[79] = {				
		TargetName = "Mozdok - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Mozdok\nMozdok Sector - Grid MP64",
	}
	OperationClearFieldMkII_AG[80] = {				
		TargetName = "Mozdok - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Mozdok\nMozdok Sector - Grid MP64",
	}
	OperationClearFieldMkII_AG[81] = {				
		TargetName = "Mozdok - SA-13",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-13 Located At Mozdok\nMozdok Sector - Grid MP64",
	}
	OperationClearFieldMkII_AG[82] = {				
		TargetName = "Mozdok - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Mozdok\nMozdok Sector - Grid MP64",
	}
	OperationClearFieldMkII_AG[83] = {				
		TargetName = "Nalchik - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Nalchik\nNalchik Sector - Grid LP81/91",
	}
	OperationClearFieldMkII_AG[84] = {				
		TargetName = "Nalchik - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Nalchik\nNalchik Sector - Grid LP81/82/91",
	}
	OperationClearFieldMkII_AG[85] = {				
		TargetName = "Nalchik - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Nalchik\nNalchik Sector - Grid LP82",
	}
	OperationClearFieldMkII_AG[86] = {				
		TargetName = "Nalchik - SA-13",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-13 Located At Nalchik\nNalchik Sector - Grid LP81",
	}
	OperationClearFieldMkII_AG[87] = {				
		TargetName = "Nalchik - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Nalchik\nNalchik Sector - Grid LP81/82/91",
	}
	OperationClearFieldMkII_AG[88] = {				
		TargetName = "Novorossiysk - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Novorossiysk\nNovorossiysk Sector - Grid DK04/05",
	}
	OperationClearFieldMkII_AG[89] = {				
		TargetName = "Novorossiysk - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Docked At Novorossiysk Port\nNovorossiysk Sector - Grid DK05",
	}
	OperationClearFieldMkII_AG[90] = {				
		TargetName = "Novorossiysk - Communications North",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Northern Communications Tower Located At Novorossiysk\nNovorossiysk Sector - Grid DK05",
	}
	OperationClearFieldMkII_AG[91] = {				
		TargetName = "Novorossiysk - Communications South",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Southern Communications Tower Located At Novorossiysk\nNovorossiysk Sector - Grid DK04",
	}
	OperationClearFieldMkII_AG[92] = {				
		TargetName = "Novorossiysk - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Novorossiysk\nNovorossiysk Sector - Grid DK04",
	}
	OperationClearFieldMkII_AG[93] = {				
		TargetName = "Novorossiysk - Navy",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Warships Located At Novorossiysk\nNovorossiysk Sector - Grid DK04",
	}
	OperationClearFieldMkII_AG[94] = {				
		TargetName = "Novorossiysk - SA-10",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-10 Site Located At Novorossiysk\nNovorossiysk Sector - Grid DK04",
	}
	OperationClearFieldMkII_AG[95] = {				
		TargetName = "Novorossiysk - SA-3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site Located At Novorossiysk\nNovorossiysk Sector - Grid DK04",
	}
	OperationClearFieldMkII_AG[96] = {				
		TargetName = "Novorossiysk - Submarine",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Submarines Docked At Novorossiysk Port\nNovorossiysk Sector - Grid DK05",
	}
	OperationClearFieldMkII_AG[97] = {				
		TargetName = "Ochamchira - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Ochamchira\nOchamchira Sector - Grid FH93/GH03",
	}
	OperationClearFieldMkII_AG[98] = {				
		TargetName = "Ochamchira - Armed Speedboat",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armed Speedboats Located At Ochamchira\nOchamchira Sector - Grid FH93",
	}
	OperationClearFieldMkII_AG[99] = {				
		TargetName = "Ochamchira - Military HQ",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military Headquarters Located At Ochamchira\nOchamchira Sector - Grid GH03",
	}
	OperationClearFieldMkII_AG[100] = {				
		TargetName = "Ochamchira - Naval Bunker",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Boat Bunker Located At Ochamchira\nOchamchira Sector - Grid FH93",
	}
	OperationClearFieldMkII_AG[101] = {				
		TargetName = "Ochamchira - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 Located At Ochamchira\nOchamchira Sector - Grid GH03",
	}
	OperationClearFieldMkII_AG[102] = {				
		TargetName = "Ochamchira - Train Station",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Train Station Located At Ochamchira\nOchamchira Sector - Grid GH03",
	}
	OperationClearFieldMkII_AG[103] = {				
		TargetName = "Oktyabrskoe - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Oktyabrskoe\nBeslan Sector - Grid MN86",
	}
	OperationClearFieldMkII_AG[104] = {				
		TargetName = "Okumi - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Okumi\nGali Sector - Grid GH23",
	}
	OperationClearFieldMkII_AG[105] = {				
		TargetName = "Okumi - Mi-24V",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Mi-24V Located At Okumi\nGali Sector - Grid GH23",
	}
	OperationClearFieldMkII_AG[106] = {				
		TargetName = "Okumi - Mi-8MTV2",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Mi-8MTV2 Located At Okumi\nGali Sector - Grid GH23",
	}
	OperationClearFieldMkII_AG[107] = {				
		TargetName = "Okumi - Military HQ",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military Headquarters Located At Okumi\nGali Sector - Grid GH23",
	}
	OperationClearFieldMkII_AG[108] = {				
		TargetName = "Okumi - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 Located At Okumi\nGali Sector - Grid GH23",
	}
	OperationClearFieldMkII_AG[109] = {				
		TargetName = "Okumi - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Okumi\nGali Sector - Grid GH23",
	}
	OperationClearFieldMkII_AG[110] = {				
		TargetName = "Pashkovskiy - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Pashkovskiy\nKrasnodar-Pashkovsky Sector - Grid FK08",
	}
	OperationClearFieldMkII_AG[111] = {				
		TargetName = "Pashkovskiy - SA-18",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Anti-Air Infantry Located At Pashkovskiy\nKrasnodar-Pashkovsky Sector - Grid FK08",
	}
	OperationClearFieldMkII_AG[112] = {				
		TargetName = "Pashkovsky - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Pashkovskiy\nKrasnodar-Pashkovsky Sector - Grid FK08",
	}
	OperationClearFieldMkII_AG[113] = {				
		TargetName = "Pervomayskiy - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Pervomayskiy\nMaykop-Khanskaya Sector - Grid EK81",
	}
	OperationClearFieldMkII_AG[114] = {				
		TargetName = "Petrovskaya - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Petrovskaya\nKrymsk Sector - Grid DL13",
	}
	OperationClearFieldMkII_AG[115] = {				
		TargetName = "Pitsunda - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Pitsunda\nGudauta Sector - Grid FH08",
	}
	OperationClearFieldMkII_AG[116] = {				
		TargetName = "Plastunovskaya - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Plastunovskaya\nKrasnodar-Pashkovsky Sector - Grid EL22",
	}
	OperationClearFieldMkII_AG[117] = {				
		TargetName = "Ponezhukay - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Located At Ponezhukay\nKrasnodar-Pashkovsky Sector - Grid EK27",
	}
	OperationClearFieldMkII_AG[118] = {				
		TargetName = "Ruisi - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Ruisi\nGori Sector - Grid MM15",
	}
	OperationClearFieldMkII_AG[119] = {				
		TargetName = "Ruisi - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Ruisi\nGori Sector - Grid MM15",
	}
	OperationClearFieldMkII_AG[120] = {				
		TargetName = "Ruisi - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets Located At Ruisi\nGori Sector - Grid MM15",
	}
	OperationClearFieldMkII_AG[121] = {				
		TargetName = "Ruisi - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Ruisi\nGori Sector - Grid MM15",
	}
	OperationClearFieldMkII_AG[122] = {				
		TargetName = "Sochi - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Docked At Sochi Port\nSochi-Adler Sector - Grid EJ52",
	}
	OperationClearFieldMkII_AG[123] = {				
		TargetName = "Sochi - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Located At Sochi\nSochi-Adler Sector - Grid EJ62",
	}
	OperationClearFieldMkII_AG[124] = {				
		TargetName = "Sochi - Navy",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Warships Patrolling The Coast Near Adler\nSochi-Adler Sector - Grid EH79",
	}
	OperationClearFieldMkII_AG[125] = {				
		TargetName = "Sochi - Submarine",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Submarines Docked At Sochi Port\nSochi-Adler Sector - Grid EJ52",
	}
	OperationClearFieldMkII_AG[126] = {				
		TargetName = "Sochi Adler - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Sochi-Adler Airfield\nSochi-Adler Sector - Grid EJ70/71",
	}
	OperationClearFieldMkII_AG[127] = {				
		TargetName = "Sukhumi - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Sukhumi\nSukhumi-Babushara Sector - Grid FH74",
	}
	OperationClearFieldMkII_AG[128] = {				
		TargetName = "Sukhumi - Armed Speedboat",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armed Speedboats Located At Sukhumi\nSukhumi-Babushara Sector - Grid FH66",
	}
	OperationClearFieldMkII_AG[129] = {				
		TargetName = "Sukhumi - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Docked Near Kvemo-Merheuli\nSukhumi-Babushara Sector - Grid FH65",
	}
	OperationClearFieldMkII_AG[130] = {				
		TargetName = "Sukhumi - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Located At Sukhumi\nSukhumi-Babushara Sector - Grid FH66",
	}
	OperationClearFieldMkII_AG[131] = {				
		TargetName = "Sukhumi - Navy",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Naval Warships Patrolling South Of Sukhumi\nSukhumi-Babushara Sector - Grid FH64",
	}
	OperationClearFieldMkII_AG[132] = {				
		TargetName = "Sukhumi - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Sukhumi\nSukhumi-Babushara Sector - Grid FH66",
	}
	OperationClearFieldMkII_AG[133] = {				
		TargetName = "Sukhumi Babushara - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Sukhumi-Babushara Airfield\nSukhumi-Babushara Sector - Grid FH74",
	}
	OperationClearFieldMkII_AG[134] = {				
		TargetName = "Suvorov Cherkesskiy - SA-3",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-3 Site Located North Of Suvorov-Cherkesskiy\nAnapa-Vityazevo Sector - Grid CK69",
	}
	OperationClearFieldMkII_AG[135] = {				
		TargetName = "Tkvarcheli - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Tkvarcheli\nTkvarcheli Sector - Grid GH14",
	}
	OperationClearFieldMkII_AG[136] = {				
		TargetName = "Tkvarcheli - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Tkvarcheli\nTkvarcheli Sector - Grid GH14",
	}
	OperationClearFieldMkII_AG[137] = {				
		TargetName = "Tkvarcheli - Communications",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Communications Tower Located At Tkvarcheli\nTkvarcheli Sector - Grid GH14",
	}
	OperationClearFieldMkII_AG[138] = {				
		TargetName = "Tkvarcheli - SA-13",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-13 Located At Tkvarcheli\nTkvarcheli Sector - Grid GH14",
	}
	OperationClearFieldMkII_AG[139] = {				
		TargetName = "Tskhinvali - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Tskhinvali\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[140] = {				
		TargetName = "Tskhinvali - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Tskhinvali\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[141] = {				
		TargetName = "Tskhinvali - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets Located At Tskhinvali\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[142] = {				
		TargetName = "Tskhinvali - Military Barracks",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military Barracks Located At Tskhinvali\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[143] = {				
		TargetName = "Tskhinvali - Military HQ",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Military Headquarters Located At Tskhinvali\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[144] = {				
		TargetName = "Tskhinvali - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Tskhinvali\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[145] = {				
		TargetName = "Tskhinvali - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 Located At Tskhinvali\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[146] = {				
		TargetName = "Tskhinvali - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Tskhinvali\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[147] = {				
		TargetName = "Udarnyy - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Udarnyy\nMineralnye Vody Sector - Grid LQ01",
	}
	OperationClearFieldMkII_AG[148] = {				
		TargetName = "Varvarovka - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Varvarovka\nAnapa-Vityazevo Sector - Grid CK76",
	}
	OperationClearFieldMkII_AG[149] = {				
		TargetName = "Veseloe - EWR",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Early Warning Radar Located At Veseloe\nSochi-Adler Sector - Grid EJ80",
	}
	OperationClearFieldMkII_AG[150] = {				
		TargetName = "Zaragizh - SA-2",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-2 Site Located At Zaragizh\nNalchik Sector - Grid LN99",
	}
	OperationClearFieldMkII_AG[151] = {				
		TargetName = "Zemo Azhara - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Zemo-Azhara\nZemo-Azhara Sector - Grid GH27",
	}
	OperationClearFieldMkII_AG[152] = {				
		TargetName = "Zemo Azhara - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Zemo-Azhara\nZemo-Azhara Sector - Grid GH27",
	}
	OperationClearFieldMkII_AG[153] = {				
		TargetName = "Zemo Azhara - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets Located At Zemo-Azhara\nZemo-Azhara Sector - Grid GH27",
	}
	OperationClearFieldMkII_AG[154] = {				
		TargetName = "Zemo Azhara - SA-19",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-19 Located At Zemo-Azhara\nZemo-Azhara Sector - Grid GH27",
	}
	OperationClearFieldMkII_AG[155] = {				
		TargetName = "Zemo Azhara - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Zemo-Azhara\nZemo-Azhara Sector - Grid GH27",
	}
	OperationClearFieldMkII_AG[156] = {				
		TargetName = "Zeni - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Zeni\nZugdidi Sector - Grid GH21",
	}
	OperationClearFieldMkII_AG[157] = {				
		TargetName = "Zeni - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Zeni\nZugdidi Sector - Grid GH20/21",
	}
	OperationClearFieldMkII_AG[158] = {				
		TargetName = "Zeni - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets Located At Zeni\nZugdidi Sector - Grid GH20/21",
	}
	OperationClearFieldMkII_AG[159] = {				
		TargetName = "Zeni - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 Located At Zeni\nZugdidi Sector - Grid GH21",
	}
	OperationClearFieldMkII_AG[160] = {				
		TargetName = "Zeni - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Zeni\nZugdidi Sector - Grid GH20/21",
	}
	OperationClearFieldMkII_AG[161] = {				
		TargetName = "Red October",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Search And Destroy The Red October!\nThe Black Sea Sector - Grid Reference Unknown",
	}
	OperationClearFieldMkII_AG[162] = {				
		TargetName = "Ochamchira - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Ochamchira\nOchamchira Sector - Grid GH03",
	}
	OperationClearFieldMkII_AG[163] = {				
		TargetName = "Dzevera - SA-19",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-19 Located At Dzevera\nGori Sector - Grid MM26",
	}
	OperationClearFieldMkII_AG[164] = {				
		TargetName = "Dzevera - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Dzevera\nGori Sector - Grid MM26",
	}
	OperationClearFieldMkII_AG[165] = {				
		TargetName = "Dzevera - Artillery",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Artillery Assets Located At Dzevera\nGori Sector - Grid MM26",
	}
	OperationClearFieldMkII_AG[166] = {				
		TargetName = "Dzevera - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Dzevera\nGori Sector - Grid MM26",
	}
	OperationClearFieldMkII_AG[167] = {				
		TargetName = "Dzevera - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Dzevera\nGori Sector - Grid MM26",
	}
	OperationClearFieldMkII_AG[168] = {				
		TargetName = "Sakasheti - Processing Plant",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Processing Plant Located At Sakasheti\nGori Sector - Grid MM16",
	}
	OperationClearFieldMkII_AG[169] = {				
		TargetName = "Sakasheti - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Sakasheti\nGori Sector - Grid MM16",
	}
	OperationClearFieldMkII_AG[170] = {				
		TargetName = "Sakasheti - SA-18",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Anti-Air Infantry Located At Sakasheti\nGori Sector - Grid MM16",
	}
	OperationClearFieldMkII_AG[171] = {				
		TargetName = "Sakasheti - Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Container Trucks Located At Sakasheti\nGori Sector - Grid MM16",
	}
	OperationClearFieldMkII_AG[172] = {				
		TargetName = "Karaleti - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Karaleti\nGori Sector - Grid MM25",
	}
	OperationClearFieldMkII_AG[173] = {				
		TargetName = "Karaleti - SA-9",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-9 Located At Karaleti\nGori Sector - Grid MM25",
	}
	OperationClearFieldMkII_AG[174] = {				
		TargetName = "Karaleti - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Karaleti\nGori Sector - Grid MM25",
	}
	OperationClearFieldMkII_AG[175] = {				
		TargetName = "Sukhumi Babushara - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Sukhumi-Babushara Airfield\nSukhumi-Babushara Sector - Grid FH74",
	}
	OperationClearFieldMkII_AG[176] = {				
		TargetName = "Gudauta - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Gudauta Airfield\nGudauta Sector - Grid FH27",
	}
	OperationClearFieldMkII_AG[177] = {				
		TargetName = "Sochi Adler - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Sochi-Adler Airfield\nSochi-Adler Sector - Grid EJ71",
	}
	OperationClearFieldMkII_AG[178] = {				
		TargetName = "Sochi Adler - SA-15",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-15 Located At Sochi-Adler Airfield\nSochi-Adler Sector - Grid EJ71",
	}
	OperationClearFieldMkII_AG[179] = {				
		TargetName = "Sochi Adler - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Sochi-Adler Airfield\nSochi-Adler Sector - Grid EJ71",
	}
	OperationClearFieldMkII_AG[180] = {				
		TargetName = "Sochi - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At The Sochi Docks\nSochi-Adler Sector - Grid EJ52",
	}
	OperationClearFieldMkII_AG[181] = {				
		TargetName = "Gelendzhik - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Located At The Gelendzhik Docks\nGelendzhik Sector - Grid DK23",
	}
	OperationClearFieldMkII_AG[182] = {				
		TargetName = "Gelendzhik - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Gelendzhik Airfield\nGelendzhik Sector - Grid DK23",
	}
	OperationClearFieldMkII_AG[183] = {				
		TargetName = "Eredvi - Scud Launcher",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Scud Launchers Located At Eredvi\nTskhinvali Sector - Grid MM27",
	}
	OperationClearFieldMkII_AG[184] = {				
		TargetName = "Eredvi - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Eredvi\nTskhinvali Sector - Grid MM27",
	}
	OperationClearFieldMkII_AG[185] = {				
		TargetName = "Eredvi - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Eredvi\nTskhinvali Sector - Grid MM27",
	}
	OperationClearFieldMkII_AG[186] = {				
		TargetName = "Eredvi - SA-11",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-11 Located At Eredvi\nTskhinvali Sector - Grid MM27",
	}
	OperationClearFieldMkII_AG[187] = {				
		TargetName = "Ergneti - Road Outpost",
		TargetStatic = true,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Road Outpost Located At Ergneti\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[188] = {				
		TargetName = "Ergneti - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Ergneti\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[189] = {				
		TargetName = "Ergneti - SA-18",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Anti-Air Infantry Located At Ergneti\nTskhinvali Sector - Grid MM17",
	}
	OperationClearFieldMkII_AG[190] = {				
		TargetName = "Lazarevskoe - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Located West Of Lazarevskoe\nThe Black Sea Sector - Grid DJ26",
	}
	OperationClearFieldMkII_AG[191] = {				
		TargetName = "Pitsunda - Cargo Ship",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Cargo Ships Located South-West Of Lazarevskoe\nThe Black Sea Sector - Grid EH64",
	}
	OperationClearFieldMkII_AG[192] = {				
		TargetName = "Saberio - SA-8",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The SA-8 Located At Saberio\nZugdidi Sector - Grid GH42",
	}
	OperationClearFieldMkII_AG[193] = {				
		TargetName = "Saberio - Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Armored Vehicles Located At Saberio\nZugdidi Sector - Grid GH42",
	}
	OperationClearFieldMkII_AG[194] = {				
		TargetName = "Saberio - AAA",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy AAA Assets Located At Saberio\nZugdidi Sector - Grid GH42",
	}
	OperationClearFieldMkII_AG[195] = {				
		TargetName = "Saberio - Supply Truck",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy The Supply Trucks Located At Saberio\nZugdidi Sector - Grid GH42",
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
		
		local DestinationZone = nil
		if (DestinationAirbaseName == "Gori") then
			DestinationZone = ZONE:FindByName("Gori")
		elseif (DestinationAirbaseName == "Tskhinvali") then
			DestinationZone = ZONE:FindByName("Tskhinvali")
		elseif (DestinationAirbaseName == "Zugdidi") then
			DestinationZone = ZONE:FindByName("Zugdidi")
		elseif (DestinationAirbaseName == "Tkvarcheli") then
			DestinationZone = ZONE:FindByName("Tkvarcheli")
		elseif (DestinationAirbaseName == "Zemo-Azhara") then
			DestinationZone = ZONE:FindByName("Zemo-Azhara")
		elseif (DestinationAirbaseName == "Ochamchira") then
			DestinationZone = ZONE:FindByName("Ochamchira")	
		else
			DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		end	
		
		USAEFCAP = SPAWN
			:New("USAEF F-15C")
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
		if ( DepartureAirbaseName == AIRBASE.Caucasus.Kobuleti ) then
			USAEFCAP:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti), {13,9}, SPAWN.Takeoff.Hot)
		elseif ( DepartureAirbaseName == AIRBASE.Caucasus.Tbilisi_Lochini ) then
			USAEFCAP:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), {1,0}, SPAWN.Takeoff.Hot)		
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
		
		local DestinationZone = nil
		if (DestinationAirbaseName == "Gori") then
			DestinationZone = ZONE:FindByName("Gori")
		elseif (DestinationAirbaseName == "Tskhinvali") then
			DestinationZone = ZONE:FindByName("Tskhinvali")
		elseif (DestinationAirbaseName == "Zugdidi") then
			DestinationZone = ZONE:FindByName("Zugdidi")
		elseif (DestinationAirbaseName == "Tkvarcheli") then
			DestinationZone = ZONE:FindByName("Tkvarcheli")
		elseif (DestinationAirbaseName == "Zemo-Azhara") then
			DestinationZone = ZONE:FindByName("Zemo-Azhara")
		elseif (DestinationAirbaseName == "Ochamchira") then
			DestinationZone = ZONE:FindByName("Ochamchira")	
		else
			DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		end
		
		USAEFSEAD = SPAWN
			:New("USAEF F-16C")
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
		if ( DepartureAirbaseName == AIRBASE.Caucasus.Kobuleti ) then
			USAEFSEAD:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti), {12,8}, SPAWN.Takeoff.Hot)
		elseif ( DepartureAirbaseName == AIRBASE.Caucasus.Tbilisi_Lochini ) then
			USAEFSEAD:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), {4,5}, SPAWN.Takeoff.Hot)		
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
		
		local DestinationZone = nil
		if (DestinationAirbaseName == "Gori") then
			DestinationZone = ZONE:FindByName("Gori")
		elseif (DestinationAirbaseName == "Tskhinvali") then
			DestinationZone = ZONE:FindByName("Tskhinvali")
		elseif (DestinationAirbaseName == "Zugdidi") then
			DestinationZone = ZONE:FindByName("Zugdidi")
		elseif (DestinationAirbaseName == "Tkvarcheli") then
			DestinationZone = ZONE:FindByName("Tkvarcheli")
		elseif (DestinationAirbaseName == "Zemo-Azhara") then
			DestinationZone = ZONE:FindByName("Zemo-Azhara")
		elseif (DestinationAirbaseName == "Ochamchira") then
			DestinationZone = ZONE:FindByName("Ochamchira")	
		else
			DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		end
		
		USAEFCAS = SPAWN
			:New("USAEF A-10C")
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
		if ( DepartureAirbaseName == AIRBASE.Caucasus.Kobuleti ) then
			USAEFCAS:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti), {11,7}, SPAWN.Takeoff.Hot)
		elseif ( DepartureAirbaseName == AIRBASE.Caucasus.Tbilisi_Lochini ) then
			USAEFCAS:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), {6,7}, SPAWN.Takeoff.Hot)		
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
		
		local DestinationZone = nil
		if (DestinationAirbaseName == "Gori") then
			DestinationZone = ZONE:FindByName("Gori")
		elseif (DestinationAirbaseName == "Tskhinvali") then
			DestinationZone = ZONE:FindByName("Tskhinvali")
		elseif (DestinationAirbaseName == "Zugdidi") then
			DestinationZone = ZONE:FindByName("Zugdidi")
		elseif (DestinationAirbaseName == "Tkvarcheli") then
			DestinationZone = ZONE:FindByName("Tkvarcheli")
		elseif (DestinationAirbaseName == "Zemo-Azhara") then
			DestinationZone = ZONE:FindByName("Zemo-Azhara")
		elseif (DestinationAirbaseName == "Ochamchira") then
			DestinationZone = ZONE:FindByName("Ochamchira")	
		else
			DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		end
		
		USAEFASS = SPAWN
			:New("USAEF F/A-18C")
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
					local WP1X = DepartureZoneVec2.x 
					local WP1Y = DepartureZoneVec2.y - 18520
					--Ingress Point
					local WP2X = TargetZoneVec2.x - 50000
					local WP2Y = TargetZoneVec2.y
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
		if ( DepartureAirbaseName == AIRBASE.Caucasus.Kobuleti ) then
			USAEFASS:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti), {10,6}, SPAWN.Takeoff.Hot)
		elseif ( DepartureAirbaseName == AIRBASE.Caucasus.Tbilisi_Lochini ) then
			USAEFASS:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), {13,12}, SPAWN.Takeoff.Hot)		
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
		
		local DestinationZone = nil
		if (DestinationAirbaseName == "Gori") then
			DestinationZone = ZONE:FindByName("Gori")
		elseif (DestinationAirbaseName == "Tskhinvali") then
			DestinationZone = ZONE:FindByName("Tskhinvali")
		elseif (DestinationAirbaseName == "Zugdidi") then
			DestinationZone = ZONE:FindByName("Zugdidi")
		elseif (DestinationAirbaseName == "Tkvarcheli") then
			DestinationZone = ZONE:FindByName("Tkvarcheli")
		elseif (DestinationAirbaseName == "Zemo-Azhara") then
			DestinationZone = ZONE:FindByName("Zemo-Azhara")
		elseif (DestinationAirbaseName == "Ochamchira") then
			DestinationZone = ZONE:FindByName("Ochamchira")	
		else
			DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		end
		
		local TypeSelection = math.random(1,3)
		
		if ( TypeSelection == 1 ) then		
			USAEFPIN = SPAWN
				:New("USAEF F-15E")			
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
									
								--////Anti-Ship Mission Profile, Standard Anti-Ship Behaviour
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
																--RTB on out of ammo guided bombs, broken in 2.7
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
																}, -- end of [5]
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
			if ( DepartureAirbaseName == AIRBASE.Caucasus.Kobuleti ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti), {5,4}, SPAWN.Takeoff.Hot)
			elseif ( DepartureAirbaseName == AIRBASE.Caucasus.Tbilisi_Lochini ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), {11,10}, SPAWN.Takeoff.Hot)		
			else
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
			end
		elseif ( TypeSelection == 2 ) then		
			USAEFPIN = SPAWN
			:New("USAEF F-117A")			
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
								
							--////Anti-Ship Mission Profile, Standard Anti-Ship Behaviour
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
															--RTB on out of ammo guided bombs, broken in 2.7
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
			if ( DepartureAirbaseName == AIRBASE.Caucasus.Kobuleti ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti), {5,4}, SPAWN.Takeoff.Hot)
			elseif ( DepartureAirbaseName == AIRBASE.Caucasus.Tbilisi_Lochini ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), {11,10}, SPAWN.Takeoff.Hot)		
			else
				USAEFPIN:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot )
			end
		else		
			USAEFPIN = SPAWN
			:New("RAF Tornado GR4")			
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
								
							--////Anti-Ship Mission Profile, Standard Anti-Ship Behaviour
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
															--RTB on out of ammo guided bombs, broken in 2.7
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
			if ( DepartureAirbaseName == AIRBASE.Caucasus.Kobuleti ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti), {5,4}, SPAWN.Takeoff.Hot)
			elseif ( DepartureAirbaseName == AIRBASE.Caucasus.Tbilisi_Lochini ) then
				USAEFPIN:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Tbilisi_Lochini), {11,10}, SPAWN.Takeoff.Hot)		
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
		
		local DestinationZone = nil
		if (DestinationAirbaseName == "Gori") then
			DestinationZone = ZONE:FindByName("Gori")
		elseif (DestinationAirbaseName == "Tskhinvali") then
			DestinationZone = ZONE:FindByName("Tskhinvali")
		elseif (DestinationAirbaseName == "Zugdidi") then
			DestinationZone = ZONE:FindByName("Zugdidi")
		elseif (DestinationAirbaseName == "Tkvarcheli") then
			DestinationZone = ZONE:FindByName("Tkvarcheli")
		elseif (DestinationAirbaseName == "Zemo-Azhara") then
			DestinationZone = ZONE:FindByName("Zemo-Azhara")
		elseif (DestinationAirbaseName == "Ochamchira") then
			DestinationZone = ZONE:FindByName("Ochamchira")	
		else
			DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		end
		
		local TargetZoneVec2Point = DestinationZone:GetVec2()
		local SpawnX = TargetZoneVec2Point.x - 10000
		local SpawnY = TargetZoneVec2Point.y		
		local DroneStartVec3 = { x = SpawnX, y = 6448, z = SpawnY }
		
		USAEFDRONE = SPAWN
			:New("USAEF MQ-9 Aerial Drone")
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
	
	--////Clear Field Escalation Mission Options
	ClearFieldMkIIOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Clear Field Options", nil)
	ClearFieldMkIICAPOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Clear Field CAP Options", ClearFieldMkIIOptions)
	ClearFieldMkIISNDOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Clear Field Sound Options", ClearFieldMkIIOptions)
	ClearFieldMkIIBLUECAPToggle = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Toggle Allied AI CAP Flights", ClearFieldMkIICAPOptions, function() SEF_BLUESQUADRONSTOGGLE() end, nil)	
	ClearFieldMkIIToggleCustomSounds = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Toggle Custom Sounds", ClearFieldMkIISNDOptions, function() SEF_ToggleCustomSounds() end, nil)	
	ClearFieldMkIIClearCarrierFighters  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Clear Carrier Deck Of Fighters", ClearFieldMkIIOptions, function() SEF_ClearAIFightersFromCarrierDeck() end, nil)
	ClearFieldMkIIClearCarrierTankers  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Clear Carrier Deck Of Tankers", ClearFieldMkIIOptions, function() SEF_ClearAITankersFromCarrierDeck() end, nil)
	ClearFieldMkIIPhaseCheck  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Check Battle Phase", ClearFieldMkIIOptions, function() SEF_BattlePhaseCheck() end, nil)
	ClearFieldMkIISkipScenario  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Skip This Mission", ClearFieldMkIIOptions, function() SEF_SkipScenario() end, nil)	
	
	--[[
	AIRBASE.Caucasus.Anapa_Vityazevo,
	AIRBASE.Caucasus.Batumi,
	AIRBASE.Caucasus.Beslan,
	AIRBASE.Caucasus.Gelendzhik,
	AIRBASE.Caucasus.Gudauta,
	AIRBASE.Caucasus.Kobuleti,
	AIRBASE.Caucasus.Krasnodar_Center,
	AIRBASE.Caucasus.Krasnodar_Pashkovsky,
	AIRBASE.Caucasus.Krymsk,
	AIRBASE.Caucasus.Kutaisi,
	AIRBASE.Caucasus.Maykop_Khanskaya,
	AIRBASE.Caucasus.Mineralnye_Vody,
	AIRBASE.Caucasus.Mozdok,
	AIRBASE.Caucasus.Nalchik,
	AIRBASE.Caucasus.Novorossiysk,
	AIRBASE.Caucasus.Senaki_Kolkhi,
	AIRBASE.Caucasus.Sochi_Adler,
	AIRBASE.Caucasus.Soganlug,
	AIRBASE.Caucasus.Sukhumi_Babushara,
	AIRBASE.Caucasus.Tbilisi_Lochini,
	AIRBASE.Caucasus.Vaziani
	]]--
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////CAP FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuCAP_KOB = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Kobuleti", SupportMenuCAP)
	SupportMenuCAP_TBL = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Tbilisi-Lochini", SupportMenuCAP)
	
	--////CAP Support Sector List
	
	SupportMenuCAP_KOB_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuCAP_KOB)
	SupportMenuCAP_KOB_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuCAP_KOB)
	SupportMenuCAP_KOB_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuCAP_KOB)
	SupportMenuCAP_KOB_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuCAP_KOB)
	
	SupportMenuCAP_TBL_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuCAP_TBL)
	SupportMenuCAP_TBL_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuCAP_TBL)
	SupportMenuCAP_TBL_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuCAP_TBL)
	SupportMenuCAP_TBL_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuCAP_TBL)
	
	--////DEPARTING KOBULETI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuCAP_KOB_Georgia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuCAP_KOB_Abzkhazia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuCAP_KOB_Abzkhazia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuCAP_KOB_Abzkhazia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuCAP_KOB_Abzkhazia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuCAP_KOB_Abzkhazia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuCAP_KOB_Abzkhazia, function() SEF_USAEFCAPSPAWN("Kobuleti", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuCAP_KOB_Stav, function() SEF_USAEFCAPSPAWN("Kobuleti", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuCAP_KOB_Stav, function() SEF_USAEFCAPSPAWN("Kobuleti", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuCAP_KOB_Stav, function() SEF_USAEFCAPSPAWN("Kobuleti", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuCAP_KOB_Stav, function() SEF_USAEFCAPSPAWN("Kobuleti", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuCAP_KOB_Kras, function() SEF_USAEFCAPSPAWN("Kobuleti", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuCAP_KOB_Kras, function() SEF_USAEFCAPSPAWN("Kobuleti", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuCAP_KOB_Kras, function() SEF_USAEFCAPSPAWN("Kobuleti", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuCAP_KOB_Kras, function() SEF_USAEFCAPSPAWN("Kobuleti", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuCAP_KOB_Kras, function() SEF_USAEFCAPSPAWN("Kobuleti", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuCAP_KOB_Kras, function() SEF_USAEFCAPSPAWN("Kobuleti", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuCAP_KOB_Kras, function() SEF_USAEFCAPSPAWN("Kobuleti", "Sochi-Adler") end, nil)	
	
	--////DEPARTING TBILISI-LOCHINI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuCAP_TBL_Georgia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuCAP_TBL_Abzkhazia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuCAP_TBL_Abzkhazia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuCAP_TBL_Abzkhazia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuCAP_TBL_Abzkhazia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuCAP_TBL_Abzkhazia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuCAP_TBL_Abzkhazia, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuCAP_TBL_Stav, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuCAP_TBL_Stav, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuCAP_TBL_Stav, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuCAP_TBL_Stav, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuCAP_TBL_Kras, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuCAP_TBL_Kras, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuCAP_TBL_Kras, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuCAP_TBL_Kras, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuCAP_TBL_Kras, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuCAP_TBL_Kras, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuCAP_TBL_Kras, function() SEF_USAEFCAPSPAWN("Tbilisi-Lochini", "Sochi-Adler") end, nil)


	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////CAS FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuCAS_KOB = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Kobuleti", SupportMenuCAS)
	SupportMenuCAS_TBL = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Tbilisi-Lochini", SupportMenuCAS)
	
	--////CAS Support Sector List
	
	SupportMenuCAS_KOB_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuCAS_KOB)
	SupportMenuCAS_KOB_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuCAS_KOB)
	SupportMenuCAS_KOB_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuCAS_KOB)
	SupportMenuCAS_KOB_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuCAS_KOB)
	
	SupportMenuCAS_TBL_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuCAS_TBL)
	SupportMenuCAS_TBL_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuCAS_TBL)
	SupportMenuCAS_TBL_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuCAS_TBL)
	SupportMenuCAS_TBL_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuCAS_TBL)
	
	--////DEPARTING KOBULETI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Tbilisi-Lochini") end, nil)
		missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuCAS_KOB_Georgia, function() SEF_USAEFCASSPAWN("Kobuleti", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuCAS_KOB_Abzkhazia, function() SEF_USAEFCASSPAWN("Kobuleti", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuCAS_KOB_Abzkhazia, function() SEF_USAEFCASSPAWN("Kobuleti", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuCAS_KOB_Abzkhazia, function() SEF_USAEFCASSPAWN("Kobuleti", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuCAS_KOB_Abzkhazia, function() SEF_USAEFCASSPAWN("Kobuleti", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuCAS_KOB_Abzkhazia, function() SEF_USAEFCASSPAWN("Kobuleti", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuCAS_KOB_Abzkhazia, function() SEF_USAEFCASSPAWN("Kobuleti", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuCAS_KOB_Stav, function() SEF_USAEFCASSPAWN("Kobuleti", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuCAS_KOB_Stav, function() SEF_USAEFCASSPAWN("Kobuleti", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuCAS_KOB_Stav, function() SEF_USAEFCASSPAWN("Kobuleti", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuCAS_KOB_Stav, function() SEF_USAEFCASSPAWN("Kobuleti", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuCAS_KOB_Kras, function() SEF_USAEFCASSPAWN("Kobuleti", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuCAS_KOB_Kras, function() SEF_USAEFCASSPAWN("Kobuleti", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuCAS_KOB_Kras, function() SEF_USAEFCASSPAWN("Kobuleti", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuCAS_KOB_Kras, function() SEF_USAEFCASSPAWN("Kobuleti", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuCAS_KOB_Kras, function() SEF_USAEFCASSPAWN("Kobuleti", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuCAS_KOB_Kras, function() SEF_USAEFCASSPAWN("Kobuleti", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuCAS_KOB_Kras, function() SEF_USAEFCASSPAWN("Kobuleti", "Sochi-Adler") end, nil)	
	
	--////DEPARTING TBILISI-LOCHINI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuCAS_TBL_Georgia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuCAS_TBL_Abzkhazia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuCAS_TBL_Abzkhazia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuCAS_TBL_Abzkhazia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuCAS_TBL_Abzkhazia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuCAS_TBL_Abzkhazia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuCAS_TBL_Abzkhazia, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuCAS_TBL_Stav, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuCAS_TBL_Stav, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuCAS_TBL_Stav, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuCAS_TBL_Stav, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuCAS_TBL_Kras, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuCAS_TBL_Kras, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuCAS_TBL_Kras, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuCAS_TBL_Kras, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuCAS_TBL_Kras, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuCAS_TBL_Kras, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuCAS_TBL_Kras, function() SEF_USAEFCASSPAWN("Tbilisi-Lochini", "Sochi-Adler") end, nil)
	
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////SEAD FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuSEAD_KOB = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Kobuleti", SupportMenuSEAD)
	SupportMenuSEAD_TBL = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Tbilisi-Lochini", SupportMenuSEAD)
	
	--////SEAD Support Sector List
	
	SupportMenuSEAD_KOB_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuSEAD_KOB)
	SupportMenuSEAD_KOB_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuSEAD_KOB)
	SupportMenuSEAD_KOB_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuSEAD_KOB)
	SupportMenuSEAD_KOB_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuSEAD_KOB)
	
	SupportMenuSEAD_TBL_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuSEAD_TBL)
	SupportMenuSEAD_TBL_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuSEAD_TBL)
	SupportMenuSEAD_TBL_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuSEAD_TBL)
	SupportMenuSEAD_TBL_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuSEAD_TBL)
	
	--////DEPARTING KOBULETI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuSEAD_KOB_Georgia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuSEAD_KOB_Abzkhazia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuSEAD_KOB_Abzkhazia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuSEAD_KOB_Abzkhazia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuSEAD_KOB_Abzkhazia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuSEAD_KOB_Abzkhazia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuSEAD_KOB_Abzkhazia, function() SEF_USAEFSEADSPAWN("Kobuleti", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuSEAD_KOB_Stav, function() SEF_USAEFSEADSPAWN("Kobuleti", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuSEAD_KOB_Stav, function() SEF_USAEFSEADSPAWN("Kobuleti", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuSEAD_KOB_Stav, function() SEF_USAEFSEADSPAWN("Kobuleti", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuSEAD_KOB_Stav, function() SEF_USAEFSEADSPAWN("Kobuleti", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuSEAD_KOB_Kras, function() SEF_USAEFSEADSPAWN("Kobuleti", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuSEAD_KOB_Kras, function() SEF_USAEFSEADSPAWN("Kobuleti", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuSEAD_KOB_Kras, function() SEF_USAEFSEADSPAWN("Kobuleti", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuSEAD_KOB_Kras, function() SEF_USAEFSEADSPAWN("Kobuleti", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuSEAD_KOB_Kras, function() SEF_USAEFSEADSPAWN("Kobuleti", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuSEAD_KOB_Kras, function() SEF_USAEFSEADSPAWN("Kobuleti", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuSEAD_KOB_Kras, function() SEF_USAEFSEADSPAWN("Kobuleti", "Sochi-Adler") end, nil)	
	
	--////DEPARTING TBILISI-LOCHINI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuSEAD_TBL_Georgia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuSEAD_TBL_Abzkhazia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuSEAD_TBL_Abzkhazia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuSEAD_TBL_Abzkhazia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuSEAD_TBL_Abzkhazia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuSEAD_TBL_Abzkhazia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuSEAD_TBL_Abzkhazia, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuSEAD_TBL_Stav, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuSEAD_TBL_Stav, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuSEAD_TBL_Stav, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuSEAD_TBL_Stav, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuSEAD_TBL_Kras, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuSEAD_TBL_Kras, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuSEAD_TBL_Kras, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuSEAD_TBL_Kras, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuSEAD_TBL_Kras, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuSEAD_TBL_Kras, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuSEAD_TBL_Kras, function() SEF_USAEFSEADSPAWN("Tbilisi-Lochini", "Sochi-Adler") end, nil)
	
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////PINPOINT STRIKE FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuPIN_KOB = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Kobuleti", SupportMenuPIN)
	SupportMenuPIN_TBL = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Tbilisi-Lochini", SupportMenuPIN)
	
	--////PIN Support Sector List
	
	SupportMenuPIN_KOB_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuPIN_KOB)
	SupportMenuPIN_KOB_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuPIN_KOB)
	SupportMenuPIN_KOB_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuPIN_KOB)
	SupportMenuPIN_KOB_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuPIN_KOB)
	
	SupportMenuPIN_TBL_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuPIN_TBL)
	SupportMenuPIN_TBL_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuPIN_TBL)
	SupportMenuPIN_TBL_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuPIN_TBL)
	SupportMenuPIN_TBL_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuPIN_TBL)
	
	--////DEPARTING KOBULETI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuPIN_KOB_Georgia, function() SEF_USAEFPINSPAWN("Kobuleti", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuPIN_KOB_Abzkhazia, function() SEF_USAEFPINSPAWN("Kobuleti", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuPIN_KOB_Abzkhazia, function() SEF_USAEFPINSPAWN("Kobuleti", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuPIN_KOB_Abzkhazia, function() SEF_USAEFPINSPAWN("Kobuleti", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuPIN_KOB_Abzkhazia, function() SEF_USAEFPINSPAWN("Kobuleti", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuPIN_KOB_Abzkhazia, function() SEF_USAEFPINSPAWN("Kobuleti", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuPIN_KOB_Abzkhazia, function() SEF_USAEFPINSPAWN("Kobuleti", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuPIN_KOB_Stav, function() SEF_USAEFPINSPAWN("Kobuleti", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuPIN_KOB_Stav, function() SEF_USAEFPINSPAWN("Kobuleti", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuPIN_KOB_Stav, function() SEF_USAEFPINSPAWN("Kobuleti", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuPIN_KOB_Stav, function() SEF_USAEFPINSPAWN("Kobuleti", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuPIN_KOB_Kras, function() SEF_USAEFPINSPAWN("Kobuleti", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuPIN_KOB_Kras, function() SEF_USAEFPINSPAWN("Kobuleti", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuPIN_KOB_Kras, function() SEF_USAEFPINSPAWN("Kobuleti", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuPIN_KOB_Kras, function() SEF_USAEFPINSPAWN("Kobuleti", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuPIN_KOB_Kras, function() SEF_USAEFPINSPAWN("Kobuleti", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuPIN_KOB_Kras, function() SEF_USAEFPINSPAWN("Kobuleti", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuPIN_KOB_Kras, function() SEF_USAEFPINSPAWN("Kobuleti", "Sochi-Adler") end, nil)	
	
	--////DEPARTING TBILISI-LOCHINI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuPIN_TBL_Georgia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuPIN_TBL_Abzkhazia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuPIN_TBL_Abzkhazia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuPIN_TBL_Abzkhazia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuPIN_TBL_Abzkhazia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuPIN_TBL_Abzkhazia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuPIN_TBL_Abzkhazia, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuPIN_TBL_Stav, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuPIN_TBL_Stav, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuPIN_TBL_Stav, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuPIN_TBL_Stav, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuPIN_TBL_Kras, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuPIN_TBL_Kras, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuPIN_TBL_Kras, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuPIN_TBL_Kras, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuPIN_TBL_Kras, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuPIN_TBL_Kras, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuPIN_TBL_Kras, function() SEF_USAEFPINSPAWN("Tbilisi-Lochini", "Sochi-Adler") end, nil)
	
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////ANTI SHIPPING FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuASS_KOB = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Kobuleti", SupportMenuASS)
	SupportMenuASS_TBL = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Tbilisi-Lochini", SupportMenuASS)
	
	--////ASS Support Sector List
	
	SupportMenuASS_KOB_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuASS_KOB)
	SupportMenuASS_KOB_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuASS_KOB)
	SupportMenuASS_KOB_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuASS_KOB)
	SupportMenuASS_KOB_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuASS_KOB)
	
	SupportMenuASS_TBL_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuASS_TBL)
	SupportMenuASS_TBL_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuASS_TBL)
	SupportMenuASS_TBL_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuASS_TBL)
	SupportMenuASS_TBL_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuASS_TBL)
	
	--////DEPARTING KOBULETI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuASS_KOB_Georgia, function() SEF_USAEFASSSPAWN("Kobuleti", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuASS_KOB_Abzkhazia, function() SEF_USAEFASSSPAWN("Kobuleti", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuASS_KOB_Abzkhazia, function() SEF_USAEFASSSPAWN("Kobuleti", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuASS_KOB_Abzkhazia, function() SEF_USAEFASSSPAWN("Kobuleti", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuASS_KOB_Abzkhazia, function() SEF_USAEFASSSPAWN("Kobuleti", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuASS_KOB_Abzkhazia, function() SEF_USAEFASSSPAWN("Kobuleti", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuASS_KOB_Abzkhazia, function() SEF_USAEFASSSPAWN("Kobuleti", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuASS_KOB_Stav, function() SEF_USAEFASSSPAWN("Kobuleti", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuASS_KOB_Stav, function() SEF_USAEFASSSPAWN("Kobuleti", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuASS_KOB_Stav, function() SEF_USAEFASSSPAWN("Kobuleti", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuASS_KOB_Stav, function() SEF_USAEFASSSPAWN("Kobuleti", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuASS_KOB_Kras, function() SEF_USAEFASSSPAWN("Kobuleti", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuASS_KOB_Kras, function() SEF_USAEFASSSPAWN("Kobuleti", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuASS_KOB_Kras, function() SEF_USAEFASSSPAWN("Kobuleti", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuASS_KOB_Kras, function() SEF_USAEFASSSPAWN("Kobuleti", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuASS_KOB_Kras, function() SEF_USAEFASSSPAWN("Kobuleti", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuASS_KOB_Kras, function() SEF_USAEFASSSPAWN("Kobuleti", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuASS_KOB_Kras, function() SEF_USAEFASSSPAWN("Kobuleti", "Sochi-Adler") end, nil)	
	
	--////DEPARTING TBILISI-LOCHINI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuASS_TBL_Georgia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuASS_TBL_Abzkhazia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuASS_TBL_Abzkhazia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuASS_TBL_Abzkhazia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuASS_TBL_Abzkhazia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuASS_TBL_Abzkhazia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuASS_TBL_Abzkhazia, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuASS_TBL_Stav, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuASS_TBL_Stav, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuASS_TBL_Stav, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuASS_TBL_Stav, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuASS_TBL_Kras, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuASS_TBL_Kras, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuASS_TBL_Kras, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuASS_TBL_Kras, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuASS_TBL_Kras, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuASS_TBL_Kras, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuASS_TBL_Kras, function() SEF_USAEFASSSPAWN("Tbilisi-Lochini", "Sochi-Adler") end, nil)
	
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--////DRONE FLIGHTS
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	SupportMenuDRONE_KOB = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Kobuleti", SupportMenuDRONE)
	SupportMenuDRONE_TBL = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Departing Tbilisi-Lochini", SupportMenuDRONE)
	
	--////DRONE Support Sector List
	
	SupportMenuDRONE_KOB_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuDRONE_KOB)
	SupportMenuDRONE_KOB_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuDRONE_KOB)
	SupportMenuDRONE_KOB_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuDRONE_KOB)
	SupportMenuDRONE_KOB_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuDRONE_KOB)
	
	SupportMenuDRONE_TBL_Georgia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Georgian Sectors", SupportMenuDRONE_TBL)
	SupportMenuDRONE_TBL_Abzkhazia = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abzkhazian And South Ossetian Sectors", SupportMenuDRONE_TBL)
	SupportMenuDRONE_TBL_Stav = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Stavropol Krai Sectors", SupportMenuDRONE_TBL)
	SupportMenuDRONE_TBL_Kras = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Krasnodar Krai Sectors", SupportMenuDRONE_TBL)
	
	--////DEPARTING KOBULETI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuDRONE_KOB_Georgia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuDRONE_KOB_Abzkhazia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuDRONE_KOB_Abzkhazia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuDRONE_KOB_Abzkhazia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuDRONE_KOB_Abzkhazia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuDRONE_KOB_Abzkhazia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuDRONE_KOB_Abzkhazia, function() SEF_USAEFDRONESPAWN("Kobuleti", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuDRONE_KOB_Stav, function() SEF_USAEFDRONESPAWN("Kobuleti", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuDRONE_KOB_Stav, function() SEF_USAEFDRONESPAWN("Kobuleti", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuDRONE_KOB_Stav, function() SEF_USAEFDRONESPAWN("Kobuleti", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuDRONE_KOB_Stav, function() SEF_USAEFDRONESPAWN("Kobuleti", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuDRONE_KOB_Kras, function() SEF_USAEFDRONESPAWN("Kobuleti", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuDRONE_KOB_Kras, function() SEF_USAEFDRONESPAWN("Kobuleti", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuDRONE_KOB_Kras, function() SEF_USAEFDRONESPAWN("Kobuleti", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuDRONE_KOB_Kras, function() SEF_USAEFDRONESPAWN("Kobuleti", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuDRONE_KOB_Kras, function() SEF_USAEFDRONESPAWN("Kobuleti", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuDRONE_KOB_Kras, function() SEF_USAEFDRONESPAWN("Kobuleti", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuDRONE_KOB_Kras, function() SEF_USAEFDRONESPAWN("Kobuleti", "Sochi-Adler") end, nil)	
	
	--////DEPARTING TBILISI-LOCHINI
	
	--////GEORGIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Batumi", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Batumi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gori", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Gori") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kobuleti", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Kobuleti") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Kutaisi", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Kutaisi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Senaki-Kolkhi", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Senaki-Kolkhi") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Soganlug", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Soganlug") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tbilisi-Lochini", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Tbilisi-Lochini") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Vaziani", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Vaziani") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zugdidi", SupportMenuDRONE_TBL_Georgia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Zugdidi") end, nil)
	
	--////ABZKHAZIA AND SOUTH OSSETIA
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gudauta", SupportMenuDRONE_TBL_Abzkhazia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Gudauta") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Ochamchira", SupportMenuDRONE_TBL_Abzkhazia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Ochamchira") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sukhumi-Babushara", SupportMenuDRONE_TBL_Abzkhazia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Sukhumi-Babushara") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tkvarcheli", SupportMenuDRONE_TBL_Abzkhazia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Tkvarcheli") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tskhinvali", SupportMenuDRONE_TBL_Abzkhazia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Tskhinvali") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Zemo-Azhara", SupportMenuDRONE_TBL_Abzkhazia, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Zemo-Azhara") end, nil)
	
	--////STAVROPOL KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Beslan", SupportMenuDRONE_TBL_Stav, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Beslan") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mineralnye-Vody", SupportMenuDRONE_TBL_Stav, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Mineralnye Vody") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Mozdok", SupportMenuDRONE_TBL_Stav, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Mozdok") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Nalchik", SupportMenuDRONE_TBL_Stav, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Nalchik") end, nil)	
	
	--////KRASNODAR KRAI
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Gelendzhik", SupportMenuDRONE_TBL_Kras, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Gelendzhik") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Center", SupportMenuDRONE_TBL_Kras, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Krasnodar-Center") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krasnodar-Pashkovsky", SupportMenuDRONE_TBL_Kras, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Krasnodar-Pashkovsky") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Krymsk", SupportMenuDRONE_TBL_Kras, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Krymsk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Maykop-Khanskaya", SupportMenuDRONE_TBL_Kras, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Maykop-Khanskaya") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Novorossiysk", SupportMenuDRONE_TBL_Kras, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Novorossiysk") end, nil)
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sochi-Adler", SupportMenuDRONE_TBL_Kras, function() SEF_USAEFDRONESPAWN("Tbilisi-Lochini", "Sochi-Adler") end, nil)	
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

function SEF_USAFAWACS_SPAWN()

	USAFAWACS_DATA[1].Vec2 = nil
	USAFAWACS_DATA[1].TimeStamp = nil
	
	local Phase = SEF_BattlePhaseCheckAwacsTankers()
	
	if ( Phase <= 2 ) then
	
		local SpawnZone = AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi):GetZone()
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
		
		USAFAWACS = SPAWN
			:New( "USAF AWACS" )
			:InitKeepUnitNames(true)
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
		:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi), {0}, SPAWN.Takeoff.Hot)
		env.info("AWACS Spawned Phase 1/2", false)
	else
		
		local SpawnZone = AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi):GetZone()
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
		
		USAFAWACS = SPAWN
			:New( "USAF AWACS" )
			:InitKeepUnitNames(true)
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
		:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi), {0}, SPAWN.Takeoff.Hot)
		env.info("AWACS Spawned Phase 3/4", false)
	end	
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
	
	local Phase = SEF_BattlePhaseCheckAwacsTankers()
	
	if ( Phase <= 2 ) then	
		
		local SpawnZone = AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi):GetZone()
		local OrbitZone1 = ZONE:FindByName("Texaco South Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Texaco South Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		TEXACO = SPAWN
			:New( "22nd ARW Texaco" )
			:InitKeepUnitNames(true)
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
		:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi), {1}, SPAWN.Takeoff.Hot)
		env.info("TEXACO Spawned Phase 1/2", false)
	else
		local SpawnZone = AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi):GetZone()
		local OrbitZone1 = ZONE:FindByName("Texaco South Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Texaco South Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		TEXACO = SPAWN
			:New( "22nd ARW Texaco" )
			:InitKeepUnitNames(true)
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
		:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi), {1}, SPAWN.Takeoff.Hot)
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
	
	local Phase = SEF_BattlePhaseCheckAwacsTankers()
	
	if ( Phase <= 2 ) then
		
		local SpawnZone = AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi):GetZone()
		local OrbitZone1 = ZONE:FindByName("Shell South Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Shell South Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		SHELL = SPAWN
			:New( "22nd ARW Shell" )
			:InitKeepUnitNames(true)
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
		:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi), {2}, SPAWN.Takeoff.Hot)
		env.info("SHELL Spawned Phase 1/2", false)
	else
		
		local SpawnZone = AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi):GetZone()
		local OrbitZone1 = ZONE:FindByName("Shell South Orbit Point 1")
		local OrbitZone2 = ZONE:FindByName("Shell South Orbit Point 2")
			
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
		local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
		
		local WP0X = DepartureZoneVec2.x
		local WP0Y = DepartureZoneVec2.y
		local WP1X = OrbitZone1Vec2.x
		local WP1Y = OrbitZone1Vec2.y
		local WP2X = OrbitZone2Vec2.x
		local WP2Y = OrbitZone2Vec2.y		
		
		SHELL = SPAWN
			:New( "22nd ARW Shell" )
			:InitKeepUnitNames(true)
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
		:SpawnAtParkingSpot(AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi), {2}, SPAWN.Takeoff.Hot)		
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
	local OrbitZone1 = ZONE:FindByName("Arco South Orbit Point 1")
	local OrbitZone2 = ZONE:FindByName("Arco South Orbit Point 2")
		
	local DepartureZoneVec2 = SpawnZone:GetVec2()
	local OrbitZone1Vec2 	= OrbitZone1:GetVec2()
	local OrbitZone2Vec2 	= OrbitZone2:GetVec2()
	
	local WP0X = DepartureZoneVec2.x
	local WP0Y = DepartureZoneVec2.y
	local WP1X = OrbitZone1Vec2.x
	local WP1Y = OrbitZone1Vec2.y
	local WP2X = OrbitZone2Vec2.x
	local WP2Y = OrbitZone2Vec2.y
		
	ARCO = SPAWN
		:New( "22nd ARW Arco" )
		:InitKeepUnitNames(true)
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
	Secure Georgia 							( Batumi / Kobuleti / Senaki / Kutaisi / Tbilisi-Lochini / Vaziani / Soganlug )
	Invasion Of Abzkhazia And South Ossetia ( Gudauta / Sukhumi)
	Invasion Of Stavropol Krai 				( Nalchik / Beslan / Mozdok / Mineralnye-Vody )
	Invasion Of Krasnodar Krai				( Sochi / Maykop / Krymsk / Krasnodar-Pashkovsky / Krasnodar-Center / Novorossiysk / Gelendzhik )
]]--

	if ( 		Airbase.getByName(AIRBASE.Caucasus.Batumi):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Kobuleti):getCoalition() ~= 2 or			
				Airbase.getByName(AIRBASE.Caucasus.Senaki_Kolkhi):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Kutaisi):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Tbilisi_Lochini):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Vaziani):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Soganlug):getCoalition() ~= 2 ) then
			
				--Then we must be in Phase 1
				trigger.action.outText("Mission Objective\n\nPhase 1 - Secure Georgia\n\nThe Following Territories Must Be Captured And Held:\n\nBatumi\nKobuleti\nSenaki-Kolkhi\nKutaisi\nTbilisi-Lochini\nVaziani\nSoganlug", 15)
	
	elseif ( 	Airbase.getByName(AIRBASE.Caucasus.Sukhumi_Babushara):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Gudauta):getCoalition() ~= 2 ) then
				
				--Then we must be in Phase 2
				trigger.action.outText("Mission Objective\n\nPhase 2 - Secure Abzkhazia And South Ossetia\n\nThe Following Territories Must Be Captured And Held:\n\nSukhumi-Babushara\nGudauta", 15)
				
	elseif (	Airbase.getByName(AIRBASE.Caucasus.Nalchik):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Beslan):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Mozdok):getCoalition() ~= 2 or 
				Airbase.getByName(AIRBASE.Caucasus.Mineralnye_Vody):getCoalition() ~= 2 ) then
	
				--Then we must be in Phase 3
				trigger.action.outText("Mission Objective\n\nPhase 3 - Invasion Of Stavropol Krai\n\nThe Following Territories Must Be Captured And Held:\n\nNalchik\nBeslan\nMozdok\nMineralnye-Vody", 15)
				
	elseif (	Airbase.getByName(AIRBASE.Caucasus.Sochi_Adler):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Maykop_Khanskaya):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Krymsk):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Pashkovsky):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Krasnodar_Center):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Novorossiysk):getCoalition() ~= 2 or
				Airbase.getByName(AIRBASE.Caucasus.Gelendzhik):getCoalition() ~= 2 ) then
				
				--Then we must be in Phase 4
				trigger.action.outText("Mission Objective\n\nPhase 4 - Invasion Of Krasnodar Krai\n\nThe Following Territories Must Be Captured And Held:\n\nSochi-Adler\nMaykop-Khanskaya\nKrymsk\nKrasnodar-Pashkovsky\nKrasnodar Center\nNovorossiysk\nGelendzhik", 15)
	else
		trigger.action.outText("Unable To Determine Phase", 15)
	end
end

function SEF_BattlePhaseCheckAwacsTankers()

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


function SEF_TestMissionList()

	--This function should only be run to perform integrity check on the mission list before any targets are killed
	MissionListErrors = 0
	
	for i = 1, #OperationClearFieldMkII_AG do		
		--trigger.action.outText("Looking at element "..i,15)
		if ( OperationClearFieldMkII_AG[i].TargetStatic == true ) then
			if ( StaticObject.getByName(OperationClearFieldMkII_AG[i].TargetName) ~= nil ) then
				--Pass
			else
				trigger.action.outText("Static "..OperationClearFieldMkII_AG[i].TargetName.." Could Not Be Found", 15)
				MissionListErrors = MissionListErrors + 1
			end			
		else
			if ( Group.getByName(OperationClearFieldMkII_AG[i].TargetName) ~=nil ) then
				--Pass
			else
				trigger.action.outText("Group "..OperationClearFieldMkII_AG[i].TargetName.." Could Not Be Found", 15)
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

--////End Other Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MAIN

	--////GLOBAL VARIABLE INITIALISATION	
	NumberOfCompletedMissions = 0
	TotalScenarios = 195
	OperationComplete = false
	CustomSoundsEnabled = 1
	SoundLockout = 0
	TargetSmokeLockout = 0	
						
	--////FUNCTIONS
	SEF_InitializeMissionTable()
	--SEF_TestMissionList()	
	timer.scheduleFunction(SEF_MissionSelector, 53, timer.getTime() + 17)
	SEF_RadioMenuSetup()
	
	--////START SUPPORT FLIGHT SCHEDULERS, DELAY ARCO BY 15 MINUTES TO ALLOW CARRIER PLANES TO SPAWN AND CLEAR DECK
	SEF_USAFAWACS_SCHEDULER()	
	SEF_TEXACO_SCHEDULER()
	SEF_SHELL_SCHEDULER()	
	timer.scheduleFunction(SEF_ARCO_SCHEDULER, nil, timer.getTime() + 900)
		
	--////SCHEDULERS
	--MISSION TARGET STATUS
	timer.scheduleFunction(SEF_MissionTargetStatus, 53, timer.getTime() + 27)		
	
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--[[
Adler - Communications			EJ70	Static
Adygeysk - SA-15				EK17
Adygeysk - SA-2					EK16
Adzhapsha - EWR					FH47
Adzhapsha - SA-10				FH47
Anapskaya - SA-10				CK77
Baksan - SA-2					LP63
Beslan - AAA					MN68
Beslan - Armor					MN68
Beslan - SA-19					MN68
Beslan - Supply Truck			MN68
Chernigovskoe - SA-2			EK50
Chikola SA-2					MN28
Chuburhindzhi - AAA				GH31
Chuburhindzhi - Armor			GH31
Chuburhindzhi - Artillery		GH31
Chuburhindzhi - SA-8			GH31
Chuburhindzhi - Supply Truck	GH31
CV 1143.5 Admiral Kuznetsov		CK93
Dagomys - SA-11					EJ53
Dzhubga - EWR					DK70
Enguri Dam - SA-18				KN53
Enguri Dam - Supply Truck		KN53
Gali - Armor					GH22
Gali - Infantry					GH22
Gali - Military Barracks		GH22	Static
Gali - Supply Truck				GH22
Gelendzhik - AAA				DK23
Gelendzhik - EWR East			DK14
Gelendzhik - EWR West			DK14
Gelendzhik - SA-10				DK23
Glebovskoe - SA-3				CK94
Gori - AAA						MM24/25
Gori - Armor					MM24
Gori - Artillery				MM24/25
Gori - SA-15					MM25
Gori - SA-8						MM25
Gori - Supply Truck				MM24/25
Gudauta - AAA					FH27
Gudauta - EWR					FH27
Gudauta - Navy					EH97
Gudauta - SA-2					FH37
Gulripshi - SA-10				FH75
Gvandra - AAA					GH37
Gvandra - Armor					GH37
Gvandra - Artillery				GH37
Gvandra - Supply Truck			GH37
Kirovo - SA-2					MN57
Krasnodar Center - AAA			DK99
Krasnodar Center - Armor		DK99
Krasnodar Center - EWR			DK99
Krasnodar Center - SA-9			DK99
Krasnodar Center - Supply Truck	DK99
Krasnodar Pashkovsky - AAA		EK18
Krasnodar Pashkovsky - Armor	EK18
Krasnodar Pashkovsky - Supply Truck	EK18
Krymsk - AAA					DK17/28
Krymsk - Armor					DK27/28
Krymsk - EWR					DK28
Krymsk - SA-15					DK27
Krymsk - SA-2					DK17
Krymsk - Supply Truck			DK27/28
Leselidze - SA-2				EJ80
Magri - EWR						EJ17
Maykop - EWR					EK84
Maykop Khanskaya - AAA			EK84
Maykop Khanskaya - Armor		EK84
Maykop Khanskaya - SA-13		EK84
Maykop Khanskaya - SA-15		EK84
Maykop Khanskaya - Supply Truck	EK84
Medvedovskaya - EWR				EL02
Mineralnye Vody - AAA			LP49
Mineralnye Vody - Armor			LP49
Mineralnye Vody - Communications	LP49	Static
Mineralnye Vody - SA-15			LP49
Mineralnye Vody - SA-18			LP49
Mineralnye Vody - SA-6			LP49
Mineralnye Vody - Supply Truck	LP49
Mozdok - AAA					MP64
Mozdok - Armor					MP64
Mozdok - SA-13					MP64
Mozdok - Supply Truck			MP64
Nalchik - AAA					LP81/91
Nalchik - Armor					LP81/82/91
Nalchik - EWR					LP82
Nalchik - SA-13					LP81
Nalchik - Supply Truck			LP81/82/91
Novorossiysk - AAA				DK04/05
Novorossiysk - Cargo Ship		DK05
Novorossiysk - Communications North	DK05	Static
Novorossiysk - Communications South	DK04	Static
Novorossiysk - EWR				DK04
Novorossiysk - Navy				DK04
Novorossiysk - SA-10			DK04
Novorossiysk - SA-3				DK04
Novorossiysk - Submarine		DK05
Ochamchira - AAA				FH93/GH03
Ochamchira - Armed Speedboat	FH93
Ochamchira - Military HQ		GH03	Static
Ochamchira - Naval Bunker		FH93	Static
Ochamchira - SA-8				GH03
Ochamchira - Train Station		GH03	Static
Oktyabrskoe - SA-2				MN86
Okumi - AAA						GH23
Okumi - Mi-24V					GH23	Static
Okumi - Mi-8MTV2				GH23	Static
Okumi - Military HQ				GH23	Static
Okumi - SA-8					GH23
Okumi - Supply Truck			GH23
Pashkovskiy - SA-15				FK08
Pashkovskiy - SA-18				FK08
Pashkovsky - Supply Truck		FK08
Pervomayskiy - SA-2				EK81
Petrovskaya - EWR				DL13
Pitsunda - SA-2					FH08
Plastunovskaya - EWR			EL22
Ponezhukay - Communications		EK27	Static
Ruisi - AAA						MM15
Ruisi - Armor					MM15
Ruisi - Artillery				MM15
Ruisi - Supply Truck			MM15
Sochi - Cargo Ship				EJ52
Sochi - Communications			EJ62	Static
Sochi - Navy					EH79
Sochi - Submarine				EJ52
Sochi Adler - AAA				EJ70/71
Sukhumi - AAA					FH74
Sukhumi - Armed Speedboat		FH66
Sukhumi - Cargo Ship			FH65
Sukhumi - Communications		FH66	Static
Sukhumi - Navy					FH64
Sukhumi - SA-15					FH66
Sukhumi Babushara - EWR			FH74
Suvorov Cherkesskiy - SA-3		CK69
Tkvarcheli - AAA				GH14
Tkvarcheli - Armor				GH14
Tkvarcheli - Communications		GH14	Static
Tkvarcheli - SA-13				GH14
Tskhinvali - AAA				MM17
Tskhinvali - Armor				MM17
Tskhinvali - Artillery			MM17
Tskhinvali - Military Barracks	MM17	Static
Tskhinvali - Military HQ		MM17	Static
Tskhinvali - SA-15				MM17
Tskhinvali - SA-8				MM17
Tskhinvali - Supply Truck		MM17
Udarnyy - SA-2					LQ01
Varvarovka - EWR				CK76
Veseloe - EWR					EJ80
Zaragizh - SA-2					LN99
Zemo Azhara - AAA				GH27
Zemo Azhara - Armor				GH27
Zemo Azhara - Artillery			GH27
Zemo Azhara - SA-19				GH27
Zemo Azhara - Supply Truck		GH27
Zeni - AAA						GH21
Zeni - Armor					GH20/21
Zeni - Artillery				GH20/21
Zeni - SA-8						GH21
Zeni - Supply Truck				GH20/21
Red October						???? >:)
Ochamchira - Supply Truck		GH03
Dzevera - SA-19					MM26
Dzevera - AAA					MM26
Dzevera - Artillery				MM26
Dzevera - Armor					MM26
Dzevera - Supply Truck			MM26
Sakasheti - Processing Plant	MM16	Static
Sakasheti - AAA					MM16
Sakasheti - SA-18				MM16
Sakasheti - Truck				MM16
Karaleti - Armor				MM25
Karaleti - SA-9					MM25
Karaleti - Supply Truck			MM25
Sukhumi Babushara - Armor		FH74
Gudauta - Armor					FH27
Sochi Adler - Armor				EJ71
Sochi Adler - SA-15				EJ71
Sochi Adler - Supply Truck		EJ71
Sochi - AAA						EJ52
Gelendzhik - Cargo Ship			DK23
Gelendzhik - Supply Truck		DK23
Eredvi - Scud Launcher			MM27
Eredvi - AAA					MM27
Eredvi - Armor					MM27
Eredvi - SA-11					MM27
Ergneti - Road Outpost			MM17	Static
Ergneti - Armor					MM17
Ergneti - SA-18					MM17
Lazarevskoe - Cargo Ship		DJ26 West Of Lazarevskoe
Pitsunda - Cargo Ship			EH64 South-West Of Pitsunda
Saberio - SA-8					GH42
Saberio - Armor					GH42
Saberio - AAA					GH42
Saberio - Supply Truck			GH42
]]--
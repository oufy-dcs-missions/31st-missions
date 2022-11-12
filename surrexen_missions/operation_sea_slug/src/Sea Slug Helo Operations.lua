--////////////////////////////////////////////////////////////
-- Name: Operation Sea Slug - Helo Module
-- Author: Surrexen    ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ
--////////////////////////////////////////////////////////////

--table missionCommands.addCommandForGroup(number groupId, string name, table/nil path, function functionToRun , any anyArguement)

-- https://wiki.hoggitworld.com/view/DCS_func_addCommandForGroup

--trigger.action.outText("Helo Operations Are Ready", 15)

--[[
	"Antonio B. Won Pat Intl"
	"Andersen AFB"
	"Rota Intl"
	"Tinian Intl"
	"Saipan Intl"
]]--

--------------------------------------------------------------------------------------------------------------------------------------------------
--////VARIABLES

HeloWeightingEnabled = true
CargoContainer = nil

CargoContainerLoadingZone = {}
CargoContainerLoadingZone[1] = {				
	ZoneName = "Antonio B. Won Pat Intl Cargo Loading Zone"		
}
CargoContainerLoadingZone[2] = {				
	ZoneName = "Andersen AFB Cargo Loading Zone"		
}
CargoContainerLoadingZone[3] = {				
	ZoneName = "Rota Intl Cargo Loading Zone"		
}
CargoContainerLoadingZone[4] = {				
	ZoneName = "Tinian Intl Cargo Loading Zone"		
}
CargoContainerLoadingZone[5] = {				
	ZoneName = "Saipan Intl Cargo Loading Zone"		
}


InfantryLoadingZone = {}
InfantryLoadingZone[1] = {				
	ZoneName = "Antonio B. Won Pat Intl Infantry Loading Zone"		
}
InfantryLoadingZone[2] = {				
	ZoneName = "Andersen AFB Infantry Loading Zone"		
}
InfantryLoadingZone[3] = {				
	ZoneName = "Rota Intl Infantry Loading Zone"		
}
InfantryLoadingZone[4] = {				
	ZoneName = "Tinian Intl Infantry Loading Zone"		
}
InfantryLoadingZone[5] = {				
	ZoneName = "Saipan Intl Infantry Loading Zone"		
}

CargoContainerSmokeLockout = 0
CargoContainerNumber = 0
CargoContainerTable = {}
InfantryTable = {}
StingerTable = {}
USACETable = {}
USACEM818Table = {}
USACEHAWKTable = {}
USACEROLANDTable = {}
USACEM1A2ABRAMSTable = {}
USACEAVENGERTable = {}
USACEBRADLEYTable = {}
USACENASAMSTable = {}
USACEPALADINTable = {}

ConstructionZone = nil

INFANTRY = SPAWN:NewWithAlias("Vehicle Template", "Infantry Squad"):InitRandomizeTemplate( { "Infantry Squad" } ):OnSpawnGroup(
		function( SpawnGroup )	
			InfantrySpawnGroup = SpawnGroup
			InfantryGroupName = SpawnGroup.GroupName											
			InfantryTableNextElement = #InfantryTable + 1											
			InfantrySquad = CARGO_GROUP:New(GROUP:FindByName(InfantryGroupName), "Infantry Squad "..InfantryTableNextElement, "Infantry Squad "..InfantryTableNextElement, 250)
			InfantryTable[InfantryTableNextElement] = InfantrySquad
		end 
	)
STINGER = SPAWN:NewWithAlias("Vehicle Template", "Stinger Squad"):InitRandomizeTemplate( { "Stinger Squad" } ):OnSpawnGroup(
		function( SpawnGroup )	
			StingerSpawnGroup = SpawnGroup
			StingerGroupName = SpawnGroup.GroupName											
			StingerTableNextElement = #StingerTable + 1											
			StingerSquad = CARGO_GROUP:New(GROUP:FindByName(StingerGroupName), "Stinger Squad "..StingerTableNextElement, "Stinger Squad "..StingerTableNextElement, 250)
			StingerTable[StingerTableNextElement] = StingerSquad
		end 
	)
USACE = SPAWN:NewWithAlias("Vehicle Template", "USACE Squad"):InitRandomizeTemplate( { "USACE Squad" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACESpawnGroup = SpawnGroup
			USACEGroupName = SpawnGroup.GroupName											
			USACETableNextElement = #USACETable + 1											
			USACESquad = CARGO_GROUP:New(GROUP:FindByName(USACEGroupName), "USACE Squad "..USACETableNextElement, "USACE Squad "..USACETableNextElement, 250)
			USACETable[USACETableNextElement] = USACESquad
		end 
	)									
USACEM818 = SPAWN:NewWithAlias("Vehicle Template", "USACE M818"):InitRandomizeTemplate( { "USACE M818" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACEM818SpawnGroup = SpawnGroup
			USACEM818GroupName = SpawnGroup.GroupName											
			USACEM818TableNextElement = #USACEM818Table + 1					
			USACEM818Table[USACEM818TableNextElement] = USACEM818GroupName																					
		end 
	)
USACEHAWK = SPAWN:NewWithAlias("Vehicle Template", "USACE Hawk"):InitRandomizeTemplate( { "USACE Hawk" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACEHAWKSpawnGroup = SpawnGroup
			USACEHAWKGroupName = SpawnGroup.GroupName											
			USACEHAWKTableNextElement = #USACEHAWKTable + 1					
			USACEHAWKTable[USACEHAWKTableNextElement] = USACEHAWKGroupName																					
		end 
	)									
USACEROLAND = SPAWN:NewWithAlias("Vehicle Template", "USACE Roland ADS"):InitRandomizeTemplate( { "USACE Roland ADS" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACEROLANDSpawnGroup = SpawnGroup
			USACEROLANDGroupName = SpawnGroup.GroupName											
			USACEROLANDTableNextElement = #USACEROLANDTable + 1					
			USACEROLANDTable[USACEROLANDTableNextElement] = USACEROLANDGroupName																					
		end 
	)
USACEM1A2ABRAMS = SPAWN:NewWithAlias("Vehicle Template", "USACE M1A2 Abrams"):InitRandomizeTemplate( { "USACE M1A2 Abrams" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACEM1A2ABRAMSSpawnGroup = SpawnGroup
			USACEM1A2ABRAMSGroupName = SpawnGroup.GroupName											
			USACEM1A2ABRAMSTableNextElement = #USACEM1A2ABRAMSTable + 1					
			USACEM1A2ABRAMSTable[USACEM1A2ABRAMSTableNextElement] = USACEM1A2ABRAMSGroupName																					
		end 
	)
USACEAVENGER = SPAWN:NewWithAlias("Vehicle Template", "USACE Avenger"):InitRandomizeTemplate( { "USACE Avenger" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACEAVENGERSpawnGroup = SpawnGroup
			USACEAVENGERGroupName = SpawnGroup.GroupName											
			USACEAVENGERTableNextElement = #USACEAVENGERTable + 1					
			USACEAVENGERTable[USACEAVENGERTableNextElement] = USACEAVENGERGroupName																					
		end 
	)
USACEBRADLEY = SPAWN:NewWithAlias("Vehicle Template", "USACE Bradley M6"):InitRandomizeTemplate( { "USACE Bradley M6" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACEBRADLEYSpawnGroup = SpawnGroup
			USACEBRADLEYGroupName = SpawnGroup.GroupName											
			USACEBRADLEYTableNextElement = #USACEBRADLEYTable + 1					
			USACEBRADLEYTable[USACEBRADLEYTableNextElement] = USACEBRADLEYGroupName																					
		end 
	)
USACENASAMS = SPAWN:NewWithAlias("Vehicle Template", "USACE NASAMS"):InitRandomizeTemplate( { "USACE NASAMS" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACENASAMSSpawnGroup = SpawnGroup
			USACENASAMSGroupName = SpawnGroup.GroupName											
			USACENASAMSTableNextElement = #USACENASAMSTable + 1					
			USACENASAMSTable[USACENASAMSTableNextElement] = USACENASAMSGroupName																					
		end 
	)									
USACEPALADIN = SPAWN:NewWithAlias("Vehicle Template", "USACE SPH M109 Paladin"):InitRandomizeTemplate( { "USACE SPH M109 Paladin" } ):OnSpawnGroup(
		function( SpawnGroup )	
			USACEPALADINSpawnGroup = SpawnGroup
			USACEPALADINGroupName = SpawnGroup.GroupName											
			USACEPALADINTableNextElement = #USACEPALADINTable + 1					
			USACEPALADINTable[USACEPALADINTableNextElement] = USACEPALADINGroupName																					
		end 
	)									

InfantryMaximumSquads = 8
InfantrySquadWeight = 250
InfantrySmokeLockout = 0
InfantryExtractionSmokeLockout = 0

StingerMaximumSquads = 4
StingerSquadWeight = 200
StingerSmokeLockout = 0
StingerExtractionSmokeLockout = 0

USACEMaximumSquads = 4
USACESquadWeight = 250
USACESmokeLockout = 0
USACEExtractionSmokeLockout = 0

CargoContainerMaximumCrates = 24
CargoContainerWeight = 250
									
USACEHawkRequiredCrates = 4
USACEHawkBuildTime = 120
USACEHawkMaximumSites = 3

USACEM818RequiredCrates = 2
USACEM818BuildTime = 60
USACEM818MaximumTrucks = 8

USACERolandRequiredCrates = 3
USACERolandBuildTime = 90
USACERolandMaximumUnits = 3

USACEM1A2AbramsRequiredCrates = 3
USACEM1A2AbramsBuildTime = 100
USACEM1A2AbramsMaximumUnits = 8

USACEAvengerRequiredCrates = 3
USACEAvengerBuildTime = 80
USACEAvengerMaximumUnits = 3

USACEBradleyRequiredCrates = 3
USACEBradleyBuildTime = 90
USACEBradleyMaximumUnits = 3

USACENASAMSRequiredCrates = 4
USACENASAMSBuildTime = 120
USACENASAMSMaximumSites = 2

USACEPaladinRequiredCrates = 3
USACEPaladinBuildTime = 100
USACEPaladinMaximumUnits = 4

--------------------------------------------------------------------------------------------------------------------------------------------------
--INFANTRY

function SEF_INFANTRY_UPDATEINFANTRYTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Infantry in pairs(InfantryTable) do					
		if ( Infantry:IsAlive() == true and Infantry:IsDestroyed() ~= true ) then								
			TempTable[TempTableCounter] = Infantry
			TempTableCounter = TempTableCounter + 1
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	InfantryTable = {}
	InfantryTable = TempTable
	--trigger.action.outText("Infantry table has "..#InfantryTable.." Elements", 15)	
end

function SEF_INFANTRY_GETNEARESTINFANTRYZONE(_Args)
		
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToZone = nil
	local InfantrySpawnZone = nil	
			
	for i = 1, #InfantryLoadingZone do
		local InfantryZoneCandidateName = InfantryLoadingZone[i].ZoneName
		local InfantryZoneCandidate = ZONE:FindByName(InfantryZoneCandidateName)
		local InfantryZoneCoord = InfantryZoneCandidate:GetCoordinate()
		local PlayerDistanceToZoneTest = TransPlayerUnitCoord:Get2DDistance(InfantryZoneCoord)
		local NearestAirbaseName = InfantryZoneCandidateName:gsub(" Infantry Loading Zone", "")
		
		--trigger.action.outText("Distance from unit "..TransClientUnitName.." To "..InfantryZoneCandidateName.." Is "..PlayerDistanceToZoneTest,15)
		
		if (NearestAirbaseName ~= nil) then
			if (Airbase.getByName(NearestAirbaseName):getCoalition() == 2) then							
				if ( PlayerDistanceToZone == nil ) then
					--Select this zone
					PlayerDistanceToZone = PlayerDistanceToZoneTest
					InfantrySpawnZone = InfantryZoneCandidateName			
				elseif ( PlayerDistanceToZoneTest <= PlayerDistanceToZone ) then
					--Select this zone
					PlayerDistanceToZone = PlayerDistanceToZoneTest
					InfantrySpawnZone = InfantryZoneCandidateName			
				else
					--Continue looking for a closer zone
				end			
			end	
		end		
	end	
	
	--trigger.action.outText("Nearest Infantry Zone To "..TransClientUnitName.." Is "..InfantrySpawnZone.." Distance "..PlayerDistanceToZone,15)
		
	return InfantrySpawnZone
end

function SEF_INFANTRY_SPAWN(_Args)
	
	SEF_INFANTRY_UPDATEINFANTRYTABLE()
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]
		
	local InfantryZoneName = SEF_INFANTRY_GETNEARESTINFANTRYZONE({ HeloGroupID, HeloGroupName })
		
	--trigger.action.outTextForGroup(HeloGroupID, "Nearest Infantry Loading Zone Is "..InfantryZoneName,15)
		
	if ( #InfantryTable >= InfantryMaximumSquads ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of Rifle Infantry Squads Available For Requisition, We Cannot Provide More Rifle Infantry Squads Right Now", 15)
	else
		local ZoneVec2 = ZONE:FindByName(InfantryZoneName):GetVec2()		
		INFANTRY:SpawnFromVec2(ZoneVec2)				
		trigger.action.outTextForGroup(HeloGroupID, "Rifle Infantry Squad Is Ready At "..InfantryZoneName, 15)		
		SEF_INFANTRY_UPDATEINFANTRYTABLE()
	end		
end

function SEF_INFANTRY_SPAWNPERSISTENT(Vec2Point)	
	SEF_INFANTRY_UPDATEINFANTRYTABLE()
	INFANTRY:SpawnFromVec2(Vec2Point)				
	SEF_INFANTRY_UPDATEINFANTRYTABLE()		
end

function SEF_INFANTRY_GETNEARESTINFANTRY(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToInfantry = nil
	local NearestInfantryObject = nil
	
	for x, y in pairs(InfantryTable) do
		local InfantryObject = y
		
		if ( InfantryObject:IsLoaded() == false ) then
		
			local InfantryObjectName = InfantryObject.Name
			local InfantryCoord = InfantryObject:GetCoordinate()
			local PlayerDistanceToInfantryTest = TransPlayerUnitCoord:Get2DDistance(InfantryCoord)
		
			if ( PlayerDistanceToInfantry == nil ) then
				PlayerDistanceToInfantry = PlayerDistanceToInfantryTest
				NearestInfantryObject = InfantryObject
			elseif ( PlayerDistanceToInfantryTest <= PlayerDistanceToInfantry ) then
				PlayerDistanceToInfantry = PlayerDistanceToInfantryTest
				NearestInfantryObject = InfantryObject
			else
				--Continue looking for nearest Infantry Squad
			end
		end	
	end
	
	if NearestInfantryObject ~= nil then
		--trigger.action.outTextForGroup(HeloGroupID, "Nearest Infantry Squad Is "..NearestInfantryObject.Name, 15)
		return NearestInfantryObject
	else
		--trigger.action.outTextForGroup(HeloGroupID, "No Infantry To Evaluate", 15)
		return nil
	end	
end

function SEF_INFANTRY_LOAD(_Args)

	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()		
	
	SEF_INFANTRY_UPDATEINFANTRYTABLE()
	
	local NearestInfantry = SEF_INFANTRY_GETNEARESTINFANTRY({ HeloGroupID, HeloGroupName })
	
	if ( NearestInfantry ~= nil ) then
		if ( TransPlayerUnit:IsCargoEmpty() == true ) then
			if ( TransPlayerUnit:InAir() == false and TransPlayerUnit:GetVelocityKMH() < 8 ) then
				
				local InfantryObject = NearestInfantry
				local InfantryObjectName = InfantryObject.Name				
				
				local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
				local InfantryCoord = InfantryObject:GetCoordinate()
				local PlayerDistanceToInfantry = TransPlayerUnitCoord:Get2DDistance(InfantryCoord) 			
				
				if ( PlayerDistanceToInfantry <= 100 ) then
					InfantryObject:Load( TransPlayerUnit, 10 )
					TransPlayerUnit:AddCargo(InfantryObject)																	
					trigger.action.outTextForGroup(HeloGroupID, InfantryObjectName.." Loaded Onto "..TransClientUnitName, 15 )
								
					local InfantryWeight = InfantrySquadWeight
									
					if ( HeloWeightingEnabled == true ) then
						trigger.action.setUnitInternalCargo(TransClientUnitName, InfantryWeight )
					end
				else
					trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Within 100m From An Infantry Squad To Load It",15)		
				end								
			else
				trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Stationary On The Ground To Load An Infantry Squad",15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." Already Has Cargo On Board",15)
		end
	else
		trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." There Are No Rifle Infantry Squads Nearby",15)
	end		
end

function SEF_INFANTRY_UNLOAD(_Args)
		
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()	
	
	if ( TransPlayerUnit:IsCargoEmpty() == false ) then							
		if ( TransPlayerUnit:InAir() == false and TransPlayerUnit:GetVelocityKMH() < 8 ) then
							
			SEF_INFANTRY_UPDATEINFANTRYTABLE()
					
			for x, y in pairs(InfantryTable) do
				local InfantryObject = y
				local InfantryObjectName = InfantryObject.Name							
							
				if ( InfantryObject:IsLoadedInCarrier(TransPlayerUnit) == true ) then
																	
					local ZonePointVec2 = TransPlayerUnit:GetPointVec2()		
					local x = ZonePointVec2:GetLat()
					local y = ZonePointVec2:GetLon()
					local offsety = y + 25
					local CrateSpawnPointVec2 = POINT_VEC2:New( x, offsety )
								
					InfantryObject:UnLoad( CrateSpawnPointVec2)
					TransPlayerUnit:RemoveCargo(InfantryObject)																	
					trigger.action.outTextForGroup(HeloGroupID, InfantryObjectName.." Unloaded From "..TransClientUnitName, 15 )

					local CargoWeight = 0
					
					if ( HeloWeightingEnabled == true ) then
                        trigger.action.setUnitInternalCargo(TransClientUnitName, CargoWeight )
                    end		
				end	
			end													
		else
			trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Stationary On The Ground To Unload An Infantry Squad",15)
		end
	else
		trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." Does Not Have Cargo On Board",15)
	end
end

function SEF_INFANTRY_LoadingZoneSmokeLock()
	InfantrySmokeLockout = 1
end

function SEF_INFANTRY_LoadingZoneSmokeUnlock()
	InfantrySmokeLockout = 0
end

function SEF_INFANTRY_SmokeLoadingZones()
	
	if (InfantrySmokeLockout == 0) then
		for i = 1, #InfantryLoadingZone do
			local InfantryZoneCandidateName = InfantryLoadingZone[i].ZoneName
			local InfantryLoadingZoneCoord = ZONE:FindByName(InfantryZoneCandidateName):GetCoordinate()
			local NearestAirbaseName = InfantryZoneCandidateName:gsub(" Infantry Loading Zone", "")
			
			if (NearestAirbaseName ~= nil) then
				if (Airbase.getByName(NearestAirbaseName):getCoalition() == 2) then			
					InfantryLoadingZoneCoord:SmokeBlue()					
				end
			end	
		end
		SEF_INFANTRY_LoadingZoneSmokeLock()
		timer.scheduleFunction(SEF_INFANTRY_LoadingZoneSmokeUnlock, 53, timer.getTime() + 300)
		
		trigger.action.outText( "Infantry Loading Zones Have Been Marked With Blue Smoke", 15 )		
	else
		trigger.action.outText( "Infantry Loading Zones Are Already Smoked", 15 )
	end
end

function SEF_INFANTRY_ExtractionZoneSmokeLock()
	InfantryExtractionSmokeLockout = 1
end

function SEF_INFANTRY_ExtractionZoneSmokeUnlock()
	InfantryExtractionSmokeLockout = 0
end

function SEF_INFANTRY_SmokeExtractionZones()
	
	if ( InfantryExtractionSmokeLockout == 0 and #InfantryTable > 0 ) then		
		for i = 1, #InfantryTable do			
			local InfantryObject = InfantryTable[i]			
			if ( InfantryObject:IsLoaded() == false ) then
				local InfantryCoord = InfantryObject:GetCoordinate()
				InfantryCoord:SmokeOrange()			
			end	
		end		
		SEF_INFANTRY_ExtractionZoneSmokeLock()
		timer.scheduleFunction(SEF_INFANTRY_ExtractionZoneSmokeUnlock, 53, timer.getTime() + 300)	
		
		trigger.action.outText("Rifle Infantry Squad Extraction Zones Have Been Marked With Orange Smoke", 15)		
	else
		trigger.action.outText("Rifle Infantry Squad Extraction Zones Are Already Smoked", 15)
	end
end

--END INFANTRY
--------------------------------------------------------------------------------------------------------------------------------------------------
--STINGER

function SEF_STINGER_UPDATESTINGERTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Stinger in pairs(StingerTable) do					
		if ( Stinger:IsAlive() == true and Stinger:IsDestroyed() ~= true ) then								
			TempTable[TempTableCounter] = Stinger
			TempTableCounter = TempTableCounter + 1
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	StingerTable = {}
	StingerTable = TempTable
	--trigger.action.outText("Stinger table has "..#StingerTable.." Elements", 15)	
end

function SEF_STINGER_GETNEARESTSTINGERZONE(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToZone = nil
	local StingerSpawnZone = nil	
	
	for i = 1, #InfantryLoadingZone do
		local InfantryZoneCandidateName = InfantryLoadingZone[i].ZoneName
		local InfantryZoneCandidate = ZONE:FindByName(InfantryZoneCandidateName)
		local InfantryZoneCoord = InfantryZoneCandidate:GetCoordinate()
		local PlayerDistanceToZoneTest = TransPlayerUnitCoord:Get2DDistance(InfantryZoneCoord)
		local NearestAirbaseName = InfantryZoneCandidateName:gsub(" Infantry Loading Zone", "")
		
		--trigger.action.outText("Distance from unit "..TransClientUnitName.." To "..InfantryZoneCandidateName.." Is "..PlayerDistanceToZoneTest,15)
		
		if (NearestAirbaseName ~= nil) then
			if (Airbase.getByName(NearestAirbaseName):getCoalition() == 2) then				
				if ( PlayerDistanceToZone == nil ) then
					--Select this zone
					PlayerDistanceToZone = PlayerDistanceToZoneTest
					StingerSpawnZone = InfantryZoneCandidateName			
				elseif ( PlayerDistanceToZoneTest <= PlayerDistanceToZone ) then
					--Select this zone
					PlayerDistanceToZone = PlayerDistanceToZoneTest
					StingerSpawnZone = InfantryZoneCandidateName			
				else
					--Continue looking for a closer zone
				end
			end
		end	
	end	
	
	--trigger.action.outText("Nearest Anti-Air Zone To "..TransClientUnitName.." Is "..StingerSpawnZone.." Distance "..PlayerDistanceToZone,15)

	return StingerSpawnZone
end

function SEF_STINGER_SPAWN(_Args)
	
	SEF_STINGER_UPDATESTINGERTABLE()
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]
		
	local InfantryZoneName = SEF_STINGER_GETNEARESTSTINGERZONE({ HeloGroupID, HeloGroupName })
		
	--trigger.action.outTextForGroup(HeloGroupID, "Nearest Anti-Air Infantry Pickup Zone Is "..InfantryZoneName,15)
		
	if ( #StingerTable >= StingerMaximumSquads ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of Anti-Air Squads Available For Requisition, We Cannot Provide More Anti-Air Infantry Squads Right Now", 15)
	else
		local ZoneVec2 = ZONE:FindByName(InfantryZoneName):GetVec2()		
		STINGER:SpawnFromVec2(ZoneVec2)				
		trigger.action.outTextForGroup(HeloGroupID, "Anti-Air Infantry Squad Is Ready At "..InfantryZoneName, 15)		
		SEF_STINGER_UPDATESTINGERTABLE()
	end		
end

function SEF_STINGER_SPAWNPERSISTENT(Vec2Point)	
	SEF_STINGER_UPDATESTINGERTABLE()
	STINGER:SpawnFromVec2(Vec2Point)				
	SEF_STINGER_UPDATESTINGERTABLE()		
end

function SEF_STINGER_GETNEARESTSTINGER(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToStinger = nil
	local NearestStingerObject = nil
	
	for x, y in pairs(StingerTable) do
		local StingerObject = y
		
		if ( StingerObject:IsLoaded() == false ) then
		
			local StingerObjectName = StingerObject.Name
			local StingerCoord = StingerObject:GetCoordinate()
			local PlayerDistanceToStingerTest = TransPlayerUnitCoord:Get2DDistance(StingerCoord)
		
			if ( PlayerDistanceToStinger == nil ) then
				PlayerDistanceToStinger = PlayerDistanceToStingerTest
				NearestStingerObject = StingerObject
			elseif ( PlayerDistanceToStingerTest <= PlayerDistanceToStinger ) then
				PlayerDistanceToStinger = PlayerDistanceToStingerTest
				NearestStingerObject = StingerObject
			else
				--Continue looking for nearest Anti-Air Infantry Squad
			end
		end	
	end
	
	if NearestStingerObject ~= nil then
		--trigger.action.outTextForGroup(HeloGroupID, "Nearest Anti-Air Infantry Squad Is "..NearestStingerObject.Name, 15)
		return NearestStingerObject
	else
		--trigger.action.outTextForGroup(HeloGroupID, "No Anti-Air Infantry To Evaluate", 15)
		return nil
	end	
end

function SEF_STINGER_LOAD(_Args)

	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()		
	
	SEF_STINGER_UPDATESTINGERTABLE()
	
	local NearestStinger = SEF_STINGER_GETNEARESTSTINGER({ HeloGroupID, HeloGroupName })
	
	if ( NearestStinger ~= nil ) then
		if ( TransPlayerUnit:IsCargoEmpty() == true ) then
			if ( TransPlayerUnit:InAir() == false and TransPlayerUnit:GetVelocityKMH() < 8 ) then
				
				local StingerObject = NearestStinger
				local StingerObjectName = StingerObject.Name				
				
				local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
				local StingerCoord = StingerObject:GetCoordinate()
				local PlayerDistanceToStinger = TransPlayerUnitCoord:Get2DDistance(StingerCoord) 			
				
				if ( PlayerDistanceToStinger <= 100 ) then
					StingerObject:Load( TransPlayerUnit, 10 )
					TransPlayerUnit:AddCargo(StingerObject)																	
					trigger.action.outTextForGroup(HeloGroupID, StingerObjectName.." Loaded Onto "..TransClientUnitName, 15 )
								
					local StingerWeight = StingerSquadWeight
									
					if ( HeloWeightingEnabled == true ) then
						trigger.action.setUnitInternalCargo(TransClientUnitName, StingerWeight )
					end
				else
					trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Within 100m From An Anti-Air Infantry Squad To Load It",15)		
				end								
			else
				trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Stationary On The Ground To Load An Anti-Air Infantry Squad",15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." Already Has Cargo On Board",15)
		end
	else
		trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." There Are No Anti-Air Infantry Squads Nearby",15)
	end		
end

function SEF_STINGER_UNLOAD(_Args)
		
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()	
	
	if ( TransPlayerUnit:IsCargoEmpty() == false ) then							
		if ( TransPlayerUnit:InAir() == false and TransPlayerUnit:GetVelocityKMH() < 8 ) then
							
			SEF_STINGER_UPDATESTINGERTABLE()
					
			for x, y in pairs(StingerTable) do
				local StingerObject = y
				local StingerObjectName = StingerObject.Name							
							
				if ( StingerObject:IsLoadedInCarrier(TransPlayerUnit) == true ) then
																	
					local ZonePointVec2 = TransPlayerUnit:GetPointVec2()		
					local x = ZonePointVec2:GetLat()
					local y = ZonePointVec2:GetLon()
					local offsety = y + 25
					local CrateSpawnPointVec2 = POINT_VEC2:New( x, offsety )
								
					StingerObject:UnLoad( CrateSpawnPointVec2)
					TransPlayerUnit:RemoveCargo(StingerObject)																	
					trigger.action.outTextForGroup(HeloGroupID, StingerObjectName.." Unloaded From "..TransClientUnitName, 15 )

					local CargoWeight = 0
					
					if ( HeloWeightingEnabled == true ) then
                        trigger.action.setUnitInternalCargo(TransClientUnitName, CargoWeight )
                    end		
				end	
			end													
		else
			trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Stationary On The Ground To Unload An Anti-Air Infantry Squad",15)
		end
	else
		trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." Does Not Have Cargo On Board",15)
	end
end

function SEF_STINGER_ExtractionZoneSmokeLock()
	StingerExtractionSmokeLockout = 1
end

function SEF_STINGER_ExtractionZoneSmokeUnlock()
	StingerExtractionSmokeLockout = 0
end

function SEF_STINGER_SmokeExtractionZones()
	
	if ( StingerExtractionSmokeLockout == 0 and #StingerTable > 0 ) then		
		for i = 1, #StingerTable do			
			local StingerObject = StingerTable[i]			
			if ( StingerObject:IsLoaded() == false ) then
				local StingerCoord = StingerObject:GetCoordinate()
				StingerCoord:SmokeOrange()			
			end	
		end		
		SEF_STINGER_ExtractionZoneSmokeLock()
		timer.scheduleFunction(SEF_STINGER_ExtractionZoneSmokeUnlock, 53, timer.getTime() + 300)	
		
		trigger.action.outText( "Anti-Air Squad Extraction Zones Have Been Marked With Orange Smoke", 15 )		
	else
		trigger.action.outText( "Anti-Air Squad Extraction Zones Are Already Smoked", 15 )
	end
end

--END STINGERS
--------------------------------------------------------------------------------------------------------------------------------------------------
--USACE ENGINEERS

function SEF_USACE_UPDATEUSACETABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, USACE in pairs(USACETable) do					
		if ( USACE:IsAlive() == true and USACE:IsDestroyed() ~= true ) then								
			TempTable[TempTableCounter] = USACE
			TempTableCounter = TempTableCounter + 1
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACETable = {}
	USACETable = TempTable
	--trigger.action.outText("USACE table has "..#USACETable.." Elements", 15)	
end

function SEF_USACE_GETNEARESTUSACEZONE(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToZone = nil
	local USACESpawnZone = nil	
	
	for i = 1, #InfantryLoadingZone do
		local InfantryZoneCandidateName = InfantryLoadingZone[i].ZoneName
		local InfantryZoneCandidate = ZONE:FindByName(InfantryZoneCandidateName)
		local InfantryZoneCoord = InfantryZoneCandidate:GetCoordinate()
		local PlayerDistanceToZoneTest = TransPlayerUnitCoord:Get2DDistance(InfantryZoneCoord)
		local NearestAirbaseName = InfantryZoneCandidateName:gsub(" Infantry Loading Zone", "")
		
		--trigger.action.outText("Distance from unit "..TransClientUnitName.." To "..InfantryZoneCandidateName.." Is "..PlayerDistanceToZoneTest,15)
		
		if (NearestAirbaseName ~= nil) then
			if (Airbase.getByName(NearestAirbaseName):getCoalition() == 2) then				
				if ( PlayerDistanceToZone == nil ) then
					--Select this zone
					PlayerDistanceToZone = PlayerDistanceToZoneTest
					USACESpawnZone = InfantryZoneCandidateName			
				elseif ( PlayerDistanceToZoneTest <= PlayerDistanceToZone ) then
					--Select this zone
					PlayerDistanceToZone = PlayerDistanceToZoneTest
					USACESpawnZone = InfantryZoneCandidateName			
				else
					--Continue looking for a closer zone
				end
			end
		end	
	end	
	
	--trigger.action.outText("Nearest Anti-Air Zone To "..TransClientUnitName.." Is "..USACESpawnZone.." Distance "..PlayerDistanceToZone,15)

	return USACESpawnZone
end

function SEF_USACE_SPAWN(_Args)
	
	SEF_USACE_UPDATEUSACETABLE()
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]
		
	local InfantryZoneName = SEF_USACE_GETNEARESTUSACEZONE({ HeloGroupID, HeloGroupName })
		
	--trigger.action.outTextForGroup(HeloGroupID, "Nearest USACE Engineering Infantry Pickup Zone Is "..InfantryZoneName,15)
		
	if ( #USACETable >= USACEMaximumSquads ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of Engineering Squads Available For Requisition, We Cannot Provide More Engineering Squads Right Now", 15)
	else
		local ZoneVec2 = ZONE:FindByName(InfantryZoneName):GetVec2()		
		USACE:SpawnFromVec2(ZoneVec2)				
		trigger.action.outTextForGroup(HeloGroupID, "USACE Engineering Squad Is Ready At "..InfantryZoneName, 15)		
		SEF_USACE_UPDATEUSACETABLE()
	end		
end

function SEF_USACE_SPAWNPERSISTENT(Vec2Point)	
	SEF_USACE_UPDATEUSACETABLE()
	USACE:SpawnFromVec2(Vec2Point)				
	SEF_USACE_UPDATEUSACETABLE()		
end

function SEF_USACE_GETNEARESTUSACE(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToUSACE = nil
	local NearestUSACEObject = nil
	
	for x, y in pairs(USACETable) do
		local USACEObject = y
		
		if ( USACEObject:IsLoaded() == false ) then
		
			local USACEObjectName = USACEObject.Name
			local USACECoord = USACEObject:GetCoordinate()
			local PlayerDistanceToUSACETest = TransPlayerUnitCoord:Get2DDistance(USACECoord)
		
			if ( PlayerDistanceToUSACE == nil ) then
				PlayerDistanceToUSACE = PlayerDistanceToUSACETest
				NearestUSACEObject = USACEObject
			elseif ( PlayerDistanceToUSACETest <= PlayerDistanceToUSACE ) then
				PlayerDistanceToUSACE = PlayerDistanceToUSACETest
				NearestUSACEObject = USACEObject
			else
				--Continue looking for nearest Anti-Air Infantry Squad
			end
		end	
	end
	
	if NearestUSACEObject ~= nil then
		--trigger.action.outTextForGroup(HeloGroupID, "Nearest USACE Engineering Squad Is "..NearestUSACEObject.Name, 15)
		return NearestUSACEObject
	else
		--trigger.action.outTextForGroup(HeloGroupID, "No USACE Engineering Infantry To Evaluate", 15)
		return nil
	end	
end

function SEF_USACE_LOAD(_Args)

	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()		
	
	SEF_USACE_UPDATEUSACETABLE()
	
	local NearestUSACE = SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
	
	if ( NearestUSACE ~= nil ) then
		if ( TransPlayerUnit:IsCargoEmpty() == true ) then
			if ( TransPlayerUnit:InAir() == false and TransPlayerUnit:GetVelocityKMH() < 8 ) then
				
				local USACEObject = NearestUSACE
				local USACEObjectName = USACEObject.Name				
				
				local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
				local USACECoord = USACEObject:GetCoordinate()
				local PlayerDistanceToUSACE = TransPlayerUnitCoord:Get2DDistance(USACECoord) 			
				
				if ( PlayerDistanceToUSACE <= 100 ) then
					USACEObject:Load( TransPlayerUnit, 10 )
					TransPlayerUnit:AddCargo(USACEObject)																	
					trigger.action.outTextForGroup(HeloGroupID, USACEObjectName.." Loaded Onto "..TransClientUnitName, 15 )
								
					local USACEWeight = USACESquadWeight
									
					if ( HeloWeightingEnabled == true ) then
						trigger.action.setUnitInternalCargo(TransClientUnitName, USACEWeight )
					end
				else
					trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Within 100m From A USACE Engineering Squad To Load It",15)		
				end								
			else
				trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Stationary On The Ground To Load A USACE Engineering Infantry Squad",15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." Already Has Cargo On Board",15)
		end
	else
		trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." There Are No USACE Engineering Squads Nearby",15)
	end		
end

function SEF_USACE_UNLOAD(_Args)
		
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()	
	
	if ( TransPlayerUnit:IsCargoEmpty() == false ) then							
		if ( TransPlayerUnit:InAir() == false and TransPlayerUnit:GetVelocityKMH() < 8 ) then
							
			SEF_USACE_UPDATEUSACETABLE()
					
			for x, y in pairs(USACETable) do
				local USACEObject = y
				local USACEObjectName = USACEObject.Name							
							
				if ( USACEObject:IsLoadedInCarrier(TransPlayerUnit) == true ) then
																	
					local ZonePointVec2 = TransPlayerUnit:GetPointVec2()		
					local x = ZonePointVec2:GetLat()
					local y = ZonePointVec2:GetLon()
					local offsety = y + 25
					local CrateSpawnPointVec2 = POINT_VEC2:New( x, offsety )
								
					USACEObject:UnLoad( CrateSpawnPointVec2)
					TransPlayerUnit:RemoveCargo(USACEObject)																	
					trigger.action.outTextForGroup(HeloGroupID, USACEObjectName.." Unloaded From "..TransClientUnitName, 15 )

					local CargoWeight = 0
					
					if ( HeloWeightingEnabled == true ) then
                        trigger.action.setUnitInternalCargo(TransClientUnitName, CargoWeight )
                    end		
				end	
			end													
		else
			trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Stationary On The Ground To Unload A USACE Engineering Squad",15)
		end
	else
		trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." Does Not Have Cargo On Board",15)
	end
end

function SEF_USACE_ExtractionZoneSmokeLock()
	USACEExtractionSmokeLockout = 1
end

function SEF_USACE_ExtractionZoneSmokeUnlock()
	USACEExtractionSmokeLockout = 0
end

function SEF_USACE_SmokeExtractionZones()
	
	if ( USACEExtractionSmokeLockout == 0 and #USACETable > 0 ) then		
		for i = 1, #USACETable do			
			local USACEObject = USACETable[i]			
			if ( USACEObject:IsLoaded() == false ) then
				local USACECoord = USACEObject:GetCoordinate()
				USACECoord:SmokeOrange()			
			end	
		end		
		SEF_USACE_ExtractionZoneSmokeLock()
		timer.scheduleFunction(SEF_USACE_ExtractionZoneSmokeUnlock, 53, timer.getTime() + 300)	
		
		trigger.action.outText( "USACE Engineering Squad Extraction Zones Have Been Marked With Orange Smoke", 15 )		
	else
		trigger.action.outText( "USACE Engineering Squad Extraction Zones Are Already Smoked", 15 )
	end
end

--END ENGINEERS
--------------------------------------------------------------------------------------------------------------------------------------------------
--CARGO CONTAINERS

function SEF_CARGO_UPDATECRATETABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Crate in pairs(CargoContainerTable) do					
		if ( Crate:IsAlive() == true and Crate:IsDestroyed() ~= true ) then								
			TempTable[TempTableCounter] = Crate
			TempTableCounter = TempTableCounter + 1
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	CargoContainerTable = {}
	CargoContainerTable = TempTable
	--trigger.action.outText("Container table has "..#CargoContainerTable.." Elements", 15)	
end

function SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(Zone)
	
	local ZoneCrateCount = 0
	
	if ( Zone ~= nil ) then		
		
		SEF_CARGO_UPDATECRATETABLE()
		
		for x, Crate in pairs(CargoContainerTable) do
			ZoneCargoObject = CARGO:FindByName(Crate.Name)
						
			if ( ZoneCargoObject:IsInZone(Zone) == true and ZoneCargoObject:IsLoaded() == false ) then					
				ZoneCrateCount = ZoneCrateCount + 1
				--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone", 15)
			end	
		end	
		--trigger.action.outText("There Are "..ZoneCrateCount.." Crates Inside The Construction Zone", 15)
		return ZoneCrateCount
	else
		--trigger.action.outText("The Construction Zone You Have Queried Does Not Currently Exist", 15)
		return ZoneCrateCount
	end
end

function SEF_CARGO_GETNEARESTCARGOZONE(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToZone = nil
	local CargoContainerSpawnZone = nil	
	
	for i = 1, #CargoContainerLoadingZone do
		local CargoZoneCandidateName = CargoContainerLoadingZone[i].ZoneName
		local CargoZoneCandidate = ZONE:FindByName(CargoZoneCandidateName)
		local CargoZoneCoord = CargoZoneCandidate:GetCoordinate()
		local PlayerDistanceToZoneTest = TransPlayerUnitCoord:Get2DDistance(CargoZoneCoord)
		local NearestAirbaseName = CargoZoneCandidateName:gsub(" Cargo Loading Zone", "")
		
		--trigger.action.outText("Distance from unit "..TransClientUnitName.." To "..CargoZoneCandidateName.." Is "..PlayerDistanceToZoneTest,15)
		
		if (NearestAirbaseName ~= nil) then
			if (Airbase.getByName(NearestAirbaseName):getCoalition() == 2) then				
				if ( PlayerDistanceToZone == nil ) then
					--Select this zone
					PlayerDistanceToZone = PlayerDistanceToZoneTest
					CargoContainerSpawnZone = CargoZoneCandidateName			
				elseif ( PlayerDistanceToZoneTest <= PlayerDistanceToZone ) then
					--Select this zone
					PlayerDistanceToZone = PlayerDistanceToZoneTest
					CargoContainerSpawnZone = CargoZoneCandidateName			
				else
					--Continue looking for a closer zone
				end
			end
		end	
	end	
	
	--trigger.action.outText("Nearest Cargo Zone To "..TransClientUnitName.." Is "..CargoContainerSpawnZone.." Distance "..PlayerDistanceToZone,15)

	return CargoContainerSpawnZone
end

function SEF_CARGO_SPAWN(_Args)
	
	SEF_CARGO_UPDATECRATETABLE()
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]
		
	local CargoZoneName = SEF_CARGO_GETNEARESTCARGOZONE({ HeloGroupID, HeloGroupName })
		
	--trigger.action.outTextForGroup(HeloGroupID, "Nearest Cargo Loading Zone Is "..CargoZoneName,15)
		
	if ( #CargoContainerTable >= CargoContainerMaximumCrates ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of Cargo Containers Available For Requisition, We Cannot Provide More Containers Right Now", 15)
	else
		ContainerID = CargoContainerNumber + 1
		CargoContainerNextElement = #CargoContainerTable + 1
		
		local ZonePointVec2 = ZONE:FindByName(CargoZoneName):GetPointVec2()
		local x = ZonePointVec2:GetLat()
		local y = ZonePointVec2:GetLon()
		local offsety = y + ( CargoContainerNextElement * 2.5 )
		local CrateSpawnPointVec2 = POINT_VEC2:New( x, offsety )		
		
		CargoContainer = CARGO_CRATE:New(SPAWNSTATIC:NewFromStatic( "Cargo Container", country.id.USA ):SpawnFromPointVec2( CrateSpawnPointVec2, 0, "Cargo Container "..ContainerID), "Cargo Container "..ContainerID,"Cargo Container "..ContainerID,1000)
		CargoContainerTable[CargoContainerNextElement] = CargoContainer
		CargoContainerNumber = CargoContainerNumber + 1
		trigger.action.outTextForGroup(HeloGroupID, "Cargo Container Is Ready At "..CargoZoneName, 15) --..CargoContainer.Name.."
		
		SEF_CARGO_UPDATECRATETABLE()
	end		
end

function SEF_CARGO_SPAWNPERSISTENT(Vec2)	
	local SpawnPointVec2 = POINT_VEC2:NewFromVec2(Vec2, 0)
	ContainerID = CargoContainerNumber + 1
	CargoContainerNextElement = #CargoContainerTable + 1
	CargoContainer = CARGO_CRATE:New(SPAWNSTATIC:NewFromStatic( "Cargo Container", country.id.USA ):SpawnFromPointVec2( SpawnPointVec2, 0, "Cargo Container "..ContainerID), "Cargo Container "..ContainerID,"Cargo Container "..ContainerID,1000)
	CargoContainerTable[CargoContainerNextElement] = CargoContainer
	CargoContainerNumber = CargoContainerNumber + 1
	SEF_CARGO_UPDATECRATETABLE()
end

function SEF_CARGO_GETNEARESTCONTAINER(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToCargo = nil
	local NearestCargoObject = nil
	
	for x, y in pairs(CargoContainerTable) do
		local CargoObject = y
		
		if ( CargoObject:IsLoaded() == false ) then
		
			local CargoObjectName = CargoObject.Name
			local CrateCoord = CargoObject:GetCoordinate()
			local PlayerDistanceToCargoTest = TransPlayerUnitCoord:Get2DDistance(CrateCoord)
		
			if ( PlayerDistanceToCargo == nil ) then
				PlayerDistanceToCargo = PlayerDistanceToCargoTest
				NearestCargoObject = CargoObject
			elseif ( PlayerDistanceToCargoTest <= PlayerDistanceToCargo ) then
				PlayerDistanceToCargo = PlayerDistanceToCargoTest
				NearestCargoObject = CargoObject
			else
				--Continue looking for nearest container
			end
		end	
	end
	
	if NearestCargoObject ~= nil then
		--trigger.action.outTextForGroup(HeloGroupID, "Nearest Container Is "..NearestCargoObject.Name, 15)
		return NearestCargoObject
	else
		--trigger.action.outTextForGroup(HeloGroupID, "No Containers To Evaluate", 15)
		return nil
	end	
end

function SEF_CARGO_LOAD(_Args)

	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()		
	
	SEF_CARGO_UPDATECRATETABLE()
	
	local NearestContainer = SEF_CARGO_GETNEARESTCONTAINER({ HeloGroupID, HeloGroupName })
	
	if ( NearestContainer ~= nil ) then
		if ( TransPlayerUnit:IsCargoEmpty() == true ) then
			if ( TransPlayerUnit:InAir() == false and TransPlayerUnit:GetVelocityKMH() < 8 ) then --and TransPlayerUnit:IsInZone(CargoContainerLoadingZone) == true or PlayerDistanceToCargo <= 100
				
				local CargoObject = NearestContainer
				local CargoObjectName = CargoObject.Name				
				
				local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
				local CrateCoord = CargoObject:GetCoordinate()
				local PlayerDistanceToCargo = TransPlayerUnitCoord:Get2DDistance(CrateCoord) 			
				
				if ( PlayerDistanceToCargo <= 100 ) then
					CargoObject:Load( TransPlayerUnit, 10 )
					TransPlayerUnit:AddCargo(CargoObject)																	
					trigger.action.outTextForGroup(HeloGroupID, "Cargo Container Loaded Onto "..TransClientUnitName, 15 ) --CargoObjectName.." Loaded Onto "..TransClientUnitName, 15
								
					local CargoWeight = CargoContainerWeight
									
					if ( HeloWeightingEnabled == true ) then
						trigger.action.setUnitInternalCargo(TransClientUnitName, CargoWeight )
					end
				else
					trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Within 100m From The Container To Load It",15)		
				end								
			else
				trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Stationary On The Ground To Load A Container",15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." Already Has Cargo On Board",15)
		end
	else
		trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." There Are No Cargo Containers Nearby",15)
	end		
end

function SEF_CARGO_UNLOAD(_Args)
		
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()	
	
	if ( TransPlayerUnit:IsCargoEmpty() == false ) then							
		if ( TransPlayerUnit:InAir() == false and TransPlayerUnit:GetVelocityKMH() < 8 ) then
							
			SEF_CARGO_UPDATECRATETABLE()
					
			for x, y in pairs(CargoContainerTable) do
				local CargoObject = y
				local CargoObjectName = CargoObject.Name							
							
				if ( CargoObject:IsLoadedInCarrier(TransPlayerUnit) == true ) then
																	
					local ZonePointVec2 = TransPlayerUnit:GetPointVec2()		
					local x = ZonePointVec2:GetLat()
					local y = ZonePointVec2:GetLon()
					local offsety = y + 25
					local CrateSpawnPointVec2 = POINT_VEC2:New( x, offsety )
								
					CargoObject:UnLoad( CrateSpawnPointVec2)
					TransPlayerUnit:RemoveCargo(CargoObject)																	
					trigger.action.outTextForGroup(HeloGroupID, "Cargo Container Unloaded From "..TransClientUnitName, 15 ) --CargoObjectName.." Unloaded From "..TransClientUnitName, 15

					local CargoWeight = 0
					
					if ( HeloWeightingEnabled == true ) then
                        trigger.action.setUnitInternalCargo(TransClientUnitName, CargoWeight )
                    end		
				end	
			end													
		else
			trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." You Must Be Stationary On The Ground To Unload A Container",15)
		end
	else
		trigger.action.outTextForGroup(HeloGroupID, TransClientUnitName.." Does Not Have Cargo On Board",15)
	end
end

function SEF_CARGO_LoadingZoneSmokeLock()
	CargoContainerSmokeLockout = 1
end

function SEF_CARGO_LoadingZoneSmokeUnlock()
	CargoContainerSmokeLockout = 0
end

function SEF_CARGO_SmokeLoadingZones()
	
	if ( CargoContainerSmokeLockout == 0 ) then		
		for i = 1, #CargoContainerLoadingZone do
			local CargoZoneCandidateName = CargoContainerLoadingZone[i].ZoneName
			local CARGOLoadingZoneCoord = ZONE:FindByName(CargoZoneCandidateName):GetCoordinate()
			local NearestAirbaseName = CargoZoneCandidateName:gsub(" Cargo Loading Zone", "")
			
			if (NearestAirbaseName ~= nil) then
				if (Airbase.getByName(NearestAirbaseName):getCoalition() == 2) then
					CARGOLoadingZoneCoord:SmokeGreen()					
				end
			end	
		end		
		SEF_CARGO_LoadingZoneSmokeLock()
		timer.scheduleFunction(SEF_CARGO_LoadingZoneSmokeUnlock, 53, timer.getTime() + 300)
		
		trigger.action.outText( "Cargo Loading Zones Have Been Marked With Green Smoke", 15 )		
	else
		trigger.action.outText( "Cargo Loading Zones Are Already Smoked", 15 )
	end
end

--END CARGO CONTAINERS
--------------------------------------------------------------------------------------------------------------------------------------------------
--////CONSTRUCTION ITEMS

function SEF_USACEM818_SPAWN(Vec2Point)	
	USACEM818:SpawnFromVec2(Vec2Point)
	trigger.action.outText("The M818 Ammunition Truck You Requisitioned Is Ready Now", 15)
end

function SEF_USACEM818_SPAWNPERSISTENT(Vec2Point)	
	USACEM818:SpawnFromVec2(Vec2Point)	
end

function SEF_BUILD_M818(_Args)

	SEF_USACE_UPDATEM818TABLE()
	
	local HeloGroupID 			= _Args[1]
	local HeloGroupName 		= _Args[2]
	local ConstructionTeamName 	= nil
	local ConstructionZone 		= nil				
	local TransPlayerUnit 		= UNIT:FindByName(HeloGroupName)
	local TransClientUnitName 	= TransPlayerUnit:GetName()	
	local NearestUSACE 			= SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
	
	if ( #USACEM818Table >= USACEM818MaximumTrucks ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of M818 Trucks Available For Requisition, No More Can Be Constructed At This Time", 15)
	else	
		if ( NearestUSACE ~= nil ) then				
			USACEConstructionCoordVec2 = NearestUSACE:GetCoordinate():GetVec2()
			ConstructionZone = ZONE_RADIUS:New("USACE Construction Zone", USACEConstructionCoordVec2, 150)
			ConstructionTeamName = NearestUSACE:GetObjectName()		
						
			if ( ConstructionTeamName ~= nil and ConstructionZone ~= nil ) then	
				if ( GROUP:FindByName(ConstructionTeamName) ) then
					if ( GROUP:FindByName(ConstructionTeamName):IsInZone(ConstructionZone) == true ) then
					
						local CrateCount = SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(ConstructionZone)
						
						if ( CrateCount >= USACEM818RequiredCrates ) then						
							--Consume Crates And Spawn The M818											
							local DestroyedCrateCount = 0
							for x, Crate in pairs(CargoContainerTable) do
								ZoneCargoObject = CARGO:FindByName(Crate.Name)								
								if ( ZoneCargoObject:IsInZone(ConstructionZone) == true and ZoneCargoObject:IsLoaded() == false ) then							
									if ( DestroyedCrateCount < USACEM818RequiredCrates ) then
										--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone And Will Be Consumed", 15)
										StaticObject.getByName(Crate.Name):destroy()
										DestroyedCrateCount = DestroyedCrateCount + 1
									end
								end	
							end						
							
							SEF_CARGO_UPDATECRATETABLE()
							
							--////Spawn The M818															
							local ConstructionTeamVec2 = GROUP:FindByName(ConstructionTeamName):GetCoordinate():GetVec2()
							local SpawnX = ConstructionTeamVec2.x + 25
							local SpawnY = ConstructionTeamVec2.y + 25				
							local ConstructionZoneSpawnPointVec2 = { x = SpawnX, y = SpawnY }				
							trigger.action.outTextForGroup(HeloGroupID, "We're Unpacking The Containers Now, Give Us A Minute To Get This Done", 15)					
							timer.scheduleFunction(SEF_USACEM818_SPAWN, ConstructionZoneSpawnPointVec2, timer.getTime() + USACEM818BuildTime)														
						else
							trigger.action.outTextForGroup(HeloGroupID, "We Need More Resources To Construct An M818, We Have "..CrateCount.." Crates And Require "..USACEM818RequiredCrates.." Crates To Build It", 15)
						end		
					else
						trigger.action.outTextForGroup(HeloGroupID, "There Are No USACE Engineering Squads In The Construction Zone", 15)
					end	
				else
					trigger.action.outTextForGroup(HeloGroupID, ConstructionTeamName.." Is Not Currently Active", 15)
				end
			else
				trigger.action.outTextForGroup(HeloGroupID, "Either The Engineering Team Is Dead Or A Construction Zone Is Not Set", 15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, "No Engineering Squads Available To Evaluate", 15)
		end	
	end	
end

function SEF_USACE_UPDATEM818TABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, M818 in pairs(USACEM818Table) do					
		if ( GROUP:FindByName(M818) ) then
			if ( GROUP:FindByName(M818):IsAlive() == true ) then								
				TempTable[TempTableCounter] = M818
				TempTableCounter = TempTableCounter + 1
			end
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACEM818Table = {}
	USACEM818Table = TempTable
	--trigger.action.outText("USACEM818 Table Has "..#USACEM818Table.." Elements", 15)	
end

function SEF_USACE_UPDATEHAWKTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Hawk in pairs(USACEHAWKTable) do					
		if ( GROUP:FindByName(Hawk) ) then
			if ( GROUP:FindByName(Hawk):IsAlive() == true ) then								
				TempTable[TempTableCounter] = Hawk
				TempTableCounter = TempTableCounter + 1
			end
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACEHAWKTable = {}
	USACEHAWKTable = TempTable
	--trigger.action.outText("USACEM818 Table Has "..#USACEHAWKTable.." Elements", 15)	
end

function SEF_USACEHAWK_SPAWN(Vec2Point)	
	USACEHAWK:SpawnFromVec2(Vec2Point)
	trigger.action.outText("The Hawk System You Requisitioned Is Ready Now", 15)
end

function SEF_USACEHAWK_SPAWNPERSISTENT(Vec2Point)	
	USACEHAWK:SpawnFromVec2(Vec2Point)	
end

function SEF_BUILD_HAWK(_Args)

	SEF_USACE_UPDATEHAWKTABLE()
			
	local HeloGroupID 			= _Args[1]
	local HeloGroupName 		= _Args[2]
	local ConstructionTeamName 	= nil
	local ConstructionZone 		= nil
	local TransPlayerUnit 		= UNIT:FindByName(HeloGroupName)
	local TransClientUnitName 	= TransPlayerUnit:GetName()	
	local NearestUSACE 			= SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })	
	
	if ( #USACEHAWKTable >= USACEHawkMaximumSites ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of Hawk Systems Available For Requisition, No More Can Be Constructed At This Time", 15)
	else	
		if ( NearestUSACE ~= nil ) then				
			USACEConstructionCoordVec2 = NearestUSACE:GetCoordinate():GetVec2()
			ConstructionZone = ZONE_RADIUS:New("USACE Construction Zone", USACEConstructionCoordVec2, 150)
			ConstructionTeamName = NearestUSACE:GetObjectName()
		
			if ( ConstructionTeamName ~= nil and ConstructionZone ~= nil ) then
				if ( GROUP:FindByName(ConstructionTeamName) ) then
					if ( GROUP:FindByName(ConstructionTeamName):IsInZone(ConstructionZone) == true ) then
						local CrateCount = SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(ConstructionZone)
						
						if ( CrateCount >= USACEHawkRequiredCrates ) then
							
							--Consume Crates And Spawn The Hawk System
							local DestroyedCrateCount = 0
							for x, Crate in pairs(CargoContainerTable) do
								ZoneCargoObject = CARGO:FindByName(Crate.Name)								
								if ( ZoneCargoObject:IsInZone(ConstructionZone) == true and ZoneCargoObject:IsLoaded() == false ) then							
									if ( DestroyedCrateCount < USACEHawkRequiredCrates ) then
										--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone And Will Be Consumed", 15)
										StaticObject.getByName(Crate.Name):destroy()
										DestroyedCrateCount = DestroyedCrateCount + 1
									end
								end	
							end
							
							SEF_CARGO_UPDATECRATETABLE()
							
							--////Spawn The Hawk System				
							local ConstructionTeamVec2 = GROUP:FindByName(ConstructionTeamName):GetCoordinate():GetVec2()
							local SpawnX = ConstructionTeamVec2.x + 25
							local SpawnY = ConstructionTeamVec2.y + 25				
							local ConstructionZoneSpawnPointVec2 = { x = SpawnX, y = SpawnY }				
							trigger.action.outTextForGroup(HeloGroupID, "We're Unpacking The Containers Now, Give Us A Couple Of Minutes To Get This Done", 15)
							timer.scheduleFunction(SEF_USACEHAWK_SPAWN, ConstructionZoneSpawnPointVec2, timer.getTime() + USACEHawkBuildTime)								
						else
							trigger.action.outTextForGroup(HeloGroupID, "We Need More Resources To Construct A Hawk System, We Have "..CrateCount.." Crates And Require "..USACEHawkRequiredCrates.." Crates To Build It", 15)
						end		
					else
						trigger.action.outTextForGroup(HeloGroupID, "There Are No USACE Engineers In The Construction Zone", 15)
					end	
				else
					trigger.action.outTextForGroup(HeloGroupID, ConstructionTeamName.." Is Not Currently Active", 15)
				end
			else
				trigger.action.outTextForGroup(HeloGroupID, "Either The Engineering Team Is Dead Or A Construction Zone Is Not Set", 15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, "No Engineering Squads Available To Evaluate", 15)
		end	
	end	
end

function SEF_USACE_UPDATEROLANDTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Roland in pairs(USACEROLANDTable) do					
		if ( GROUP:FindByName(Roland) ) then
			if ( GROUP:FindByName(Roland):IsAlive() == true ) then								
				TempTable[TempTableCounter] = Roland
				TempTableCounter = TempTableCounter + 1
			end
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACEROLANDTable = {}
	USACEROLANDTable = TempTable
	--trigger.action.outText("USACEM818 Table Has "..#USACEROLANDTable.." Elements", 15)	
end

function SEF_USACEROLAND_SPAWN(Vec2Point)	
	USACEROLAND:SpawnFromVec2(Vec2Point)
	trigger.action.outText("The Roland ADS System You Requisitioned Is Ready Now", 15)
end

function SEF_USACEROLAND_SPAWNPERSISTENT(Vec2Point)	
	USACEROLAND:SpawnFromVec2(Vec2Point)	
end

function SEF_BUILD_ROLAND(_Args)

	SEF_USACE_UPDATEROLANDTABLE()
			
	local HeloGroupID 			= _Args[1]
	local HeloGroupName 		= _Args[2]
	local ConstructionTeamName 	= nil
	local ConstructionZone 		= nil	
	local TransPlayerUnit 		= UNIT:FindByName(HeloGroupName)
	local TransClientUnitName 	= TransPlayerUnit:GetName()	
	local NearestUSACE 			= SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
	
	if ( #USACEROLANDTable >= USACERolandMaximumUnits ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of Roland ADS Systems Available For Requisition, No More Can Be Constructed At This Time", 15)
	else	
		if ( NearestUSACE ~= nil ) then				
			USACEConstructionCoordVec2 = NearestUSACE:GetCoordinate():GetVec2()
			ConstructionZone = ZONE_RADIUS:New("USACE Construction Zone", USACEConstructionCoordVec2, 150)
			ConstructionTeamName = NearestUSACE:GetObjectName()
		
			if ( ConstructionTeamName ~= nil and ConstructionZone ~= nil ) then
				if ( GROUP:FindByName(ConstructionTeamName) ) then
					if ( GROUP:FindByName(ConstructionTeamName):IsInZone(ConstructionZone) == true ) then
						local CrateCount = SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(ConstructionZone)
						
						if ( CrateCount >= USACERolandRequiredCrates ) then
							
							--Consume Crates And Spawn The Roland ADS System
							local DestroyedCrateCount = 0
							for x, Crate in pairs(CargoContainerTable) do
								ZoneCargoObject = CARGO:FindByName(Crate.Name)								
								if ( ZoneCargoObject:IsInZone(ConstructionZone) == true and ZoneCargoObject:IsLoaded() == false ) then							
									if ( DestroyedCrateCount < USACERolandRequiredCrates ) then
										--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone And Will Be Consumed", 15)
										StaticObject.getByName(Crate.Name):destroy()
										DestroyedCrateCount = DestroyedCrateCount + 1
									end
								end	
							end					
							
							SEF_CARGO_UPDATECRATETABLE()
							
							--////Spawn The Hawk System				
							local ConstructionTeamVec2 = GROUP:FindByName(ConstructionTeamName):GetCoordinate():GetVec2()
							local SpawnX = ConstructionTeamVec2.x + 25
							local SpawnY = ConstructionTeamVec2.y + 25				
							local ConstructionZoneSpawnPointVec2 = { x = SpawnX, y = SpawnY }				
							trigger.action.outTextForGroup(HeloGroupID, "We're Unpacking The Containers Now, Give Us A Couple Of Minutes To Get This Done", 15)
							timer.scheduleFunction(SEF_USACEROLAND_SPAWN, ConstructionZoneSpawnPointVec2, timer.getTime() + USACERolandBuildTime)								
						else
							trigger.action.outTextForGroup(HeloGroupID, "We Need More Resources To Construct A Roland ADS System, We Have "..CrateCount.." Crates And Require "..USACERolandRequiredCrates.." Crates To Build It", 15)
						end		
					else
						trigger.action.outTextForGroup(HeloGroupID, "There Are No USACE Engineers In The Construction Zone", 15)
					end	
				else
					trigger.action.outTextForGroup(HeloGroupID, ConstructionTeamName.." Is Not Currently Active", 15)
				end
			else
				trigger.action.outTextForGroup(HeloGroupID, "Either The Engineering Team Is Dead Or A Construction Zone Is Not Set", 15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, "No Engineering Squads Available To Evaluate", 15)
		end	
	end		
end

function SEF_USACE_UPDATEM1A2ABRAMSTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Abrams in pairs(USACEM1A2ABRAMSTable) do					
		if ( GROUP:FindByName(Abrams) ) then
			if ( GROUP:FindByName(Abrams):IsAlive() == true ) then								
				TempTable[TempTableCounter] = Abrams
				TempTableCounter = TempTableCounter + 1
			end
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACEM1A2ABRAMSTable = {}
	USACEM1A2ABRAMSTable = TempTable
	--trigger.action.outText("USACEM1A2ABRAMS Table Has "..#USACEM1A2ABRAMSTable.." Elements", 15)	
end

function SEF_USACEM1A2ABRAMS_SPAWN(Vec2Point)	
	USACEM1A2ABRAMS:SpawnFromVec2(Vec2Point)
	trigger.action.outText("The M1A2 Abrams Tank You Requisitioned Is Ready Now", 15)
end

function SEF_USACEM1A2ABRAMS_SPAWNPERSISTENT(Vec2Point)	
	USACEM1A2ABRAMS:SpawnFromVec2(Vec2Point)	
end

function SEF_BUILD_M1A2ABRAMS(_Args)

	SEF_USACE_UPDATEM1A2ABRAMSTABLE()
			
	local HeloGroupID 			= _Args[1]
	local HeloGroupName 		= _Args[2]
	local ConstructionTeamName 	= nil
	local ConstructionZone 		= nil
	local TransPlayerUnit 		= UNIT:FindByName(HeloGroupName)
	local TransClientUnitName 	= TransPlayerUnit:GetName()
	local NearestUSACE 			= SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
	
	if ( #USACEM1A2ABRAMSTable >= USACEM1A2AbramsMaximumUnits ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of M1A2 Abrams Tanks Available For Requisition, No More Can Be Constructed At This Time", 15)
	else	
		if ( NearestUSACE ~= nil ) then				
			USACEConstructionCoordVec2 = NearestUSACE:GetCoordinate():GetVec2()
			ConstructionZone = ZONE_RADIUS:New("USACE Construction Zone", USACEConstructionCoordVec2, 150)
			ConstructionTeamName = NearestUSACE:GetObjectName()
			
			if ( ConstructionTeamName ~= nil and ConstructionZone ~= nil ) then
				if ( GROUP:FindByName(ConstructionTeamName) ) then
					if ( GROUP:FindByName(ConstructionTeamName):IsInZone(ConstructionZone) == true ) then
						local CrateCount = SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(ConstructionZone)
						
						if ( CrateCount >= USACEM1A2AbramsRequiredCrates ) then
							
							--Consume Crates And Spawn The Abrams Tank
							local DestroyedCrateCount = 0
							for x, Crate in pairs(CargoContainerTable) do
								ZoneCargoObject = CARGO:FindByName(Crate.Name)								
								if ( ZoneCargoObject:IsInZone(ConstructionZone) == true and ZoneCargoObject:IsLoaded() == false ) then							
									if ( DestroyedCrateCount < USACEM1A2AbramsRequiredCrates ) then
										--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone And Will Be Consumed", 15)
										StaticObject.getByName(Crate.Name):destroy()
										DestroyedCrateCount = DestroyedCrateCount + 1
									end
								end	
							end							
							
							SEF_CARGO_UPDATECRATETABLE()
							
							--////Spawn The Hawk System				
							local ConstructionTeamVec2 = GROUP:FindByName(ConstructionTeamName):GetCoordinate():GetVec2()
							local SpawnX = ConstructionTeamVec2.x + 25
							local SpawnY = ConstructionTeamVec2.y + 25				
							local ConstructionZoneSpawnPointVec2 = { x = SpawnX, y = SpawnY }				
							trigger.action.outTextForGroup(HeloGroupID, "We're Unpacking The Containers Now, Give Us A Couple Of Minutes To Get This Done", 15)
							timer.scheduleFunction(SEF_USACEM1A2ABRAMS_SPAWN, ConstructionZoneSpawnPointVec2, timer.getTime() + USACEM1A2AbramsBuildTime)								
						else
							trigger.action.outTextForGroup(HeloGroupID, "We Need More Resources To Construct An M1A2 Abrams Tank, We Have "..CrateCount.." Crates And Require "..USACEM1A2AbramsRequiredCrates.." Crates To Build It", 15)
						end		
					else
						trigger.action.outTextForGroup(HeloGroupID, "There Are No USACE Engineers In The Construction Zone", 15)
					end	
				else
					trigger.action.outTextForGroup(HeloGroupID, ConstructionTeamName.." Is Not Currently Active", 15)
				end
			else
				trigger.action.outTextForGroup(HeloGroupID, "Either The Engineering Team Is Dead Or A Construction Zone Is Not Set", 15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, "No Engineering Squads Available To Evaluate", 15)
		end	
	end		
end

function SEF_USACE_UPDATEAVENGERTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Avenger in pairs(USACEAVENGERTable) do					
		if ( GROUP:FindByName(Avenger) ) then
			if ( GROUP:FindByName(Avenger):IsAlive() == true ) then								
				TempTable[TempTableCounter] = Avenger
				TempTableCounter = TempTableCounter + 1
			end
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACEAVENGERTable = {}
	USACEAVENGERTable = TempTable
	--trigger.action.outText("USACEAVENGER Table Has "..#USACEAVENGERTable.." Elements", 15)	
end

function SEF_USACEAVENGER_SPAWN(Vec2Point)	
	USACEAVENGER:SpawnFromVec2(Vec2Point)
	trigger.action.outText("The Avenger You Requisitioned Is Ready Now", 15)
end

function SEF_USACEAVENGER_SPAWNPERSISTENT(Vec2Point)	
	USACEAVENGER:SpawnFromVec2(Vec2Point)	
end

function SEF_BUILD_AVENGER(_Args)

	SEF_USACE_UPDATEAVENGERTABLE()
			
	local HeloGroupID 			= _Args[1]
	local HeloGroupName 		= _Args[2]
	local ConstructionTeamName 	= nil
	local ConstructionZone 		= nil
	local TransPlayerUnit 		= UNIT:FindByName(HeloGroupName)
	local TransClientUnitName 	= TransPlayerUnit:GetName()
	local NearestUSACE 			= SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
	
	if ( #USACEAVENGERTable >= USACEAvengerMaximumUnits ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of Avengers Available For Requisition, No More Can Be Constructed At This Time", 15)
	else	
		if ( NearestUSACE ~= nil ) then				
			USACEConstructionCoordVec2 = NearestUSACE:GetCoordinate():GetVec2()
			ConstructionZone = ZONE_RADIUS:New("USACE Construction Zone", USACEConstructionCoordVec2, 150)
			ConstructionTeamName = NearestUSACE:GetObjectName()
			
			if ( ConstructionTeamName ~= nil and ConstructionZone ~= nil ) then
				if ( GROUP:FindByName(ConstructionTeamName) ) then
					if ( GROUP:FindByName(ConstructionTeamName):IsInZone(ConstructionZone) == true ) then
						local CrateCount = SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(ConstructionZone)
						
						if ( CrateCount >= USACEAvengerRequiredCrates ) then
							
							--Consume Crates And Spawn The Avenger
							local DestroyedCrateCount = 0
							for x, Crate in pairs(CargoContainerTable) do
								ZoneCargoObject = CARGO:FindByName(Crate.Name)								
								if ( ZoneCargoObject:IsInZone(ConstructionZone) == true and ZoneCargoObject:IsLoaded() == false ) then							
									if ( DestroyedCrateCount < USACEAvengerRequiredCrates ) then
										--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone And Will Be Consumed", 15)
										StaticObject.getByName(Crate.Name):destroy()
										DestroyedCrateCount = DestroyedCrateCount + 1
									end
								end	
							end							
							
							SEF_CARGO_UPDATECRATETABLE()
							
							--////Spawn The Avenger				
							local ConstructionTeamVec2 = GROUP:FindByName(ConstructionTeamName):GetCoordinate():GetVec2()
							local SpawnX = ConstructionTeamVec2.x + 25
							local SpawnY = ConstructionTeamVec2.y + 25				
							local ConstructionZoneSpawnPointVec2 = { x = SpawnX, y = SpawnY }				
							trigger.action.outTextForGroup(HeloGroupID, "We're Unpacking The Containers Now, Give Us A Couple Of Minutes To Get This Done", 15)
							timer.scheduleFunction(SEF_USACEAVENGER_SPAWN, ConstructionZoneSpawnPointVec2, timer.getTime() + USACEAvengerBuildTime)								
						else
							trigger.action.outTextForGroup(HeloGroupID, "We Need More Resources To Construct An Avenger, We Have "..CrateCount.." Crates And Require "..USACEAvengerRequiredCrates.." Crates To Build It", 15)
						end		
					else
						trigger.action.outTextForGroup(HeloGroupID, "There Are No USACE Engineers In The Construction Zone", 15)
					end	
				else
					trigger.action.outTextForGroup(HeloGroupID, ConstructionTeamName.." Is Not Currently Active", 15)
				end
			else
				trigger.action.outTextForGroup(HeloGroupID, "Either The Engineering Team Is Dead Or A Construction Zone Is Not Set", 15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, "No Engineering Squads Available To Evaluate", 15)
		end	
	end		
end

function SEF_USACE_UPDATEBRADLEYTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Bradley in pairs(USACEBRADLEYTable) do					
		if ( GROUP:FindByName(Bradley) ) then
			if ( GROUP:FindByName(Bradley):IsAlive() == true ) then								
				TempTable[TempTableCounter] = Bradley
				TempTableCounter = TempTableCounter + 1
			end
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACEBRADLEYTable = {}
	USACEBRADLEYTable = TempTable
	--trigger.action.outText("USACEBRADLEY Table Has "..#USACEBRADLEYTable.." Elements", 15)	
end

function SEF_USACEBRADLEY_SPAWN(Vec2Point)	
	USACEBRADLEY:SpawnFromVec2(Vec2Point)
	trigger.action.outText("The Bradley M6 You Requisitioned Is Ready Now", 15)
end

function SEF_USACEBRADLEY_SPAWNPERSISTENT(Vec2Point)	
	USACEBRADLEY:SpawnFromVec2(Vec2Point)	
end

function SEF_BUILD_BRADLEY(_Args)

	SEF_USACE_UPDATEBRADLEYTABLE()
			
	local HeloGroupID 			= _Args[1]
	local HeloGroupName 		= _Args[2]
	local ConstructionTeamName 	= nil
	local ConstructionZone 		= nil
	local TransPlayerUnit 		= UNIT:FindByName(HeloGroupName)
	local TransClientUnitName 	= TransPlayerUnit:GetName()
	local NearestUSACE 			= SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
	
	if ( #USACEBRADLEYTable >= USACEBradleyMaximumUnits ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of Bradley M6's Available For Requisition, No More Can Be Constructed At This Time", 15)
	else	
		if ( NearestUSACE ~= nil ) then				
			USACEConstructionCoordVec2 = NearestUSACE:GetCoordinate():GetVec2()
			ConstructionZone = ZONE_RADIUS:New("USACE Construction Zone", USACEConstructionCoordVec2, 150)
			ConstructionTeamName = NearestUSACE:GetObjectName()
			
			if ( ConstructionTeamName ~= nil and ConstructionZone ~= nil ) then
				if ( GROUP:FindByName(ConstructionTeamName) ) then
					if ( GROUP:FindByName(ConstructionTeamName):IsInZone(ConstructionZone) == true ) then
						local CrateCount = SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(ConstructionZone)
						
						if ( CrateCount >= USACEBradleyRequiredCrates ) then
							
							--Consume Crates And Spawn The Bradley M6
							local DestroyedCrateCount = 0
							for x, Crate in pairs(CargoContainerTable) do
								ZoneCargoObject = CARGO:FindByName(Crate.Name)								
								if ( ZoneCargoObject:IsInZone(ConstructionZone) == true and ZoneCargoObject:IsLoaded() == false ) then							
									if ( DestroyedCrateCount < USACEBradleyRequiredCrates ) then
										--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone And Will Be Consumed", 15)
										StaticObject.getByName(Crate.Name):destroy()
										DestroyedCrateCount = DestroyedCrateCount + 1
									end
								end	
							end							
							
							SEF_CARGO_UPDATECRATETABLE()
							
							--////Spawn The Bradley				
							local ConstructionTeamVec2 = GROUP:FindByName(ConstructionTeamName):GetCoordinate():GetVec2()
							local SpawnX = ConstructionTeamVec2.x + 25
							local SpawnY = ConstructionTeamVec2.y + 25				
							local ConstructionZoneSpawnPointVec2 = { x = SpawnX, y = SpawnY }				
							trigger.action.outTextForGroup(HeloGroupID, "We're Unpacking The Containers Now, Give Us A Couple Of Minutes To Get This Done", 15)
							timer.scheduleFunction(SEF_USACEBRADLEY_SPAWN, ConstructionZoneSpawnPointVec2, timer.getTime() + USACEBradleyBuildTime)								
						else
							trigger.action.outTextForGroup(HeloGroupID, "We Need More Resources To Construct A Bradley M6, We Have "..CrateCount.." Crates And Require "..USACEBradleyRequiredCrates.." Crates To Build It", 15)
						end		
					else
						trigger.action.outTextForGroup(HeloGroupID, "There Are No USACE Engineers In The Construction Zone", 15)
					end	
				else
					trigger.action.outTextForGroup(HeloGroupID, ConstructionTeamName.." Is Not Currently Active", 15)
				end
			else
				trigger.action.outTextForGroup(HeloGroupID, "Either The Engineering Team Is Dead Or A Construction Zone Is Not Set", 15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, "No Engineering Squads Available To Evaluate", 15)
		end	
	end		
end

function SEF_USACE_UPDATENASAMSTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Nasams in pairs(USACENASAMSTable) do					
		if ( GROUP:FindByName(Nasams) ) then
			if ( GROUP:FindByName(Nasams):IsAlive() == true ) then								
				TempTable[TempTableCounter] = Nasams
				TempTableCounter = TempTableCounter + 1
			end
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACENASAMSTable = {}
	USACENASAMSTable = TempTable
	--trigger.action.outText("USACEM818 Table Has "..#USACENASAMSTable.." Elements", 15)	
end

function SEF_USACENASAMS_SPAWN(Vec2Point)	
	USACENASAMS:SpawnFromVec2(Vec2Point)
	trigger.action.outText("The NASAMS System You Requisitioned Is Ready Now", 15)
end

function SEF_USACENASAMS_SPAWNPERSISTENT(Vec2Point)	
	USACENASAMS:SpawnFromVec2(Vec2Point)	
end

function SEF_BUILD_NASAMS(_Args)

	SEF_USACE_UPDATENASAMSTABLE()
			
	local HeloGroupID 			= _Args[1]
	local HeloGroupName 		= _Args[2]
	local ConstructionTeamName 	= nil
	local ConstructionZone 		= nil
	local TransPlayerUnit 		= UNIT:FindByName(HeloGroupName)
	local TransClientUnitName 	= TransPlayerUnit:GetName()	
	local NearestUSACE 			= SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })	
	
	if ( #USACENASAMSTable >= USACENASAMSMaximumSites ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of NASAMS Systems Available For Requisition, No More Can Be Constructed At This Time", 15)
	else	
		if ( NearestUSACE ~= nil ) then				
			USACEConstructionCoordVec2 = NearestUSACE:GetCoordinate():GetVec2()
			ConstructionZone = ZONE_RADIUS:New("USACE Construction Zone", USACEConstructionCoordVec2, 150)
			ConstructionTeamName = NearestUSACE:GetObjectName()
		
			if ( ConstructionTeamName ~= nil and ConstructionZone ~= nil ) then
				if ( GROUP:FindByName(ConstructionTeamName) ) then
					if ( GROUP:FindByName(ConstructionTeamName):IsInZone(ConstructionZone) == true ) then
						local CrateCount = SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(ConstructionZone)
						
						if ( CrateCount >= USACENASAMSRequiredCrates ) then
							
							--Consume Crates And Spawn The NASAMS System
							local DestroyedCrateCount = 0
							for x, Crate in pairs(CargoContainerTable) do
								ZoneCargoObject = CARGO:FindByName(Crate.Name)								
								if ( ZoneCargoObject:IsInZone(ConstructionZone) == true and ZoneCargoObject:IsLoaded() == false ) then							
									if ( DestroyedCrateCount < USACENASAMSRequiredCrates ) then
										--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone And Will Be Consumed", 15)
										StaticObject.getByName(Crate.Name):destroy()
										DestroyedCrateCount = DestroyedCrateCount + 1
									end
								end	
							end
							
							SEF_CARGO_UPDATECRATETABLE()
							
							--////Spawn The Hawk System				
							local ConstructionTeamVec2 = GROUP:FindByName(ConstructionTeamName):GetCoordinate():GetVec2()
							local SpawnX = ConstructionTeamVec2.x + 25
							local SpawnY = ConstructionTeamVec2.y + 25				
							local ConstructionZoneSpawnPointVec2 = { x = SpawnX, y = SpawnY }				
							trigger.action.outTextForGroup(HeloGroupID, "We're Unpacking The Containers Now, Give Us A Couple Of Minutes To Get This Done", 15)
							timer.scheduleFunction(SEF_USACENASAMS_SPAWN, ConstructionZoneSpawnPointVec2, timer.getTime() + USACENASAMSBuildTime)								
						else
							trigger.action.outTextForGroup(HeloGroupID, "We Need More Resources To Construct A NASAMS System, We Have "..CrateCount.." Crates And Require "..USACENASAMSRequiredCrates.." Crates To Build It", 15)
						end		
					else
						trigger.action.outTextForGroup(HeloGroupID, "There Are No USACE Engineers In The Construction Zone", 15)
					end	
				else
					trigger.action.outTextForGroup(HeloGroupID, ConstructionTeamName.." Is Not Currently Active", 15)
				end
			else
				trigger.action.outTextForGroup(HeloGroupID, "Either The Engineering Team Is Dead Or A Construction Zone Is Not Set", 15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, "No Engineering Squads Available To Evaluate", 15)
		end	
	end	
end

function SEF_USACE_UPDATEPALADINTABLE()

	local TempTable = {}
	local TempTableCounter = 1

	for x, Paladin in pairs(USACEPALADINTable) do					
		if ( GROUP:FindByName(Paladin) ) then
			if ( GROUP:FindByName(Paladin):IsAlive() == true ) then								
				TempTable[TempTableCounter] = Paladin
				TempTableCounter = TempTableCounter + 1
			end
		end	
	end
	
	--trigger.action.outText("Temp table has "..#TempTable.." Elements", 15)
	USACEPALADINTable = {}
	USACEPALADINTable = TempTable
	--trigger.action.outText("USACEPALADIN Table Has "..#USACEPALADINTable.." Elements", 15)	
end

function SEF_USACEPALADIN_SPAWN(Vec2Point)	
	USACEPALADIN:SpawnFromVec2(Vec2Point)
	trigger.action.outText("The SPH M109 Paladin You Requisitioned Is Ready Now", 15)
end

function SEF_USACEPALADIN_SPAWNPERSISTENT(Vec2Point)	
	USACEPALADIN:SpawnFromVec2(Vec2Point)	
end

function SEF_BUILD_PALADIN(_Args)

	SEF_USACE_UPDATEPALADINTABLE()
			
	local HeloGroupID 			= _Args[1]
	local HeloGroupName 		= _Args[2]
	local ConstructionTeamName 	= nil
	local ConstructionZone 		= nil
	local TransPlayerUnit 		= UNIT:FindByName(HeloGroupName)
	local TransClientUnitName 	= TransPlayerUnit:GetName()
	local NearestUSACE 			= SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
	
	if ( #USACEPALADINTable >= USACEPaladinMaximumUnits ) then
		trigger.action.outTextForGroup(HeloGroupID, "We Have Reached The Maximum Amount Of SPH M109 Paladin's Available For Requisition, No More Can Be Constructed At This Time", 15)
	else	
		if ( NearestUSACE ~= nil ) then				
			USACEConstructionCoordVec2 = NearestUSACE:GetCoordinate():GetVec2()
			ConstructionZone = ZONE_RADIUS:New("USACE Construction Zone", USACEConstructionCoordVec2, 150)
			ConstructionTeamName = NearestUSACE:GetObjectName()
			
			if ( ConstructionTeamName ~= nil and ConstructionZone ~= nil ) then
				if ( GROUP:FindByName(ConstructionTeamName) ) then
					if ( GROUP:FindByName(ConstructionTeamName):IsInZone(ConstructionZone) == true ) then
						local CrateCount = SEF_CARGO_COUNTCRATESINCONSTRUCTIONZONE(ConstructionZone)
						
						if ( CrateCount >= USACEPaladinRequiredCrates ) then
							
							--Consume Crates And Spawn The SPH M109 Paladin
							local DestroyedCrateCount = 0
							for x, Crate in pairs(CargoContainerTable) do
								ZoneCargoObject = CARGO:FindByName(Crate.Name)								
								if ( ZoneCargoObject:IsInZone(ConstructionZone) == true and ZoneCargoObject:IsLoaded() == false ) then							
									if ( DestroyedCrateCount < USACEPaladinRequiredCrates ) then
										--trigger.action.outText(Crate.Name.." Is Inside The Construction Zone And Will Be Consumed", 15)
										StaticObject.getByName(Crate.Name):destroy()
										DestroyedCrateCount = DestroyedCrateCount + 1
									end
								end	
							end							
							
							SEF_CARGO_UPDATECRATETABLE()
							
							--////Spawn The SPH M109 Paladin				
							local ConstructionTeamVec2 = GROUP:FindByName(ConstructionTeamName):GetCoordinate():GetVec2()
							local SpawnX = ConstructionTeamVec2.x + 25
							local SpawnY = ConstructionTeamVec2.y + 25				
							local ConstructionZoneSpawnPointVec2 = { x = SpawnX, y = SpawnY }				
							trigger.action.outTextForGroup(HeloGroupID, "We're Unpacking The Containers Now, Give Us A Couple Of Minutes To Get This Done", 15)
							timer.scheduleFunction(SEF_USACEPALADIN_SPAWN, ConstructionZoneSpawnPointVec2, timer.getTime() + USACEPaladinBuildTime)								
						else
							trigger.action.outTextForGroup(HeloGroupID, "We Need More Resources To Construct An SPH M109 Paladin, We Have "..CrateCount.." Crates And Require "..USACEPaladinRequiredCrates.." Crates To Build It", 15)
						end		
					else
						trigger.action.outTextForGroup(HeloGroupID, "There Are No USACE Engineers In The Construction Zone", 15)
					end	
				else
					trigger.action.outTextForGroup(HeloGroupID, ConstructionTeamName.." Is Not Currently Active", 15)
				end
			else
				trigger.action.outTextForGroup(HeloGroupID, "Either The Engineering Team Is Dead Or A Construction Zone Is Not Set", 15)
			end
		else
			trigger.action.outTextForGroup(HeloGroupID, "No Engineering Squads Available To Evaluate", 15)
		end	
	end		
end

--END CONSTRUCTION ITEMS
--------------------------------------------------------------------------------------------------------------------------------------------------
--REPAIR/REARM/DISMANTLE

function SEF_REPAIR_GETNEARESTHAWK(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToHawk = nil
	local NearestHawkSite = nil
	
	for x, y in pairs(USACEHAWKTable) do
		local HawkSiteName = y
				
		if ( GROUP:FindByName(HawkSiteName) and GROUP:FindByName(HawkSiteName):IsAlive() == true ) then
		
			--if ( GROUP:FindByName(USACEHAWKTable[i]):GetSize() > 7 ) then
			--local ConstructedGroupVec2 = GROUP:FindByName(USACEHAWKTable[i]):GetCoordinate():GetVec2()
			
			local HawkGroup = GROUP:FindByName(HawkSiteName)
			local HawkCoord = HawkGroup:GetCoordinate()
			local PlayerDistanceToHawkTest = TransPlayerUnitCoord:Get2DDistance(HawkCoord)
		
			if ( PlayerDistanceToHawk == nil ) then
				PlayerDistanceToHawk = PlayerDistanceToHawkTest
				NearestHawkSite = HawkSiteName
			elseif ( PlayerDistanceToHawkTest <= PlayerDistanceToHawk ) then
				PlayerDistanceToHawk = PlayerDistanceToHawkTest
				NearestHawkSite = HawkSiteName
			else
				--Continue looking for nearest Hawk Site
			end
		end	
	end
	
	if NearestHawkSite ~= nil then
		--trigger.action.outTextForGroup(HeloGroupID, "Nearest Hawk Site Is "..NearestHawkSite, 15)
		return NearestHawkSite
	else
		--trigger.action.outTextForGroup(HeloGroupID, "No Hawk Sites To Evaluate", 15)
		return nil
	end	
end

function SEF_REPAIR_GETNEARESTNASAMS(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
	local PlayerDistanceToNasams = nil
	local NearestNasamsSite = nil
	
	for x, y in pairs(USACENASAMSTable) do
		local NasamsSiteName = y
				
		if ( GROUP:FindByName(NasamsSiteName) and GROUP:FindByName(NasamsSiteName):IsAlive() == true ) then
		
			local NasamsGroup = GROUP:FindByName(NasamsSiteName)
			local NasamsCoord = NasamsGroup:GetCoordinate()
			local PlayerDistanceToNasamsTest = TransPlayerUnitCoord:Get2DDistance(NasamsCoord)
		
			if ( PlayerDistanceToNasams == nil ) then
				PlayerDistanceToNasams = PlayerDistanceToNasamsTest
				NearestNasamsSite = NasamsSiteName
			elseif ( PlayerDistanceToNasamsTest <= PlayerDistanceToNasams ) then
				PlayerDistanceToNasams = PlayerDistanceToNasamsTest
				NearestNasamsSite = NasamsSiteName
			else
				--Continue looking for nearest Nasams Site
			end
		end	
	end
	
	if NearestNasamsSite ~= nil then
		--trigger.action.outTextForGroup(HeloGroupID, "Nearest Nasams Site Is "..NearestNasamsSite, 15)
		return NearestNasamsSite
	else
		--trigger.action.outTextForGroup(HeloGroupID, "No Nasams Sites To Evaluate", 15)
		return nil
	end	
end

function SEF_REPAIR_HAWK(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	
	SEF_USACE_UPDATEHAWKTABLE()	
	local NearestHawkSite = SEF_REPAIR_GETNEARESTHAWK({ HeloGroupID, HeloGroupName })
	
	if ( NearestHawkSite ~= nil ) then
		
		SEF_USACE_UPDATEUSACETABLE()
		local NearestUSACE = SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
		
		if ( NearestUSACE ~= nil ) then
			
			--Grab Coords Of Everything
			local HawkGroup = GROUP:FindByName(NearestHawkSite)
			local HawkCoord = HawkGroup:GetCoordinate()
			local HawkCoordVec2 = HawkCoord:GetVec2()
			
			local USACEObject = NearestUSACE
			local USACEObjectName = USACEObject.Name				
			local USACECoord = USACEObject:GetCoordinate()
			
			local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
			
			--Make Sure Hawk And Engineers And Player Are All In Proximity
			
			local DistanceHawkToUSACE = HawkCoord:Get2DDistance(USACECoord)			
			local DistanceHawkToPlayer = HawkCoord:Get2DDistance(TransPlayerUnitCoord) 			
			
			if ( DistanceHawkToPlayer <= 100 ) then 
				if ( DistanceHawkToUSACE <= 100 ) then
						
					--Now Get The Nearest Containter					
					local HawkDistanceToCargo = nil
					local NearestCargoObject = nil
					
					SEF_CARGO_UPDATECRATETABLE()
					
					for x, y in pairs(CargoContainerTable) do
						local CargoObject = y
						
						if ( CargoObject:IsLoaded() == false ) then
						
							local CargoObjectName = CargoObject.Name
							local CrateCoord = CargoObject:GetCoordinate()
							local HawkDistanceToCargoTest = HawkCoord:Get2DDistance(CrateCoord)
						
							if ( HawkDistanceToCargo == nil ) then
								HawkDistanceToCargo = HawkDistanceToCargoTest
								NearestCargoObject = CargoObject
							elseif ( HawkDistanceToCargoTest <= HawkDistanceToCargo ) then
								HawkDistanceToCargo = HawkDistanceToCargoTest
								NearestCargoObject = CargoObject
							else
								--Continue Looking For Nearest Container
							end
						end	
					end
	
					if ( NearestCargoObject ~= nil ) then
											
						--Make Sure Nearest Container Is In Proximity
						local NearestCrateCoord = NearestCargoObject:GetCoordinate()
						local DistanceHawkToNearestCrate = HawkCoord:Get2DDistance(NearestCrateCoord)
						
						if ( DistanceHawkToNearestCrate <= 100 ) then							
							--Delete Cargo Container
							StaticObject.getByName(NearestCargoObject.Name):destroy()
							SEF_CARGO_UPDATECRATETABLE()
							--Delete Hawk
							Group.getByName(NearestHawkSite):destroy()		
							SEF_USACE_UPDATEHAWKTABLE()
							SEF_USACEHAWK_SPAWNPERSISTENT(HawkCoordVec2)

							trigger.action.outTextForGroup(HeloGroupID, "The Hawk System Has Been Repaired", 15)							
						else
							trigger.action.outTextForGroup(HeloGroupID, "To Repair The Site You Need A Cargo Container Within 100m Of The Hawk System", 15)
						end						
					else
						trigger.action.outTextForGroup(HeloGroupID, "To Repair The Site You Need A Cargo Container Within 100m Of The Hawk System", 15)						
					end				
				else
					trigger.action.outTextForGroup(HeloGroupID, "The USACE Engineers Are To Far Away From The Hawk System. Distance Must Be 100m Or Less", 15)
				end				
			else				
				trigger.action.outTextForGroup(HeloGroupID, "You Are To Far Away From A Hawk System. Distance Must Be 100m Or Less", 15)
			end		
		end		
	else
		trigger.action.outTextForGroup(HeloGroupID, "There Are No Hawk Sites Built To Evaluate For Repairs", 15)
	end
end

function SEF_DISMANTLE_HAWK(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	
	SEF_USACE_UPDATEHAWKTABLE()	
	local NearestHawkSite = SEF_REPAIR_GETNEARESTHAWK({ HeloGroupID, HeloGroupName })
	
	if ( NearestHawkSite ~= nil ) then
		
		SEF_USACE_UPDATEUSACETABLE()
		local NearestUSACE = SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
		
		if ( NearestUSACE ~= nil ) then
			
			--Grab Coords Of Everything
			local HawkGroup = GROUP:FindByName(NearestHawkSite)
			local HawkCoord = HawkGroup:GetCoordinate()
			local HawkCoordVec2 = HawkCoord:GetVec2()
			
			local USACEObject = NearestUSACE
			local USACEObjectName = USACEObject.Name				
			local USACECoord = USACEObject:GetCoordinate()
			
			local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
			
			--Make Sure Hawk And Engineers And Player Are All In Proximity
			
			local DistanceHawkToUSACE = HawkCoord:Get2DDistance(USACECoord)			
			local DistanceHawkToPlayer = HawkCoord:Get2DDistance(TransPlayerUnitCoord) 			
			
			if ( DistanceHawkToPlayer <= 100 ) then  
				if ( DistanceHawkToUSACE <= 100 ) then				
					--Delete Hawk
					Group.getByName(NearestHawkSite):destroy()
					trigger.action.outTextForGroup(HeloGroupID, "The Hawk System Has Been Dismantled", 15)								
				else
					trigger.action.outTextForGroup(HeloGroupID, "The USACE Engineers Are To Far Away From The Hawk System. Distance Must Be 100m Or Less", 15)
				end				
			else				
				trigger.action.outTextForGroup(HeloGroupID, "You Are To Far Away From A Hawk System. Distance Must Be 100m Or Less", 15)
			end		
		end		
	else
		trigger.action.outTextForGroup(HeloGroupID, "There Are No Hawk Sites Built To Evaluate For Dismantling", 15)
	end
end

function SEF_REPAIR_NASAMS(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	
	SEF_USACE_UPDATENASAMSTABLE()	
	local NearestNasamsSite = SEF_REPAIR_GETNEARESTNASAMS({ HeloGroupID, HeloGroupName })
	
	if ( NearestNasamsSite ~= nil ) then
		
		SEF_USACE_UPDATEUSACETABLE()
		local NearestUSACE = SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
		
		if ( NearestUSACE ~= nil ) then
			
			--Grab Coords Of Everything
			local NasamsGroup = GROUP:FindByName(NearestNasamsSite)
			local NasamsCoord = NasamsGroup:GetCoordinate()
			local NasamsCoordVec2 = NasamsCoord:GetVec2()
			
			local USACEObject = NearestUSACE
			local USACEObjectName = USACEObject.Name				
			local USACECoord = USACEObject:GetCoordinate()
			
			local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
			
			--Make Sure NASAMS And Engineers And Player Are All In Proximity
			
			local DistanceNasamsToUSACE = NasamsCoord:Get2DDistance(USACECoord)			
			local DistanceNasamsToPlayer = NasamsCoord:Get2DDistance(TransPlayerUnitCoord) 			
			
			if ( DistanceNasamsToPlayer <= 100 ) then 
				if ( DistanceNasamsToUSACE <= 100 ) then
						
					--Now Get The Nearest Containter					
					local NasamsDistanceToCargo = nil
					local NearestCargoObject = nil
					
					SEF_CARGO_UPDATECRATETABLE()
					
					for x, y in pairs(CargoContainerTable) do
						local CargoObject = y
						
						if ( CargoObject:IsLoaded() == false ) then
						
							local CargoObjectName = CargoObject.Name
							local CrateCoord = CargoObject:GetCoordinate()
							local NasamsDistanceToCargoTest = NasamsCoord:Get2DDistance(CrateCoord)
						
							if ( NasamsDistanceToCargo == nil ) then
								NasamsDistanceToCargo = NasamsDistanceToCargoTest
								NearestCargoObject = CargoObject
							elseif ( NasamsDistanceToCargoTest <= NasamsDistanceToCargo ) then
								NasamsDistanceToCargo = NasamsDistanceToCargoTest
								NearestCargoObject = CargoObject
							else
								--Continue Looking For Nearest Container
							end
						end	
					end
	
					if ( NearestCargoObject ~= nil ) then
											
						--Make Sure Nearest Container Is In Proximity
						local NearestCrateCoord = NearestCargoObject:GetCoordinate()
						local DistanceNasamsToNearestCrate = NasamsCoord:Get2DDistance(NearestCrateCoord)
						
						if ( DistanceNasamsToNearestCrate <= 100 ) then							
							--Delete Cargo Container
							StaticObject.getByName(NearestCargoObject.Name):destroy()
							SEF_CARGO_UPDATECRATETABLE()
							--Delete NASAMS
							Group.getByName(NearestNasamsSite):destroy()		
							SEF_USACE_UPDATENASAMSTABLE()
							SEF_USACENASAMS_SPAWNPERSISTENT(NasamsCoordVec2)

							trigger.action.outTextForGroup(HeloGroupID, "The NASAMS System Has Been Repaired", 15)							
						else
							trigger.action.outTextForGroup(HeloGroupID, "To Repair The Site You Need A Cargo Container Within 100m Of The NASAMS System", 15)
						end						
					else
						trigger.action.outTextForGroup(HeloGroupID, "To Repair The Site You Need A Cargo Container Within 100m Of The NASAMS System", 15)						
					end				
				else
					trigger.action.outTextForGroup(HeloGroupID, "The USACE Engineers Are To Far Away From The NASAMS System. Distance Must Be 100m Or Less", 15)
				end				
			else				
				trigger.action.outTextForGroup(HeloGroupID, "You Are To Far Away From A NASAMS System. Distance Must Be 100m Or Less", 15)
			end		
		end		
	else
		trigger.action.outTextForGroup(HeloGroupID, "There Are No NASAMS Sites Built To Evaluate For Repairs", 15)
	end
end

function SEF_DISMANTLE_NASAMS(_Args)
	
	local HeloGroupID 	= _Args[1]
	local HeloGroupName = _Args[2]		
	local TransPlayerUnit = UNIT:FindByName(HeloGroupName)
	local TransClientUnitName = TransPlayerUnit:GetName()
	
	SEF_USACE_UPDATENASAMSTABLE()	
	local NearestNasamsSite = SEF_REPAIR_GETNEARESTNASAMS({ HeloGroupID, HeloGroupName })
	
	if ( NearestNasamsSite ~= nil ) then
		
		SEF_USACE_UPDATEUSACETABLE()
		local NearestUSACE = SEF_USACE_GETNEARESTUSACE({ HeloGroupID, HeloGroupName })
		
		if ( NearestUSACE ~= nil ) then
			
			--Grab Coords Of Everything
			local NasamsGroup = GROUP:FindByName(NearestNasamsSite)
			local NasamsCoord = NasamsGroup:GetCoordinate()
			local NasamsCoordVec2 = NasamsCoord:GetVec2()
			
			local USACEObject = NearestUSACE
			local USACEObjectName = USACEObject.Name				
			local USACECoord = USACEObject:GetCoordinate()
			
			local TransPlayerUnitCoord = TransPlayerUnit:GetCoordinate()
			
			--Make Sure NASAMS And Engineers And Player Are All In Proximity
			
			local DistanceNasamsToUSACE = NasamsCoord:Get2DDistance(USACECoord)			
			local DistanceNasamsToPlayer = NasamsCoord:Get2DDistance(TransPlayerUnitCoord) 			
			
			if ( DistanceNasamsToPlayer <= 100 ) then  
				if ( DistanceNasamsToUSACE <= 100 ) then				
					--Delete NASAMS
					Group.getByName(NearestNasamsSite):destroy()
					trigger.action.outTextForGroup(HeloGroupID, "The NASAMS System Has Been Dismantled", 15)								
				else
					trigger.action.outTextForGroup(HeloGroupID, "The USACE Engineers Are To Far Away From The NASAMS System. Distance Must Be 100m Or Less", 15)
				end				
			else				
				trigger.action.outTextForGroup(HeloGroupID, "You Are To Far Away From A NASAMS System. Distance Must Be 100m Or Less", 15)
			end		
		end		
	else
		trigger.action.outTextForGroup(HeloGroupID, "There Are No NASAMS Sites Built To Evaluate For Dismantling", 15)
	end
end

--END REPAIR/REARM/DISMANTLE
--------------------------------------------------------------------------------------------------------------------------------------------------
--////MENU

function SEF_SetupHeloMenu(HeloGroupID, HeloGroupName)
	
	--trigger.action.outText("Helo Menu Setup For Group ID "..HeloGroupID.." Group Name "..HeloGroupName, 15)
	
	--First Clear The Menu So It Doesn't Duplicate If They Respawned
	missionCommands.removeItemForGroup(HeloGroupID, {[1] = "Helo Operations"})
	
	local HeloMenuMain  	= missionCommands.addSubMenuForGroup(HeloGroupID, "Helo Operations", nil)
	local HeloMenuINFANTRY 	= missionCommands.addSubMenuForGroup(HeloGroupID, "Rifle Infantry Squads", HeloMenuMain)	
	local HeloMenuSTINGER 	= missionCommands.addSubMenuForGroup(HeloGroupID, "Anti-Air Infantry Squads", HeloMenuMain)	
	local HeloMenuUSACE 	= missionCommands.addSubMenuForGroup(HeloGroupID, "USACE Engineering Squad", HeloMenuMain)	
	local HeloMenuCargo 	= missionCommands.addSubMenuForGroup(HeloGroupID, "Cargo Containers", HeloMenuMain)	
	local HeloMenuConstruct = missionCommands.addSubMenuForGroup(HeloGroupID, "Construction Options", HeloMenuMain)
	local HeloMenuRepair	= missionCommands.addSubMenuForGroup(HeloGroupID, "Repair/Dismantle Options", HeloMenuMain)
	
	--INFANTRY
	missionCommands.addCommandForGroup(HeloGroupID, "Request Infantry Squad", HeloMenuINFANTRY, SEF_INFANTRY_SPAWN, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Load Infantry Squad", HeloMenuINFANTRY, SEF_INFANTRY_LOAD, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Unload Infantry Squad", HeloMenuINFANTRY, SEF_INFANTRY_UNLOAD, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Smoke Infantry Loading Zones", HeloMenuINFANTRY, SEF_INFANTRY_SmokeLoadingZones, nil)	
	missionCommands.addCommandForGroup(HeloGroupID, "Smoke Infantry Squad Extraction Zones", HeloMenuINFANTRY, SEF_INFANTRY_SmokeExtractionZones, nil)
	
	--STINGER
	missionCommands.addCommandForGroup(HeloGroupID, "Request Anti-Air Squad", HeloMenuSTINGER, SEF_STINGER_SPAWN, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Load Anti-Air Squad", HeloMenuSTINGER, SEF_STINGER_LOAD, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Unload Anti-Air Squad", HeloMenuSTINGER, SEF_STINGER_UNLOAD, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Smoke Infantry Loading Zones", HeloMenuSTINGER, SEF_INFANTRY_SmokeLoadingZones, nil)	
	missionCommands.addCommandForGroup(HeloGroupID, "Smoke Anti-Air Squad Extraction Zones", HeloMenuSTINGER, SEF_STINGER_SmokeExtractionZones, nil)
			
	--USACE SQUAD	
	missionCommands.addCommandForGroup(HeloGroupID, "Requst USACE Engineer Squad", HeloMenuUSACE, SEF_USACE_SPAWN, { HeloGroupID, HeloGroupName })				
	missionCommands.addCommandForGroup(HeloGroupID, "Load USACE Engineer Squad", HeloMenuUSACE, SEF_USACE_LOAD, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Unload USACE Engineer Squad", HeloMenuUSACE, SEF_USACE_UNLOAD, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Smoke Infantry Loading Zones", HeloMenuUSACE, SEF_INFANTRY_SmokeLoadingZones, nil)	
	missionCommands.addCommandForGroup(HeloGroupID, "Smoke USACE Engineer Squad Extraction Zones", HeloMenuUSACE, SEF_USACE_SmokeExtractionZones, nil)
	
	--CARGO CONTAINERS
	missionCommands.addCommandForGroup(HeloGroupID, "Requisition Cargo", HeloMenuCargo, SEF_CARGO_SPAWN, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Load Cargo", HeloMenuCargo, SEF_CARGO_LOAD, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Unload Cargo", HeloMenuCargo, SEF_CARGO_UNLOAD, { HeloGroupID, HeloGroupName })	
	missionCommands.addCommandForGroup(HeloGroupID, "Smoke Cargo Loading Zones", HeloMenuCargo, SEF_CARGO_SmokeLoadingZones, nil)

	--CONSTRUCTION
	missionCommands.addCommandForGroup(HeloGroupID, "Construct M818", HeloMenuConstruct, SEF_BUILD_M818, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Construct Hawk System", HeloMenuConstruct, SEF_BUILD_HAWK, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Construct Roland ADS System", HeloMenuConstruct, SEF_BUILD_ROLAND, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Construct M1A2 Abrams Tank", HeloMenuConstruct, SEF_BUILD_M1A2ABRAMS, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Construct Avenger", HeloMenuConstruct, SEF_BUILD_AVENGER, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Construct Bradley M6", HeloMenuConstruct, SEF_BUILD_BRADLEY, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Construct NASAMS System", HeloMenuConstruct, SEF_BUILD_NASAMS, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Construct SPH M109 Paladin", HeloMenuConstruct, SEF_BUILD_PALADIN, { HeloGroupID, HeloGroupName })

	--REPAIR AND DISMANTLE
	missionCommands.addCommandForGroup(HeloGroupID, "Repair Hawk System", HeloMenuRepair, SEF_REPAIR_HAWK, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Repair NASAMS System", HeloMenuRepair, SEF_REPAIR_NASAMS, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Dismantle Hawk System", HeloMenuRepair, SEF_DISMANTLE_HAWK, { HeloGroupID, HeloGroupName })
	missionCommands.addCommandForGroup(HeloGroupID, "Dismantle NASAMS System", HeloMenuRepair, SEF_DISMANTLE_NASAMS, { HeloGroupID, HeloGroupName })	
end

--////END MENU
--------------------------------------------------------------------------------------------------------------------------------------------------
--////SAVE FUNCTIONS

function SEF_SaveConstructedItemsTable(timeloop, time)
	
	SEF_UPDATECONSTRUCTIONTABLE()
	
	ConstructionStr = IntegratedserializeWithCycles("SeaSlugConstructions", SeaSlugConstructions)
	writemission(ConstructionStr, "SeaSlugConstructions.lua")
	--trigger.action.outText("Progress Has Been Saved", 15)	
	return time + SaveScheduleUnits
end

function SEF_SaveConstructedItemsTableNoArgs()
	ConstructionStr = IntegratedserializeWithCycles("SeaSlugConstructions", SeaSlugConstructions)
	writemission(ConstructionStr, "SeaSlugConstructions.lua")	
end

function SEF_UPDATECONSTRUCTIONTABLE()
	
	--Update Tables
	SEF_USACE_UPDATEHAWKTABLE()
	SEF_USACE_UPDATENASAMSTABLE()
	SEF_USACE_UPDATEM818TABLE()
	SEF_USACE_UPDATEROLANDTABLE()
	SEF_USACE_UPDATEM1A2ABRAMSTABLE()
	SEF_USACE_UPDATEAVENGERTABLE()
	SEF_USACE_UPDATEBRADLEYTABLE()
	SEF_USACE_UPDATEPALADINTABLE()
	SEF_INFANTRY_UPDATEINFANTRYTABLE()
	SEF_STINGER_UPDATESTINGERTABLE()
	SEF_USACE_UPDATEUSACETABLE()
	SEF_CARGO_UPDATECRATETABLE()
	
	TableConstructor = 1
	SeaSlugConstructions = {}	

	if #USACEM818Table > 0 then
		for i = 1, #USACEM818Table do
			local ConstructedGroupVec2 = GROUP:FindByName(USACEM818Table[i]):GetCoordinate():GetVec2()
						
			SeaSlugConstructions[TableConstructor] = {}
			SeaSlugConstructions[TableConstructor].Type = "M818"
			SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
			SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
			
			TableConstructor = TableConstructor + 1
		end
	end
		
	if #USACEROLANDTable > 0 then
		for i = 1, #USACEROLANDTable do
			local ConstructedGroupVec2 = GROUP:FindByName(USACEROLANDTable[i]):GetCoordinate():GetVec2()
						
			SeaSlugConstructions[TableConstructor] = {}
			SeaSlugConstructions[TableConstructor].Type = "Roland ADS"
			SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
			SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
			
			TableConstructor = TableConstructor + 1
		end
	end

	if #USACEM1A2ABRAMSTable > 0 then
		for i = 1, #USACEM1A2ABRAMSTable do
			local ConstructedGroupVec2 = GROUP:FindByName(USACEM1A2ABRAMSTable[i]):GetCoordinate():GetVec2()
						
			SeaSlugConstructions[TableConstructor] = {}
			SeaSlugConstructions[TableConstructor].Type = "M1A2 Abrams"
			SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
			SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
			
			TableConstructor = TableConstructor + 1
		end
	end
	
	if #USACEAVENGERTable > 0 then
		for i = 1, #USACEAVENGERTable do
			local ConstructedGroupVec2 = GROUP:FindByName(USACEAVENGERTable[i]):GetCoordinate():GetVec2()
						
			SeaSlugConstructions[TableConstructor] = {}
			SeaSlugConstructions[TableConstructor].Type = "Avenger"
			SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
			SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
			
			TableConstructor = TableConstructor + 1
		end
	end
	
	if #USACEBRADLEYTable > 0 then
		for i = 1, #USACEBRADLEYTable do
			local ConstructedGroupVec2 = GROUP:FindByName(USACEBRADLEYTable[i]):GetCoordinate():GetVec2()
						
			SeaSlugConstructions[TableConstructor] = {}
			SeaSlugConstructions[TableConstructor].Type = "Bradley"
			SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
			SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
			
			TableConstructor = TableConstructor + 1
		end
	end
	
	if #USACEPALADINTable > 0 then
		for i = 1, #USACEPALADINTable do
			local ConstructedGroupVec2 = GROUP:FindByName(USACEPALADINTable[i]):GetCoordinate():GetVec2()
						
			SeaSlugConstructions[TableConstructor] = {}
			SeaSlugConstructions[TableConstructor].Type = "Paladin"
			SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
			SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
			
			TableConstructor = TableConstructor + 1
		end
	end
	
	if #USACEHAWKTable > 0 then
		for i = 1, #USACEHAWKTable do
						
			local ConstructedGroupVec2 = GROUP:FindByName(USACEHAWKTable[i]):GetCoordinate():GetVec2()
						
			SeaSlugConstructions[TableConstructor] = {}
			SeaSlugConstructions[TableConstructor].Type = "Hawk"
			SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
			SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
			
			TableConstructor = TableConstructor + 1				
		end
	end
	
	if #USACENASAMSTable > 0 then
		for i = 1, #USACENASAMSTable do
						
			local ConstructedGroupVec2 = GROUP:FindByName(USACENASAMSTable[i]):GetCoordinate():GetVec2()
						
			SeaSlugConstructions[TableConstructor] = {}
			SeaSlugConstructions[TableConstructor].Type = "NASAMS"
			SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
			SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
			
			TableConstructor = TableConstructor + 1				
		end
	end
	
	if #InfantryTable > 0 then
		for i = 1, #InfantryTable do		
			
			local SquadObject = InfantryTable[i]
			
			if ( SquadObject ~= nil and SquadObject:IsAlive() == true and SquadObject:IsLoaded() == false and GROUP:FindByName(SquadObject:GetObjectName()):GetCoordinate():GetVec2() ~= nil ) then
			
			
				local SquadName = SquadObject:GetObjectName()			
				local ConstructedGroupVec2 = GROUP:FindByName(SquadName):GetCoordinate():GetVec2()
							
				SeaSlugConstructions[TableConstructor] = {}
				SeaSlugConstructions[TableConstructor].Type = "Rifle Infantry"
				SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
				SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
				
				TableConstructor = TableConstructor + 1
			end	
		end
	end
	
	if #StingerTable > 0 then
		for i = 1, #StingerTable do		
			
			local SquadObject = StingerTable[i]
			
			if ( SquadObject ~= nil and SquadObject:IsAlive() == true and SquadObject:IsLoaded() == false and GROUP:FindByName(SquadObject:GetObjectName()):GetCoordinate():GetVec2() ~= nil ) then
			
			
				local SquadName = SquadObject:GetObjectName()			
				local ConstructedGroupVec2 = GROUP:FindByName(SquadName):GetCoordinate():GetVec2()
							
				SeaSlugConstructions[TableConstructor] = {}
				SeaSlugConstructions[TableConstructor].Type = "Anti Air Infantry"
				SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
				SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
				
				TableConstructor = TableConstructor + 1
			end	
		end
	end
	
	if #USACETable > 0 then
		for i = 1, #USACETable do		
			
			local SquadObject = USACETable[i]
			
			if ( SquadObject ~= nil and SquadObject:IsAlive() == true and SquadObject:IsLoaded() == false and GROUP:FindByName(SquadObject:GetObjectName()):GetCoordinate():GetVec2() ~= nil ) then
			
				local SquadName = SquadObject:GetObjectName()			
				local ConstructedGroupVec2 = GROUP:FindByName(SquadName):GetCoordinate():GetVec2()
							
				SeaSlugConstructions[TableConstructor] = {}
				SeaSlugConstructions[TableConstructor].Type = "USACE Engineers"
				SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
				SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
				
				TableConstructor = TableConstructor + 1
			end	
		end
	end

	if #CargoContainerTable > 0 then
		for i = 1, #CargoContainerTable do		
			
			local ContainerObject = CargoContainerTable[i]
			local CargoObject = CARGO:FindByName(ContainerObject.Name)
			
			if ( CargoObject ~= nil and CargoObject:IsAlive() == true and CargoObject:IsLoaded() == false and CargoObject:GetCoordinate():GetVec2() ~= nil ) then
			
				local ContainerName = ContainerObject.Name			
				local ConstructedGroupVec2 = CargoObject:GetCoordinate():GetVec2()
							
				SeaSlugConstructions[TableConstructor] = {}
				SeaSlugConstructions[TableConstructor].Type = "Cargo Container"
				SeaSlugConstructions[TableConstructor].Vec2X = ConstructedGroupVec2.x
				SeaSlugConstructions[TableConstructor].Vec2Y = ConstructedGroupVec2.y
				
				TableConstructor = TableConstructor + 1
			end					
		end
	end
end

--////END SAVE FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------------------------------
--////MAIN

--////LOAD CONSTRUCTED ITEMS

if file_exists("SeaSlugConstructions.lua") then	
	
	trigger.action.outText("Requisitioning Previously Constructed Items",15)
	
	dofile("SeaSlugConstructions.lua")
	
	ConstructedItemsTableLength = SEF_GetTableLength(SeaSlugConstructions)	
		
	for i = 1, ConstructedItemsTableLength do				
		local ConstructionType = SeaSlugConstructions[i].Type
		local ConstructionVec2X = SeaSlugConstructions[i].Vec2X
		local ConstructionVec2Y = SeaSlugConstructions[i].Vec2Y
		local ConstructionSpawnPointVec2 = { x = ConstructionVec2X, y = ConstructionVec2Y }
		
		if ( ConstructionType == "Hawk" ) then
			SEF_USACEHAWK_SPAWNPERSISTENT(ConstructionSpawnPointVec2)
		elseif ( ConstructionType == "NASAMS" ) then
			SEF_USACENASAMS_SPAWNPERSISTENT(ConstructionSpawnPointVec2)	
		elseif ( ConstructionType == "M818" ) then
			SEF_USACEM818_SPAWNPERSISTENT(ConstructionSpawnPointVec2)
		elseif ( ConstructionType == "Roland ADS" ) then
			SEF_USACEROLAND_SPAWNPERSISTENT(ConstructionSpawnPointVec2)
		elseif ( ConstructionType == "M1A2 Abrams" ) then
			SEF_USACEM1A2ABRAMS_SPAWNPERSISTENT(ConstructionSpawnPointVec2)
		elseif ( ConstructionType == "Avenger" ) then
			SEF_USACEAVENGER_SPAWNPERSISTENT(ConstructionSpawnPointVec2)
		elseif ( ConstructionType == "Bradley" ) then
			SEF_USACEBRADLEY_SPAWNPERSISTENT(ConstructionSpawnPointVec2)
		elseif ( ConstructionType == "Paladin" ) then
			SEF_USACEPALADIN_SPAWNPERSISTENT(ConstructionSpawnPointVec2)	
		elseif ( ConstructionType == "Rifle Infantry" ) then
			SEF_INFANTRY_SPAWNPERSISTENT(ConstructionSpawnPointVec2)			
		elseif ( ConstructionType == "Anti Air Infantry" ) then
			SEF_STINGER_SPAWNPERSISTENT(ConstructionSpawnPointVec2)	
		elseif ( ConstructionType == "USACE Engineers" ) then
			SEF_USACE_SPAWNPERSISTENT(ConstructionSpawnPointVec2)		
		elseif ( ConstructionType == "Cargo Container" ) then
			SEF_CARGO_SPAWNPERSISTENT(ConstructionSpawnPointVec2)
		else				
		end			
	end			
else			
	SeaSlugConstructions = {}	
	ConstructedItemsTableLength = 0		
end

timer.scheduleFunction(SEF_SaveConstructedItemsTable, 53, timer.getTime() + SaveScheduleUnits)

--////END MAIN
--------------------------------------------------------------------------------------------------------------------------------------------------
--////OBSTETRICS AND GYNAECOLOGY

EventHandlerHeloBirth = {}
function EventHandlerHeloBirth:onEvent(Event)
	
	if ( Event.id == world.event.S_EVENT_BIRTH and Event.initiator:getDesc().category == 1 and Event.initiator:getPlayerName() ~= nil ) then				
		local EventGroupName = Event.initiator:getGroup():getName()
		local EventGroupType = Event.initiator:getTypeName()
		local EventGroupID 	 = Event.initiator:getGroup():getID()
		local EventPlayerName = Event.initiator:getPlayerName()
				
		if ( EventGroupType == "UH-1H" or EventGroupType == "Mi-8MT" or EventGroupType == "SA342L" or EventGroupType == "SA342M" or EventGroupType == "SA342Minigun" or EventGroupType == "SA342Mistral" or EventGroupType == "Ka-50" or EventGroupType == "Mi-24P" or EventGroupType == "AH-64D_BLK_II" ) then			 
			SEF_SetupHeloMenu(EventGroupID, EventGroupName)
		end
	end	  
end
world.addEventHandler(EventHandlerHeloBirth)

--////END OBSTETRICS AND GYNAECOLOGY
--------------------------------------------------------------------------------------------------------------------------------------------------
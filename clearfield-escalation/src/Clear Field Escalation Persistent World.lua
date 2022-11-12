--///////////////////////////////////////////////////////////////////////////////////
-- Name: Operation Clear Field Escalation - Persistence Module
-- Author: Surrexen via Pikey's Simple Group Saving Script  ༼ つ ◕_◕ ༽つ    (づ｡◕‿◕｡)づ 
--///////////////////////////////////////////////////////////////////////////////////

----------------------------------------------------------
SaveScheduleUnits = 300 --Seconds between each table write
----------------------------------------------------------
  
function IntegratedbasicSerialize(s)
    if s == nil then
		return "\"\""
    else
		if ((type(s) == 'number') or (type(s) == 'boolean') or (type(s) == 'function') or (type(s) == 'table') or (type(s) == 'userdata') ) then
			return tostring(s)
		elseif type(s) == 'string' then
			return string.format('%q', s)
		end
    end
end
  
-- imported slmod.serializeWithCycles (Speed)
function IntegratedserializeWithCycles(name, value, saved)
    local basicSerialize = function (o)
		if type(o) == "number" then
			return tostring(o)
		elseif type(o) == "boolean" then
			return tostring(o)
		else -- assume it is a string
			return IntegratedbasicSerialize(o)
		end
	end

    local t_str = {}
    saved = saved or {}       -- initial value
    if ((type(value) == 'string') or (type(value) == 'number') or (type(value) == 'table') or (type(value) == 'boolean')) then
		table.insert(t_str, name .. " = ")
			if type(value) == "number" or type(value) == "string" or type(value) == "boolean" then
				table.insert(t_str, basicSerialize(value) ..  "\n")
			else
				if saved[value] then    -- value already saved?
					table.insert(t_str, saved[value] .. "\n")
				else
					saved[value] = name   -- save name for next time
					table.insert(t_str, "{}\n")
						for k,v in pairs(value) do      -- save its fields
							local fieldname = string.format("%s[%s]", name, basicSerialize(k))
							table.insert(t_str, IntegratedserializeWithCycles(fieldname, v, saved))
						end
				end
			end
		return table.concat(t_str)
    else
		return ""
    end
end

function file_exists(name) --check if the file already exists for writing
	if lfs.attributes(name) then
    return true
    else
    return false end 
end

function writemission(data, file)--Function for saving to file (commonly found)
	File = io.open(file, "w")
	File:write(data)
	File:close()
end

function SEF_GetTableLength(Table)
	local TableLengthCount = 0
	for _ in pairs(Table) do TableLengthCount = TableLengthCount + 1 end
	return TableLengthCount
end

--////SAVE FUNCTION FOR UNITS
function SEF_SaveUnitIntermentTable(timeloop, time)
	IntermentMissionStr = IntegratedserializeWithCycles("ClearFieldMkIIUnitInterment", ClearFieldMkIIUnitInterment)
	writemission(IntermentMissionStr, "ClearFieldMkIIUnitInterment.lua")
	--trigger.action.outText("Progress Has Been Saved", 15)	
	return time + SaveScheduleUnits
end

function SEF_SaveUnitIntermentTableNoArgs()
	IntermentMissionStr = IntegratedserializeWithCycles("ClearFieldMkIIUnitInterment", ClearFieldMkIIUnitInterment)
	writemission(IntermentMissionStr, "ClearFieldMkIIUnitInterment.lua")		
end

--////SAVE FUNCTION FOR STATICS
function SEF_SaveStaticIntermentTable(timeloop, time)
	IntermentMissionStrStatic = IntegratedserializeWithCycles("ClearFieldMkIIStaticInterment", ClearFieldMkIIStaticInterment)
	writemission(IntermentMissionStrStatic, "ClearFieldMkIIStaticInterment.lua")
	--trigger.action.outText("Progress Has Been Saved", 15)	
	return time + SaveScheduleUnits
end

function SEF_SaveStaticIntermentTableNoArgs()
	IntermentMissionStrStatic = IntegratedserializeWithCycles("ClearFieldMkIIStaticInterment", ClearFieldMkIIStaticInterment)
	writemission(IntermentMissionStrStatic, "ClearFieldMkIIStaticInterment.lua")	
end

function SEF_SaveAirbasesTable(timeloop, time)
	SEF_PERSISTENTAIRBASES(PersistentAirbases)
	AirbaseStr = IntegratedserializeWithCycles("ClearFieldMkIIAirbases", ClearFieldMkIIAirbases)
	writemission(AirbaseStr, "ClearFieldMkIIAirbases.lua")
	return time + SaveScheduleUnits
end

function SEF_SaveAirbasesTableNoArgs()
	SEF_PERSISTENTAIRBASES(PersistentAirbases)
	AirbaseStr = IntegratedserializeWithCycles("ClearFieldMkIIAirbases", ClearFieldMkIIAirbases)
	writemission(AirbaseStr, "ClearFieldMkIIAirbases.lua")	
end

PersistentAirbases = {

	--AIRBASE.Caucasus.Anapa_Vityazevo,
	AIRBASE.Caucasus.Batumi,
	AIRBASE.Caucasus.Beslan,
	AIRBASE.Caucasus.Gelendzhik,
	AIRBASE.Caucasus.Gudauta,
	--AIRBASE.Caucasus.Kobuleti,
	AIRBASE.Caucasus.Krasnodar_Center,
	AIRBASE.Caucasus.Krasnodar_Pashkovsky,
	AIRBASE.Caucasus.Krymsk,
	--AIRBASE.Caucasus.Kutaisi,
	AIRBASE.Caucasus.Maykop_Khanskaya,
	AIRBASE.Caucasus.Mineralnye_Vody,
	AIRBASE.Caucasus.Mozdok,
	AIRBASE.Caucasus.Nalchik,
	AIRBASE.Caucasus.Novorossiysk,
	--AIRBASE.Caucasus.Senaki_Kolkhi,
	AIRBASE.Caucasus.Sochi_Adler,
	AIRBASE.Caucasus.Soganlug,
	AIRBASE.Caucasus.Sukhumi_Babushara,
	--AIRBASE.Caucasus.Tbilisi_Lochini,
	AIRBASE.Caucasus.Vaziani,
}

REDCAPTURETEAM = SPAWN:New("Russian APC Tigr 233036")
BLUECAPTURETEAM = SPAWN:New("US M1025 HMMWV")

function SEF_PERSISTENTAIRBASES(AirbaseList)
	ClearFieldMkIIAirbases = {}
	
	for i, ab in ipairs(AirbaseList) do
		local AirbaseObject = Airbase.getByName(ab)
		local AirbaseCoalition = AirbaseObject:getCoalition()
		
		TempAirbaseTable = {
			["Airbase"]=ab,
			["Coalition"]=AirbaseCoalition
		}
		table.insert(ClearFieldMkIIAirbases, TempAirbaseTable )			
	end	
end

function SEF_CAPAIRBASE(Airbase, Coalition)
	
	if ( Coalition == 1 ) then
		RedHeloSpawnVec2 = ZONE:FindByName(Airbase.." LZ Red"):GetVec2()
		
		--////CREATE OFFSETS
		local OffsetX = math.random(-40, 40)
		local OffsetY = math.random(-40, 40)		
		local SpawnX = RedHeloSpawnVec2.x + OffsetX
		local SpawnY = RedHeloSpawnVec2.y + OffsetY		 
		local OffsetSpawnVec2 = { x = SpawnX, y = SpawnY }		
		
		REDCAPTURETEAM:SpawnFromVec2(OffsetSpawnVec2)		
	elseif ( Coalition == 2 ) then
		BlueHeloSpawnVec2 = ZONE:FindByName(Airbase.." LZ Blue"):GetVec2()
		
		--////CREATE OFFSETS
		local OffsetX = math.random(-40, 40)
		local OffsetY = math.random(-40, 40)		
		local SpawnX = BlueHeloSpawnVec2.x + OffsetX
		local SpawnY = BlueHeloSpawnVec2.y + OffsetY		 
		local OffsetSpawnVec2 = { x = SpawnX, y = SpawnY }
		
		BLUECAPTURETEAM:SpawnFromVec2(OffsetSpawnVec2)
	else
	end
end

-------------------------------------------------------------------------------------------------------------------------------------
--////MAIN

SEFDeletedUnitCount = 0
SEFDeletedStaticCount = 0

--////LOAD UNITS
if file_exists("ClearFieldMkIIUnitInterment.lua") then	
	
	dofile("ClearFieldMkIIUnitInterment.lua")
	
	UnitIntermentTableLength = SEF_GetTableLength(ClearFieldMkIIUnitInterment)	
	--trigger.action.outText("Unit Table Length Is "..UnitIntermentTableLength, 15)
		
	for i = 1, UnitIntermentTableLength do
		--trigger.action.outText("Unit Interment Element "..i.." Is "..ClearFieldMkIIUnitInterment[i], 15)		
		
		if ( Unit.getByName(ClearFieldMkIIUnitInterment[i]) ~= nil ) then
			Unit.getByName(ClearFieldMkIIUnitInterment[i]):destroy()
			SEFDeletedUnitCount = SEFDeletedUnitCount + 1
		else
			trigger.action.outText("Unit Interment Element "..i.." Is "..ClearFieldMkIIUnitInterment[i].." And Was Not Found", 15)
		end	
	end			
else			
	ClearFieldMkIIUnitInterment = {}	
	UnitIntermentTableLength = 0	
end
--////LOAD STATICS
if file_exists("ClearFieldMkIIStaticInterment.lua") then
	
	dofile("ClearFieldMkIIStaticInterment.lua")
		
	StaticIntermentTableLength = SEF_GetTableLength(ClearFieldMkIIStaticInterment)	
	--trigger.action.outText("Static Table Length Is "..StaticIntermentTableLength, 15)
	
	for i = 1, StaticIntermentTableLength do
		--trigger.action.outText("Static Interment Element "..i.." Is "..ClearFieldMkIIStaticInterment[i], 15)
		
		if ( StaticObject.getByName(ClearFieldMkIIStaticInterment[i]) ~= nil ) then		
			StaticObject.getByName(ClearFieldMkIIStaticInterment[i]):destroy()		
			SEFDeletedStaticCount = SEFDeletedStaticCount + 1
		else
			trigger.action.outText("Static Interment Element "..i.." Is "..ClearFieldMkIIStaticInterment[i].." And Was Not Found", 15)
		end	
	end	
else
	ClearFieldMkIIStaticInterment = {}
	StaticIntermentTableLength = 0	
end

trigger.action.outText("Persistent World Functions Have Removed "..SEFDeletedUnitCount.." Units and "..SEFDeletedStaticCount.." Static Objects", 15)

--////LOAD AIRBASES
if file_exists("ClearFieldMkIIAirbases.lua") then

	dofile("ClearFieldMkIIAirbases.lua")
	
	AirbaseTableLength = SEF_GetTableLength(ClearFieldMkIIAirbases)
	
	for i = 1, AirbaseTableLength do
		BaseName = ClearFieldMkIIAirbases[i].Airbase
		BaseCoalition = ClearFieldMkIIAirbases[i].Coalition
		
		if ( BaseCoalition == 1) then			
			SEF_CAPAIRBASE(BaseName, 1)
		elseif ( BaseCoalition == 2 ) then			
			SEF_CAPAIRBASE(BaseName, 2)
			
			--[[
			--////Deal With Particular Airbase Late Activations
			if ( BaseName == "Whatever" ) then
				--trigger.action.activateGroup(Group.getByName("Whatever"))
			else
			end
			if ( BaseName == "Whatever" ) then
				--trigger.action.activateGroup(Group.getByName("Whatever"))
			else
			end
			if ( BaseName == "Whatever" ) then
				--trigger.action.activateGroup(Group.getByName("Whatever"))
			else
			end
			]]--
			
		else			
		end
	end
else
	ClearFieldMkIIAirbases = {}
	AirbaseTableLength = 0
end

---------------------------------------------------------------------------------------------------------------------------------------------------

--SCHEDULE
--trigger.action.outText("Persistent World Functions Schedulers Are Currently Disabled", 15)
timer.scheduleFunction(SEF_SaveUnitIntermentTable, 53, timer.getTime() + SaveScheduleUnits)
timer.scheduleFunction(SEF_SaveStaticIntermentTable, 53, timer.getTime() + (SaveScheduleUnits + 3))
timer.scheduleFunction(SEF_SaveAirbasesTable, 53, timer.getTime() + (SaveScheduleUnits + 5))

---------------------------------------------------------------------------------------------------------------------------------------------------
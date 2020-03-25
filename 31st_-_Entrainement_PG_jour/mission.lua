-- *****************************************************************************
-- *                         Global Objects creation                           *
-- *****************************************************************************
--
-- Beacons
--
ctld.createRadioBeaconAtZone("oilrigbeaconzone","blue", 1440,"oilRig ADF")
ctld.createRadioBeaconAtZone("tumbFARPBeaconZone","blue", 1440,"Tumb FARP ADF")
--
-- Scheduler Object
--
Scheduler = SCHEDULER:New( nil )
--
-- CommandCenter
--
HQ = STATIC:FindByName( "HQ_Minhad" )
-- CommandCenter = COMMANDCENTER:New( HQ, "Lima" )
--
-- Warehouses
--
hshWarehouse={}
hshWarehouse.Minhad=WAREHOUSE:New(STATIC:FindByName("Warehouse_Minhad"), "Al Minhad Warehouse")
hshWarehouse.Maktoum=WAREHOUSE:New(STATIC:FindByName("Warehouse_Maktoum"), "Al Maktoum Warehouse")
hshWarehouse.KhasabAB=WAREHOUSE:New(STATIC:FindByName("Warehouse_Khasab"), "Khasab AB Warehouse")
hshWarehouse.KhasabHB=WAREHOUSE:New(STATIC:FindByName("Warehouse_KhasabHarbour"), "Khasab Harbour Warehouse")
--
-- Spawns Tankers
--
spawnTexaco = SPAWN:New("texaco")
spawnArco = SPAWN:New("arco")
spawnTotal = SPAWN:New("total")
spawnShell = SPAWN:New("shell")
spawnEscortTexaco = SPAWN:New("escort texaco")
spawnEscortArco = SPAWN:New("escort arco")
spawnEscortTotal = SPAWN:New("escort total")
spawnEscortShell = SPAWN:New("escort shell")
--
-- Civilian aircrafts
--
spawnUPS = SPAWN:New("ups"):InitLimit( 4, 20 )
spawnChina = SPAWN:New("chinasouthern"):InitLimit( 4, 20 )
spawnEasyJet = SPAWN:New("easyjet"):InitLimit( 4, 20 )
spawnSingaporeAirlines = SPAWN:New("singaporeairline"):InitLimit( 4, 20 )
--
-- Spawns Mission triggers
--
spawnB1_1 = SPAWN:New("B1-1")
spawnB1_2 = SPAWN:New("B1-2")
spawncobra = SPAWN:New("cobra1")
spawnMi8Nuke1 = SPAWN:New("mi8-nuke-1")
spawnMi8Nuke2 = SPAWN:New("mi8-nuke-2")
spawnMi8Nuke3 = SPAWN:New("mi8-nuke-3")
spawnMi8Nuke4 = SPAWN:New("mi8-nuke-4")
spawnTruckNuke = SPAWN:New("vehicules-nuke")
spawnAntonovNuke = SPAWN:New("antonov")
spawnEscortAntonovNuke = SPAWN:New("escorte_bombes")
--
-- Sound Objects
--
snd1020HzTone = USERSOUND:New( "1020Hz_DF_tone.wav" )
--
-- Spawns BVR
--
spawnF14_BVR = SPAWN:New("f14-bvr-1"):InitLimit(6,50)
spawnSU27_BVR = SPAWN:New("su27-bvr-1"):InitLimit(6,50)
spawnSU27_ET_BVR = SPAWN:New("su27-bvr-2"):InitLimit(6,50)
spawnMig29_BVR = SPAWN:New("mig29-bvr-1"):InitLimit(6,50)
spawnF16_BVR = SPAWN:New("f16-bvr-1"):InitLimit(6,50)
--
-- Spawns WVR
--
spawnMig28_WVR = SPAWN:New("f5e-wvr-1"):InitLimit(6,50)
spawnM2K_WVR = SPAWN:New("m2000c-wvr-1"):InitLimit(6,50)
spawnSu27_WVR = SPAWN:New("su27-wvr-1"):InitLimit(6,50)
spawnMig29_WVR = SPAWN:New("mig29-wvr-1"):InitLimit(6,50)
spawnSu33_WVR = SPAWN:New("su33-wvr-1"):InitLimit(6,50)
spawnFA18_WVR = SPAWN:New("fa18-wvr-1"):InitLimit(6,50)
spawnF16_WVR = SPAWN:New("f16-wvr-1"):InitLimit(6,50)
-- *****************************************************************************
-- *                           Mission functions                               *
-- *****************************************************************************
--
-- Generic Spawn object functions
--
function ActivateGroup(param)
  local objSpawn = param[1]
  local strSkillLevel = param[2]
  local strFlightName = param[3]
  local intMessageTempo = param[4] or 45
  local strMessage = param[5] or "Groupe %s activé !"
  local blnSilent = param[6] or false
  objSpawn:InitSkill(strSkillLevel):Spawn()
  if not(blnSilent) then
    snd1020HzTone:ToCoalition( coalition.side.BLUE )
    MESSAGE:New(string.format(strMessage, strFlightName),intMessageTempo,"WARNING",false):ToBlue()
  end
end
function fctKillSpawnObjectArray(param)
  local arrGroups = param[1]
  local strMessage = param[2]
  local intMessageTempo = param[3] or 45
  local blnSilent = param[4] or false
  for index, objSpawn in pairs(arrGroups) do
    fctKillSpawnObject({objSpawn})
  end
  if not(blnSilent) then
    MESSAGE:New(string.format(strMessage),intMessageTempo,"WARNING",false):ToBlue()
  end
end
function fctKillSpawnObject(param)
  local objSpawn = param[1]
  local GroupPlane, Index = objSpawn:GetFirstAliveGroup()
  while GroupPlane ~= nil do
    -- Do actions with the GroupPlane object.
    GroupPlane:Destroy(true)
    GroupPlane, Index = objSpawn:GetNextAliveGroup( Index )
  end
end
--
-- Generic Group functions
--
function startUncontrolledAirGroup(AirGroup)
  BASE:E("Start")
  AirGroup:SetCommand({
    id = 'Start', 
    params = {}
  })
end
function StopMove( GroundGroup )
  BASE:E("Stop")
  local Command = GroundGroup:CommandStopRoute( true )
  GroundGroup:SetCommand(Command)
end
function StartMove( GroundGroup )
  BASE:E("Start")
  local Command = GroundGroup:CommandStopRoute( false )
  GroundGroup:SetCommand(Command)
end
--
-- Tankers functions
--
function fctResetTankerAndEscort(param)
  local GroupTanker, Index = param[1]:GetFirstAliveGroup()
  while GroupTanker ~= nil do
    -- Do actions with the GroupTanker object.
    GroupTanker:Destroy(true)
    GroupTanker, Index = (param[1]):GetNextAliveGroup( Index )
  end
  local groupEscort, Index = param[2]:GetFirstAliveGroup()
  while groupEscort ~= nil do
    -- Do actions with the groupEscort object.
    groupEscort:Destroy(true)
    groupEscort, Index = (param[2]):GetNextAliveGroup( Index )
  end
  local groupTanker = param[1]:InitSkill("Excellent"):Spawn()
  local groupEscort = param[2]:InitSkill("Excellent"):Spawn()
  groupEscort:OptionAlarmStateRed()
  groupEscort:OptionROEReturnFire()
  local PointVec3 = POINT_VEC3:New( 1000, 0, 1000 )
  local escortTask = groupEscort:TaskFollow(groupTanker,PointVec3:GetVec3(), 4)
  groupEscort:SetTask( escortTask, 1 )
  groupTanker:GetUnit(1):GetBeacon():AATACAN(param[4], param[5], true)
  MESSAGE:New(string.format("tanker %s recréé et re-intialisé", (GROUP:FindByName(param[3]):GetUnits()[1]):GetCallsign())):ToBlue()
  -- : " .. (GROUP:FindByName("tanker"):GetUnits()[1]):GetCallsign()):ToBlue()
end
--
-- B1_Raid trigger function
--
function ActivateB1(param)
  local arrGroups = param[1]
  for index, groupB1 in ipairs(arrGroups)
  do
    startUncontrolledAirGroup(groupB1)
  end
end
--
-- Cobra_Raid trigger function
--
function ActivateCobra(param)
  startUncontrolledAirGroup(param[1])
end
--
-- NukeConoy trigger function
--
function startNukeConvoy(params)
  local arrGroups = params[1]
--   local arrScheduleIDs = params[2]
--   local objScheduler = params[3]
--   for index, objScheduleID in ipairs(arrScheduleIDs)
--   do
--     objScheduler:Remove(objScheduleID)
--   end
  for index, groupMi8 in ipairs(arrGroups)
  do
    startUncontrolledAirGroup(groupMi8)
  end
end
--
-- BVR functions
--
function ActivateBVR(param)
  local objSpawn = param[1]
  local strFlightName = param[2]
  local strSkillLevel = "Excellent"
  local intMessageTempo = 45
  local strMessage = "Une paire de %s activée dans la zone de training BVR."
  ActivateGroup({objSpawn, strSkillLevel, strFlightName, intMessageTempo, strMessage})
end
--
-- WVR functions
--
function ActivateWVR(param)
  local objSpawn = param[1]
  local strFlightName = param[2]
  local strSkillLevel = "Excellent"
  local intMessageTempo = 45
  local strMessage = "Un %s activé dans la zone de training BFM."
  ActivateGroup({objSpawn, strSkillLevel, strFlightName, intMessageTempo, strMessage})
end
--
-- A2ADispatcher functions
--
function InitCAP(param)
  local objPolygon = param[1]
  local objAirbase = param[2]
  local strSquadronName = param[3]
  local arrPlaneGroups = param[4]
  local intSquadGroupMax = param[5]
  local intGrouping = param[6] or 2
  local intOverhead = param[7] or 1.4
  local intThreshold = param[8] or 0.30
  RedA2ADispatcher:SetSquadron( strSquadronName, objAirbase, arrPlaneGroups, intSquadGroupMax )
  -- RedA2ADispatcher:SetSquadronVisible( strSquadronName )
  RedA2ADispatcher:SetSquadronGrouping( strSquadronName, intGrouping )
  RedA2ADispatcher:SetSquadronOverhead( strSquadronName, intOverhead )
  RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( strSquadronName )
  RedA2ADispatcher:SetSquadronFuelThreshold( strSquadronName, intThreshold )
  RedA2ADispatcher:SetSquadronCap( strSquadronName, objPolygon, 1500, 35000, 300, 600, 450, 1200 )
  RedA2ADispatcher:SetSquadronCapInterval( strSquadronName, 1, 10, 30, 1 )
end
function InitInterceptionFlight(param)
  local objAirbase = param[1]
  local strSquadronName = param[2]
  local arrPlaneGroups = param[3]
  local intSquadGroupMax = param[4]
  local intOverhead = param[5] or 1.4
  local intThreshold = param[6] or 0.30
  RedA2ADispatcher:SetSquadron( strSquadronName, objAirbase, arrPlaneGroups, intSquadGroupMax )
  RedA2ADispatcher:SetSquadronGci( strSquadronName, 800, 1200 )
  RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( strSquadronName )
  RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( strSquadronName )
  RedA2ADispatcher:SetSquadronFuelThreshold( strSquadronName, intThreshold )
  -- RedA2ADispatcher:SetSquadronVisible( strSquadronName )
  RedA2ADispatcher:SetSquadronOverhead( strSquadronName, intOverhead )
end



-- *****************************************************************************
-- *                               Mission init                                *
-- *****************************************************************************
--                     **                     Tankers                         **
--                     *********************************************************
--
-- Texaco --
--
local ObjEspacementTankers = POINT_VEC3:New( 0, 1500, 0 )
groupTexaco = spawnTexaco:InitSkill("Excellent"):Spawn()
groupEscortTexaco = spawnEscortTexaco:InitSkill("Excellent"):Spawn():OptionAlarmStateRed():OptionROEReturnFire()
taskEscortTexaco = groupEscortTexaco:TaskFollow(groupTexaco,ObjEspacementTankers:GetVec3(), 4)
groupEscortTexaco:SetTask( taskEscortTexaco, 1 )
groupTexaco:GetUnit(1):GetBeacon():AATACAN(15, "TXC", true)
--
-- Arco --
--
groupArco = spawnArco:InitSkill("Excellent"):Spawn()
groupEscortArco = spawnEscortArco:InitSkill("Excellent"):Spawn():OptionAlarmStateRed():OptionROEReturnFire()
taskEscortArco = groupEscortArco:TaskFollow(groupArco,ObjEspacementTankers:GetVec3(), 4)
groupEscortArco:SetTask( taskEscortArco, 1 )
groupArco:GetUnit(1):GetBeacon():AATACAN(16, "ARC", true)
--
-- Shell --
--
groupShell = spawnShell:InitSkill("Excellent"):Spawn()
groupEscortShell = spawnEscortShell:InitSkill("Excellent"):Spawn():OptionAlarmStateRed():OptionROEReturnFire()
taskEscortShell = groupEscortShell:TaskFollow(groupShell,ObjEspacementTankers:GetVec3(), 4)
groupEscortShell:SetTask( taskEscortShell, 1 )
groupShell:GetUnit(1):GetBeacon():AATACAN(17, "SHL", true)
--
-- Total --
--
groupTotal = spawnTotal:InitSkill("Excellent"):Spawn()
groupEscortTotal = spawnEscortTotal:InitSkill("Excellent"):Spawn():OptionAlarmStateRed():OptionROEReturnFire()
taskEscortTotal = groupEscortTotal:TaskFollow(groupTotal,ObjEspacementTankers:GetVec3(), 4)
groupEscortTotal:SetTask( taskEscortTotal, 1 )
groupTotal:GetUnit(1):GetBeacon():AATACAN(18, "TOT", true)
-- *****************************************************************************
--                     **                     B1 Raid                         **
--                     *********************************************************
groupB1_1 = spawnB1_1:InitSkill("Excellent"):InitUnControlled():Spawn()
groupB1_2 = spawnB1_2:InitSkill("Excellent"):InitUnControlled():Spawn()
ScheduleIDGroupB1_1 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupB1_1 }, 1800, 20 )
ScheduleIDGroupB1_2 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupB1_2 }, 1810, 20 )
-- *****************************************************************************
--                     **                     Cobra Raid                         **
--                     *********************************************************
groupCobra = spawncobra:InitSkill("Excellent"):InitUnControlled():Spawn()
ScheduleIDGroupCobra = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupCobra }, 7200, 20 )
-- *****************************************************************************
--                     **                     Nukes                           **
--                     *********************************************************
--
-- Mi8 --
--
groupMi8Nuke1 = spawnMi8Nuke1:InitSkill("Excellent"):InitUnControlled():Spawn()
groupMi8Nuke2 = spawnMi8Nuke2:InitSkill("Excellent"):InitUnControlled():Spawn()
groupMi8Nuke3 = spawnMi8Nuke3:InitSkill("Excellent"):InitUnControlled():Spawn()
groupMi8Nuke4 = spawnMi8Nuke4:InitSkill("Excellent"):InitUnControlled():Spawn()
ScheduleIDMi8Nuke1 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupMi8Nuke1 }, 1200, 20 )
ScheduleIDMi8Nuke2 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupMi8Nuke2 }, 1245, 20 )
ScheduleIDMi8Nuke3 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupMi8Nuke3 }, 1290, 20 )
ScheduleIDMi8Nuke4 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupMi8Nuke4 }, 1335, 20 )
--
-- Trucks --
--
groupTruckNuke = spawnTruckNuke:InitSkill("Excellent"):Spawn()
Scheduler:Schedule(nil, StopMove, { groupTruckNuke }, 2, 20 )
--
-- Antonov and escort --
--
groupAntonovNuke = spawnAntonovNuke:InitSkill("Excellent"):InitUnControlled():Spawn()
groupEscortAntonovNuke = spawnEscortAntonovNuke:InitSkill("Excellent"):InitUnControlled():Spawn()
-- *****************************************************************************
--                     **                     Blue Warehouses                 **
--                     *********************************************************
hshWarehouse.Minhad:Start()
hshWarehouse.Maktoum:Start()
hshWarehouse.KhasabAB:Start()
hshWarehouse.KhasabHB:Start()

-- *****************************************************************************
--                     **                     Civilian traffic                **
--                     *********************************************************
local RAT_UPS = RAT:New("ups")
RAT_UPS:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_UPS:SetTakeoff("air")
RAT_UPS:SetDeparture("spawn_RAT_ups")
RAT_UPS:SetFLcruise(36000)
-- RAT_UPS:SetMaxCruiseSpeed(900)
RAT_UPS:SetFLmin(35500) 
RAT_UPS:SetFLmax(36500) 
RAT_UPS:Invisible()
RAT_UPS:SetDestination("Dubai Intl")
RAT_UPS:SetSpawnInterval(300)
RAT_UPS:InitRepeatOnEngineShutDown()
-- RAT_UPS:Spawn(3)
local RAT_China = RAT:New("chinasouthern")
RAT_China:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_China:SetTakeoff("air")
RAT_China:SetDeparture("spawn_RAT_chinasouthern")
RAT_China:SetFLcruise(35000)
-- RAT_China:SetMaxCruiseSpeed(900)
RAT_China:SetFLmin(34500) 
RAT_China:SetFLmax(35500) 
RAT_China:Invisible()
RAT_China:SetDestination("Shiraz International Airport")
RAT_China:SetSpawnInterval(300)
RAT_China:InitRepeatOnEngineShutDown()
-- RAT_China:Spawn(3)
local RAT_EasyJet = RAT:New("easyjet")
RAT_EasyJet:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_EasyJet:SetTakeoff("air")
RAT_EasyJet:SetDeparture("spawn_RAT_easyjet")
RAT_EasyJet:SetFLcruise(34000)
RAT_EasyJet:SetFLmin(33500)
-- RAT_EasyJet:SetMaxCruiseSpeed(900)
RAT_EasyJet:SetFLmax(34500) 
RAT_EasyJet:Invisible()
RAT_EasyJet:SetDestination("Bandar Abbas Intl")
RAT_EasyJet:SetSpawnInterval(300)
RAT_EasyJet:InitRepeatOnEngineShutDown()
-- RAT_EasyJet:Spawn(3)
local RAT_SingaporeAirlines = RAT:New("singaporeairline")
RAT_SingaporeAirlines:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_SingaporeAirlines:SetTakeoff("air")
RAT_SingaporeAirlines:SetDeparture("spawn_RAT_singaporeairline")
RAT_SingaporeAirlines:SetFLcruise(33000)
-- RAT_SingaporeAirlines:SetMaxCruiseSpeed(900)
RAT_SingaporeAirlines:SetFLmin(32500) 
RAT_SingaporeAirlines:SetFLmax(33500) 
RAT_SingaporeAirlines:Invisible()
RAT_SingaporeAirlines:SetDestination("Abu Dhabi International Airport")
RAT_SingaporeAirlines:SetSpawnInterval(300)
RAT_SingaporeAirlines:InitRepeatOnEngineShutDown()
-- RAT_SingaporeAirlines:Spawn(3)

local RatManager=RATMANAGER:New(12)
RatManager:Add(RAT_UPS, 3)
RatManager:Add(RAT_China, 3)
RatManager:Add(RAT_EasyJet, 3)
RatManager:Add(RAT_SingaporeAirlines, 3)
RatManager:SetTspawn(300)
RatManager:Start()
RatManager:Stop(14400)
-- *****************************************************************************
--                     **           Red A2A Dispatcher Init                   **
--                     *********************************************************
--
-- Detection network
--
EWR_Network = SET_GROUP:New()
EWR_Network:FilterPrefixes( { "iranian awacs", "SAM_", "EWR_" } )
EWR_Network:FilterStart()
Detection = DETECTION_AREAS:New( EWR_Network, 30000 )
--
-- Red A2A Dispatcher
--
RedA2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
RedA2ADispatcher:SetEngageRadius( 100000 )
RedA2ADispatcher:SetTacticalDisplay( false )
-- RedA2ADispatcher:SetDefaultLanding( AI_A2A_Dispatcher.Landing.AtEngineShutdown )
RedA2ADispatcher:SetIntercept( 30 )
RedA2ADispatcher:SetGciRadius( 80000 )
-- RedA2ADispatcher:SetDefaultGrouping( 2 )
--                               ***********************************************
--                               ***              CAP flights                ***
--                               ***********************************************
--
-- Kerman CAP
--
CAPZoneKerman = ZONE_POLYGON:NewFromGroupName( "cap_kerman_polygon" )
InitCAP({CAPZoneKerman, AIRBASE.PersianGulf.Kerman_Airport, "KermanCAP", { "f14cap", "jf17cap" }, 8})
--
-- Shiraz CAP
--
CAPZoneShiraz = ZONE_POLYGON:NewFromGroupName( "cap_shiraz_polygon" )
InitCAP({CAPZoneShiraz, AIRBASE.PersianGulf.Shiraz_International_Airport, "ShirazCAP", { "f4cap" }, 14})
--
-- Jiroft CAP
--
CAPZoneJiroft = ZONE_POLYGON:NewFromGroupName( "cap_jiroft_polygon" )
InitCAP({CAPZoneJiroft, AIRBASE.PersianGulf.Kerman_Airport, "JiroftCAP", { "mig29cap", "jf17cap" }, 10})
--
-- Lar CAP
--
CAPZoneLar = ZONE_POLYGON:NewFromGroupName( "cap_lar_polygon" )
InitCAP({CAPZoneLar, AIRBASE.PersianGulf.Lar_Airbase, "LarCAP", { "f4cap" }, 10})
--
-- Bandar E Jask CAP
--
CAPZoneBandarEJask = ZONE_POLYGON:NewFromGroupName( "cap_bandar_e_jask_polygon" )
CAPZoneBandarEJask2 = ZONE_POLYGON:NewFromGroupName( "cap_bandar_e_jask_polygon2" )
InitCAP({CAPZoneBandarEJask, AIRBASE.PersianGulf.Bandar_Abbas_Intl, "BandarEJaskCAP", { "mig21cap" }, 16})
InitCAP({CAPZoneBandarEJask2, AIRBASE.PersianGulf.Kerman_Airport, "BandarEJaskCAP2", { "jf17cap" }, 4})

--                               ***********************************************
--                               ***        Interception flights             ***
--                               ***********************************************
--
-- Bandar Abbas Interception
--
InitInterceptionFlight({AIRBASE.PersianGulf.Bandar_Abbas_Intl, "Intercept_BandarAbbas", { "f4intercept" }, 8, 1.4, 0.30})
--
-- Lar Interception
--
InitInterceptionFlight({AIRBASE.PersianGulf.Lar_Airbase, "Intercept_Lar", { "f14intercept" , "f4intercept", "jf17intercept" }, 10, 1.4, 0.30})
--
-- Kerman Interception
--
InitInterceptionFlight({AIRBASE.PersianGulf.Kerman_Airport, "Intercept_Kerman", { "mig29intercept", "jf17intercept" }, 8, 1.6, 0.30})
--
-- Launch Red A2A Dispatcher
--
RedA2ADispatcher:Start()


-- *****************************************************************************
-- *                               Mission Menus                               *
-- *****************************************************************************
local MenuCoalitionBlue = MENU_COALITION:New( coalition.side.BLUE, "Game Master Blue" )
local MenuCoalitionRed = MENU_COALITION:New( coalition.side.RED, "Game Master Red" )
-- Menus missions
menuRaidB1 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Décollage Raid B1 sur Lavan Island", MenuCoalitionBlue, ActivateB1, {{groupB1_1, groupB1_2}} )
menuRaidCobra = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Décollage Raid Cobra sur Bandar Lenegh et Queshm", MenuCoalitionBlue, ActivateCobra, {groupCobra} )
menuNukeStartBlue = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoyage des Bombes", MenuCoalitionBlue, startNukeConvoy, {{groupMi8Nuke1, groupMi8Nuke2, groupMi8Nuke3, groupMi8Nuke4}} )
-- Menus Red Game Master
menuNukeStart = MENU_COALITION_COMMAND:New( coalition.side.RED, "Convoyage des Bombes vers Kerman", MenuCoalitionRed, startNukeConvoy, {{groupMi8Nuke1, groupMi8Nuke2, groupMi8Nuke3, groupMi8Nuke4}} )
-- Menus tankers
menuResetTexaco = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "reset Texaco", MenuCoalitionBlue , fctResetTankerAndEscort, {spawnTexaco, spawnEscortTexaco, "texaco", 15, "TXC"})
menuResetArco = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "reset Arco", MenuCoalitionBlue , fctResetTankerAndEscort, {spawnArco, spawnEscortArco, "arco", 16, "ARC"})
menuResetShell = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "reset Shell", MenuCoalitionBlue , fctResetTankerAndEscort, {spawnShell, spawnEscortShell, "shell", 17, "SHL"})
menuResetTotal = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "reset Total", MenuCoalitionBlue , fctResetTankerAndEscort, {spawnTotal, spawnEscortTotal, "total", 18, "TOT"})
-- Menus BVR
local MenuBVRBlue = MENU_COALITION:New( coalition.side.BLUE, "BVR Blue" )
menuF14_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F14 Iranien", MenuBVRBlue, ActivateBVR, {spawnF14_BVR, "F14-B"} )
menuSU27_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su27", MenuBVRBlue, ActivateBVR, {spawnSU27_BVR, "Su27"} )
menuSU27_ET_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su27 ET", MenuBVRBlue, ActivateBVR, {spawnSU27_ET_BVR, "Su27-ET"} )
menuMig29_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig29", MenuBVRBlue, ActivateBVR, {spawnMig29_BVR, "Su27-ET"} )
menuF16_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F-16", MenuBVRBlue, ActivateBVR, {spawnF16_BVR, "F16"} )
menuKillAllBVRMigs = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "sweep de la zone BVR", MenuBVRBlue, fctKillSpawnObjectArray, {{spawnF16_BVR, spawnF14_BVR, spawnSU27_BVR, spawnSU27_ET_BVR, spawnMig29_BVR}, "Zone BVR dégagée !! Pas besoin d' appeler 12G..."})
-- Menus WVR
local MenuWVRBlue = MENU_COALITION:New( coalition.side.BLUE, "BFM Blue" )
menuMig28_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig28", MenuWVRBlue, ActivateWVR, {spawnMig28_WVR, "Mig-28"} )
menuM2K_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mirage", MenuWVRBlue, ActivateWVR, {spawnM2K_WVR, "Mirage-2000"} )
menuSu27_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su 27", MenuWVRBlue, ActivateWVR, {spawnSu27_WVR, "Su-27"} )
menuMig29_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig 29", MenuWVRBlue, ActivateWVR, {spawnMig29_WVR, "Mig-29"} )
menuSu33_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su 33", MenuWVRBlue, ActivateWVR, {spawnSu33_WVR, "Su-33"} )
menuFA18_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F/A18", MenuWVRBlue, ActivateWVR, {spawnFA18_WVR, "F/A-18"} )
menuF16_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F 16", MenuWVRBlue, ActivateWVR, {spawnF16_WVR, "F 16"} )
menuKillAllWVRPlanes = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "sweep de la zone BFM", MenuWVRBlue, fctKillSpawnObjectArray, {{spawnF16_WVR, spawnMig28_WVR, spawnM2K_WVR, spawnSu27_WVR, spawnMig29_WVR, spawnSu33_WVR, spawnFA18_WVR}, "Zone BFM dégagée !! Pas besoin d' appeler 12G..."})



-- *****************************************************************************
-- *                         Global Objects creation                           *
-- *****************************************************************************
--
-- Beacons
--
ctld.createRadioBeaconAtZone("oilrigbeaconzone","blue", 1440,"oilRig ADF")
ctld.createRadioBeaconAtZone("tumbFARPBeaconZone","blue", 1440,"Tumb FARP ADF")
--
-- Scheduler Object
--
Scheduler = SCHEDULER:New( nil )
--
-- CommandCenter
--
HQ = STATIC:FindByName( "HQ_Minhad" )
-- CommandCenter = COMMANDCENTER:New( HQ, "Lima" )
--
-- Warehouses
--
hshWarehouse={}
hshWarehouse.Minhad=WAREHOUSE:New(STATIC:FindByName("Warehouse_Minhad"), "Al Minhad Warehouse")
hshWarehouse.Maktoum=WAREHOUSE:New(STATIC:FindByName("Warehouse_Maktoum"), "Al Maktoum Warehouse")
hshWarehouse.KhasabAB=WAREHOUSE:New(STATIC:FindByName("Warehouse_Khasab"), "Khasab AB Warehouse")
hshWarehouse.KhasabHB=WAREHOUSE:New(STATIC:FindByName("Warehouse_KhasabHarbour"), "Khasab Harbour Warehouse")
--
-- Spawns Tankers
--
spawnTexaco = SPAWN:New("texaco")
spawnArco = SPAWN:New("arco")
spawnTotal = SPAWN:New("total")
spawnShell = SPAWN:New("shell")
spawnEscortTexaco = SPAWN:New("escort texaco")
spawnEscortArco = SPAWN:New("escort arco")
spawnEscortTotal = SPAWN:New("escort total")
spawnEscortShell = SPAWN:New("escort shell")
--
-- Civilian aircrafts
--
spawnUPS = SPAWN:New("ups"):InitLimit( 4, 20 )
spawnChina = SPAWN:New("chinasouthern"):InitLimit( 4, 20 )
spawnEasyJet = SPAWN:New("easyjet"):InitLimit( 4, 20 )
spawnSingaporeAirlines = SPAWN:New("singaporeairline"):InitLimit( 4, 20 )
--
-- Spawns Mission triggers
--
spawnB1_1 = SPAWN:New("B1-1")
spawnB1_2 = SPAWN:New("B1-2")
spawncobra = SPAWN:New("cobra1")
spawnMi8Nuke1 = SPAWN:New("mi8-nuke-1")
spawnMi8Nuke2 = SPAWN:New("mi8-nuke-2")
spawnMi8Nuke3 = SPAWN:New("mi8-nuke-3")
spawnMi8Nuke4 = SPAWN:New("mi8-nuke-4")
spawnTruckNuke = SPAWN:New("vehicules-nuke")
spawnAntonovNuke = SPAWN:New("antonov")
spawnEscortAntonovNuke = SPAWN:New("escorte_bombes")
--
-- Sound Objects
--
snd1020HzTone = USERSOUND:New( "1020Hz_DF_tone.wav" )
--
-- Spawns BVR
--
spawnF14_BVR = SPAWN:New("f14-bvr-1"):InitLimit(6,50)
spawnSU27_BVR = SPAWN:New("su27-bvr-1"):InitLimit(6,50)
spawnSU27_ET_BVR = SPAWN:New("su27-bvr-2"):InitLimit(6,50)
spawnMig29_BVR = SPAWN:New("mig29-bvr-1"):InitLimit(6,50)
spawnF16_BVR = SPAWN:New("f16-bvr-1"):InitLimit(6,50)
--
-- Spawns WVR
--
spawnMig28_WVR = SPAWN:New("f5e-wvr-1"):InitLimit(6,50)
spawnM2K_WVR = SPAWN:New("m2000c-wvr-1"):InitLimit(6,50)
spawnSu27_WVR = SPAWN:New("su27-wvr-1"):InitLimit(6,50)
spawnMig29_WVR = SPAWN:New("mig29-wvr-1"):InitLimit(6,50)
spawnSu33_WVR = SPAWN:New("su33-wvr-1"):InitLimit(6,50)
spawnFA18_WVR = SPAWN:New("fa18-wvr-1"):InitLimit(6,50)
spawnF16_WVR = SPAWN:New("f16-wvr-1"):InitLimit(6,50)
-- *****************************************************************************
-- *                           Mission functions                               *
-- *****************************************************************************
--
-- Generic Spawn object functions
--
function ActivateGroup(param)
  local objSpawn = param[1]
  local strSkillLevel = param[2]
  local strFlightName = param[3]
  local intMessageTempo = param[4] or 45
  local strMessage = param[5] or "Groupe %s activé !"
  local blnSilent = param[6] or false
  objSpawn:InitSkill(strSkillLevel):Spawn()
  if not(blnSilent) then
    snd1020HzTone:ToCoalition( coalition.side.BLUE )
    MESSAGE:New(string.format(strMessage, strFlightName),intMessageTempo,"WARNING",false):ToBlue()
  end
end
function fctKillSpawnObjectArray(param)
  local arrGroups = param[1]
  local strMessage = param[2]
  local intMessageTempo = param[3] or 45
  local blnSilent = param[4] or false
  for index, objSpawn in pairs(arrGroups) do
    fctKillSpawnObject({objSpawn})
  end
  if not(blnSilent) then
    MESSAGE:New(string.format(strMessage),intMessageTempo,"WARNING",false):ToBlue()
  end
end
function fctKillSpawnObject(param)
  local objSpawn = param[1]
  local GroupPlane, Index = objSpawn:GetFirstAliveGroup()
  while GroupPlane ~= nil do
    -- Do actions with the GroupPlane object.
    GroupPlane:Destroy(true)
    GroupPlane, Index = objSpawn:GetNextAliveGroup( Index )
  end
end
--
-- Generic Group functions
--
function startUncontrolledAirGroup(AirGroup)
  BASE:E("Start")
  AirGroup:SetCommand({
    id = 'Start', 
    params = {}
  })
end
function StopMove( GroundGroup )
  BASE:E("Stop")
  local Command = GroundGroup:CommandStopRoute( true )
  GroundGroup:SetCommand(Command)
end
function StartMove( GroundGroup )
  BASE:E("Start")
  local Command = GroundGroup:CommandStopRoute( false )
  GroundGroup:SetCommand(Command)
end
--
-- Tankers functions
--
function fctResetTankerAndEscort(param)
  local GroupTanker, Index = param[1]:GetFirstAliveGroup()
  while GroupTanker ~= nil do
    -- Do actions with the GroupTanker object.
    GroupTanker:Destroy(true)
    GroupTanker, Index = (param[1]):GetNextAliveGroup( Index )
  end
  local groupEscort, Index = param[2]:GetFirstAliveGroup()
  while groupEscort ~= nil do
    -- Do actions with the groupEscort object.
    groupEscort:Destroy(true)
    groupEscort, Index = (param[2]):GetNextAliveGroup( Index )
  end
  local groupTanker = param[1]:InitSkill("Excellent"):Spawn()
  local groupEscort = param[2]:InitSkill("Excellent"):Spawn()
  groupEscort:OptionAlarmStateRed()
  groupEscort:OptionROEReturnFire()
  local PointVec3 = POINT_VEC3:New( 1000, 0, 1000 )
  local escortTask = groupEscort:TaskFollow(groupTanker,PointVec3:GetVec3(), 4)
  groupEscort:SetTask( escortTask, 1 )
  groupTanker:GetUnit(1):GetBeacon():AATACAN(param[4], param[5], true)
  MESSAGE:New(string.format("tanker %s recréé et re-intialisé", (GROUP:FindByName(param[3]):GetUnits()[1]):GetCallsign())):ToBlue()
  -- : " .. (GROUP:FindByName("tanker"):GetUnits()[1]):GetCallsign()):ToBlue()
end
--
-- B1_Raid trigger function
--
function ActivateB1(param)
  local arrGroups = param[1]
  for index, groupB1 in ipairs(arrGroups)
  do
    startUncontrolledAirGroup(groupB1)
  end
end
--
-- Cobra_Raid trigger function
--
function ActivateCobra(param)
  startUncontrolledAirGroup(param[1])
end
--
-- NukeConoy trigger function
--
function startNukeConvoy(params)
  local arrGroups = params[1]
--   local arrScheduleIDs = params[2]
--   local objScheduler = params[3]
--   for index, objScheduleID in ipairs(arrScheduleIDs)
--   do
--     objScheduler:Remove(objScheduleID)
--   end
  for index, groupMi8 in ipairs(arrGroups)
  do
    startUncontrolledAirGroup(groupMi8)
  end
end
--
-- BVR functions
--
function ActivateBVR(param)
  local objSpawn = param[1]
  local strFlightName = param[2]
  local strSkillLevel = "Excellent"
  local intMessageTempo = 45
  local strMessage = "Une paire de %s activée dans la zone de training BVR."
  ActivateGroup({objSpawn, strSkillLevel, strFlightName, intMessageTempo, strMessage})
end
--
-- WVR functions
--
function ActivateWVR(param)
  local objSpawn = param[1]
  local strFlightName = param[2]
  local strSkillLevel = "Excellent"
  local intMessageTempo = 45
  local strMessage = "Un %s activé dans la zone de training BFM."
  ActivateGroup({objSpawn, strSkillLevel, strFlightName, intMessageTempo, strMessage})
end
--
-- A2ADispatcher functions
--
function InitCAP(param)
  local objPolygon = param[1]
  local objAirbase = param[2]
  local strSquadronName = param[3]
  local arrPlaneGroups = param[4]
  local intSquadGroupMax = param[5]
  local intGrouping = param[6] or 2
  local intOverhead = param[7] or 1.4
  local intThreshold = param[8] or 0.30
  RedA2ADispatcher:SetSquadron( strSquadronName, objAirbase, arrPlaneGroups, intSquadGroupMax )
  -- RedA2ADispatcher:SetSquadronVisible( strSquadronName )
  RedA2ADispatcher:SetSquadronGrouping( strSquadronName, intGrouping )
  RedA2ADispatcher:SetSquadronOverhead( strSquadronName, intOverhead )
  RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( strSquadronName )
  RedA2ADispatcher:SetSquadronFuelThreshold( strSquadronName, intThreshold )
  RedA2ADispatcher:SetSquadronCap( strSquadronName, objPolygon, 1500, 35000, 300, 600, 450, 1200 )
  RedA2ADispatcher:SetSquadronCapInterval( strSquadronName, 1, 10, 30, 1 )
end
function InitInterceptionFlight(param)
  local objAirbase = param[1]
  local strSquadronName = param[2]
  local arrPlaneGroups = param[3]
  local intSquadGroupMax = param[4]
  local intOverhead = param[5] or 1.4
  local intThreshold = param[6] or 0.30
  RedA2ADispatcher:SetSquadron( strSquadronName, objAirbase, arrPlaneGroups, intSquadGroupMax )
  RedA2ADispatcher:SetSquadronGci( strSquadronName, 800, 1200 )
  RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( strSquadronName )
  RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( strSquadronName )
  RedA2ADispatcher:SetSquadronFuelThreshold( strSquadronName, intThreshold )
  -- RedA2ADispatcher:SetSquadronVisible( strSquadronName )
  RedA2ADispatcher:SetSquadronOverhead( strSquadronName, intOverhead )
end



-- *****************************************************************************
-- *                               Mission init                                *
-- *****************************************************************************
--                     **                     Tankers                         **
--                     *********************************************************
--
-- Texaco --
--
local ObjEspacementTankers = POINT_VEC3:New( 0, 1500, 0 )
groupTexaco = spawnTexaco:InitSkill("Excellent"):Spawn()
groupEscortTexaco = spawnEscortTexaco:InitSkill("Excellent"):Spawn():OptionAlarmStateRed():OptionROEReturnFire()
taskEscortTexaco = groupEscortTexaco:TaskFollow(groupTexaco,ObjEspacementTankers:GetVec3(), 4)
groupEscortTexaco:SetTask( taskEscortTexaco, 1 )
groupTexaco:GetUnit(1):GetBeacon():AATACAN(15, "TXC", true)
--
-- Arco --
--
groupArco = spawnArco:InitSkill("Excellent"):Spawn()
groupEscortArco = spawnEscortArco:InitSkill("Excellent"):Spawn():OptionAlarmStateRed():OptionROEReturnFire()
taskEscortArco = groupEscortArco:TaskFollow(groupArco,ObjEspacementTankers:GetVec3(), 4)
groupEscortArco:SetTask( taskEscortArco, 1 )
groupArco:GetUnit(1):GetBeacon():AATACAN(16, "ARC", true)
--
-- Shell --
--
groupShell = spawnShell:InitSkill("Excellent"):Spawn()
groupEscortShell = spawnEscortShell:InitSkill("Excellent"):Spawn():OptionAlarmStateRed():OptionROEReturnFire()
taskEscortShell = groupEscortShell:TaskFollow(groupShell,ObjEspacementTankers:GetVec3(), 4)
groupEscortShell:SetTask( taskEscortShell, 1 )
groupShell:GetUnit(1):GetBeacon():AATACAN(17, "SHL", true)
--
-- Total --
--
groupTotal = spawnTotal:InitSkill("Excellent"):Spawn()
groupEscortTotal = spawnEscortTotal:InitSkill("Excellent"):Spawn():OptionAlarmStateRed():OptionROEReturnFire()
taskEscortTotal = groupEscortTotal:TaskFollow(groupTotal,ObjEspacementTankers:GetVec3(), 4)
groupEscortTotal:SetTask( taskEscortTotal, 1 )
groupTotal:GetUnit(1):GetBeacon():AATACAN(18, "TOT", true)
-- *****************************************************************************
--                     **                     B1 Raid                         **
--                     *********************************************************
groupB1_1 = spawnB1_1:InitSkill("Excellent"):InitUnControlled():Spawn()
groupB1_2 = spawnB1_2:InitSkill("Excellent"):InitUnControlled():Spawn()
ScheduleIDGroupB1_1 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupB1_1 }, 1800, 20 )
ScheduleIDGroupB1_2 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupB1_2 }, 1810, 20 )
-- *****************************************************************************
--                     **                     Cobra Raid                         **
--                     *********************************************************
groupCobra = spawncobra:InitSkill("Excellent"):InitUnControlled():Spawn()
ScheduleIDGroupCobra = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupCobra }, 7200, 20 )
-- *****************************************************************************
--                     **                     Nukes                           **
--                     *********************************************************
--
-- Mi8 --
--
groupMi8Nuke1 = spawnMi8Nuke1:InitSkill("Excellent"):InitUnControlled():Spawn()
groupMi8Nuke2 = spawnMi8Nuke2:InitSkill("Excellent"):InitUnControlled():Spawn()
groupMi8Nuke3 = spawnMi8Nuke3:InitSkill("Excellent"):InitUnControlled():Spawn()
groupMi8Nuke4 = spawnMi8Nuke4:InitSkill("Excellent"):InitUnControlled():Spawn()
ScheduleIDMi8Nuke1 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupMi8Nuke1 }, 1200, 20 )
ScheduleIDMi8Nuke2 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupMi8Nuke2 }, 1245, 20 )
ScheduleIDMi8Nuke3 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupMi8Nuke3 }, 1290, 20 )
ScheduleIDMi8Nuke4 = Scheduler:Schedule(nil, startUncontrolledAirGroup, { groupMi8Nuke4 }, 1335, 20 )
--
-- Trucks --
--
groupTruckNuke = spawnTruckNuke:InitSkill("Excellent"):Spawn()
Scheduler:Schedule(nil, StopMove, { groupTruckNuke }, 2, 20 )
--
-- Antonov and escort --
--
groupAntonovNuke = spawnAntonovNuke:InitSkill("Excellent"):InitUnControlled():Spawn()
groupEscortAntonovNuke = spawnEscortAntonovNuke:InitSkill("Excellent"):InitUnControlled():Spawn()
-- *****************************************************************************
--                     **                     Blue Warehouses                 **
--                     *********************************************************
hshWarehouse.Minhad:Start()
hshWarehouse.Maktoum:Start()
hshWarehouse.KhasabAB:Start()
hshWarehouse.KhasabHB:Start()

-- *****************************************************************************
--                     **                     Civilian traffic                **
--                     *********************************************************
local RAT_UPS = RAT:New("ups")
RAT_UPS:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_UPS:SetTakeoff("air")
RAT_UPS:SetDeparture("spawn_RAT_ups")
RAT_UPS:SetFLcruise(36000)
-- RAT_UPS:SetMaxCruiseSpeed(900)
RAT_UPS:SetFLmin(35500) 
RAT_UPS:SetFLmax(36500) 
RAT_UPS:Invisible()
RAT_UPS:SetDestination("Dubai Intl")
RAT_UPS:SetSpawnInterval(300)
RAT_UPS:InitRepeatOnEngineShutDown()
-- RAT_UPS:Spawn(3)
local RAT_China = RAT:New("chinasouthern")
RAT_China:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_China:SetTakeoff("air")
RAT_China:SetDeparture("spawn_RAT_chinasouthern")
RAT_China:SetFLcruise(35000)
-- RAT_China:SetMaxCruiseSpeed(900)
RAT_China:SetFLmin(34500) 
RAT_China:SetFLmax(35500) 
RAT_China:Invisible()
RAT_China:SetDestination("Shiraz International Airport")
RAT_China:SetSpawnInterval(300)
RAT_China:InitRepeatOnEngineShutDown()
-- RAT_China:Spawn(3)
local RAT_EasyJet = RAT:New("easyjet")
RAT_EasyJet:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_EasyJet:SetTakeoff("air")
RAT_EasyJet:SetDeparture("spawn_RAT_easyjet")
RAT_EasyJet:SetFLcruise(34000)
RAT_EasyJet:SetFLmin(33500)
-- RAT_EasyJet:SetMaxCruiseSpeed(900)
RAT_EasyJet:SetFLmax(34500) 
RAT_EasyJet:Invisible()
RAT_EasyJet:SetDestination("Bandar Abbas Intl")
RAT_EasyJet:SetSpawnInterval(300)
RAT_EasyJet:InitRepeatOnEngineShutDown()
-- RAT_EasyJet:Spawn(3)
local RAT_SingaporeAirlines = RAT:New("singaporeairline")
RAT_SingaporeAirlines:SetTerminalType(AIRBASE.TerminalType.OpenBig)
RAT_SingaporeAirlines:SetTakeoff("air")
RAT_SingaporeAirlines:SetDeparture("spawn_RAT_singaporeairline")
RAT_SingaporeAirlines:SetFLcruise(33000)
-- RAT_SingaporeAirlines:SetMaxCruiseSpeed(900)
RAT_SingaporeAirlines:SetFLmin(32500) 
RAT_SingaporeAirlines:SetFLmax(33500) 
RAT_SingaporeAirlines:Invisible()
RAT_SingaporeAirlines:SetDestination("Abu Dhabi International Airport")
RAT_SingaporeAirlines:SetSpawnInterval(300)
RAT_SingaporeAirlines:InitRepeatOnEngineShutDown()
-- RAT_SingaporeAirlines:Spawn(3)

local RatManager=RATMANAGER:New(12)
RatManager:Add(RAT_UPS, 3)
RatManager:Add(RAT_China, 3)
RatManager:Add(RAT_EasyJet, 3)
RatManager:Add(RAT_SingaporeAirlines, 3)
RatManager:SetTspawn(300)
RatManager:Start()
RatManager:Stop(14400)
-- *****************************************************************************
--                     **           Red A2A Dispatcher Init                   **
--                     *********************************************************
--
-- Detection network
--
EWR_Network = SET_GROUP:New()
EWR_Network:FilterPrefixes( { "iranian awacs", "SAM_", "EWR_" } )
EWR_Network:FilterStart()
Detection = DETECTION_AREAS:New( EWR_Network, 30000 )
--
-- Red A2A Dispatcher
--
RedA2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
RedA2ADispatcher:SetEngageRadius( 100000 )
RedA2ADispatcher:SetTacticalDisplay( false )
-- RedA2ADispatcher:SetDefaultLanding( AI_A2A_Dispatcher.Landing.AtEngineShutdown )
RedA2ADispatcher:SetIntercept( 30 )
RedA2ADispatcher:SetGciRadius( 80000 )
-- RedA2ADispatcher:SetDefaultGrouping( 2 )
--                               ***********************************************
--                               ***              CAP flights                ***
--                               ***********************************************
--
-- Kerman CAP
--
CAPZoneKerman = ZONE_POLYGON:NewFromGroupName( "cap_kerman_polygon" )
InitCAP({CAPZoneKerman, AIRBASE.PersianGulf.Kerman_Airport, "KermanCAP", { "f14cap", "jf17cap" }, 8})
--
-- Shiraz CAP
--
CAPZoneShiraz = ZONE_POLYGON:NewFromGroupName( "cap_shiraz_polygon" )
InitCAP({CAPZoneShiraz, AIRBASE.PersianGulf.Shiraz_International_Airport, "ShirazCAP", { "f4cap" }, 14})
--
-- Jiroft CAP
--
CAPZoneJiroft = ZONE_POLYGON:NewFromGroupName( "cap_jiroft_polygon" )
InitCAP({CAPZoneJiroft, AIRBASE.PersianGulf.Kerman_Airport, "JiroftCAP", { "mig29cap", "jf17cap" }, 10})
--
-- Lar CAP
--
CAPZoneLar = ZONE_POLYGON:NewFromGroupName( "cap_lar_polygon" )
InitCAP({CAPZoneLar, AIRBASE.PersianGulf.Lar_Airbase, "LarCAP", { "f4cap" }, 10})
--
-- Bandar E Jask CAP
--
CAPZoneBandarEJask = ZONE_POLYGON:NewFromGroupName( "cap_bandar_e_jask_polygon" )
CAPZoneBandarEJask2 = ZONE_POLYGON:NewFromGroupName( "cap_bandar_e_jask_polygon2" )
InitCAP({CAPZoneBandarEJask, AIRBASE.PersianGulf.Bandar_Abbas_Intl, "BandarEJaskCAP", { "mig21cap" }, 16})
InitCAP({CAPZoneBandarEJask2, AIRBASE.PersianGulf.Kerman_Airport, "BandarEJaskCAP2", { "jf17cap" }, 4})

--                               ***********************************************
--                               ***        Interception flights             ***
--                               ***********************************************
--
-- Bandar Abbas Interception
--
InitInterceptionFlight({AIRBASE.PersianGulf.Bandar_Abbas_Intl, "Intercept_BandarAbbas", { "f4intercept" }, 8, 1.4, 0.30})
--
-- Lar Interception
--
InitInterceptionFlight({AIRBASE.PersianGulf.Lar_Airbase, "Intercept_Lar", { "f14intercept" , "f4intercept", "jf17intercept" }, 10, 1.4, 0.30})
--
-- Kerman Interception
--
InitInterceptionFlight({AIRBASE.PersianGulf.Kerman_Airport, "Intercept_Kerman", { "mig29intercept", "jf17intercept" }, 8, 1.6, 0.30})
--
-- Launch Red A2A Dispatcher
--
RedA2ADispatcher:Start()


-- *****************************************************************************
-- *                               Mission Menus                               *
-- *****************************************************************************
local MenuCoalitionBlue = MENU_COALITION:New( coalition.side.BLUE, "Game Master Blue" )
local MenuCoalitionRed = MENU_COALITION:New( coalition.side.RED, "Game Master Red" )
-- Menus missions
menuRaidB1 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Décollage Raid B1 sur Lavan Island", MenuCoalitionBlue, ActivateB1, {{groupB1_1, groupB1_2}} )
menuRaidCobra = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Décollage Raid Cobra sur Bandar Lenegh et Queshm", MenuCoalitionBlue, ActivateCobra, {groupCobra} )
menuNukeStartBlue = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoyage des Bombes", MenuCoalitionBlue, startNukeConvoy, {{groupMi8Nuke1, groupMi8Nuke2, groupMi8Nuke3, groupMi8Nuke4}} )
-- Menus Red Game Master
menuNukeStart = MENU_COALITION_COMMAND:New( coalition.side.RED, "Convoyage des Bombes vers Kerman", MenuCoalitionRed, startNukeConvoy, {{groupMi8Nuke1, groupMi8Nuke2, groupMi8Nuke3, groupMi8Nuke4}} )
-- Menus tankers
menuResetTexaco = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "reset Texaco", MenuCoalitionBlue , fctResetTankerAndEscort, {spawnTexaco, spawnEscortTexaco, "texaco", 15, "TXC"})
menuResetArco = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "reset Arco", MenuCoalitionBlue , fctResetTankerAndEscort, {spawnArco, spawnEscortArco, "arco", 16, "ARC"})
menuResetShell = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "reset Shell", MenuCoalitionBlue , fctResetTankerAndEscort, {spawnShell, spawnEscortShell, "shell", 17, "SHL"})
menuResetTotal = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "reset Total", MenuCoalitionBlue , fctResetTankerAndEscort, {spawnTotal, spawnEscortTotal, "total", 18, "TOT"})
-- Menus BVR
local MenuBVRBlue = MENU_COALITION:New( coalition.side.BLUE, "BVR Blue" )
menuF14_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F14 Iranien", MenuBVRBlue, ActivateBVR, {spawnF14_BVR, "F14-B"} )
menuSU27_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su27", MenuBVRBlue, ActivateBVR, {spawnSU27_BVR, "Su27"} )
menuSU27_ET_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su27 ET", MenuBVRBlue, ActivateBVR, {spawnSU27_ET_BVR, "Su27-ET"} )
menuMig29_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig29", MenuBVRBlue, ActivateBVR, {spawnMig29_BVR, "Su27-ET"} )
menuF16_BVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F-16", MenuBVRBlue, ActivateBVR, {spawnF16_BVR, "F16"} )
menuKillAllBVRMigs = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "sweep de la zone BVR", MenuBVRBlue, fctKillSpawnObjectArray, {{spawnF16_BVR, spawnF14_BVR, spawnSU27_BVR, spawnSU27_ET_BVR, spawnMig29_BVR}, "Zone BVR dégagée !! Pas besoin d' appeler 12G..."})
-- Menus WVR
local MenuWVRBlue = MENU_COALITION:New( coalition.side.BLUE, "BFM Blue" )
menuMig28_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig28", MenuWVRBlue, ActivateWVR, {spawnMig28_WVR, "Mig-28"} )
menuM2K_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mirage", MenuWVRBlue, ActivateWVR, {spawnM2K_WVR, "Mirage-2000"} )
menuSu27_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su 27", MenuWVRBlue, ActivateWVR, {spawnSu27_WVR, "Su-27"} )
menuMig29_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig 29", MenuWVRBlue, ActivateWVR, {spawnMig29_WVR, "Mig-29"} )
menuSu33_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su 33", MenuWVRBlue, ActivateWVR, {spawnSu33_WVR, "Su-33"} )
menuFA18_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F/A18", MenuWVRBlue, ActivateWVR, {spawnFA18_WVR, "F/A-18"} )
menuF16_WVR = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F 16", MenuWVRBlue, ActivateWVR, {spawnF16_WVR, "F 16"} )
menuKillAllWVRPlanes = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "sweep de la zone BFM", MenuWVRBlue, fctKillSpawnObjectArray, {{spawnF16_WVR, spawnMig28_WVR, spawnM2K_WVR, spawnSu27_WVR, spawnMig29_WVR, spawnSu33_WVR, spawnFA18_WVR}, "Zone BFM dégagée !! Pas besoin d' appeler 12G..."})




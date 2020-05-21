env.info("mission initialization...")

blueCommandCenter = COMMANDCENTER:New( GROUP:FindByName( "CIA_HQ" ), "CIA_HQ" )
--blueCommandCenter:TraceOff()


--SEAD Objects
SEAD_RED_SAM_Defenses = SEAD:New( { 'SA6_Sochi', 'SA10_Gelend', 'SA10_Nalchik', 'defenses BESLAN'} )
SEAD_BLUE_SAM_Defenses = SEAD:New( { 'PAtriot_Sukhumi', 'Patriot_Sochi', 'Patriot_Tbilisi', 'Hawk_Senaki'} )





--JTAC Objects
--groupAlouette = GROUP:FindByName("alouette-1")
--groupAlouette:Activate()
--ctld.activatePickupZone("axeman_pickup")
--ctld.loadTransport("alouette-1")
--ctld.activatePickupZone("axeman_pickup")
--ctld.loadTransport("alouette-2")
ctld.deactivatePickupZone("axeman_pickup") -- because UH1 are human
ctld.activatePickupZone("SAM_beslan_pickup_zone")
ctld.loadTransport("chevy-1-1")
ctld.loadTransport("chevy-1-2")
ctld.loadTransport("chevy-1-3")
ctld.loadTransport("chevy-1-4")
ctld.createRadioBeaconAtZone("FARP_campagne","blue",1440,"RP Alouette")
ctld.createRadioBeaconAtZone("deploy_axeman_alpha","blue",1440,"DZ Axeman")

function spawnEscortInZone(escortTemplate, popupZone, escortedGroup, escortFreq, skill, agressive)
    if not(escortedGroup) then
        BASE:E("spawnEscortInZone(): group " + escortedGroup + " not found !!!")
        return nil
    end
    local popupZoneObject = ZONE:New(popupZone)
    if not(popupZoneObject) then
        BASE:E("spawnEscortInZone(): popup zone not found !!!")
        return nil
    end
    local groupEscort = SPAWN:New(escortTemplate)
                             :InitSkill(skill)
                             :OnSpawnGroup(
            function( escortGroup )
                BASE:E(string.format("group escorte : %s", escortGroup:GetName()))
                BASE:E(string.format("is alive ? %s",tostring(escortGroup:IsAlive())))
                escortGroup:PushTask(escortGroup:TaskEscort(escortedGroup, POINT_VEC3:New( 1000, 0, 1000 ), nil , 40, {"Air"}), 0)
            end)
                             :SpawnInZone(popupZoneObject, true)
    return groupEscort
end

---@param escortTemplate string
---@param aibaseName string
---@param escortedGroupName string
---@param escortFreq number
---@param skill string
---@param agressive boolean
---@return GROUP
function spawnEscortAtAirbase(escortTemplate, aibaseName, escortedGroupName, escortFreq, skill, agressive)
    if not(escortedGroupName) then
        BASE:E("spawnEscortInZone(): group " + escortedGroupName + " not found !!!")
        return nil
    end
    local groupEscort = SPAWN
            :New(escortTemplate)
            :InitSkill(skill)
            :OnSpawnGroup(
            function( escortGroup )
                ---@type GROUP
                local curGroup =  escortGroup
                BASE:E(string.format("group escorte : %s", curGroup:GetName()))
                BASE:E(string.format("is alive ? %s",tostring(curGroup:IsAlive())))
                curGroup:PushTask(curGroup:TaskEscort(escortedGroupName, POINT_VEC3:New( 1000, 0, 1000 ), nil , 40, { "Air"}), 0)
            end)
            :SpawnAtAirbase(AIRBASE:FindByName(aibaseName),SPAWN.Takeoff.Cold)
    return groupEscort
end

---@param param table<string, number>
function setUserFlag(param)
    local userflag = USERFLAG:New(param[1])
    userflag:Set(param[2])
end

function ROEDegradation()
    redA2ADispatcherLand:SetBorderZone( {zoneRedRussiaDefense, zoneFleetDefend, zoneExtendedRussiaDefense} )
    local grpSA6Sochi = GROUP:FindByName("SA6_Sochi")
    grpSA6Sochi:OptionAlarmStateRed()
    grpSA6Sochi:OptionROEOpenFire()
    MESSAGE:New("Nous sommes pris pour cible !!! \
Notre agent sur place nous signale qu'il a intercepté il y a 3 minutes un ordre de tir autorisé sur la batterie anti-aérienne au Nord de Sochi. \
Procédez au repérage de la zone avec la plus extrème prudence.",60,"SITAC",true):ToBlue()
end

spawnArco = SPAWN:New("arco")
spawnTexaco = SPAWN:New("texaco")
--spawnRedTanker = SPAWN:New("RedTanker")
spawnRedTankerLand = SPAWN:New("RedTankerLand")

groupArco = spawnArco:Spawn()
groupTexaco = spawnTexaco:Spawn()
--groupRedTanker = GROUP:FindByName("RedTanker")
--groupRedTanker:StartUncontrolled(60)
groupRedTankerLand = GROUP:FindByName("RedTankerLand")
groupRedTankerLand:StartUncontrolled(60)
groupRedAWACS = GROUP:FindByName("RedAwacs")
groupRedAWACS:StartUncontrolled(0)

groupEscortArco = spawnEscortAtAirbase("escort_tomcat",AIRBASE.Caucasus.Kobuleti,groupArco,264.25,"Excellent",false)
groupEscortTexaco = spawnEscortAtAirbase("escort_hornet",AIRBASE.Caucasus.Batumi,groupTexaco,264.00,"Excellent",false)
--groupEscortRedTanker = spawnEscortAtAirbase("escort_29", AIRBASE.Caucasus.Anapa_Vityazevo ,groupRedTanker,251.00,"Excellent",false)
groupEscortRedTankerLand = spawnEscortAtAirbase("escort_29", AIRBASE.Caucasus.Maykop_Khanskaya ,groupRedTankerLand,251.00,"Excellent",false)


--RedA2A Defenses
--zoneRedRussiaDefense = ZONE_POLYGON:New( "Border_Red", GROUP:FindByName( "Border_Red" ) )
zoneRedRussiaDefense = ZONE_POLYGON:New( "Border_Red", GROUP:FindByName( "restricted_borders_red" ) )
zoneFleetDefend = ZONE_POLYGON:New( "CAPFleetZone", GROUP:FindByName( "CAPFleetZone" ) )
zoneExtendedRussiaDefense = ZONE_POLYGON:New( "CAPExtended", GROUP:FindByName( "CAPExtended" ) )


DetectionRedSetGroup = SET_GROUP:New()
DetectionRedSetGroup:FilterPrefixes( { "EWR_RED", "KSN", "RedAwacs" } )
DetectionRedSetGroup:FilterStart()

redDetection = DETECTION_AREAS:New( DetectionRedSetGroup, 20000 )

-- Setup the A2A dispatcher, and initialize it.
redA2ADispatcherLand = AI_A2A_DISPATCHER:New( redDetection )

--redA2ADispatcherLand:SetBorderZone( {zoneRedRussiaDefense, zoneFleetDefend} )
redA2ADispatcherLand:SetBorderZone( {zoneRedRussiaDefense} )

redA2ADispatcherLand:SetEngageRadius( 400000 )
redA2ADispatcherLand:SetDefaultOverhead(1.4)
redA2ADispatcherLand:SetTacticalDisplay( false )
redA2ADispatcherLand:SetDefaultCapLimit( 3 )
redA2ADispatcherLand:SetDefaultCapTimeInterval( 60, 600 )
redA2ADispatcherLand:SetDefaultLandingAtEngineShutdown()
redA2ADispatcherLand:SetDefaultTakeoffFromParkingCold()
redA2ADispatcherLand:SetDefaultFuelThreshold(0.6)
redA2ADispatcherLand:SetGciRadius(400000)
redA2ADispatcherLand:SetDefaultGrouping(2)
redA2ADispatcherLand:SetDefaultTanker(groupRedTankerLand:GetName())



-- Setup the squadrons.
--redA2ADispatcherLand:SetSquadron( "KSNCAP", "KSN", { "RedFleetCAP"}, 10 )
--redA2ADispatcherLand:SetSquadronTanker("KSNCAP","RedTanker")
--redA2ADispatcherLand:SetSquadronCap( "KSNCAP", zoneFleetDefend, 20000,35000,500,900,500,2000,"BARO")
--redA2ADispatcherLand:SetSquadron( "KSNIntercept", "KSN", { "RedFleetIntercept"}, 3 )
--redA2ADispatcherLand:SetSquadronTanker("KSNIntercept","RedTanker")
--redA2ADispatcherLand:SetSquadronGrouping("KSNIntercept",2)
--redA2ADispatcherLand:SetSquadronGci("KSNIntercept",500,2000)

--redA2ADispatcherLand:SetSquadron("AnapaCAP",AIRBASE.Caucasus.Anapa_Vityazevo,{"RedLandCAP27","RedLandCAP29"},10)
--redA2ADispatcherLand:SetSquadronCap( "AnapaCAP", zoneRedRussiaDefense, 20000,35000,200,900,200,2000,"BARO")
redA2ADispatcherLand:SetSquadron("BeslanCAP",AIRBASE.Caucasus.Beslan,{"RedLandCAP27","RedLandCAP29"},3)
redA2ADispatcherLand:SetSquadronCap( "BeslanCAP", zoneRedRussiaDefense, 20000,35000,200,900,200,2000,"BARO")
redA2ADispatcherLand:SetSquadron("MaykopCAP",AIRBASE.Caucasus.Maykop_Khanskaya,{"RedLandCAP27","RedLandCAP29"},4)
redA2ADispatcherLand:SetSquadronCap( "MaykopCAP", zoneRedRussiaDefense, 20000,35000,200,900,200,2000,"BARO")
--redA2ADispatcherLand:SetSquadron( "SochiGCI", AIRBASE.Caucasus.Sochi_Adler, { "RedLandIntercept"}, 3 )
--redA2ADispatcherLand:SetSquadronGrouping("SochiGCI",2)
--redA2ADispatcherLand:SetSquadronGci("SochiGCI",200,2000)
redA2ADispatcherLand:SetSquadron( "MozdocGCI", AIRBASE.Caucasus.Mozdok, { "RedLandIntercept"}, 1 )
redA2ADispatcherLand:SetSquadronGrouping("MozdocGCI",3)
redA2ADispatcherLand:SetSquadronGci("MozdocGCI",200,2000)
redA2ADispatcherLand:SetSquadron( "NalchikGCI", AIRBASE.Caucasus.Nalchik, { "RedLandIntercept"}, 1 )
redA2ADispatcherLand:SetSquadronGrouping("NalchikGCI",2)
redA2ADispatcherLand:SetSquadronGci("NalchikGCI",200,2000)
--redA2ADispatcherLand:SetSquadron( "AnapaGCI", AIRBASE.Caucasus.Anapa_Vityazevo, { "RedLandIntercept"}, 6 )
--redA2ADispatcherLand:SetSquadronGrouping("AnapaGCI",4)
--redA2ADispatcherLand:SetSquadronGci("AnapaGCI",200,2000)




--BlueA2A Defenses
--zoneGeorgianDefend = ZONE_POLYGON:New( "BorderBlue", GROUP:FindByName( "BorderBlue" ) )
zoneGeorgianDefend = ZONE_POLYGON:New( "BorderBlue", GROUP:FindByName( "restricted_border_blue" ) )
zoneCVW8FleetDefend = ZONE_POLYGON:New( "CVW_Defend", GROUP:FindByName( "CVW_Defend" ) )



DetectionBlueSetGroup = SET_GROUP:New()
DetectionBlueSetGroup:FilterPrefixes( { "EWR_BLUE", "CVW-8", "BlueAwacs" } )
DetectionBlueSetGroup:FilterStart()

blueDetection = DETECTION_AREAS:New( DetectionBlueSetGroup, 20000 )


blueA2ADispatcher = AI_A2A_DISPATCHER:New( blueDetection )

--blueA2ADispatcher:SetBorderZone( {zoneGeorgianDefend, zoneCVW8FleetDefend} )
blueA2ADispatcher:SetBorderZone( {zoneGeorgianDefend} )

blueA2ADispatcher:SetEngageRadius( 400000 )
blueA2ADispatcher:SetDefaultOverhead(1.4)
blueA2ADispatcher:SetTacticalDisplay( false )
blueA2ADispatcher:SetDefaultCapLimit( 3 )
blueA2ADispatcher:SetDefaultCapTimeInterval( 60, 600 )
blueA2ADispatcher:SetDefaultLandingAtEngineShutdown()
blueA2ADispatcher:SetDefaultTakeoffFromParkingCold()
blueA2ADispatcher:SetDefaultFuelThreshold(0.6)
blueA2ADispatcher:SetGciRadius(400000)
blueA2ADispatcher:SetDefaultGrouping(2)
blueA2ADispatcher:SetDefaultTanker("texaco")
--blueA2ADispatcher:SetCommandCenter(blueCommandCenter)

--blueA2ADispatcher:SetSquadron( "STNCAP", "Stennis", { "blueFleetCAP"}, 10 )
--blueA2ADispatcher:SetSquadronCap( "STNCAP", zoneCVW8FleetDefend, 20000,35000,500,900,500,2000,"BARO")
--blueA2ADispatcher:SetSquadron( "STNIntercept", "Stennis", { "blueFleetIntercept"}, 4 )
--blueA2ADispatcher:SetSquadronLandingAtRunway("STNIntercept")
--blueA2ADispatcher:SetSquadronGrouping("STNIntercept",2)
--blueA2ADispatcher:SetSquadronGci("STNIntercept",500,2000)

--blueA2ADispatcher:SetSquadron("BatumiCAP",AIRBASE.Caucasus.Batumi,{"blueLandCAP17","blueLandCAP16"},6)
--blueA2ADispatcher:SetSquadronCap( "BatumiCAP", zoneGeorgianDefend, 20000,35000,200,900,200,2000,"BARO")
--blueA2ADispatcher:SetSquadron("GudautaCAP",AIRBASE.Caucasus.Gudauta,{"blueLandCAP17"},4)
--blueA2ADispatcher:SetSquadronCap( "GudautaCAP", zoneGeorgianDefend, 20000,35000,200,900,200,2000,"BARO")
blueA2ADispatcher:SetSquadron("TbilisiCAP",AIRBASE.Caucasus.Tbilisi_Lochini,{"blueLandCAP17","blueLandCAP16"},5)
blueA2ADispatcher:SetSquadronCap( "TbilisiCAP", zoneGeorgianDefend, 20000,35000,200,900,200,2000,"BARO")
--blueA2ADispatcher:SetSquadron("KutaisiCAP",AIRBASE.Caucasus.Kutaisi,{"blueLandCAP17", "blueLandCAP16"},6)
--blueA2ADispatcher:SetSquadronCap( "KutaisiCAP", zoneGeorgianDefend, 20000,35000,200,900,200,2000,"BARO")

-- Menus
menuMission = MENU_COALITION:New( coalition.side.BLUE, "Mission Control" )
menuRepopAxeman = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Repop Axeman", menuMission, setUserFlag, {"20", 1})
menuRepopEscortAxeman = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Repop Escorte Axeman", menuMission, setUserFlag, {"21", 1})
menuConvoiFallback = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Convoi Failback", menuMission, setUserFlag, {"30", 1})
menuAlouetteIA = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Alouette IA", menuMission, setUserFlag, {"60", 1})
--menuROEDegradation = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "ROE outrepassées", menuMission, ROEDegradation)
env.info("mission initialization...")

--Download the turkish F16 livery https://www.digitalcombatsimulator.com/en/files/3306644/
--Download the RazGriz JF17 livery https://www.digitalcombatsimulator.com/en/files/3307267/

blueCommandCenter = COMMANDCENTER:New( GROUP:FindByName( "CIA_HQ" ), "CIA_HQ" )
--blueCommandCenter:TraceOff()


--SEAD Objects
SEAD_RED_SAM_Defenses = SEAD:New( { 'SA6_Sochi', 'SA10_Gelend', 'SA10_Nalchik'} )
SEAD_BLUE_SAM_Defenses = SEAD:New( { 'PAtriot_Sukhumi', 'Patriot_Sochi', 'Patriot_Tbilisi', 'Hawk_Senaki'} )



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
  local groupEscort = SPAWN
    :New(escortTemplate)
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


spawnArco = SPAWN:New("arco")
spawnTexaco = SPAWN:New("texaco")
spawnRedTanker = SPAWN:New("RedTanker")
spawnRedTankerLand = SPAWN:New("RedTankerLand")

groupArco = spawnArco:Spawn()
groupTexaco = spawnTexaco:Spawn()
groupRedTanker = GROUP:FindByName("RedTanker")
groupRedTanker:StartUncontrolled(60)
groupRedTankerLand = GROUP:FindByName("RedTankerLand")
groupRedTankerLand:StartUncontrolled(60)
groupRedAWACS = GROUP:FindByName("RedAwacs")
groupRedAWACS:StartUncontrolled(0)


groupEscortArco = spawnEscortInZone("escort_tomcat","popup_escort_tankers",groupArco,265.00,"Excellent",false)
groupEscortTexaco = spawnEscortInZone("escort_hornet","popup_escort_tankers",groupTexaco,265.00,"Excellent",false)
--groupEscortRedTanker = spawnEscortInZone("escort_29","popup_escort_Red_Tankers",groupRedTanker,251.00,"Excellent",false)
groupEscortRedTankerLand = spawnEscortInZone("escort_29","popup_escort_Red_Tankers",groupRedTankerLand,251.00,"Excellent",false)


--RedA2A Defenses
zoneRedRussiaDefense = ZONE_POLYGON:New( "Border_Red", GROUP:FindByName( "Border_Red" ) )
zoneFleetDefend = ZONE_POLYGON:New( "CAPFleetZone", GROUP:FindByName( "CAPFleetZone" ) )



DetectionRedSetGroup = SET_GROUP:New()
DetectionRedSetGroup:FilterPrefixes( { "EWR_RED", "KSN", "RedAwacs" } )
DetectionRedSetGroup:FilterStart()

redDetection = DETECTION_AREAS:New( DetectionRedSetGroup, 20000 )

-- Setup the A2A dispatcher, and initialize it.
redA2ADispatcherLand = AI_A2A_DISPATCHER:New( redDetection )

redA2ADispatcherLand:SetBorderZone( {zoneRedRussiaDefense, zoneFleetDefend} )

redA2ADispatcherLand:SetEngageRadius( 200000 )
redA2ADispatcherLand:SetDefaultOverhead(1.4)
redA2ADispatcherLand:SetTacticalDisplay( false )
redA2ADispatcherLand:SetDefaultCapLimit( 16 )
redA2ADispatcherLand:SetDefaultCapTimeInterval( 60, 600 )
redA2ADispatcherLand:SetDefaultLandingAtEngineShutdown()
redA2ADispatcherLand:SetDefaultTakeoffFromParkingCold()
redA2ADispatcherLand:SetDefaultFuelThreshold(0.4)
redA2ADispatcherLand:SetGciRadius(600000)
redA2ADispatcherLand:SetDefaultGrouping(2)
redA2ADispatcherLand:SetDefaultTanker("RedTankerLand")


-- Setup the squadrons.
redA2ADispatcherLand:SetSquadron( "KSNCAP", "KSN", { "RedFleetCAP"}, 10 )
redA2ADispatcherLand:SetSquadronTanker("KSNCAP","RedTanker")
redA2ADispatcherLand:SetSquadronCap( "KSNCAP", zoneFleetDefend, 20000,35000,500,900,500,2000,"BARO")
redA2ADispatcherLand:SetSquadron( "KSNIntercept", "KSN", { "RedFleetIntercept"}, 3 )
redA2ADispatcherLand:SetSquadronTanker("KSNIntercept","RedTanker")
redA2ADispatcherLand:SetSquadronGrouping("KSNIntercept",2)
redA2ADispatcherLand:SetSquadronGci("KSNIntercept",500,2000)

redA2ADispatcherLand:SetSquadron("AnapaCAP",AIRBASE.Caucasus.Anapa_Vityazevo,{"RedLandCAP27","RedLandCAP29"},6)
redA2ADispatcherLand:SetSquadronCap( "AnapaCAP", zoneRedRussiaDefense, 20000,35000,500,900,500,2000,"BARO")
redA2ADispatcherLand:SetSquadron("BeslanCAP",AIRBASE.Caucasus.Beslan,{"RedLandCAP27","RedLandCAP29"},4)
redA2ADispatcherLand:SetSquadronCap( "BeslanCAP", zoneRedRussiaDefense, 20000,35000,500,900,500,2000,"BARO")
redA2ADispatcherLand:SetSquadron("MaykopCAP",AIRBASE.Caucasus.Maykop_Khanskaya,{"RedLandCAP27","RedLandCAP29"},10)
redA2ADispatcherLand:SetSquadronCap( "MaykopCAP", zoneRedRussiaDefense, 20000,35000,500,900,500,2000,"BARO")
redA2ADispatcherLand:SetSquadron( "SochiGCI", AIRBASE.Caucasus.Sochi_Adler, { "RedLandIntercept"}, 3 )
redA2ADispatcherLand:SetSquadronGrouping("SochiGCI",2)
redA2ADispatcherLand:SetSquadronGci("SochiGCI",500,2000)
redA2ADispatcherLand:SetSquadron( "MozdocGCI", AIRBASE.Caucasus.Mozdok, { "RedLandIntercept"}, 3 )
redA2ADispatcherLand:SetSquadronGrouping("MozdocGCI",2)
redA2ADispatcherLand:SetSquadronGci("MozdocGCI",500,2000)
redA2ADispatcherLand:SetSquadron( "NalchikGCI", AIRBASE.Caucasus.Nalchik, { "RedLandIntercept"}, 3 )
redA2ADispatcherLand:SetSquadronGrouping("NalchikGCI",2)
redA2ADispatcherLand:SetSquadronGci("NalchikGCI",500,2000)
redA2ADispatcherLand:SetSquadron( "AnapaGCI", AIRBASE.Caucasus.Anapa_Vityazevo, { "RedLandIntercept"}, 3 )
redA2ADispatcherLand:SetSquadronGrouping("AnapaGCI",4)
redA2ADispatcherLand:SetSquadronGci("AnapaGCI",500,2000)




--BlueA2A Defenses
zoneGeorgianDefend = ZONE_POLYGON:New( "BorderBlue", GROUP:FindByName( "BorderBlue" ) )
zoneCVW8FleetDefend = ZONE_POLYGON:New( "CVW_Defend", GROUP:FindByName( "CVW_Defend" ) )



DetectionBlueSetGroup = SET_GROUP:New()
DetectionBlueSetGroup:FilterPrefixes( { "EWR_BLUE", "CVW-8", "BlueAwacs" } )
DetectionBlueSetGroup:FilterStart()

blueDetection = DETECTION_AREAS:New( DetectionBlueSetGroup, 20000 )


blueA2ADispatcher = AI_A2A_DISPATCHER:New( blueDetection )

blueA2ADispatcher:SetBorderZone( {zoneGeorgianDefend, zoneCVW8FleetDefend} )

blueA2ADispatcher:SetEngageRadius( 200000 )
blueA2ADispatcher:SetDefaultOverhead(1.4)
blueA2ADispatcher:SetTacticalDisplay( false )
blueA2ADispatcher:SetDefaultCapLimit( 10 )
blueA2ADispatcher:SetDefaultCapTimeInterval( 60, 600 )
blueA2ADispatcher:SetDefaultLandingAtEngineShutdown()
blueA2ADispatcher:SetDefaultTakeoffFromParkingCold()
blueA2ADispatcher:SetDefaultFuelThreshold(0.4)
blueA2ADispatcher:SetGciRadius(600000)
blueA2ADispatcher:SetDefaultGrouping(2)
blueA2ADispatcher:SetDefaultTanker("texaco")
blueA2ADispatcher:SetCommandCenter(blueCommandCenter)

blueA2ADispatcher:SetSquadron( "STNCAP", "Stennis", { "blueFleetCAP"}, 10 )
blueA2ADispatcher:SetSquadronCap( "STNCAP", zoneCVW8FleetDefend, 20000,35000,500,900,500,2000,"BARO")
blueA2ADispatcher:SetSquadron( "STNIntercept", "Stennis", { "blueFleetIntercept"}, 4 )
blueA2ADispatcher:SetSquadronGrouping("STNIntercept",2)
blueA2ADispatcher:SetSquadronGci("STNIntercept",500,2000)
blueA2ADispatcher:SetSquadron("BatumiCAP",AIRBASE.Caucasus.Batumi,{"blueLandCAP17","blueLandCAP16"},6)
blueA2ADispatcher:SetSquadronCap( "BatumiCAP", zoneGeorgianDefend, 20000,35000,500,900,500,2000,"BARO")
blueA2ADispatcher:SetSquadron("GudautaCAP",AIRBASE.Caucasus.Gudauta,{"blueLandCAP17"},4)
blueA2ADispatcher:SetSquadronCap( "GudautaCAP", zoneGeorgianDefend, 20000,35000,500,900,500,2000,"BARO")
blueA2ADispatcher:SetSquadron("TbilisiCAP",AIRBASE.Caucasus.Tbilisi_Lochini,{"blueLandCAP17","blueLandCAP16"},10)
blueA2ADispatcher:SetSquadronCap( "TbilisiCAP", zoneGeorgianDefend, 20000,35000,500,900,500,2000,"BARO")
blueA2ADispatcher:SetSquadron("KutaisiCAP",AIRBASE.Caucasus.Kutaisi,{"blueLandCAP17", "blueLandCAP16"},6)
blueA2ADispatcher:SetSquadronCap( "KutaisiCAP", zoneGeorgianDefend, 20000,35000,500,900,500,2000,"BARO")


spawnUSAF = SPAWN:New("F15E_Escort"):InitLimit(16,16):InitSkill("Excellent"):SpawnScheduled(1200,0.5)
spawnGalaxy = SPAWN:New("C5"):InitLimit(5,5):InitSkill("Excellent"):SpawnScheduled(10,1)
--spawnUSAF:SpawnScheduled(15,1)

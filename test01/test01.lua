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
groupEscortArco = LIB31ST_ESCORT:spawnEscortInZone("escort_tomcat","popup_escort_tankers",groupArco,265.00,"Excellent",false)
groupEscortTexaco = LIB31ST_ESCORT:spawnEscortInZone("escort_hornet","popup_escort_tankers",groupTexaco,265.00,"Excellent",false)
groupEscortRedTanker = LIB31ST_ESCORT:spawnEscortInZone("escort_29","popup_escort_Red_Tankers",groupRedTanker,251.00,"Excellent",false)
groupEscortRedTankerLand = LIB31ST_ESCORT:spawnEscortInZone("escort_29","popup_escort_Red_Tankers",groupRedTankerLand,251.00,"Excellent",false)


--RedA2A Defenses
zoneRedRussiaDefense = ZONE_POLYGON:New( "Border_Red", GROUP:FindByName( "Border_Red" ) )
zoneFleetDefend = ZONE_POLYGON:New( "CAPFleetZone", GROUP:FindByName( "CAPFleetZone" ) )


DetectionRedSetGroup = SET_GROUP:New()
DetectionRedSetGroup:FilterPrefixes( { "EWR_RED", "KSN", "RedAwacs" } )
DetectionRedSetGroup:FilterStart()

redDetection = DETECTION_AREAS:New( DetectionRedSetGroup, 20000 )

-- Setup the A2A dispatcher, and initialize it.
redA2ADispatcherLand = AI_A2A_DISPATCHER:New( redDetection )
redA2ADispatcherKSN = AI_A2A_DISPATCHER:New( redDetection )

redA2ADispatcherLand:SetBorderZone( zoneRedRussiaDefense )
redA2ADispatcherKSN:SetBorderZone(zoneFleetDefend)

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
redA2ADispatcherLand:SetEngageRadius( 150000 )
redA2ADispatcherLand:SetTacticalDisplay( true )
redA2ADispatcherLand:SetDefaultCapLimit( 8 )
redA2ADispatcherLand:SetDefaultCapTimeInterval( 300, 600 )
redA2ADispatcherLand:SetDefaultLandingAtEngineShutdown()
redA2ADispatcherLand:SetDefaultTakeoffFromParkingCold()
redA2ADispatcherLand:SetDefaultFuelThreshold(0.3)
redA2ADispatcherLand:SetGciRadius(200000)
redA2ADispatcherLand:SetDefaultGrouping(2)
redA2ADispatcherLand:SetDefaultTanker("RedTankerLand")

redA2ADispatcherKSN:SetEngageRadius( 150000 )
redA2ADispatcherKSN:SetTacticalDisplay( true )
redA2ADispatcherKSN:SetDefaultCapLimit( 4 )
redA2ADispatcherKSN:SetDefaultCapTimeInterval( 300, 600 )
redA2ADispatcherKSN:SetDefaultLandingAtEngineShutdown()
redA2ADispatcherKSN:SetDefaultTakeoffFromParkingCold()
redA2ADispatcherKSN:SetDefaultFuelThreshold(0.4)
redA2ADispatcherKSN:SetGciRadius(200000)
redA2ADispatcherKSN:SetDefaultGrouping(2)
redA2ADispatcherKSN:SetDefaultTanker("RedTanker")


-- Setup the squadrons.
redA2ADispatcherKSN:SetSquadron( "KSNCAP", "KSN", { "RedFleetCAP"}, 10 )
redA2ADispatcherKSN:SetSquadronCap( "KSNCAP", zoneFleetDefend, 20000,35000,500,900,500,2000,"BARO")
redA2ADispatcherKSN:SetSquadron( "KSNIntercept", "KSN", { "RedFleetIntercept"}, 3 )
redA2ADispatcherKSN:SetSquadronGci("KSNIntercept",500,2000)

redA2ADispatcherLand:SetSquadron("AnapaCAP",AIRBASE.Caucasus.Anapa_Vityazevo,{"RedLandCAP27","RedLandCAP29"},6)
redA2ADispatcherLand:SetSquadronCap( "AnapaCAP", zoneRedRussiaDefense, 20000,35000,500,900,500,2000,"BARO")
redA2ADispatcherLand:SetSquadron("BeslanCAP",AIRBASE.Caucasus.Beslan,{"RedLandCAP27","RedLandCAP29"},4)
redA2ADispatcherLand:SetSquadronCap( "BeslanCAP", zoneRedRussiaDefense, 20000,35000,500,900,500,2000,"BARO")
redA2ADispatcherLand:SetSquadron("MaykopCAP",AIRBASE.Caucasus.Maykop_Khanskaya,{"RedLandCAP27","RedLandCAP29"},10)
redA2ADispatcherLand:SetSquadronCap( "MaykopCAP", zoneRedRussiaDefense, 20000,35000,500,900,500,2000,"BARO")



-- CAP Squadron execution.
--
--redA2ADispatcherKSN:SetSquadronOverhead( "KSNCAP", 1.5 )
--redA2ADispatcherKSN:SetSquadronGrouping( "KSNCAP", 2 )
--redA2ADispatcherKSN:SetSquadronVisible("KSNCAP")
--redA2ADispatcherKSN:SetSquadronFuelThreshold("KSNCAP",0.3)
--redA2ADispatcherKSN:SetSquadronTakeoffFromParkingCold("KSNCAP")
--redA2ADispatcherKSN:SetSquadronLandingAtEngineShutdown("KSNCAP")
--redA2ADispatcherKSN:SetSquadronOverhead( "KSNIntercept", 1.5 )
--redA2ADispatcherKSN:SetSquadronGrouping( "KSNIntercept", 2 )
--redA2ADispatcherKSN:SetSquadronFuelThreshold("KSNIntercept",0.4)
--redA2ADispatcherKSN:SetSquadronTakeoffFromParkingHot("KSNIntercept")
--redA2ADispatcherKSN:SetSquadronLandingAtEngineShutdown("KSNIntercept")


--redKSNA2ADispatcher:SetSquadronGci( "KSNCAP", 900, 1200 )















--RedGCIDispatcher:__Start()
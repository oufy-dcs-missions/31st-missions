--mission Ajna
--Intégration de Skynet , moose et mist
--Pour un deepstrike avec defenses aeriennes dynamiques

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
            :InitRepeatOnEngineShutDown()
            :OnSpawnGroup(
            function( escortGroup )
                ---@type GROUP
                local curGroup =  escortGroup
                BASE:E(string.format("group escorte : %s", escortedGroupName:GetName()))
                BASE:E(string.format("is alive ? %s",tostring(curGroup:IsAlive())))
                curGroup:PushTask(curGroup:TaskEscort(escortedGroupName, POINT_VEC3:New( 1000, 0, 1000 ), nil , 40, { "Air"}), 0)
                :OptionRTBBingoFuel(true)
                :OptionECM_DetectedLockByRadar()
            end)
            :SpawnAtAirbase(AIRBASE:FindByName(aibaseName),SPAWN.Takeoff.Cold)
    return groupEscort
end

do
    groupRedTankerLand = GROUP:FindByName("RedTankerLand")
    groupRedTankerLand:StartUncontrolled(300)
    groupEscortRedTankerLand = spawnEscortAtAirbase("escort", AIRBASE.Caucasus.Maykop_Khanskaya ,groupRedTankerLand,251.00,"Excellent",false)

    groupRedAwacs = GROUP:FindByName("RedAWACS")
    --groupRedAwacs:StartUncontrolled()
    groupEscortRedAwacs = spawnEscortAtAirbase("escort1", AIRBASE.Caucasus.Maykop_Khanskaya ,groupRedAwacs,251.00,"Excellent",false)


    redSkynet = SkynetIADS:create('redSkyNet')

    --local iadsDebug = redSkynet:getDebugSettings()
    --iadsDebug.IADSStatus = true
    --iadsDebug.samWentDark = true
    --iadsDebug.contacts = true
    --iadsDebug.radarWentLive = true
    --iadsDebug.ewRadarNoConnection = true
    --iadsDebug.samNoConnection = true
    --iadsDebug.jammerProbability = true
    --iadsDebug.addedEWRadar = true
    --iadsDebug.hasNoPower = true
    --iadsDebug.addedSAMSite = true
    --iadsDebug.warnings = true
    --iadsDebug.harmDefence = true
    --iadsDebug.samSiteStatusEnvOutput = true
    --iadsDebug.earlyWarningRadarStatusEnvOutput = true

    redSkynet:addEarlyWarningRadarsByPrefix('Red_EW')
    redSkynet:addEarlyWarningRadar('RedAWACS')
    redSkynet:addSAMSitesByPrefix('Red SA')

    local chegemPowerSource = StaticObject.getByName('GPU #007')
    local chegemConnectionSource = StaticObject.getByName('GPU #008')
    redSkynet:getSAMSiteByGroupName('Red SA9 Chegem'):addPowerSource(chegemPowerSource):addConnectionNode(chegemConnectionSource):setActAsEW(true)

    local montainPowerSource = StaticObject.getByName('GPU #010')
    local montainConnectionSource = StaticObject.getByName('GPU #011')
    redSkynet:getSAMSiteByGroupName('Red SA9 montain'):addPowerSource(montainPowerSource):addConnectionNode(montainConnectionSource):setActAsEW(true)

    local bylymPowerSource = StaticObject.getByName('GPU #012')
    local bylymConnectionSource = StaticObject.getByName('GPU #009')
    redSkynet:getSAMSiteByGroupName('Red SA6 Bylym'):addPowerSource(bylymPowerSource):addConnectionNode(bylymConnectionSource):setActAsEW(true)



    local ewCenterPowerSource = StaticObject.getByName('GPU #006')
    local ewCenterConnNode = StaticObject.getByName('CommandTower')
    redSkynet:getEarlyWarningRadarByUnitName('Red_EW #002'):addPowerSource(ewCenterPowerSource):addConnectionNode(ewCenterConnNode)


    local commandCenter = StaticObject.getByName("Red CommandCenter")
    local comPowerSource = StaticObject.getByName("GPU #001")
    redSkynet:addCommandCenter(commandCenter):addPowerSource(comPowerSource)
    redSkynet:setupSAMSitesAndThenActivate(60)
    zoneRedRussiaDefense = ZONE_POLYGON:New( "Border_Red", GROUP:FindByName( "borders_red" ) )
    zoneRedPatrol = ZONE_POLYGON:New( "Patrol_Red", GROUP:FindByName( "RedPatrolZone" ) )


    DetectionRedSetGroup = SET_GROUP:New()
    --DetectionRedSetGroup:FilterPrefixes( { "Red_EW", "RedAWACS" } )
    --DetectionRedSetGroup:FilterStart()

    redDetection = DETECTION_AREAS:New( DetectionRedSetGroup, 150000 )

    -- Setup the A2A dispatcher, and initialize it.
    redA2ADispatcherLand = AI_A2A_DISPATCHER:New( redDetection )

    --redA2ADispatcherLand:SetBorderZone( {zoneRedRussiaDefense, zoneFleetDefend} )
    redA2ADispatcherLand:SetBorderZone( {zoneRedRussiaDefense} )

    redA2ADispatcherLand:SetEngageRadius( 100000 )
    redA2ADispatcherLand:SetDefaultOverhead(1.4)
    redA2ADispatcherLand:SetTacticalDisplay( false )
    redA2ADispatcherLand:SetDefaultCapLimit( 1 )
    redA2ADispatcherLand:SetDefaultCapTimeInterval( 120, 1800 )
    redA2ADispatcherLand:SetDefaultLandingAtEngineShutdown()
    redA2ADispatcherLand:SetDefaultTakeoffFromParkingCold()
    redA2ADispatcherLand:SetDefaultFuelThreshold(0.6)
    redA2ADispatcherLand:SetGciRadius(400000)
    redA2ADispatcherLand:SetDefaultGrouping(2)
    redA2ADispatcherLand:SetDefaultTanker(groupRedTankerLand:GetName())



    -- Setup the squadrons.

    redA2ADispatcherLand:SetSquadron("BeslanCAP",AIRBASE.Caucasus.Beslan,{"Su33","Su30"},4)
    redA2ADispatcherLand:SetSquadronCap( "BeslanCAP", zoneRedPatrol, 20000,35000,200,900,200,2000,"BARO")
    redA2ADispatcherLand:SetSquadronCapRacetrack("BeslanCAP",30000, 120000, 60, 120, 20*60,90*60)
    redA2ADispatcherLand:SetSquadron("NalchikCAP",AIRBASE.Caucasus.Nalchik,{"Su33","Su30"},6)
    redA2ADispatcherLand:SetSquadronCap( "NalchikCAP", zoneRedPatrol, 20000,35000,200,900,200,2000,"BARO")
    redA2ADispatcherLand:SetSquadronCapRacetrack("NalchikCAP",30000, 80000, 320, 359, 20*60,90*60)

    redA2ADispatcherLand:SetSquadron( "MozdocGCI", AIRBASE.Caucasus.Mozdok, { "Mig31","Su33","Mig23","Su30"}, 1 )
    redA2ADispatcherLand:SetSquadronGrouping("MozdocGCI",3)
    redA2ADispatcherLand:SetSquadronGci("MozdocGCI",200,2000)
    redA2ADispatcherLand:SetSquadron( "VodyGCI", AIRBASE.Caucasus.Mineralnye_Vody, { "Mig31","Su33","Mig23","Su30"}, 2 )
    redA2ADispatcherLand:SetSquadronGrouping("VodyGCI",2)
    redA2ADispatcherLand:SetSquadronGci("VodyGCI",200,2000)
    redA2ADispatcherLand:SetTacticalDisplay(true)
    redA2ADispatcherLand:Start()

    redSkynet:addMooseSetGroup(DetectionRedSetGroup)
end
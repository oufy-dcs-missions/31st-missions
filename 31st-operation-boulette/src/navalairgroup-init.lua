if enablePedro == true then
    pedroCVN =
    RESCUEHELO:New(UNIT:FindByName(CVN_UNIT_NAME), 'Pedro-1')
            :SetHomeBase(AIRBASE:FindByName('CVW-7-5'))
            :SetTakeoffCold()
            :SetRespawnOn()
            :SetRescueDuration(3)
            :SetModex(42)

    function pedroCVN:OnAfterStart(from, event, to)
        self.helo:CommandSetFrequency(CVN_BASE_FREQ, radio.modulation.AM)
    end
    pedroCVN:Start()

    pedroLHA =
    RESCUEHELO:New(UNIT:FindByName(LHA_UNIT_NAME), 'Pedro-1')
            :SetHomeBase(AIRBASE:FindByName('CVW-7-6'))
            :SetTakeoffCold()
            :SetRespawnOn()
            :SetRescueDuration(3)
            :SetModex(43)

    function pedroLHA:OnAfterStart(from, event, to)
        self.helo:CommandSetFrequency(LHA_BASE_FREQ, radio.modulation.AM)
    end
    pedroLHA:Start()

end


if enableAirboss == true then
    local airbossCVN = AIRBOSS:New(CVN_UNIT_NAME, CVN_UNIT_NAME)
    airbossCVN:SetTACAN(CVN_TACAN_CHANNEL, CVN_TACAN_BAND, "CVN")
    airbossCVN:SetICLS(CVN_ICLS_CHANNEL, "LSO")
    airbossCVN:SetLSORadio(CVN_AIRBOSS_LSO_FREQ)
    airbossCVN:SetMarshalRadio(CVN_AIRBOSS_MARSHALL_FREQ)
    airbossCVN:SetPatrolAdInfinitum(true)
    airbossCVN:SetCarrierControlledArea(55)
    airbossCVN:SetStaticWeather(true)
    airbossCVN:SetMenuSingleCarrier()
    airbossCVN:SetRecoveryCase(1)
    airbossCVN:SetMaxLandingPattern(3)
    airbossCVN:SetDefaultPlayerSkill(AIRBOSS.Difficulty.NORMAL) -- other options EASY / HARD
    airbossCVN:SetHandleAION()
    airbossCVN:SetMenuRecovery(30, 20, true)
    airbossCVN:SetMenuMarkZones(airboss_enable_markzones)
    airbossCVN:SetMenuSmokeZones(airboss_enable_smokezones)
    airbossCVN:SetAirbossNiceGuy(airboss_enable_niceguy)
    airbossCVN:SetRadioRelayMarshal("RELAY_MARSHALL")
    airbossCVN:SetRadioRelayLSO("RELAY_LSO")
    airbossCVN:SetSoundfilesFolder("Airboss Soundfiles/")
    --airbossCVN:Load(nil, "Greenie Board.csv")
    --airbossCVN:SetAutoSave(nil, "Greenie Board.csv")
    local window1 = airbossCVN:AddRecoveryWindow("08:20", "09:15", 1, 0, true)
    airbossCVN:Start()
end

if enableViking == true then
    RECOVERYTANKER:New(UNIT:FindByName('CVW-7-5'), 'Arco-2'):SetTakeoffCold()
            :SetAltitude(VIKING_ALTITUDE)
            :SetSpeed(VIKING_SPEED)
            :SetHomeBase(CVN_UNIT_NAME)
            :SetCallsign(CALLSIGN.Tanker.Arco, 2)
            :SetRadio(VIKING_FREQ)
            :SetModex(511)
            :SetTACAN(VIKING_TACAN_CHANNEL, VIKING_TACAN_MORSE)
            :SetRacetrackDistances(VIKING_RACETRACK_FRONT, VIKING_RACETRACK_AFT)
            :Start()
end

if enableHawkeye == true then
    RECOVERYTANKER:New(UNIT:FindByName('CVW-7-7'), 'BLUE EWR-Awacs-2')
            :SetAWACS()
            :SetTakeoffCold()
            :SetRadio(HAWKEYE_FREQ)
            :SetAltitude(HAWKEYE_ALTITUDE)
            :SetHomeBase(CVN_UNIT_NAME)
            :SetCallsign(CALLSIGN.AWACS.Magic, 1)
            :SetRacetrackDistances(HAWKEYE_RACETRACK_FRONT, HAWKEYE_RACETRACK_AFT)
            :SetTACAN(HAWKEYE_TACAN_CHANNEL, HAWKEYE_TACAN_MORSE)
            :SetModex(611)
            :__Start(1)
end
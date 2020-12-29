if TankerBoomConfig.enable == true then
    RECOVERYTANKER:New(UNIT:FindByName('anchor-tankers'), 'Texaco-1')
            :SetTakeoffCold()
            :SetAltitude(TankerBoomConfig.altitude)
            :SetSpeed(TankerBoomConfig.speed)
            :SetHomeBase(AIRBASE.Caucasus.Kobuleti)
            :SetCallsign(CALLSIGN.Tanker.Texaco)
            :SetRadio(TankerBoomConfig.freq)
            :SetModex(511)
            :SetTACAN(TankerBoomConfig.tacan.channel, TankerBoomConfig.tacan.morse)
            :SetRacetrackDistances(30, 20)
            :Start()
end

if TankerBoomSlowConfig.enable == true then
    RECOVERYTANKER:New(UNIT:FindByName('anchor-tankers'), 'Shell-1')
            :SetTakeoffCold()
            :SetAltitude(TankerBoomSlowConfig.altitude)
            :SetSpeed(TankerBoomSlowConfig.speed)
            :SetHomeBase(AIRBASE.Caucasus.Kobuleti)
            :SetCallsign(CALLSIGN.Tanker.Shell)
            :SetRadio(TankerBoomSlowConfig.freq)
            :SetModex(512)
            :SetTACAN(TankerBoomSlowConfig.tacan.channel, TankerBoomSlowConfig.tacan.morse)
            :SetRacetrackDistances(30, 20)
            :Start()
end

if TankerBasketConfig.enable == true then
    RECOVERYTANKER:New(UNIT:FindByName('anchor-tankers'), 'Arco-1')
            :SetTakeoffCold()
            :SetAltitude(TankerBasketConfig.altitude)
            :SetSpeed(TankerBasketConfig.speed)
            :SetHomeBase(AIRBASE.Caucasus.Kobuleti)
            :SetCallsign(CALLSIGN.Tanker.Arco, 1)
            :SetRadio(TankerBasketConfig.freq)
            :SetModex(513)
            :SetTACAN(TankerBasketConfig.tacan.channel, TankerBasketConfig.tacan.morse)
            :SetRacetrackDistances(30, 20)
            :Start()
end

if AwacsConfig.enable == true then
    RECOVERYTANKER:New(UNIT:FindByName('anchor-awacs'), 'BLUE EWR-Awacs-1')
            :SetAWACS()
            :SetTakeoffCold()
            :SetAltitude(AwacsConfig.altitude)
            :SetSpeed(AwacsConfig.speed)
            :SetHomeBase(AIRBASE.Caucasus.Kobuleti)
            :SetCallsign(CALLSIGN.AWACS.Overlord, 1)
            :SetRadio(AwacsConfig.freq)
            :SetModex(713)
            :SetTACAN(AwacsConfig.tacan.channel, AwacsConfig.tacan.morse)
            :SetRacetrackDistances(40, 40)
            :Start()
end

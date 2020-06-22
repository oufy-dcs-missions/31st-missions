-- AIRBOSS DOC https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Ops.Airboss.html

--AIRBOSS SETTINGS
-- airboss_enable = true

-- airboss_enable_markzones = true

-- airboss_enable_smokezones = true

-- airboss_enable_niceguy = true

-- airboss_enable_tanker = true

-- airboss_enable_rescue_helo = true

if airboss_enable == true then

  local airbossStennis = AIRBOSS:New("Stennis", "Stennis")

  airbossStennis:SetTACAN(75, "X", "STN")
  airbossStennis:SetICLS(15, "LSO")
  airbossStennis:SetLSORadio(127.5)
  airbossStennis:SetMarshalRadio(127.5)
  airbossStennis:SetPatrolAdInfinitum(true)
  airbossStennis:SetCarrierControlledArea(45)
  airbossStennis:SetStaticWeather(true)
--  airbossStennis:SetMenuSingleCarrier()
  airbossStennis:SetRecoveryCase(1)
  airbossStennis:SetMaxLandingPattern(6)
  airbossStennis:SetDefaultPlayerSkill(AIRBOSS.Difficulty.NORMAL) -- other options EASY / HARD
  airbossStennis:SetHandleAIOFF()
  airbossStennis:SetMenuRecovery(30, 20, true)
  airbossStennis:SetMenuMarkZones(airboss_enable_markzones)
  airbossStennis:SetMenuSmokeZones(airboss_enable_smokezones)
  airbossStennis:SetAirbossNiceGuy(airboss_enable_niceguy)
  airbossStennis:SetRadioRelayMarshal("CVN75 Relay")
  airbossStennis:SetRadioRelayLSO("CVN75 Relay")
--  airbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")
--  airbossStennis:Load(nil, "Greenie Board.csv")
--  airbossStennis:SetAutoSave(nil, "Greenie Board.csv")

-- create fake recovery window at the end of the mission play
  local window1 = airbossStennis:AddRecoveryWindow("07:31", "23:55", 1, 0, false)

  airbossStennis:Start()


  if airboss_enable_tanker == true then
    local carrierTanker = nil  --Ops.RecoveryTanker#RECOVERYTANKER
    carrierTanker = RECOVERYTANKER:New("Stennis", "StennisTanker")
    carrierTanker:SetTakeoffHot()
    carrierTanker:SetTACAN(32, "KST")
    carrierTanker:SetRadio(264.25, "AM")
    carrierTanker:SetRespawnOn()
    carrierTanker:Start()
    airbossStennis:SetRecoveryTanker(carrierTanker)
  end

  if airboss_enable_rescue_helo == true then
    local RescueheloStennis=RESCUEHELO:New(UNIT:FindByName("Stennis"), "StennisRescue")
    RescueheloStennis:SetTakeoffHot()
    RescueheloStennis:Start()
  end

  env.info('Airboss ... OK')
  trigger.action.outText("AIRBOSS scripts Loaded...", 10)
--   ADD TO CONFIG FILE
--  airboss_enable_markzones = true
--  airboss_enable_smokezones = true
--  airboss_enable_niceguy = true

	timer.scheduleFunction(function() 
	trigger.action.outText(	"<< If the AIRBOSS option does not appear in your F10 - Other Menu, try switching slots a few times and you will get the AIRBOSS message popups! Check the AIRBOSS documentation (link in briefing for more info) >>", 30)
	end, nil, timer.getTime() + 30  )

end

if airboss_enable == false then
  trigger.action.outText("AIRBOSS script disabled...", 10)
end


-- SETUP:

-- Carrier needs to be nammed "Stennis" (UNIT NAME not GROUP, you can do both if that helps.)
-- S-3B tanker added to the map and needs to be named "StennisTanker" and set on the map as late activation (UNIT NAME not GROUP, you can do both if that helps.)
-- recovery helo added to the map needs to be named "StennisRescue" and set on the map as late activation. (UNIT NAME not GROUP, you can do both if that helps.)
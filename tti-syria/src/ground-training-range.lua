AGR1 				= 		ZONE:New( "AGR1" )

AGR1_vec = AGR1:GetVec3()



--NORMAL
A2GJ = SPAWN:New( "A2G_Init" )
            :InitRandomizeTemplate( TemplateTable_GROUND )



--SAM ADD
function a2g_sam_start()
    local switch = math.random(1, 3)

    if switch == 1 then
        a2gsam1_start()
    elseif switch == 2 then
        a2gsam2_start()
    elseif switch == 3 then
        a2gsam3_start()
    end

    trigger.action.outText( ">> An enemy SAM site has been detected in the area.<< \nRequesting SEAD aircraft to locate and destroy the SAM Site.", 10)
    trigger.action.outSound( "Ui beep.ogg" )


end
--SAM ADD
function a2gsam1_start() --1 per group
    for i = 1, 1 do
        A2G_SAM:SpawnInZone(SAM1, true)
    end
    if enable_jtac_drones == true and sam_site_jtacs_enable == true then
        activate_SAM1_jtac()
    end
end

function a2gsam2_start() --1 per group
    for i = 1, 1 do
        A2G_SAM:SpawnInZone(SAM2, true)
    end
    if enable_jtac_drones == true and sam_site_jtacs_enable == true then
        activate_SAM2_jtac()
    end
end

function a2gsam3_start() --1 per group
    for i = 1, 1 do
        A2G_SAM:SpawnInZone(SAM3, true)
    end
    if enable_jtac_drones == true and sam_site_jtacs_enable == true then
        activate_SAM3_jtac()
    end
end


function a2gj_start()
    HardMissionNameGen()
    trigger.action.setUserFlag('AG-STARTING', true)
    local switch = math.random (1,10)

    if switch == 1 then
        a2gj1_start()

    elseif switch ==2 then
        a2gj2_start()

    elseif switch ==3  then
        a2gj3_start()

    elseif switch ==4  then
        a2gj4_start()

    elseif switch ==5  then
        a2gj5_start()

    elseif switch == 6  then
        a2gj6_start()

    elseif switch == 7  then
        a2gj7_start()

    elseif switch == 8  then
        a2gj8_start()

    elseif switch == 9  then
        a2gj9_start()

    elseif switch == 10  then
        a2gj10_start()

    end
    arrayZoneAG[switch][4] = true
end

function a2gmr_start()
    EasyMissionNameGen()
    trigger.action.setUserFlag('MR-STARTING', true)
    local switch = math.random (1,10)

    if switch == 1 then
        a2gmr1_start()

    elseif switch ==2 then
        a2gmr2_start()

    elseif switch ==3  then
        a2gmr3_start()

    elseif switch ==4  then
        a2gmr4_start()

    elseif switch ==5  then
        a2gmr5_start()

    elseif switch ==6  then
        a2gmr6_start()

    elseif switch ==7  then
        a2gmr7_start()

    elseif switch ==8  then
        a2gmr8_start()

    elseif switch ==9  then
        a2gmr9_start()

    elseif switch ==10  then
        a2gmr10_start()


    end
    arrayZoneMR[switch][4] = true
end

function a2gas_start()
    ShipMissionNameGen()
    trigger.action.setUserFlag('AS-STARTING', true)
    local switch = math.random (1,5)

    if switch == 1 then
        a2gas1_start()

    elseif switch ==2 then
        a2gas2_start()

    elseif switch ==3  then
        a2gas3_start()

    elseif switch ==4  then
        a2gas4_start()

    elseif switch ==5  then
        a2gas5_start()
    end
    arrayZoneASS[switch][4] = true
end

function a2gh_start()
    HeloMissionNameGen()
    trigger.action.setUserFlag('AGH-STARTING', true)
    local switch = math.random(1, 5)


    if switch == 1 then
        a2gh1_start()
    elseif switch == 2 then
        a2gh2_start()
    elseif switch == 3 then
        a2gh3_start()
    elseif switch == 4 then
        a2gh4_start()
    elseif switch == 5 then
        a2gh5_start()
    elseif switch == 6 then
        a2gh6_start()
    elseif switch == 7 then
        a2gh7_start()
    elseif switch == 8 then
        a2gh8_start()
    elseif switch == 9 then
        a2gh9_start()
    elseif switch == 10 then
        a2gh10_start()

    end
    arrayZoneAGH[switch][4] = true
end


function a2gia_start()
    InfMissionNameGen()
    trigger.action.setUserFlag('AGHIA-STARTING', true)
    local switch = math.random(6, 10)
    if switch == 1 then
        a2gia1_start()
    elseif switch == 2 then
        a2gia2_start()
    elseif switch == 3 then
        a2gia3_start()
    elseif switch == 4 then
        a2gia4_start()
    elseif switch == 5 then
        a2gia5_start()
    elseif switch == 6 then
        env.info('TTI: Spawning infantry assault mission 6')
        a2gia6_start()
    elseif switch == 7 then
        env.info('TTI: Spawning infantry assault mission 7')
        a2gia7_start()
    elseif switch == 8 then
        env.info('TTI: Spawning infantry assault mission 8')
        a2gia8_start()
    elseif switch == 9 then
        env.info('TTI: Spawning infantry assault mission 9')
        a2gia9_start()
    elseif switch == 10 then
        env.info('TTI: Spawning infantry assault mission 10')
        a2gia10_start()
    end
    arrayZoneINFAS[switch-5][4] = true
end


function a2gj1_start()  --1 per group
    for i=1, a2g_hard_misc  do
        A2GJ:SpawnInZone( poly_AG1, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG1, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG1, true )
    end
    if enable_jtac_drones == true then
        activate_A2G1_jtac()
    end
    create_ag_1_marker()
end

function a2gj2_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG2, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG2, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG2, true )
    end
    if enable_jtac_drones == true then
        activate_A2G2_jtac()
    end
    create_ag_2_marker()
end

function a2gj3_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG3, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG3, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG3, true )
    end
    if enable_jtac_drones == true then
        activate_A2G3_jtac()
    end
    create_ag_3_marker()
end

function a2gj4_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG4, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG4, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG4, true )
    end
    if enable_jtac_drones == true then
        activate_A2G4_jtac()
    end
    create_ag_4_marker()
end

function a2gj5_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG5, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG5, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG5, true )
    end
    if enable_jtac_drones == true then
        activate_A2G5_jtac()
    end
    create_ag_5_marker()
end

function a2gj6_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG6, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG6, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG6, true )
    end
    if enable_jtac_drones == true then
        activate_A2G6_jtac()
    end
    create_ag_6_marker()
end

function a2gj7_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG7, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG7, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG7, true )
    end
    if enable_jtac_drones == true then
        activate_A2G7_jtac()
    end
    create_ag_7_marker()
end

function a2gj8_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG8, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG8, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG8, true )
    end
    if enable_jtac_drones == true then
        activate_A2G8_jtac()
    end
    create_ag_8_marker()
end

function a2gj9_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG9, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG9, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG9, true )
    end
    if enable_jtac_drones == true then
        activate_A2G9_jtac()
    end
    create_ag_9_marker()
end

function a2gj10_start()  --1 per group
    for i=1, a2g_hard_misc do
        A2GJ:SpawnInZone( poly_AG10, true )
    end
    for i=1, a2g_hard_aa do
        A2G_AA:SpawnInZone( poly_AG10, true )
    end
    for i=1, a2g_hard_sam do
        A2G_SAM:SpawnInZone( poly_AG10, true )
    end
    if enable_jtac_drones == true then
        activate_A2G10_jtac()
    end
    create_ag_10_marker()
end

function a2gmr1_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR1, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR1, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR1, true )
    end
    if enable_jtac_drones == true then
        activate_MR1_jtac()
    end
    create_mr_1_marker()
end

function a2gmr2_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR2, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR2, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR2, true )
    end
    if enable_jtac_drones == true then
        activate_MR2_jtac()
    end
    create_mr_2_marker()
end

function a2gmr3_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR3, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR3, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR3, true )
    end
    if enable_jtac_drones == true then
        activate_MR3_jtac()
    end
    create_mr_3_marker()
end

function a2gmr4_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR4, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR4, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR4, true )
    end
    if enable_jtac_drones == true then
        activate_MR4_jtac()
    end
    create_mr_4_marker()
end

function a2gmr5_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR5, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR5, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR5, true )
    end
    if enable_jtac_drones == true then
        activate_MR5_jtac()
    end
    create_mr_5_marker()
end

function a2gmr6_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR6, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR6, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR6, true )
    end
    if enable_jtac_drones == true then
        activate_MR6_jtac()
    end
    create_mr_6_marker()
end

function a2gmr7_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR7, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR7, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR7, true )
    end
    if enable_jtac_drones == true then
        activate_MR7_jtac()
    end
    create_mr_7_marker()
end

function a2gmr8_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR8, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR8, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR8, true )
    end
    if enable_jtac_drones == true then
        activate_MR8_jtac()
    end
    create_mr_8_marker()
end

function a2gmr9_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR9, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR9, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR9, true )
    end
    if enable_jtac_drones == true then
        activate_MR9_jtac()
    end
    create_mr_9_marker()
end

function a2gmr10_start()  --1 per group
    for i=1, a2g_easy_misc do
        A2GMR:SpawnInZone( poly_MR10, true )
    end
    for i=1, a2g_easy_aa do
        A2G_AA:SpawnInZone( poly_MR10, true )
    end
    for i=1, a2g_easy_sam do
        A2G_SAM:SpawnInZone( poly_MR10, true )
    end
    if enable_jtac_drones == true then
        activate_MR10_jtac()
    end
    create_mr_10_marker()
end

function a2gas1_start()  --1 per group
    if enemy_ship_ai == true then
        sp("AS_1")
    elseif enemy_ship_ai == false then
        sp("AS_1_disabled")
    end
    create_as_1_marker()
end


function a2gas2_start()  --1 per group
    if enemy_ship_ai == true then
        sp("AS_2")
    elseif enemy_ship_ai == false then
        sp("AS_2_disabled")
    end
    create_as_2_marker()
end


function a2gas3_start()  --1 per group
    if enemy_ship_ai == true then
        sp("AS_3")
    elseif enemy_ship_ai == false then
        sp("AS_3_disabled")
    end
    create_as_3_marker()
end

function a2gas4_start()  --4 per group
    if enemy_ship_ai == true then
        sp("AS_4")
    elseif enemy_ship_ai == false then
        sp("AS_4_disabled")
    end
    create_as_4_marker()
end


function a2gas5_start()  --5 per group
    if enemy_ship_ai == true then
        sp("AS_5")
    elseif enemy_ship_ai == false then
        sp("AS_5_disabled")
    end
    create_as_5_marker()
end

function a2gh1_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH1, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH1, true )
    end
    if enable_jtac_drones == true then
        activate_AGH1_jtac()
    end
    create_agh_1_marker()
end

function a2gh2_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH2, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH2, true )
    end
    if enable_jtac_drones == true then
        activate_AGH2_jtac()
    end
    create_agh_2_marker()
end

function a2gh3_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH3, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH3, true )
    end
    if enable_jtac_drones == true then
        activate_AGH3_jtac()
    end
    create_agh_3_marker()
end

function a2gh4_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH4, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH4, true )
    end
    if enable_jtac_drones == true then
        activate_AGH4_jtac()
    end
    create_agh_4_marker()
end

function a2gh5_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH5, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH5, true )
    end
    if enable_jtac_drones == true then
        activate_AGH5_jtac()
    end
    create_agh_5_marker()
end


function a2gh6_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH6, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH6, true )
    end
    if enable_jtac_drones == true then
        activate_AGH6_jtac()
    end
    create_agh_5_marker()
end

function a2gh7_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH7, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH7, true )
    end
    if enable_jtac_drones == true then
        activate_AGH7_jtac()
    end
    create_agh_7_marker()
end

function a2gh8_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH8, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH8, true )
    end
    if enable_jtac_drones == true then
        activate_AGH8_jtac()
    end
    create_agh_8_marker()
end

function a2gh9_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH9, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH9, true )
    end
    if enable_jtac_drones == true then
        activate_AGH9_jtac()
    end
    create_agh_9_marker()
end

function a2gh10_start()  --1 per group
    for i=1, a2g_helo_misc do
        A2GH:SpawnInZone( poly_AGH10, true )
    end
    for i=1, a2g_helo_aa do
        A2G_AA:SpawnInZone( poly_AGH10, true )
    end
    if enable_jtac_drones == true then
        activate_AGH10_jtac()
    end
    create_agh_10_marker()
end

function a2gia1_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH1, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH1, true )
    end
    if enable_jtac_drones == true then
        activate_AGH1_jtac()
    end
    create_infas_1_marker()
end

function a2gia2_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH2, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH2, true )
    end
    if enable_jtac_drones == true then
        activate_AGH2_jtac()
    end
    create_infas_2_marker()
end

function a2gia3_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH3, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH3, true )
    end
    if enable_jtac_drones == true then
        activate_AGH3_jtac()
    end
    create_infas_3_marker()
end

function a2gia4_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH4, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH4, true )
    end
    if enable_jtac_drones == true then
        activate_AGH4_jtac()
    end
    create_infas_4_marker()
end

function a2gia5_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH5, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH5, true )
    end
    if enable_jtac_drones == true then
        activate_AGH5_jtac()
    end
    create_infas_5_marker()
end

function a2gia6_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH6, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH6, true )
    end
    if enable_jtac_drones == true then
        activate_AGH6_jtac()
    end
    create_infas_6_marker()
end

function a2gia7_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH7, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH7, true )
    end
    if enable_jtac_drones == true then
        activate_AGH7_jtac()
    end
    create_infas_7_marker()
end

function a2gia8_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH8, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH8, true )
    end
    if enable_jtac_drones == true then
        activate_AGH8_jtac()
    end
    create_infas_8_marker()
end

function a2gia9_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH9, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH9, true )
    end
    if enable_jtac_drones == true then
        activate_AGH9_jtac()
    end
    create_infas_9_marker()
end

function a2gia10_start()  --1 per group
    for i=1, a2g_inf_troops do
        A2GIA:SpawnInZone( poly_AGH10, true )
    end
    for i=1, a2g_inf_misc do
        A2GIAM:SpawnInZone( poly_AGH10, true )
    end
    if enable_jtac_drones == true then
        activate_AGH10_jtac()
    end
    create_infas_10_marker()
end

env.info('functions ground init ok')

trigger.action.outText("Ground LUA File Loaded...", 10)
env.info('Deadly GROUND scripting complete')
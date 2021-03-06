env.info('Initiating Custom GROUND MOOSE for TTI ok')

TemplateTable_GROUND = { 

"ar_t90",
"ar_t80",
"ar_t72",
"ar_btr",
"ar_bmp",

"ar_t55",
"ar_bdrm",
"ar_btrpd",

"ua_fuel",

"ua_transport1",
"ua_transport2",
"ua_transport3",
}
 
TemplateTable_EASY_GROUND = { 
"aa_ural",
"ar_t90",
"ar_t80",
"ar_t72",
"ar_btr",
"ua_fuel",
"ua_transport1",
"ua_transport2",
"ua_transport3",
} 
 
 -- TemplateTable_SAM = { 
-- "sam_s3",
-- "sam_s2",
-- "sam_s10",
-- "sam_s6",
-- "sam_s11",
 -- } 
 
  -- TemplateTable_AA = { 
-- "aa_ural",
-- "aa_shilka",
-- "aa_tunguska",
-- "aa_strella",
-- "aa_osa",
-- "aa_manpads",
 -- } 
 
 TemplateTable_IA_GROUND = { 
"inf_1",
"inf_2",
"inf_3",
} 
 
  TemplateTable_IA_MISC = { 
"ua_fuel",

"ua_transport1",
"ua_transport2",
"ua_transport3",
} 
 
 
TemplateTable_SEA = { 
"ship_pyotr",
"ship_molniya",
"ship_neus",
}
env.info('template init ground ok')


AG1 				= 		ZONE:New( "AG1" ) 
AG2 				= 		ZONE:New( "AG2" ) 
AG3 				= 		ZONE:New( "AG3" ) 
AG4 				= 		ZONE:New( "AG4" ) 
AG5 				= 		ZONE:New( "AG5" ) 
AG6 				= 		ZONE:New( "AG6" ) 
AG7 				= 		ZONE:New( "AG7" ) 
AG8 				= 		ZONE:New( "AG8" ) 
AG9 				= 		ZONE:New( "AG9" ) 
AG10 				= 		ZONE:New( "AG10" ) 
AAA_ZONE 			= 		ZONE:New( "AAA_ZONE" ) 
klsv 				= 		ZONE:New( "klsv" )

AG1_vec = AG1:GetVec3()
AG2_vec = AG2:GetVec3()
AG3_vec = AG3:GetVec3()
AG4_vec = AG4:GetVec3()
AG5_vec = AG5:GetVec3()
AG6_vec = AG6:GetVec3()
AG7_vec = AG7:GetVec3()
AG8_vec = AG8:GetVec3()
AG9_vec = AG9:GetVec3()
AG10_vec = AG10:GetVec3()

MR1 				= 		ZONE:New( "MR1" ) 
MR2 				= 		ZONE:New( "MR2" ) 
MR3 				= 		ZONE:New( "MR3" ) 
MR4 				= 		ZONE:New( "MR4" ) 
MR5 				= 		ZONE:New( "MR5" )
MR6 				= 		ZONE:New( "MR6" ) 
MR7 				= 		ZONE:New( "MR7" ) 
MR8 				= 		ZONE:New( "MR8" ) 
MR9 				= 		ZONE:New( "MR9" ) 
MR10 				= 		ZONE:New( "MR10" ) 

MR1_vec = MR1:GetVec3()
MR2_vec = MR2:GetVec3()
MR3_vec = MR3:GetVec3()
MR4_vec = MR4:GetVec3()
MR5_vec = MR5:GetVec3()
MR6_vec = MR6:GetVec3()
MR7_vec = MR7:GetVec3()
MR8_vec = MR8:GetVec3()
MR9_vec = MR9:GetVec3()
MR10_vec = MR10:GetVec3()



AGH1 				= 		ZONE:New( "AGH1" ) 
AGH2 				= 		ZONE:New( "AGH2" ) 
AGH3 				= 		ZONE:New( "AGH3" ) 
AGH4 				= 		ZONE:New( "AGH4" ) 
AGH5 				= 		ZONE:New( "AGH5" ) 

AGH6 				= 		ZONE:New( "AGH6" ) 
AGH7 				= 		ZONE:New( "AGH7" ) 
AGH8 				= 		ZONE:New( "AGH8" ) 
AGH9 				= 		ZONE:New( "AGH9" ) 
AGH10 				= 		ZONE:New( "AGH10" ) 

AGH1_vec = AGH1:GetVec3()
AGH2_vec = AGH2:GetVec3()
AGH3_vec = AGH3:GetVec3()
AGH4_vec = AGH4:GetVec3()
AGH5_vec = AGH5:GetVec3()
AGH6_vec = AGH6:GetVec3()
AGH7_vec = AGH7:GetVec3()
AGH8_vec = AGH8:GetVec3()
AGH9_vec = AGH9:GetVec3()
AGH10_vec = AGH10:GetVec3()

if env.mission.theatre ~= "Nevada" then
ASS1 				= 		ZONE:New( "ASS1" ) 
ASS2 				= 		ZONE:New( "ASS2" ) 
ASS3				= 		ZONE:New( "ASS3" ) 
ASS4				= 		ZONE:New( "ASS4" ) 
ASS5 				= 		ZONE:New( "ASS5" ) 

ASS1_vec = ASS1:GetVec3()
ASS2_vec = ASS2:GetVec3()
ASS3_vec = ASS3:GetVec3()
ASS4_vec = ASS4:GetVec3()
ASS5_vec = ASS5:GetVec3()
end

SAM1 				= 		ZONE:New( "SAM1" ) 
SAM2 				= 		ZONE:New( "SAM2" ) 
SAM3 				= 		ZONE:New( "SAM3" ) 

env.info('Zone ground init ok')

--NORMAL
A2GJ = SPAWN:New( "A2G_Init" )
	:InitRandomizeTemplate( TemplateTable_GROUND )

A2GAS = SPAWN:New( "A2GAS_Init" )
	:InitRandomizeTemplate( TemplateTable_SEA )

A2GMR = SPAWN:New( "A2GMR_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	
A2GH = SPAWN:New( "A2GH_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	
A2GIA = SPAWN:New( "A2GIA_Init" )
	:InitRandomizeTemplate( TemplateTable_IA_GROUND )

A2GIAM = SPAWN:New( "A2GIAMISC_Init" )
	:InitRandomizeTemplate( TemplateTable_IA_MISC )
	
A2G_AA = SPAWN:New( "AA_Init" )
	:InitRandomizeTemplate( TemplateTable_AA )
	
A2G_SAM = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_SAM )
	
env.info('spawn objects ground init co ok')


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
		a2gia6_start()
	elseif switch == 7 then
		a2gia7_start()
	elseif switch == 8 then
		a2gia8_start()
	elseif switch == 9 then
		a2gia9_start()
	elseif switch == 10 then
		a2gia10_start()
	end
	arrayZoneINFAS[switch-5][4] = true
end


function a2gj1_start()  --1 per group
for i=1, a2g_hard_misc  do
	A2GJ:SpawnInZone( AG1, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG1, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG1, true )
end
if enable_jtac_drones == true then 
activate_A2G1_jtac()
end
create_ag_1_marker()
end

function a2gj2_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG2, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG2, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG2, true )
end
if enable_jtac_drones == true then 
activate_A2G2_jtac()
end
create_ag_2_marker()
end

function a2gj3_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG3, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG3, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG3, true )
end
if enable_jtac_drones == true then 
activate_A2G3_jtac()
end
create_ag_3_marker()
end

function a2gj4_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG4, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG4, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG4, true )
end
if enable_jtac_drones == true then 
activate_A2G4_jtac()
end
create_ag_4_marker()
end

function a2gj5_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG5, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG5, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG5, true )
end
if enable_jtac_drones == true then 
activate_A2G5_jtac()
end
create_ag_5_marker()
end

function a2gj6_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG6, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG6, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG6, true )
end
if enable_jtac_drones == true then 
activate_A2G6_jtac()
end
create_ag_6_marker()
end

function a2gj7_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG7, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG7, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG7, true )
end
if enable_jtac_drones == true then 
activate_A2G7_jtac()
end
create_ag_7_marker()
end

function a2gj8_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG8, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG8, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG8, true )
end
if enable_jtac_drones == true then 
activate_A2G8_jtac()
end
create_ag_8_marker()
end

function a2gj9_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG9, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG9, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG9, true )
end
if enable_jtac_drones == true then 
activate_A2G9_jtac()
end
create_ag_9_marker()
end

function a2gj10_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( AG10, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG10, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( AG10, true )
end
if enable_jtac_drones == true then 
activate_A2G10_jtac()
end
create_ag_10_marker()
end

function a2gmr1_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR1, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR1, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR1, true )
end
if enable_jtac_drones == true then 
activate_MR1_jtac()
end
create_mr_1_marker()
end

function a2gmr2_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR2, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR2, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR2, true )
end
if enable_jtac_drones == true then 
activate_MR2_jtac()
end
create_mr_2_marker()
end

function a2gmr3_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR3, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR3, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR3, true )
end
if enable_jtac_drones == true then 
activate_MR3_jtac()
end
create_mr_3_marker()
end

function a2gmr4_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR4, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR4, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR4, true )
end
if enable_jtac_drones == true then 
activate_MR4_jtac()
end
create_mr_4_marker()
end

function a2gmr5_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR5, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR5, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR5, true )
end
if enable_jtac_drones == true then 
activate_MR5_jtac()
end
create_mr_5_marker()
end

function a2gmr6_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR6, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR6, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR6, true )
end
if enable_jtac_drones == true then 
activate_MR6_jtac()
end
create_mr_6_marker()
end

function a2gmr7_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR7, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR7, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR7, true )
end
if enable_jtac_drones == true then 
activate_MR7_jtac()
end
create_mr_7_marker()
end

function a2gmr8_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR8, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR8, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR8, true )
end
if enable_jtac_drones == true then 
activate_MR8_jtac()
end
create_mr_8_marker()
end

function a2gmr9_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR9, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR9, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR9, true )
end
if enable_jtac_drones == true then 
activate_MR9_jtac()
end
create_mr_9_marker()
end

function a2gmr10_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR10, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR10, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( MR10, true )
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
	A2GH:SpawnInZone(  AGH1, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH1, true )
end
if enable_jtac_drones == true then 
activate_AGH1_jtac()
end
create_agh_1_marker()
end

function a2gh2_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone(  AGH2, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH2, true )
end
if enable_jtac_drones == true then 
activate_AGH2_jtac()
end
create_agh_2_marker()
end

function a2gh3_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( AGH3, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH3, true )
end
if enable_jtac_drones == true then 
activate_AGH3_jtac()
end
create_agh_3_marker()
end

function a2gh4_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( AGH4, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH4, true )
end
if enable_jtac_drones == true then 
activate_AGH4_jtac()
end
create_agh_4_marker()
end

function a2gh5_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( AGH5, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH5, true )
end
if enable_jtac_drones == true then 
activate_AGH5_jtac()
end
create_agh_5_marker()
end


function a2gh6_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone(  AGH6, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH6, true )
end
if enable_jtac_drones == true then 
activate_AGH6_jtac()
end
create_agh_5_marker()
end

function a2gh7_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone(  AGH7, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH7, true )
end
if enable_jtac_drones == true then 
activate_AGH7_jtac()
end
create_agh_7_marker()
end

function a2gh8_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( AGH8, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH8, true )
end
if enable_jtac_drones == true then 
activate_AGH8_jtac()
end
create_agh_8_marker()
end

function a2gh9_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( AGH9, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH9, true )
end
if enable_jtac_drones == true then 
activate_AGH9_jtac()
end
create_agh_9_marker()
end

function a2gh10_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( AGH10, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone(  AGH10, true )
end
if enable_jtac_drones == true then 
activate_AGH10_jtac()
end
create_agh_10_marker()
end

function a2gia1_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone(  AGH1, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH1, true )
end
if enable_jtac_drones == true then 
activate_AGH1_jtac()
end
create_infas_1_marker()
end

function a2gia2_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone(  AGH2, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH2, true )
end
if enable_jtac_drones == true then 
activate_AGH2_jtac()
end
create_infas_2_marker()
end

function a2gia3_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( AGH3, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH3, true )
end
if enable_jtac_drones == true then 
activate_AGH3_jtac()
end
create_infas_3_marker()
end

function a2gia4_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( AGH4, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH4, true )
end
if enable_jtac_drones == true then 
activate_AGH4_jtac()
end
create_infas_4_marker()
end

function a2gia5_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( AGH5, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH5, true )
end
if enable_jtac_drones == true then 
activate_AGH5_jtac()
end
create_infas_5_marker()
end

function a2gia6_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone(  AGH6, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH6, true )
end
if enable_jtac_drones == true then 
activate_AGH6_jtac()
end
create_infas_6_marker()
end

function a2gia7_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone(  AGH7, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH7, true )
end
if enable_jtac_drones == true then 
activate_AGH7_jtac()
end
create_infas_7_marker()
end

function a2gia8_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( AGH8, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH8, true )
end
if enable_jtac_drones == true then 
activate_AGH8_jtac()
end
create_infas_8_marker()
end

function a2gia9_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( AGH9, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH9, true )
end
if enable_jtac_drones == true then 
activate_AGH9_jtac()
end
create_infas_9_marker()
end

function a2gia10_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( AGH10, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone(  AGH10, true ) 
end
if enable_jtac_drones == true then 
activate_AGH10_jtac()
end
create_infas_10_marker()
end

env.info('functions ground init ok')

trigger.action.outText("Ground LUA File Loaded...", 10)
env.info('Deadly GROUND scripting complete')
--ADJUST RANDOM AI AIR TRAFFIC SPAWN SETTINGS HERE
--READ THE MISSION SETTINGS --README FILE FOR MORE DETAILS

random_civ_air_traffic = true
random_fighter_air_traffic = true


-- # of civ aircraft spawns PER TYPE,
civ_rat_spawns = 1

-- set # of fighter aircraft spawns, for each type individually

fighter_rat_a10_spawns = 0
fighter_rat_f18_grnd_spawns = 0
fighter_rat_f18_cv_spawns = 2
fighter_rat_f16_spawns = 2
fighter_rat_f15_spawns = 2
fighter_rat_f14_grnd_spawns = 2
fighter_rat_f14_cv_spawns = 2

air_traffic_flight_level = 350
--example:  200 = 20000ft

max_distance_destination = 800
--the max distance in KM
--of the ai aircaft's final destination airfield, which are chosen at random

civ_allow_immortal = false
civ_allow_invisible = false

fighter_jet_combat_mode = "return"
-- LEAVE IN QOUTES " "
-- free is weapons free
-- hold is weapons hold
-- return is return firef

fighter_jet_immortal = false
fighter_jet_invisible = false

--change takeoff setting for carrier ai aircraft
-- use "hot", "cold", or "runway"
cv_takeoff_mode = "cold"

-- enable or disable ai aircraft types that will spawn in (use true or false)
-- civilian
enable_yak = true
enable_c130 = true
enable_c17 = false
enable_an26 = true

-- fighter jet
enable_f14_cv_to_ground = true
enable_f14_ground_to_cv = true
enable_f15 = true
enable_f16 = true
enable_f18_cv_to_ground = true
enable_f18_ground_to_cv = true
enable_a10 = true

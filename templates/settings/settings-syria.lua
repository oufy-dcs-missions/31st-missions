-- *****************************************************************************
-- *                         AIRBOSS settings                                  *
-- *****************************************************************************
AirBossConfig = {
    {
        enable = true,
        carriername = 'CVW-7-1',
        alias = 'roosevelt',
        enable_markzones = true,
        enable_smokezones = false,
        enable_niceguy = true,
        handleAI = true,
        tacan = {
            channel = 71,
            mode = 'X',
            morse = 'RSV',
        },
        icls = {
            channel = 11,
            morse = 'RSVLSO',
        },
        freq = {
            base = 127.5,
            marshall = 134.00,
            lso = 126.5
        },
        infintepatrol = true,
        controlarea = 50,
        recoverycase = 1,
        maxpatterns = 5,
        difficulty = AIRBOSS.Difficulty.NORMAL,
        menurecovery = {
            enable = true,
            duration = 30,
            windondeck = 20,
            uturn = true
        },
        releayunit = {
            marshall = 'MarshallRelay',
            lso = 'LSORelay',
        },
        singlecarrier = true
    }
}

-- *****************************************************************************
-- *                         RAT settings                                      *
-- *****************************************************************************
RATConfig = {
    {
        name = 'civil',
        enable = true,
        aircrafts_groupconfigs = {
            {
                templatename = 'RAT-civil-1',
                spawns = 1,
                flightlevel = 260,
                inactive_timer = 300,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = true,
                airbases_names = {
                    departure = {
                        AIRBASE.Syria.Rene_Mouawad
                    },
                    arrival = {
                        AIRBASE.Syria.King_Hussein_Air_College
                    }
                }
            },
            {
                templatename = 'RAT-civil-2',
                spawns = 1,
                flightlevel = 220,
                inactive_timer = 1200,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        AIRBASE.Syria.King_Hussein_Air_College
                    },
                    arrival = {
                        AIRBASE.Syria.Beirut_Rafic_Hariri
                    }
                }
            },
            {
                templatename = 'RAT-civil-3',
                spawns = 1,
                flightlevel = 380,
                inactive_timer = 1200,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        AIRBASE.Syria.Adana_Sakirpasa,
                        AIRBASE.Syria.Haifa
                    },
                    arrival = {
                        AIRBASE.Syria.Haifa,
                        AIRBASE.Syria.Palmyra
                    }
                }
            }
        }
    },
    {
        name = 'military',
        enable = false,
        aircrafts_groupconfigs = {
            {
                templatename = 'RAT_C130@IFF:5551FR',
                spawns = 1,
                flightlevel = 140,
                inactive_timer = 300,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        AIRBASE.Caucasus.Sochi_Adler,
                        AIRBASE.Caucasus.Tbilisi_Lochini,
                        AIRBASE.Caucasus.Mineralnye_Vody,
                        AIRBASE.Caucasus.Sukhumi_Babushara
                    },
                    arrival = {
                        AIRBASE.Caucasus.Sochi_Adler,
                        AIRBASE.Caucasus.Tbilisi_Lochini,
                        AIRBASE.Caucasus.Mineralnye_Vody,
                        AIRBASE.Caucasus.Sukhumi_Babushara
                    }
                }
            },
            {
                templatename = 'RAT_C5@IFF:5552FR',
                spawns = 1,
                flightlevel = 260,
                inactive_timer = 1200,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        AIRBASE.Caucasus.Sochi_Adler,
                        AIRBASE.Caucasus.Tbilisi_Lochini,
                        AIRBASE.Caucasus.Mineralnye_Vody,
                        AIRBASE.Caucasus.Sukhumi_Babushara
                    },
                    arrival = {
                        AIRBASE.Caucasus.Sochi_Adler,
                        AIRBASE.Caucasus.Tbilisi_Lochini,
                        AIRBASE.Caucasus.Mineralnye_Vody,
                        AIRBASE.Caucasus.Sukhumi_Babushara
                    }
                }
            },
            {
                templatename = 'RAT_AN26@IFF:5553UN',
                spawns = 1,
                flightlevel = 260,
                inactive_timer = 900,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        AIRBASE.Caucasus.Sochi_Adler,
                        AIRBASE.Caucasus.Tbilisi_Lochini,
                        AIRBASE.Caucasus.Mineralnye_Vody,
                        AIRBASE.Caucasus.Sukhumi_Babushara
                    },
                    arrival = {
                        AIRBASE.Caucasus.Sochi_Adler,
                        AIRBASE.Caucasus.Tbilisi_Lochini,
                        AIRBASE.Caucasus.Mineralnye_Vody,
                        AIRBASE.Caucasus.Sukhumi_Babushara
                    }
                }
            }
        }
    }
}


TankersConfig = {
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'CVW-7-8',
        baseUnit = 'CVW-7-1',
        terminalType = AIRBASE.TerminalType.OpenMedOrBig,
        groupName = 'shell-1',
        airboss_recovery = true,
        escortgroupname = 'escort-2',
        altitude = 12500,
        speed = 270,
        tacan = {
            channel = 14,
            morse = 'SHL',
        },
        freq = 264,
        fuelwarninglevel = 15,
        racetrack = {
            front = 40,
            back = -10
        },
        modex = 702,
        callsign = {
            name = CALLSIGN.Tanker.Shell,
            number = 1
        }
    },
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'anchor-sea-2-1',
        baseUnit = AIRBASE.Syria.Megiddo,
        terminalType = AIRBASE.TerminalType.OpenBig,
        groupName = 'texaco-1',
        airboss_recovery = false,
        escortgroupname = 'escort-1',
        altitude = 28000,
        speed = 430,
        tacan = {
            channel = 15,
            morse = 'TEX',
        },
        freq = 264,
        fuelwarninglevel = 20,
        racetrack = {
            front = 50,
            back = 0
        },
        modex = 345,
        callsign = {
            name = CALLSIGN.Tanker.Texaco,
            number = 1
        }
    },
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'anchor-ground-2-1',
        baseUnit = AIRBASE.Syria.Incirlik,
        terminalType = AIRBASE.TerminalType.OpenBig,
        groupName = 'arco-1',
        airboss_recovery = false,
        escortgroupname = 'escort-1',
        altitude = 24000,
        speed = 430,
        tacan = {
            channel = 16,
            morse = 'ARC',
        },
        freq = 129,
        fuelwarninglevel = 20,
        racetrack = {
            front = 50,
            back = 0
        },
        modex = 347,
        callsign = {
            name = CALLSIGN.Tanker.Arco,
            number = 1
        }
    }
}

PedrosConfig = {
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'CVW-7-1',
        baseUnit = 'CVW-7-5',
        groupName = 'Pedro-1',
        freq = 127.5,
        modex = 704
    }
}


AwacsConfig = {
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'CVW-7-5',
        baseUnit = 'CVW-7-1',
        terminalType = AIRBASE.TerminalType.OpenMedOrBig,
        groupName = 'wizzard-1',
        airboss_recovery = true,
        escortgroupname = 'escort-4',
        altitude = 24000,
        speed = 380,
        freq = 265.8,
        fuelwarninglevel=25,
        racetrack = {
            front = 10,
            back = 10
        },
        tacan = {
            channel = 17,
            morse = 'WZD',
        },
        modex = 611,
        callsign = {
            name = CALLSIGN.AWACS.Wizard,
            number = 1
        }
    },
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'anchor-sea-3-1',
        baseUnit = AIRBASE.Syria.Incirlik,
        terminalType = AIRBASE.TerminalType.OpenBig,
        groupName = 'overlord-1',
        airboss_recovery = false,
        escortgroupname = 'escort-1',
        altitude = 34500,
        speed = 430,
        freq = 261,
        fuelwarninglevel=25,
        racetrack = {
            front = 60,
            back = 0
        },
        tacan = {
            channel = 18,
            morse = 'OVL',
        },
        modex = 705,
        callsign = {
            name = CALLSIGN.AWACS.Overlord,
            number = 1
        }
    }
}

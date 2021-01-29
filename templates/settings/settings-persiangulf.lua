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
        infintepatrol = false,
        controlarea = 50,
        recoverycase = 1,
        maxpatterns = 5,
        difficulty = AIRBOSS.Difficulty.NORMAL,
        menurecovery = {
            enable = true,
            duration = 30,
            windondeck = 20,
            offset = 20,
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
                        AIRBASE.PersianGulf.Fujairah_Intl
                    },
                    arrival = {
                        AIRBASE.PersianGulf.Bandar_Abbas_Intl
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
                        AIRBASE.PersianGulf.Al_Ain_International_Airport
                    },
                    arrival = {
                        AIRBASE.PersianGulf.Shiraz_International_Airport
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
                        AIRBASE.PersianGulf.Abu_Dhabi_International_Airport
                    },
                    arrival = {
                        'zone-RAT-Paris'
                    }
                }
            },
            {
                templatename = 'RAT-civil-4',
                spawns = 1,
                flightlevel = 380,
                inactive_timer = 1200,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        AIRBASE.PersianGulf.Shiraz_International_Airport
                    },
                    arrival = {
                        'zone-RAT-Sydney'
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
        patternUnit = 'anchor-texaco-1',
        baseUnit = AIRBASE.PersianGulf.Al_Dhafra_AB,
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
            front = 40,
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
        patternUnit = 'anchor-arco-1',
        baseUnit = AIRBASE.PersianGulf.Al_Dhafra_AB,
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
            front = 40,
            back = 10
        },
        modex = 347,
        callsign = {
            name = CALLSIGN.Tanker.Arco,
            number = 1
        }
    },
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'anchor-iranian-texaco-1',
        baseUnit = AIRBASE.PersianGulf.Kerman_Airport,
        terminalType = AIRBASE.TerminalType.OpenBig,
        groupName = 'KC135MPRS_template',
        airboss_recovery = false,
        escortgroupname = 'escort_F14',
        altitude = 28000,
        speed = 430,
        tacan = {
            channel = 101,
            morse = 'TEX',
        },
        freq = 264,
        fuelwarninglevel = 20,
        racetrack = {
            front = 60,
            back = 0
        },
        modex = 345,
        callsign = {
            name = CALLSIGN.Tanker.Texaco,
            number = 2
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
        patternUnit = 'anchor-overlord-1',
        baseUnit = AIRBASE.PersianGulf.Al_Dhafra_AB,
        terminalType = AIRBASE.TerminalType.OpenBig,
        groupName = 'overlord-1',
        airboss_recovery = false,
        escortgroupname = 'escort-1',
        altitude = 34500,
        speed = 430,
        freq = 261,
        fuelwarninglevel=25,
        racetrack = {
            front = 80,
            back = -10
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
    },
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'anchor-iranian-awacs-1',
        baseUnit = AIRBASE.PersianGulf.Kerman_Airport,
        terminalType = AIRBASE.TerminalType.OpenBig,
        groupName = 'A50_template',
        airboss_recovery = false,
        escortgroupname = 'escort_F14',
        altitude = 34500,
        speed = 430,
        freq = 261,
        fuelwarninglevel=25,
        racetrack = {
            front = 90,
            back = 0
        },
        tacan = {
            channel = 100,
            morse = 'DKS',
        },
        modex = 705,
        callsign = {
            name = CALLSIGN.AWACS.Darkstar,
            number = 2
        }
    }
}


CoalitionSquadrons = {
    {
        enable = false,
        bordersgroup = 'Iran',
        takeofftype = AI_A2A_DISPATCHER.Takeoff.Cold,
        landingtype = AI_A2A_DISPATCHER.Landing.AtEngineShutdown,
        detectionprefixarray = {'EWR IRAN'},
        AwacsTemplateName = 'A50_template',
        groupingrange = 30000,
        engageradius = 150000,
        abortradius = 300000,
        gciradius = 250000,
        fuelthreshold = 0.25,
        cappatrolpersquadron = 1,
        defaultpatrolgrouping = 2,
        debug = false,
        squadrons = {
            {
                enable = true,
                name = 'KermanF14CAP',
                base = AIRBASE.PersianGulf.Kerman_Airport,
                templatearray = {'F14_template'},
                numberofsplanes = 4,
                availabilityrate = 0.4,
                capzonegroup = 'Iran'
            },
            {
                enable = true,
                name = 'KermanF14Intercept',
                base = AIRBASE.PersianGulf.Kerman_Airport,
                templatearray = {'F14_template'},
                numberofsplanes = 4,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'LarF14CAP',
                base = AIRBASE.PersianGulf.Lar_Airbase,
                templatearray = {'F14_template'},
                numberofsplanes = 4,
                availabilityrate = 0.4,
                capzonegroup = 'Iran'
            },
            {
                enable = true,
                name = 'LarF14Intercept',
                base = AIRBASE.PersianGulf.Lar_Airbase,
                templatearray = {'F14_template'},
                numberofsplanes = 4,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'BandarEJaskF14Intercept',
                base = AIRBASE.PersianGulf.Bandar_e_Jask_airfield,
                templatearray = {'F14_template'},
                numberofsplanes = 4,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'HavadariaF14Inteercept',
                base = AIRBASE.PersianGulf.Havadarya,
                templatearray = {'F14_template'},
                numberofsplanes = 4,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'HavadariaF4CAP',
                base = AIRBASE.PersianGulf.Havadarya,
                templatearray = {'F4_template'},
                numberofsplanes = 12,
                availabilityrate = 0.35,
                capzonegroup = 'Iran'
            },
            {
                enable = true,
                name = 'JiroftF4CAP',
                base = AIRBASE.PersianGulf.Jiroft_Airport,
                templatearray = {'F4_template'},
                numberofsplanes = 12,
                availabilityrate = 0.35,
                capzonegroup = 'Iran'
            },
            {
                enable = true,
                name = 'LarF4CAP',
                base = AIRBASE.PersianGulf.Lar_Airbase,
                templatearray = {'F4_template'},
                numberofsplanes = 12,
                availabilityrate = 0.35,
                capzonegroup = 'Iran'
            },
            {
                enable = true,
                name = 'LavanF4Intercept',
                base = AIRBASE.PersianGulf.Lavan_Island_Airport,
                templatearray = {'F4_template'},
                numberofsplanes = 12,
                availabilityrate = 0.35
            },
            {
                enable = true,
                name = 'BandarAbbasF4Intercept',
                base = AIRBASE.PersianGulf.Bandar_Abbas_Intl,
                templatearray = {'F4_template'},
                numberofsplanes = 12,
                availabilityrate = 0.35
            },
            {
                enable = true,
                name = 'BandarLengehF4Intercept',
                base = AIRBASE.PersianGulf.Bandar_Lengeh,
                templatearray = {'F4_template'},
                numberofsplanes = 10,
                availabilityrate = 0.35
            },
            {
                enable = true,
                name = 'BandarLengehF5Intercept',
                base = AIRBASE.PersianGulf.Bandar_Lengeh,
                templatearray = {'F5_template'},
                numberofsplanes = 10,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'SirriF5CAP',
                base = AIRBASE.PersianGulf.Sirri_Island,
                templatearray = {'F5_template'},
                numberofsplanes = 10,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'KermanMig29Intercept',
                base = AIRBASE.PersianGulf.Kerman_Airport,
                templatearray = {'Mig29_template'},
                numberofsplanes = 6,
                availabilityrate = 0.6
            },
            {
                enable = true,
                name = 'KermanMig29CAP',
                base = AIRBASE.PersianGulf.Kerman_Airport,
                templatearray = {'Mig29_template'},
                numberofsplanes = 6,
                availabilityrate = 0.6,
                capzonegroup = 'Iran'
            },
            {
                enable = true,
                name = 'JiroftMig29Intercept',
                base = AIRBASE.PersianGulf.Jiroft_Airport,
                templatearray = {'Mig29_template'},
                numberofsplanes = 4,
                availabilityrate = 0.6
            },
            {
                enable = true,
                name = 'JiroftMig29CAP',
                base = AIRBASE.PersianGulf.Jiroft_Airport,
                templatearray = {'Mig29_template'},
                numberofsplanes = 4,
                availabilityrate = 0.6,
                capzonegroup = 'Iran'
            }
        }
    }
}

MantisConfig = {
    {
        enable = true,
        debug = false,
        name = 'iraniandefense',
        coalition = 'red',
        EWRPrefix = 'EWR IRAN',
        SAMPrefix = 'SAM IRAN',
        dynamic = {
            enable = true,
            HQGroupName = 'HQ IRAN-1',
            AwacsTemplateName = 'A50_template',
            advanced = true,
            ratio = 80,
            autorelocate = {
                hq = false,
                ewr = false
            }
        },
        EWRGrouping = 5000,
        EWRRange = 800000,
        SAMRadius = 40000,
        SAMRange = 75,
        DetectInterval = 30
    }
}

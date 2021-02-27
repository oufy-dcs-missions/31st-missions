---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by oufy.
--- DateTime: 11/02/2021 18:06
---
-- *****************************************************************************
-- *                         AIRBOSS settings                                  *
-- *****************************************************************************

AirBossConfig = {
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
                        AIRBASE.Nevada.McCarran_International_Airport
                    },
                    arrival = {
                        'RAT-NewYork'
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
                        AIRBASE.Nevada.McCarran_International_Airport
                    },
                    arrival = {
                        'RAT-SanFrancisco'
                    }
                }
            },
            {
                templatename = 'RAT-civil-3',
                spawns = 1,
                flightlevel = 325,
                inactive_timer = 1200,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        'RAT-LosAngeles'
                    },
                    arrival = {
                        'RAT-Washington'
                    }
                }
            },
            {
                templatename = 'RAT-civil-4',
                spawns = 1,
                flightlevel = 330,
                inactive_timer = 600,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        'RAT-SanFrancisco'
                    },
                    arrival = {
                        AIRBASE.Nevada.North_Las_Vegas
                    }
                }
            },
            {
                templatename = 'RAT-civil-5',
                spawns = 5,
                flightlevel = 30,
                inactive_timer = 600,
                allow_immortal = false,
                allow_invisible = true,
                atcmessage_enable = false,
                airbases_names = {
                    departure = {
                        AIRBASE.Nevada.North_Las_Vegas,
                        AIRBASE.Nevada.McCarran_International_Airport,
                        AIRBASE.Nevada.Boulder_City_Airport,
                        AIRBASE.Nevada.Henderson_Executive_Airport,
                        AIRBASE.Nevada.Jean_Airport,
                        AIRBASE.Nevada.Echo_Bay,
                        AIRBASE.Nevada.Mesquite,
                        'FARP-London'
                    },
                    arrival = {
                        AIRBASE.Nevada.North_Las_Vegas,
                        AIRBASE.Nevada.McCarran_International_Airport,
                        AIRBASE.Nevada.Boulder_City_Airport,
                        AIRBASE.Nevada.Henderson_Executive_Airport,
                        AIRBASE.Nevada.Jean_Airport,
                        AIRBASE.Nevada.Echo_Bay,
                        AIRBASE.Nevada.Mesquite,
                        'FARP-London'
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
                        AIRBASE.Caucasus.Sukhumi_Babushara,
                        AIRBASE:FindByName('London')
                    },
                    arrival = {
                        AIRBASE.Caucasus.Sochi_Adler,
                        AIRBASE.Caucasus.Tbilisi_Lochini,
                        AIRBASE.Caucasus.Mineralnye_Vody,
                        AIRBASE.Caucasus.Sukhumi_Babushara,
                        AIRBASE:FindByName('London')
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
        patternUnit = 'anchor-ground-2-1',
        baseUnit = AIRBASE.Nevada.Nellis_AFB,
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
        baseUnit = AIRBASE.Nevada.Nellis_AFB,
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
}


AwacsConfig = {
    {
        enable = true,
        autorespawn = true,
        patternUnit = 'anchor-ground-3-1',
        baseUnit = AIRBASE.Nevada.Nellis_AFB,
        terminalType = AIRBASE.TerminalType.OpenBig,
        groupName = 'overlord-1',
        airboss_recovery = false,
        escortgroupname = 'escort-3',
        altitude = 34500,
        speed = 430,
        freq = 125.000,
        fuelwarninglevel=25,
        racetrack = {
            front = 60,
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
        bordersgroup = 'Syrie',
        takeofftype = AI_A2A_DISPATCHER.Takeoff.Cold,
        landingtype = AI_A2A_DISPATCHER.Landing.AtEngineShutdown,
        detectionprefixarray = {'EWR_Syria'},
        AwacsTemplateName = 'A50_template',
        groupingrange = 30000,
        engageradius = 150000,
        abortradius = 300000,
        gciradius = 250000,
        fuelthreshold = 0.35,
        cappatrolpersquadron = 1,
        defaultpatrolgrouping = 2,
        debug = false,
        squadrons = {
            {
                enable = true,
                name = 'Abu_al_DuhurCAP',
                base = AIRBASE.Syria.Abu_al_Duhur,
                templatearray = {'Mig23_template-1'},
                numberofsplanes = 12,
                availabilityrate = 0.4,
                capzone = 'CAPDuhur'
            },
            {
                enable = true,
                name = 'Al_QusayrCAP',
                base = AIRBASE.Syria.Al_Qusayr,
                templatearray = {'Mig21_template-1'},
                numberofsplanes = 10,
                availabilityrate = 0.4,
                capzone = 'CAPBassel'
            },
            {
                enable = true,
                name = 'Al_QusayrIntercept1',
                base = AIRBASE.Syria.Al_Qusayr,
                templatearray = {'Mig21_template-1'},
                numberofsplanes = 8,
                availabilityrate = 0.5
            },
            {
                enable = true,
                name = 'An_NasiriyahCAP',
                base = AIRBASE.Syria.An_Nasiriyah,
                templatearray = {'Mig23_template-1'},
                numberofsplanes = 12,
                availabilityrate = 0.4,
                capzone = 'CAPDumayr'
            },
            {
                enable = true,
                name = 'An_NasiriyahIntercept',
                base = AIRBASE.Syria.An_Nasiriyah,
                templatearray = {'Mig23_template-1'},
                numberofsplanes = 12,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'KhalkhalahIntercept',
                base = AIRBASE.Syria.Khalkhalah,
                templatearray = {'Mig25_template-1','Mig21_template-1'},
                numberofsplanes = 24,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'KhalkhalahCAP',
                base = AIRBASE.Syria.Khalkhalah,
                templatearray = {'Mig25_template-1'},
                numberofsplanes = 8,
                availabilityrate = 0.6,
                capzone = 'CAPPalmyre'
            },
            {
                enable = true,
                name = 'Al_DumayrIntercept1',
                base = AIRBASE.Syria.Al_Dumayr,
                templatearray = {'Mig23_template-1'},
                numberofsplanes = 10,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'HamaIntercept',
                base = AIRBASE.Syria.Hama,
                templatearray = {'Mig21_template-1'},
                numberofsplanes = 10,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'Marj_as_Sultan_SouthIntercept',
                base = AIRBASE.Syria.Marj_as_Sultan_South,
                templatearray = {'Mig25_template-1','Mig23_template-1'},
                numberofsplanes = 16,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'Al_DumayrIntercept2',
                base = AIRBASE.Syria.Al_Dumayr,
                templatearray = {'Mig29_template-1'},
                numberofsplanes = 24,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'Al_QusayrIntercept2',
                base = AIRBASE.Syria.Al_Qusayr,
                templatearray = {'Mig23_template-1'},
                numberofsplanes = 8,
                availabilityrate = 0.4
            },
            {
                enable = true,
                name = 'TabqaCAP1',
                base = AIRBASE.Syria.Tabqa,
                templatearray = {'Mig21_template-1'},
                numberofsplanes = 6,
                availabilityrate = 0.7,
                capzone = 'CAPJira'
            },
            {
                enable = true,
                name = 'TabqaCAP2',
                base = AIRBASE.Syria.Tabqa,
                templatearray = {'Mig21_template-1'},
                numberofsplanes = 6,
                availabilityrate = 0.8,
                capzone = 'CAPAlep'
            }
        }
    },
    {
        enable = false,
        bordersgroup = 'Israel',
        takeofftype = AI_A2A_DISPATCHER.Takeoff.Cold,
        landingtype = AI_A2A_DISPATCHER.Landing.AtEngineShutdown,
        detectionprefixarray = {'EWR_Israel'},
        AwacsTemplateName = 'overlord-1',
        groupingrange = 30000,
        engageradius = 150000,
        abortradius = 300000,
        gciradius = 250000,
        fuelthreshold = 0.35,
        cappatrolpersquadron = 1,
        defaultpatrolgrouping = 2,
        debug = false,
        squadrons = {
            {
                enable = true,
                name = 'Ramat_DavidCAP1',
                base = AIRBASE.Syria.Ramat_David,
                templatearray = {'F16_template-1'},
                numberofsplanes = 8,
                availabilityrate = 0.7,
                capzone = 'CAPRamat'
            },
            {
                enable = true,
                name = 'Ramat_DavidIntercept',
                base = AIRBASE.Syria.Ramat_David,
                templatearray = {'F15_template-1'},
                numberofsplanes = 12,
                availabilityrate = 0.8
            }
        }
    },
    {
        enable = false,
        bordersgroup = 'Liban',
        takeofftype = AI_A2A_DISPATCHER.Takeoff.Cold,
        landingtype = AI_A2A_DISPATCHER.Landing.AtEngineShutdown,
        detectionprefixarray = {'EWR Liban'},
        AwacsTemplateName = '',
        groupingrange = 30000,
        engageradius = 150000,
        abortradius = 300000,
        gciradius = 250000,
        fuelthreshold = 0.35,
        cappatrolpersquadron = 1,
        defaultpatrolgrouping = 2,
        debug = false,
        squadrons = {
            {
                enable = true,
                name = 'Ramat_DavidCAP2',
                base = AIRBASE.Syria.Ramat_David,
                templatearray = {'F16_template-1'},
                numberofsplanes = 12,
                availabilityrate = 0.7,
                capzone = 'CAPBeyrouth'
            },
            {
                enable = true,
                name = 'HaifaCAP',
                base = AIRBASE.Syria.Haifa,
                templatearray = {'F16_template-1'},
                numberofsplanes = 8,
                availabilityrate = 0.7,
                capzone = 'CAPMouawad'
            },
            {
                enable = true,
                name = 'HaifaIntercept',
                base = AIRBASE.Syria.Haifa,
                templatearray = {'F15_template-1'},
                numberofsplanes = 12,
                availabilityrate = 0.8
            }
        }
    },
    {
        enable = false,
        bordersgroup = 'Turquie',
        takeofftype = AI_A2A_DISPATCHER.Takeoff.Cold,
        landingtype = AI_A2A_DISPATCHER.Landing.AtEngineShutdown,
        detectionprefixarray = {'EWR Turkey'},
        AwacsTemplateName = 'overlord-1',
        groupingrange = 30000,
        engageradius = 150000,
        abortradius = 300000,
        gciradius = 250000,
        fuelthreshold = 0.35,
        cappatrolpersquadron = 1,
        defaultpatrolgrouping = 2,
        debug = false,
        squadrons = {
            {
                enable = true,
                name = 'IncirlikCAP1',
                base = AIRBASE.Syria.Incirlik,
                templatearray = {'F4_template-1','F16_template-3'},
                numberofsplanes = 12,
                availabilityrate = 0.6,
                capzone = 'CAPIncirlik'
            },
            {
                enable = true,
                name = 'IncirlikCAP2',
                base = AIRBASE.Syria.Incirlik,
                templatearray = {'F16_template-2','F15_template-3'},
                numberofsplanes = 12,
                availabilityrate = 0.5,
                capzone = 'CAPGaz'
            },
            {
                enable = true,
                name = 'IncirlikIntercept',
                base = AIRBASE.Syria.Incirlik,
                templatearray = {'F4_template-1','F16_template-3','F16_template-2','F15_template-3'},
                numberofsplanes = 24,
                availabilityrate = 0.8
            }
        }
    }
}

IADSConfig = {
    {
        enable = false,
        debug = false,
        name = 'defense_Syria',
        EWRPrefix = 'EWR_Syria',
        SAMPrefix = 'SAM_Syria',
        CommandCenterGroup = 'HQ_Syria-1',
        coalition = coalition.side.RED,
        interconnectionsconfig = {
            EWR = {
                {
                    unitname = 'EWR_Syria-1-1',
                    communicationstatic = 'IADSComm-6',
                    powerstatic = 'IADSGPU-1',
                    pointdefensegroupname = 'SAM_Syria_MOBILE-1'
                },
                {
                    unitname = 'EWR_Syria-2-1',
                    communicationstatic = 'IADSComm-1',
                    powerstatic = '',
                    pointdefensegroupname = 'SAM_Syria_POINTDEF-1'
                },
                {
                    unitname = 'EWR_Syria-3-1',
                    communicationstatic = 'IADSComm-3',
                    powerstatic = 'IADSGPU-3',
                    pointdefensegroupname = ''
                },
                {
                    unitname = 'EWR_Syria-4-1',
                    communicationstatic = 'IADSComm-4',
                    powerstatic = 'IADSGPU-4',
                    pointdefensegroupname = 'SAM_Syria_MOBILE-2'
                }
            },
            SAM = {
                {
                    groupname = 'SAM_Syria_SA10-1',
                    communicationstatic = 'IADSComm-1',
                    powerstatic = '',
                    pointdefensegroupname = 'SAM_Syria_POINTDEF-5',
                    isew = true
                },
                {
                    groupname = 'SAM_Syria_SA11-1',
                    communicationstatic = 'IADSComm-5',
                    powerstatic = 'IADSGPU-5',
                    pointdefensegroupname = 'SAM_Syria_POINTDEF-4',
                    isew = false
                },
                {
                    groupname = 'SAM_Syria_SA2-1',
                    communicationstatic = 'IADSComm-3',
                    powerstatic = 'IADSGPU-25',
                    pointdefensegroupname = 'SAM_Syria_POINTDEF-6',
                    isew = false
                },
                {
                    groupname = 'SAM_Syria_SA6-1',
                    communicationstatic = 'IADSComm-6',
                    powerstatic = '',
                    pointdefensegroupname = 'SAM_Syria_POINTDEF-2',
                    isew = false
                },
                {
                    groupname = 'SAM_Syria_SA6-2',
                    communicationstatic = 'IADSComm-2',
                    powerstatic = 'IADSGPU-2',
                    pointdefensegroupname = 'SAM_Syria_POINTDEF-3',
                    isew = true
                }
            },
            HQ = {
                {
                    groupname = 'HQ_Syria-1',
                    communicationstatic = {
                        'IADSComm-1'
                    },
                    powerstatic = '',
                    pointdefensegroupname = 'SAM_Syria_POINTDEF-1'
                }
            }
        },
        AwacsTemplateName = 'A50_template',
        SAMRange = 75,
        HARMDetectionChance = 50,
        DetectInterval = 0
    },
    {
        enable = false,
        debug = false,
        name = 'defense_Israel',
        EWRPrefix = 'EWR_Israel',
        SAMPrefix = 'SAM_Israel',
        CommandCenterGroup = 'HQ_Israel-1',
        coalition = coalition.side.BLUE,
        interconnectionsconfig = {
            EWR = {
                {
                    unitname = 'EWR_Israel-1-1',
                    communicationstatic = 'IADSComm-7',
                    powerstatic = 'IADSGPU-6',
                    pointdefensegroupname = 'SAM_Israel_POINTDEF-1'
                },
                {
                    unitname = 'EWR_Israel-2-1',
                    communicationstatic = 'IADSComm-8',
                    powerstatic = 'IADSGPU-7',
                    pointdefensegroupname = 'SAM_Israel_POINTDEF-2'
                }
            },
            SAM = {
            },
            HQ = {
                {
                    groupname = 'HQ_Israel-1',
                    communicationstatic = {
                        'IADSComm-9'
                    },
                    powerstatic = '',
                    pointdefensegroupname = 'SAM_Israel_POINTDEF-6'
                }
            }
        },
        AwacsTemplateName = 'overlord-1',
        SAMRange = 75,
        HARMDetectionChance = 50,
        DetectInterval = 0
    },
    {
        enable = false,
        debug = false,
        name = 'defense_Turkey',
        EWRPrefix = 'EWR_Turkey',
        SAMPrefix = 'SAM_Turkey',
        CommandCenterGroup = 'HQ_Turkey-1',
        coalition = coalition.side.BLUE,
        interconnectionsconfig = {
            EWR = {
                {
                    unitname = 'EWR_Turkey-1-1',
                    communicationstatic = 'IADSComm-10',
                    powerstatic = 'IADSGPU-8',
                    pointdefensegroupname = 'SAM_Turkey_POINTDEF-1'
                },
                {
                    unitname = 'EWR_Turkey-2-1',
                    communicationstatic = 'IADSComm-11',
                    powerstatic = 'IADSGPU-9',
                    pointdefensegroupname = 'SAM_Turkey_POINTDEF-2'
                },
                {
                    unitname = 'EWR_Turkey-3-1',
                    communicationstatic = 'IADSComm-12',
                    powerstatic = '',
                    pointdefensegroupname = 'SAM_Turkey_POINTDEF-3'
                },
                {
                    unitname = 'EWR_Turkey-4-1',
                    communicationstatic = 'IADSComm-16',
                    powerstatic = 'IADSGPU-14',
                    pointdefensegroupname = 'IADSComm-16'
                }
            },
            SAM = {
                {
                    groupname = 'SAM_Turkey_Rapier-1',
                    communicationstatic = 'IADSComm-12',
                    powerstatic = 'IADSGPU-11',
                    pointdefensegroupname = '',
                    isew = false
                },
                {
                    groupname = 'SAM_Turkey_Hawk-1',
                    communicationstatic = 'IADSComm-10',
                    powerstatic = 'IADSGPU-13',
                    pointdefensegroupname = 'SAM_Turkey_POINTDEF-5',
                    isew = true
                },
                {
                    groupname = 'SAM_Turkey_Rapier-2',
                    communicationstatic = 'IADSComm-14',
                    powerstatic = '',
                    pointdefensegroupname = 'SAM_Turkey_POINTDEF-6',
                    isew = false
                },
                {
                    groupname = 'SAM_Turkey_Rapier-3',
                    communicationstatic = 'IADSComm-15',
                    powerstatic = 'IADSGPU-12',
                    pointdefensegroupname = 'SAM_Turkey_POINTDEF-7',
                    isew = false
                },
                {
                    groupname = 'SAM_Turkey_SA3-1',
                    communicationstatic = '',
                    powerstatic = 'IADSGPU-10',
                    pointdefensegroupname = '',
                    isew = false
                }
            },
            HQ = {
                {
                    groupname = 'HQ_Turkey-1',
                    communicationstatic = {
                        'IADSComm-13'
                    },
                    powerstatic = '',
                    pointdefensegroupname = 'SAM_Turkey_POINTDEF-4'
                }
            }
        },
        AwacsTemplateName = 'overlord-1',
        SAMRange = 75,
        HARMDetectionChance = 50,
        DetectInterval = 0
    }
}


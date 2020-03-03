spawnArco = SPAWN:New("arco")
spawnTexaco = SPAWN:New("texaco")

groupArco = spawnArco:Spawn()
groupTexaco = spawnTexaco:Spawn()



groupEscortArco = LIB31ST_ESCORT:spawnEscortInZone("escort_tomcat","popup_escort_tankers",groupArco,265.00,"Excellent",false)
groupEscortTexaco = LIB31ST_ESCORT:spawnEscortInZone("escort_hornet","popup_escort_tankers",groupTexaco,265.00,"Excellent",false)


groupRed = LIB31ST_CAP:spawnCAPInZone("RedFleetCAP","popup_red_fleetCAP",251.00, "Excellent" )
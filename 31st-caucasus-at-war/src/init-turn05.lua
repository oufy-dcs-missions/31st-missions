---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by oufy.
--- DateTime: 15/10/2020 23:27
---

trigger.action.setUserFlag("SSB",100)

humanUnits = {
    --Felix-1
    "unit|2|6|25|F-14B| Pilot #1",
    "unit|2|6|25|F-14B| Pilot #2",
    --Super
    "unit|2|8|25|F-16C_50| Pilot #1",
    "unit|2|8|25|F-16C_50| Pilot #2",
    "unit|2|8|25|F-16C_50| Pilot #3",
    "unit|2|8|25|F-16C_50| Pilot #4",
    --Frelon
    "unit|2|7|25|FA-18C_hornet| Pilot #1",
    "unit|2|7|25|FA-18C_hornet| Pilot #2",
    --Hawg
    "unit|2|11|31|A-10C| Pilot #1",
    "unit|2|11|31|A-10C| Pilot #2",
    "unit|2|11|31|A-10C| Pilot #3",
    "unit|2|11|31|A-10C| Pilot #4",
    --Alouette
    "unit|2|10|31|Ka-50| Pilot #1",
}

function getClientFromUnitName (_unitName)
    return CLIENT:FindByName(_unitName)
end

arrClients={}
for _unitIndex,_unitName in pairs(humanUnits) do
    arrClients._unitName = getClientFromUnitName(_unitName)
    arrClients._unitName:HandleEvent( EVENTS.Crash )
    function arrClients._unitName:OnEventCrash( EventData )
        self:E( "Crash de "..EventData.IniUnitName.." Le Flag ssb_"..EventData.IniUnitName.." va être fixé à 100" )
        trigger.action.setUserFlag("ssb_"..EventData.IniUnitName,100)
    end
    arrClients._unitName:HandleEvent( EVENTS.Ejection )
    function arrClients._unitName:OnEventEjection( EventData )
        self:E( "Ejection de "..EventData.IniUnitName.." Le Flag ssb_"..EventData.IniUnitName.." va être fixé à 100" )
        trigger.action.setUserFlag("ssb_"..EventData.IniUnitName,100)
    end
    --arrClients._unitName:HandleEvent( EVENTS.Dead )
    --function arrClients._unitName:OnEventDead(EventData)
    --    self:E( "Mort de "..EventData.IniUnitName.." Le Flag ssb_"..EventData.IniUnitName.." va être fixé à 100" )
    --    trigger.action.setUserFlag("ssb_"..EventData.IniUnitName,100)
    --end
end
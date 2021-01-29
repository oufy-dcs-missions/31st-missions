Scheduler:Schedule(nil, StartMove, { groupTruckNuke }, 1, 20 )
startUncontrolledAirGroup(groupAntonovNuke)
startUncontrolledAirGroup(groupEscortAntonovNuke)
-- groupAntonovNuke:SetCommand({ 
--   id = 'Start', 
--   params = { 
--   } 
-- })
-- groupEscortAntonovNuke:SetCommand({ 
--   id = 'Start', 
--   params = { 
--   } 
-- })
local PointVec3 = POINT_VEC3:New( 1000, 0, -1000 ) -- This is a Vec3 class.
local FollowDCSTask = groupEscortAntonovNuke:TaskFollow( groupAntonovNuke, PointVec3:GetVec3() )
groupEscortAntonovNuke:PushTask( FollowDCSTask, 1 )

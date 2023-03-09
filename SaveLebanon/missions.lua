US_CC = COMMANDCENTER:New( GROUP:FindByName( "HQ Blue" ), "USA HQ" )

-- Set zones to capture
HamaCaptureZone = ZONE:New( "Zone Hama" )
DamascusCaptureZone = ZONE:New( "Zone Damascus" )

HamaCoord = AIRBASE:FindByName(AIRBASE.Syria.Hama):GetCoordinate()
DamascusCoord = AIRBASE:FindByName(AIRBASE.Syria.Damascus):GetCoordinate()

HamaCoord:CircleToAll(11000, -1, { 1, 0, 0 }, 0.3, { 1, 0, 0 }, 0.3)
DamascusCoord:CircleToAll(9000, -1, { 1, 0, 0 }, 0.3, { 1, 0, 0 }, 0.3)

-- Setup zones
HamaCaptureCoalition = ZONE_CAPTURE_COALITION:New( HamaCaptureZone, coalition.side.RED )
HamaCaptureCoalition:__Guard( 1 )
HamaCaptureCoalition:Start( 5, 30 )

DamascusCaptureCoalition = ZONE_CAPTURE_COALITION:New( DamascusCaptureZone, coalition.side.RED )
DamascusCaptureCoalition:__Guard( 1 )
DamascusCaptureCoalition:Start( 5, 30 )

-- When zones is cleared
function HamaCaptureCoalition:OnEnterEmpty( From, Event, To)
  HamaCoord:CircleToAll(9000, -1, { 0, 0, 1 }, 0.3, {0, 0, 1}, 0.3)
  US_CC:MessageTypeToCoalition( "Hama est à nous !", MESSAGE.Type.Information )
end

function DamascusCaptureCoalition:OnEnterEmpty( From, Event, To)
  DamascusCoord:CircleToAll(9000, -1, { 0, 0, 1 }, 0.3, {0, 0, 1}, 0.3)
  US_CC:MessageTypeToCoalition( "Nous avons capturé Damascus", MESSAGE.Type.Information )
end

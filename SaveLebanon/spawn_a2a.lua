-- 1km = 0.54nm
DetectionRadius = 212000 --115.00nm
EngageRadius = 150000 -- 81.00nm
GCIRadius = 75000 -- 40.50nm
NumberOfAirplanePerGroup = 1
NumberOfCAPNorth = 2
NumberOfCAPSouth = 2
FuelTreshold = 0.2

-- Airports = { "Hama", "Damascus" }
SquadronTemplates = { "SQ MIG-29", "SQ SU-33" }

-- Setup A2A Dispatcher
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "EWR Red", "AWACS Red" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, DetectionRadius )

A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

RedBorderZone = ZONE_POLYGON:New( "Red Border", GROUP:FindByName( "Red Border" ) )
A2ADispatcher:SetBorderZone( { RedBorderZone } )

A2ADispatcher:SetTacticalDisplay( true )
-- A2ADispatcher:SetRefreshTimeInterval( 5 )
-- A2ADispatcher:SetReportDisplayTime( 10 )

A2ADispatcher:SetEngageRadius( EngageRadius )
A2ADispatcher:SetGciRadius( GCIRadius )

A2ADispatcher:SetDefaultTakeoffFromRunway()
A2ADispatcher:SetDefaultLandingAtRunway()

-- for i = 1, #Airports do
--   A2ADispatcher:SetSquadron( Airports[i], AIRBASE:FindByName(Airports[i]), SquadronTemplates, 15 )
--   A2ADispatcher:SetSquadronGrouping( Airports[i], NumberOfAirplanePerGroup )
--   A2ADispatcher:SetSquadronFuelThreshold( Airports[i], FuelTreshold )

--   A2ADispatcher:SetSquadronGci( Airports[i], 900, 1200 )
-- end

-- Setup Squadrons
A2ADispatcher:SetSquadron( "Hama", AIRBASE.Syria.Hama, SquadronTemplates, 15 )
A2ADispatcher:SetSquadronGrouping( "Hama", NumberOfAirplanePerGroup )
A2ADispatcher:SetSquadronFuelThreshold( "Hama", FuelTreshold )

A2ADispatcher:SetSquadron( "Damascus", AIRBASE.Syria.Damascus, SquadronTemplates, 15 )
A2ADispatcher:SetSquadronGrouping( "Damascus", NumberOfAirplanePerGroup )
A2ADispatcher:SetSquadronFuelThreshold( "Damascus", FuelTreshold )
A2ADispatcher:SetSquadronTanker( "Damascus", "Tank Damascus" )

-- GCI
A2ADispatcher:SetSquadronGci( "Hama", 900, 1200 )
A2ADispatcher:SetSquadronGci( "Damascus", 900, 1200 )

-- CAP
CAPZoneNorth = ZONE:New("CAP Zone North")
A2ADispatcher:SetSquadronCap( "Hama", CAPZoneNorth, 4000, 10000, 500, 600, 800, 900 )
A2ADispatcher:SetSquadronCapInterval( "Hama", NumberOfCAPNorth, 30, 60, 1 )

CAPZoneSouth = ZONE:New("CAP Zone South")
A2ADispatcher:SetSquadronCap( "Damascus", CAPZoneSouth, 4000, 10000, 500, 600, 800, 900 )
A2ADispatcher:SetSquadronCapInterval( "Damascus", NumberOfCAPSouth, 30, 60, 1 )

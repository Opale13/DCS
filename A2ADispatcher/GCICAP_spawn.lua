-- 1km = 0.54nm
DetectionRadius = 150000 -- 81.00nm
EngageRadius = 150000 -- 81.00nm
GCIRadius = 75000 -- 40.50nm

Airports = {
  {
    ["Name"]=AIRBASE.Syria.Larnaca,
    ["HaveCAP"]=true,
    ["HaveGCI"]= false,
    ["NumberOfAirplanePerGroup"] = 1,
    ["NumberOfCAP"] = 2,
    ["CAPZone"] = "CAP Zone #001",
    ["FuelTreshold"] = 0.2
  }
}

SquadronTemplates = { "SQ MIG-29", "SQ SU-33" }
DetectionsTable = { "EWR Red", "AWACS Red" }

-- Setup A2A Dispatcher
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( DetectionsTable )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, DetectionRadius )

A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

RedBorderZone = ZONE_POLYGON:New( "Red Border", GROUP:FindByName( "Red Border" ) )
A2ADispatcher:SetBorderZone( { RedBorderZone } )

A2ADispatcher:SetTacticalDisplay( true )

A2ADispatcher:SetEngageRadius( EngageRadius )
A2ADispatcher:SetGciRadius( GCIRadius )

A2ADispatcher:SetDefaultTakeoffFromRunway()
A2ADispatcher:SetDefaultLandingAtEngineShutdown()

-- Create CAP and/or GCI automaticaly
for i=1, #Airports do
  AirportName = Airports[i].Name
  AirportHaveCAP = Airports[i].HaveCAP
  AirportHaveGCI = Airports[i].HaveGCI

  if AirportHaveCAP == false and AirportHaveGCI == false then
    break
  else
    A2ADispatcher:SetSquadron( AirportName, AirportName, SquadronTemplates, 15 )
    A2ADispatcher:SetSquadronGrouping( AirportName, Airports[i].NumberOfAirplanePerGroup )
    A2ADispatcher:SetSquadronFuelThreshold( AirportName, Airports[i].FuelTreshold )
  end

  if AirportHaveCAP == true then
    CAPZone = ZONE:New(Airports[i].CAPZone)
    A2ADispatcher:SetSquadronCap( AirportName, CAPZone, 4000, 10000, 500, 600, 800, 900 )
    A2ADispatcher:SetSquadronCapInterval( AirportName, Airports[i].NumberOfCAP, 30, 60, 1 )
  end

  if AirportHaveGCI == true then
    A2ADispatcher:SetSquadronGci( AirportName, 900, 1200 )
  end
end

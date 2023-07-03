function SetupA2ADispatcher ( ColalitionA2A )
  -- Setup EWR
  DetectionSetGroup = SET_GROUP:New()
  DetectionSetGroup:FilterPrefixes( ColalitionA2A.DetectionsTable )
  DetectionSetGroup:FilterStart()

  Detection = DETECTION_AREAS:New( DetectionSetGroup, ColalitionA2A.DetectionRadius )

  -- Setup A2A Dispatcher
  A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

  A2ADispatcher:SetTacticalDisplay( true )

  A2ADispatcher:SetEngageRadius( ColalitionA2A.EngageRadius )
  A2ADispatcher:SetGciRadius( ColalitionA2A.GCIRadius )

  A2ADispatcher:SetDefaultTakeoffFromRunway()
  A2ADispatcher:SetDefaultLandingAtEngineShutdown()

  -- Setup border
  if GROUP:FindByName( ColalitionA2A.BorderName ) ~= nil then
    BorderZone = ZONE_POLYGON:New( ColalitionA2A.BorderName, GROUP:FindByName( ColalitionA2A.BorderName ) )
    A2ADispatcher:SetBorderZone( { BorderZone } )
  end

  return A2ADispatcher
end

-- Create CAP and/or GCI automaticaly
function SetupSquadron( Dispatcher, Airport )
  AirportName = Airport.Name
  AirportHaveCAP = Airport.HaveCAP
  AirportHaveGCI = Airport.HaveGCI

  if AirportHaveCAP == false and AirportHaveGCI == false then
    do return end
  end

  for i=1, #Airport.SquadronOptions do
    SquadronOption = Airport.SquadronOptions[i]
    CAPOptions = SquadronOption.CAP
    GCIOptions = SquadronOption.GCI

    Dispatcher:SetSquadron( SquadronOption.Name, AirportName, SquadronOption.Templates, SquadronOption.ResourceCount )
    Dispatcher:SetSquadronGrouping( SquadronOption.Name, SquadronOption.AirplanesPerGroup )
    Dispatcher:SetSquadronFuelThreshold( SquadronOption.Name, SquadronOption.FuelTreshold )

    if AirportHaveCAP == true then
      Dispatcher:SetSquadronCap(
        SquadronOption.Name,
        ZONE:New(CAPOptions.Zone),
        CAPOptions.MinimumAltitude,
        CAPOptions.MiximumAltitude,
        CAPOptions.MinimumSpeed,
        CAPOptions.MiximumSpeed,
        CAPOptions.MinimumEngageSpeed,
        CAPOptions.MiximumEngageSpeed
      )
      Dispatcher:SetSquadronCapInterval(
        SquadronOption.Name,
        CAPOptions.NumberOfGroup,
        CAPOptions.MinimumTimeSpawning,
        CAPOptions.MaximumTimeSpawning
      )
    end

    if AirportHaveGCI == true then
      Dispatcher:SetSquadronGci(
        SquadronOption.Name,
        GCIOptions.MinimumEngageSpeed,
        GCIOptions.MaximumEngageSpeed
      )
    end
  end
end

-- Init A2A
RedDispatcher = SetupA2ADispatcher( RedA2A )
BlueDispatcher = SetupA2ADispatcher( BlueA2A )

for i=1, #Airports do
  if Airports[i].Coalition == "RED" then
    SetupSquadron( RedDispatcher, Airports[i] )
  else
    SetupSquadron( BlueDispatcher, Airports[i] )
  end
end

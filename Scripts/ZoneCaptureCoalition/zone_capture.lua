Airports = {
  {
    ["Name"]=AIRBASE.Syria.Larnaca,
    ["Radius"] = 45000,
    ["Coalition"] = "RED"
  },
  {
    ["Name"]=AIRBASE.Syria.Akrotiri,
    ["Radius"] = 11000,
    ["Coalition"] = "BLUE"
  }
}

Color = {
  ["WHITE"] = { 1, 1, 1 },
  ["RED"] = { 1, 0, 0 },
  ["BLUE"] = { 0, 0, 1 }
}

for i=1, #Airports do
  Airports[i].Zone = AIRBASE:FindByName(Airports[i].Name):GetCoordinate()
  Airports[i].Zone.MarkID = Airports[i].Zone:CircleToAll(Airports[i].Radius, -1, Color[Airports[i].Coalition], 0.3, Color[Airports[i].Coalition], 0.3)

  ZoneToCapture = ZONE_AIRBASE:New(Airports[i].Name, Airports[i].Radius)

  ZoneCaptureCoalition = ZONE_CAPTURE_COALITION:New( ZoneToCapture, coalition.side[Airports[i].Coalition] )
  ZoneCaptureCoalition:__Guard( 1 )
  ZoneCaptureCoalition:Start( 5, 30 )

  function ZoneCaptureCoalition:OnEnterEmpty( From, Event, To)
    COORDINATE:RemoveMark(Airports[i].Zone.MarkID)
    Airports[i].Zone.MarkID = Airports[i].Zone:CircleToAll(Airports[i].Radius, -1, Color.WHITE, 0.3, Color.WHITE, 0.3)
    --US_CC:MessageTypeToCoalition( Airports[i].Name .. " est à nous !", MESSAGE.Type.Information )
  end

  function ZoneCaptureCoalition:OnEnterGuarded( From, Event, To )
    if From ~= To then
      local Coalition = self:GetCoalition()
      self:E( { Coalition = Coalition } )

      COORDINATE:RemoveMark(Airports[i].Zone.MarkID)
      if Coalition == coalition.side.BLUE then
        Airports[i].Zone.MarkID = Airports[i].Zone:CircleToAll(Airports[i].Radius, -1, Color.BLUE, 0.3, Color.BLUE, 0.3)
      else
        Airports[i].Zone.MarkID = Airports[i].Zone:CircleToAll(Airports[i].Radius, -1, Color.RED, 0.3, Color.RED, 0.3)
      end
    end
  end
end

Colors = {
  ["WHITE"] = { 1, 1, 1 },
  ["RED"] = { 1, 0, 0 },
  ["BLUE"] = { 0, 0, 1 }
}

-- Zones to clean
for i=1, #Zones do
  Zone = ZONE:New( Zones[i].Name )

  ZoneCaptureCoalition = ZONE_CAPTURE_COALITION:New( Zone, coalition.side[Zones[i].Coalition] )
  ZoneCaptureCoalition:__Guard( 1 )
  ZoneCaptureCoalition:SetMarkZone( true )
  ZoneCaptureCoalition:DrawZone( -1, Colors[Zones[i].Coalition], 0.3, Colors[Zones[i].Coalition], 0.3 )
  ZoneCaptureCoalition:Start( 5, 30 )

  function ZoneCaptureCoalition:OnEnterEmpty( From, Event, To)
    if From ~= To then
      local Coalition = self:GetCoalition()
      self:E( { Coalition = Coalition } )

      self:UndrawZone()
      self:DrawZone( -1, Colors.WHITE, 0.3, Colors.WHITE, 0.3 )

    end
  end

  function ZoneCaptureCoalition:OnEnterGuarded( From, Event, To )
    -- RED = 1; BLUE = 2
    if From ~= To then
      local Coalition = self:GetCoalition()
      -- self:E( { Coalition = Coalition } )
      -- trigger.action.outText( Coalition, 10 )

      local color = "RED"
      if Coalition == coalition.side.BLUE then
        color = "BLUE"
      end
      self:UndrawZone()
      self:DrawZone( -1, Colors[color], 0.3, Colors[color], 0.3 )
    end
  end
end

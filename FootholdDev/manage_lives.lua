-- if not CountLive then
--   CountLive = 1
-- do

-- for i=1, #PlayersTable do
--   env.info("Debug: " .. Unit.getName(PlayersTable[i]))
-- end

MaxLife = 1
PlayersTable = {}

PlayersList = net.get_player_list()
trigger.action.outTExt( "Display player list", 15)
for i=1, #PlayersList do
  trigger.action.outTExt( PlayersList[i], 15 )
end

-- function AddPlayerInTable( PlayerName, MaxLife )
--   local AddPlayer = true
--   for i=1, #PlayersTable do
--     if PlayersTable[i].Name == PlayerName then
--       trigger.action.outText( PlayerName .. " already exists", 20)
--       AddPlayer = false
--       break
--     end
--   end

--   if AddPlayer then
--     table.insert(PlayersTable, {
--       ["Name"] = PlayerName,
--       ["Life"] = MaxLife
--     })

--     trigger.action.outText( PlayerName .. " added in table", 20)
--   end
-- end

-- function RemoveLife( PlayerName )
--   for i=1, #PlayersTable do
--     if PlayersTable[i].Name == PlayerName then
--       PlayersTable[i].Life = PlayersTable[i].Life - 1
--       trigger.action.outText( PlayerName .. " - 1 life: " .. PlayersTable[i].Life, 20 )
--       break
--     end
--   end
-- end

-- local EventHandler = {}
-- function EventHandler:onEvent( event )
--   if event.id == world.event.S_EVENT_PLAYER_ENTER_UNIT then
--     EventUnit = event.initiator

--     if EventUnit ~= nil then
--       PlayerName = EventUnit:getPlayerName()
--       AddPlayerInTable( PlayerName, MaxLife )

--       for i=1, #PlayersTable do
--         trigger.action.outText( PlayersTable[i].Name .. " - " .. PlayersTable[i].Life, 10 )
--       end
--     end
--   end

--   if event.id == world.event.S_EVENT_PILOT_DEAD then
--     EventUnit = event.initiator

--     if EventUnit ~= nil then
--       PlayerName = EventUnit:getPlayerName()
--       RemoveLife( PlayerName )

--       for i=1, #PlayersTable do
--         trigger.action.outText( PlayersTable[i].Name .. " - " .. PlayersTable[i].Life, 10 )
--       end
--     end
--   end
-- end
-- world.addEventHandler( EventHandler )

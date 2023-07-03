BudgetTotal = 1000000

WeaponCategoriesCost = {
  ["0"] = 100,
  ["1"] = 200,
  ["2"] = 300,
  ["3"] = 400
}

function DecreaseBudget( WeaponCategory )
  BudgetTotal = BudgetTotal - WeaponCategoriesCost[WeaponCategory]
  trigger.action.outText( "BudgetTotal: "..BudgetTotal, 60 )
end

local EventHandler = {}
function EventHandler:onEvent( event )
  -- Decrease budget
  if event.id == world.event.S_EVENT_SHOT then
    DecreaseBudget( event.weapon:getCategory() )

  elseif event.id == world.event.S_EVENT_PILOT_DEAD then
    InitiatorUnit = event.InitiatorUnit
    UnitWeapons = InitiatorUnit:getAmmo()

    for i=1, #UnitWeapons do
      DecreaseBudget( UnitWeapons[i]["desc"]["category"] )
      trigger.action.outText( tostring(UnitWeapons[i]["desc"]["category"]), 60 )
    end

  elseif event.id == world.event.S_EVENT_WEAPON_DROP then
    trigger.action.outText( event.weapon_name, 60 )

  -- Increase budget
  elseif event.id == world.event.S_EVENT_DEAD then
    Initiator = event.initiator
    if Initiator == nil or Initiator:getCategory() != 1 then
      do return end
    end

    -- Check if initiator is an enemy
    if Initiator:getCoalition() != .... then
      do return end
    end

    -- Check if enemy is destroyed

    -- Increase budget
  end
end
world.addEventHandler( EventHandler )
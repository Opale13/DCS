-- Setup coalition
-- EnemyCoalition="RED"

-- -- A2A setup
RedA2A = {
  ["DetectionRadius"] = 5000,
  ["EngageRadius"] = 10000,
  ["GCIRadius"] = 20000,
  ["DetectionsTable"] = { "EWR Red" },
  ["BorderName"] = "Red Border"
}

BlueA2A = {
  ["DetectionRadius"] = 5000,
  ["EngageRadius"] = 10000,
  ["GCIRadius"] = 20000,
  ["DetectionsTable"] = { "Blue AWACS" },
  ["BorderName"] = "Blue Border"
}

Airports = {
  {
    ["Name"]=AIRBASE.Syria.Damascus,
    ["Coalition"] = "RED",
    ["HaveCAP"] = true,
    ["HaveGCI"] = true,
    ["SquadronOptions"] = {
      {
        ["Name"] = "URSS 52th",
        ["Templates"] = { "SQ MIG29", "SQ MIG31" },
        ["AirplanesPerGroup"] = 2,
        ["ResourceCount"] = 6,
        ["FuelTreshold"] = 0.2,
        ["CAP"] = {
          ["Zone"] = "CAP Damascus",
          ["NumberOfGroup"] = 2,
          ["MinimumAltitude"] = 10000,
          ["MiximumAltitude"] = 25000,
          ["MinimumSpeed"] = 500,
          ["MiximumSpeed"] = 600,
          ["MinimumEngageSpeed"] = 800,
          ["MiximumEngageSpeed"] = 900,
          ["MinimumTimeSpawning"] = 180,
          ["MaximumTimeSpawning"] = 600
        },
        ["GCI"] = {
          ["MinimumEngageSpeed"] = 900,
          ["MaximumEngageSpeed"] = 1200
        }
      }
    }
  },
  {
    ["Name"]=AIRBASE.Syria.Beirut_Rafic_Hariri,
    ["Coalition"] = "BLUE",
    ["HaveCAP"] = true,
    ["HaveGCI"] = true,
    ["SquadronOptions"] = {
      {
        ["Name"] = "US 105th",
        ["Templates"] = { "SQ F18" },
        ["AirplanesPerGroup"] = 2,
        ["ResourceCount"] = 4,
        ["FuelTreshold"] = 0.2,
        ["CAP"] = {
          ["Zone"] = "CAP Beirut North",
          ["NumberOfGroup"] = 2,
          ["MinimumAltitude"] = 10000,
          ["MiximumAltitude"] = 25000,
          ["MinimumSpeed"] = 500,
          ["MiximumSpeed"] = 600,
          ["MinimumEngageSpeed"] = 800,
          ["MiximumEngageSpeed"] = 900,
          ["MinimumTimeSpawning"] = 180,
          ["MaximumTimeSpawning"] = 600
        },
        ["GCI"] = {
          ["MinimumEngageSpeed"] = 900,
          ["MaximumEngageSpeed"] = 1200
        }
      },
      {
        ["Name"] = "US 104th",
        ["Templates"] = { "SQ F18" },
        ["AirplanesPerGroup"] = 2,
        ["ResourceCount"] = 4,
        ["FuelTreshold"] = 0.2,
        ["CAP"] = {
          ["Zone"] = "CAP Beirut South",
          ["NumberOfGroup"] = 2,
          ["MinimumAltitude"] = 10000,
          ["MiximumAltitude"] = 25000,
          ["MinimumSpeed"] = 500,
          ["MiximumSpeed"] = 600,
          ["MinimumEngageSpeed"] = 800,
          ["MiximumEngageSpeed"] = 900,
          ["MinimumTimeSpawning"] = 180,
          ["MaximumTimeSpawning"] = 600
        },
        ["GCI"] = {
          ["MinimumEngageSpeed"] = 900,
          ["MaximumEngageSpeed"] = 1200
        }
      }
    }
  }
}

Zones = {
  {
    ["Name"] = "Alpha",
    ["Coalition"] = "RED"
  }
}
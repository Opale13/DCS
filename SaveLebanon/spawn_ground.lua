AlQusayrSamZone = ZONE:New( "Zone SAM Hama" )
DamascusSAMSpawn = ZONE:New( "Zone SAM Damascus" )

AGTemplates = {
  "ag template #001",
  "ag template #002"
}

InfTemplates = {
  "inf template #001",
  "inf template #002",
  "inf template #003"
}

SAMTemplates = {
  "sam template #001",
  "sam template #002",
  "sam template #003"
}

-- Hama
for i=1, 3, 1
do
  SPAWN
    :New( "AG Hama #00" .. i)
    :InitRandomizeTemplate( AGTemplates )
    :Spawn()
end

SPAWN
  :New( "Inf Hama #001")
  :InitRandomizeTemplate( InfTemplates )
  :Spawn()

SPAWN
  :New( "SAM Hama" )
  :InitRandomizeTemplate( SAMTemplates )
  :SpawnInZone( AlQusayrSamZone, true )


-- Damascus
for i=1, 3, 1
do
  SPAWN
  :New("AG Damascus #00" .. i)
  :InitRandomizeTemplate( AGTemplates )
  :Spawn()
end

for i=1, 2, 1
do
  SPAWN
  :New( "Inf Damascus #00" .. i)
  :InitRandomizeTemplate( InfTemplates )
  :Spawn()
end

SPAWN
  :New( "SAM Damascus")
  :InitRandomizeTemplate( SAMTemplates )
  :SpawnInZone( DamascusSAMSpawn, true )

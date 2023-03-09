# GCICAP

## How to setup ?

```lua
-- 1km = 0.54nm
---------------
-- WIP
DetectionRadius = 150000 
-- Define radius around enemies where CAP will attack
EngageRadius = 150000
-- Define radius around airport where if enemies enter, the GCI will spawn    
GCIRadius = 75000        

Airports = {
    {
        -- The airport name were CAP and/or GCI will spawn (check Syria Airports and PersianGulf Airports section)
        ["Name"]=AIRBASE.Syria.Larnaca, 
        -- Define if CAP will spawn at the airport
        ["HaveCAP"]=true,
        -- Define if GCI will spawn at the airport
        ["HaveGCI"]= false,
        -- Define number of units by group
        ["NumberOfAirplanePerGroup"] = 1,
        -- Define the number of CAP group that will spawn 
        ["NumberOfCAP"] = 2,
        -- Define the zone name where the CAP will patrol
        ["CAPZone"] = "",
        -- Define the fuel treshold where the airplane will RTB or an air refuel
        ["FuelTreshold"] = 0.2
    },
    -- Repeat for each airport where you need to spawn GCI or CAP
    {
        ...
    }
    
}

-- Define the squadron templates that will choose for spawn
SquadronTemplates = { "SQ MIG-29", "SQ SU-33" }
-- WIP
DetectionsTAble = { "EWR Red" }
```

## Syria Airports
AIRBASE.Syria.Kuweires
AIRBASE.Syria.Marj_Ruhayyil
AIRBASE.Syria.Kiryat_Shmona
AIRBASE.Syria.Marj_as_Sultan_North
AIRBASE.Syria.Eyn_Shemer
AIRBASE.Syria.Incirlik
AIRBASE.Syria.Damascus
AIRBASE.Syria.Bassel_Al_Assad
AIRBASE.Syria.Rosh_Pina
AIRBASE.Syria.Aleppo
AIRBASE.Syria.Al_Qusayr
AIRBASE.Syria.Wujah_Al_Hajar
AIRBASE.Syria.Al_Dumayr
AIRBASE.Syria.Gazipasa
AIRBASE.Syria.Hatay
AIRBASE.Syria.Nicosia
AIRBASE.Syria.Pinarbashi
AIRBASE.Syria.Paphos
AIRBASE.Syria.Kingsfield
AIRBASE.Syria.Thalah
AIRBASE.Syria.Haifa
AIRBASE.Syria.Khalkhalah
AIRBASE.Syria.Megiddo
AIRBASE.Syria.Lakatamia
AIRBASE.Syria.Rayak
AIRBASE.Syria.Larnaca
AIRBASE.Syria.Mezzeh
AIRBASE.Syria.Gecitkale
AIRBASE.Syria.Akrotiri
AIRBASE.Syria.Naqoura
AIRBASE.Syria.Gaziantep
AIRBASE.Syria.Sayqal
AIRBASE.Syria.Tiyas
AIRBASE.Syria.Shayrat
AIRBASE.Syria.Taftanaz
AIRBASE.Syria.H4
AIRBASE.Syria.King_Hussein_Air_College
AIRBASE.Syria.Rene_Mouawad
AIRBASE.Syria.Jirah
AIRBASE.Syria.Ramat_David
AIRBASE.Syria.Qabr_as_Sitt
AIRBASE.Syria.Minakh
AIRBASE.Syria.Adana_Sakirpasa
AIRBASE.Syria.Palmyra
AIRBASE.Syria.Hama
AIRBASE.Syria.Ercan
AIRBASE.Syria.Marj_as_Sultan_South
AIRBASE.Syria.Tabqa
AIRBASE.Syria.Beirut_Rafic_Hariri
AIRBASE.Syria.An_Nasiriyah
AIRBASE.Syria.Abu_al_Duhur
AIRBASE.Syria.At_Tanf
AIRBASE.Syria.H3
AIRBASE.Syria.H3_Northwest
AIRBASE.Syria.H3_Southwest
AIRBASE.Syria.Kharab_Ishk
AIRBASE.Syria.Raj_al_Issa_East
AIRBASE.Syria.Raj_al_Issa_West
AIRBASE.Syria.Ruwayshid
AIRBASE.Syria.Sanliurfa
AIRBASE.Syria.Tal_Siman
AIRBASE.Syria.Deir_ez_Zor

## PersianGulf Airports
AIRBASE.PersianGulf.Abu_Dhabi_International_Airport
AIRBASE.PersianGulf.Abu_Musa_Island_Airport
AIRBASE.PersianGulf.Al_Bateen_Airport
AIRBASE.PersianGulf.Al_Ain_International_Airport
AIRBASE.PersianGulf.Al_Dhafra_AB
AIRBASE.PersianGulf.Al_Maktoum_Intl
AIRBASE.PersianGulf.Al_Minhad_AB
AIRBASE.PersianGulf.Bandar_e_Jask_airfield
AIRBASE.PersianGulf.Bandar_Abbas_Intl
AIRBASE.PersianGulf.Bandar_Lengeh
AIRBASE.PersianGulf.Dubai_Intl
AIRBASE.PersianGulf.Fujairah_Intl
AIRBASE.PersianGulf.Havadarya
AIRBASE.PersianGulf.Jiroft_Airport
AIRBASE.PersianGulf.Kerman_Airport
AIRBASE.PersianGulf.Khasab
AIRBASE.PersianGulf.Kish_International_Airport
AIRBASE.PersianGulf.Lar_Airbase
AIRBASE.PersianGulf.Lavan_Island_Airport
AIRBASE.PersianGulf.Liwa_Airbase
AIRBASE.PersianGulf.Qeshm_Island
AIRBASE.PersianGulf.Ras_Al_Khaimah
AIRBASE.PersianGulf.Sas_Al_Nakheel_Airport
AIRBASE.PersianGulf.Sharjah_Intl
AIRBASE.PersianGulf.Shiraz_International_Airport
AIRBASE.PersianGulf.Sir_Abu_Nuayr
AIRBASE.PersianGulf.Sirri_Island
AIRBASE.PersianGulf.Tunb_Island_AFB
AIRBASE.PersianGulf.Tunb_Kochak

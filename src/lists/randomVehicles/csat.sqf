/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_vehicles", "_veh", "_variants"];

if (!isServer) exitWith {};

private _include = "IncludeIranian" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Quadbike
_vehicles = createHashMap;

// Quadbike
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_Quadbike_01_ghex_F"];
        };
        default
        {
            _veh = ["O_Quadbike_01_F"];
        };
    };
}
else
{
    _veh = ["O_Quadbike_01_F"];
};

_vehicles set ["quadbike", [_veh, true, true]];

_dict set [RAND_VEH_QUADBIKE_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = createHashMap;

// Qilin
if (Escape_Using_Apex) then
{
    if (Escape_Csat_Use_Camo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _variants = ["GreenHex"];
            };
            default
            {
                _variants = ["Arid"];
            };
        };
    }
    else
    {
        _variants = ["Arid", "Black"];
    };

    _vehicles set ["qilin", [["O_LSV_02_unarmed_F"], _variants, true]];
};

_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = createHashMap;

// Qilin
if (Escape_Using_Apex) then
{
    if (Escape_Csat_Use_Camo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _variants = ["GreenHex"];
            };
            default
            {
                _variants = ["Arid"];
            };
        };
    }
    else
    {
        _variants = ["Arid", "Black"];
    };

    _vehicles set ["qilin", [["O_LSV_02_armed_F", "O_LSV_02_AT_F"], _variants, true]];
};

_dict set [RAND_VEH_CAR_ARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;

// Zamak
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_Truck_02_transport_F", "O_T_Truck_02_covered_F"];
        };
        default
        {
            _veh = ["O_Truck_02_transport_F", "O_Truck_02_covered_F"];
        };
    };
}
else
{
    _veh = ["O_Truck_02_transport_F", "O_Truck_02_covered_F"];
};

_vehicles set ["zamak", [_veh, true, true]];

// Tempest
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_Truck_03_transport_ghex_F", "O_T_Truck_03_covered_ghex_F", "O_T_Truck_03_device_ghex_F"];
        };
        default
        {
            _veh = ["O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_Truck_03_device_F"];
        };
    };
}
else
{
    _veh = ["O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_Truck_03_device_F"];
};

_vehicles set ["tempest", [_veh, true, true]];

_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks armed
_vehicles = createHashMap;
_dict set [RAND_VEH_TRUCK_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;

// Zamak
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh =
            [
                "O_T_Truck_02_box_F",
                "O_T_Truck_02_Ammo_F",
                "O_T_Truck_02_fuel_F",
                "O_T_Truck_02_medical_F"
            ];
        };
        default
        {
            _veh =
            [
                "O_Truck_02_box_F",
                "O_Truck_02_Ammo_F",
                "O_Truck_02_fuel_F",
                "O_Truck_02_medical_F"
            ];
        };
    };
}
else
{
    _veh = ["O_Truck_02_box_F", "O_Truck_02_Ammo_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F"];
};

_vehicles set ["zamak", [_veh, true, true]];

// Tempest
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh =
            [
                "O_T_Truck_03_ammo_ghex_F",
                "O_T_Truck_03_fuel_ghex_F",
                "O_T_Truck_03_medical_ghex_F",
                "O_T_Truck_03_repair_ghex_F"
            ];
        };
        default
        {
            _veh =
            [
                "O_Truck_03_ammo_F",
                "O_Truck_03_fuel_F",
                "O_Truck_03_medical_F",
                "O_Truck_03_repair_F"
            ];
        };
    };
}
else
{
    _veh = ["O_Truck_03_ammo_F", "O_Truck_03_fuel_F", "O_Truck_03_medical_F", "O_Truck_03_repair_F"];
};

_vehicles set ["tempest", [_veh, true, true]];

_dict set [RAND_VEH_UTIL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = createHashMap;

// Ifrit
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_MRAP_02_ghex_F"];
        };
        default
        {
            _veh = ["O_MRAP_02_F"];
        };
    };
}
else
{
    _veh = ["O_MRAP_02_F"];
};

_vehicles set ["ifrit", [_veh, true, true]];

_dict set [RAND_VEH_MRAP_UNARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = createHashMap;

// Ifrit
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_MRAP_02_hmg_ghex_F", "O_T_MRAP_02_gmg_ghex_F"];
        };
        default
        {
            _veh = ["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"];
        };
    };
}
else
{
    _veh = ["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"];
};

_vehicles set ["ifrit", [_veh, true, true]];

_dict set [RAND_VEH_MRAP_ARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV unarmed
_vehicles = createHashMap;

// Stomper
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_UGV_01_ghex_F"];
        };
        default
        {
            _veh = ["O_UGV_01_F"];
        };
    };
}
else
{
    _veh = ["O_UGV_01_F"];
};

_vehicles set ["stomper", [_veh, true, true]];

_dict set [RAND_VEH_UGV_UNARMED_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV armed
_vehicles = createHashMap;

// Stomper
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_UGV_01_rcws_ghex_F"];
        };
        default
        {
            _veh = ["O_UGV_01_rcws_F"];
        };
    };
}
else
{
    _veh = ["O_UGV_01_rcws_F"];
};

_vehicles set ["stomper", [_veh, true, true]];

_dict set [RAND_VEH_UGV_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = createHashMap;

// Marid
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_APC_Wheeled_02_rcws_v2_ghex_F"];
        };
        default
        {
            _veh = ["O_APC_Wheeled_02_rcws_v2_F"];
        };
    };
}
else
{
    _veh = ["O_APC_Wheeled_02_rcws_v2_F"];
};

_vehicles set ["marid", [
    _veh,
    true,
    ["Escape_Marid_Default", "Escape_Marid_Cage", "Escape_Marid_Net"]
]];

_dict set [RAND_VEH_IFV_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = createHashMap;

// Kamysh
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_APC_Tracked_02_cannon_ghex_F"];
        };
        default
        {
            _veh = ["O_APC_Tracked_02_cannon_F"];
        };
    };
}
else
{
    _veh = ["O_APC_Tracked_02_cannon_F"];
};

_vehicles set ["kamysh", [
    _veh,
    true,
    ["Escape_Kamysh_Default", "Escape_Kamysh_Cage", "Escape_Kamysh_Net"]
]];

_dict set [RAND_VEH_APC_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = createHashMap;

// T-100
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_MBT_02_cannon_ghex_F"];
        };
        default
        {
            _veh = ["O_MBT_02_cannon_F"];
        };
    };
}
else
{
    _veh = ["O_MBT_02_cannon_F"];
};

_vehicles set ["t100", [_veh, true, ["Escape_T100_Default", "Escape_T100_Net"]]];

// T-140
if (Escape_Using_Tanks) then
{
    if (Escape_Csat_Use_Camo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _variants = ["GreenHex"];
            };
            default
            {
                _variants = ["Hex"];
            };
        };
    }
    else
    {
        _variants = ["Hex", "Grey", "Jungle"];
    };

    _vehicles set ["t140", [
        ["O_MBT_04_cannon_F", "O_MBT_04_command_F"],
        _variants,
        ["Escape_T140_Default", "Escape_T140_Net"]
    ]];
};

_dict set [RAND_VEH_TANK_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Tank special
_vehicles = createHashMap;
_dict set [RAND_VEH_TANK_SPECIAL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = createHashMap;

// Sochor
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_MBT_02_arty_ghex_F"];
        };
        default
        {
            _veh = ["O_MBT_02_arty_F"];
        };
    };
}
else
{
    _veh = ["O_MBT_02_arty_F"];
};

_vehicles set ["sochor", [
    _veh,
    true,
    ["Escape_Sochor_Default", "Escape_Sochor_Net"]
]];

_dict set [RAND_VEH_ARTY_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = createHashMap;

// Tigris
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _veh = ["O_T_APC_Tracked_02_AA_ghex_F"];
        };
        default
        {
            _veh = ["O_APC_Tracked_02_AA_F"];
        };
    };
}
else
{
    _veh = ["O_APC_Tracked_02_AA_F"];
};

_vehicles set ["tigris", [
    _veh,
    true,
    ["Escape_Tigris_Default", "Escape_Tigris_Cage", "Escape_Tigris_Net"]
]];

_dict set [RAND_VEH_AA_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = createHashMap;

// Orca
if (Escape_Csat_Use_Camo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _variants = ["Black"];
        };
        default
        {
            _variants = ["Opfor"];
        };
    };
}
else
{
    _variants = ["Opfor", "Black", "Blackcustom"];
};

_vehicles set ["orca", [["O_Heli_Light_02_unarmed_F"], _variants, true]];

// Taru
if (Escape_Using_Heli) then
{
    if (Escape_Csat_Use_Camo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _variants = ["Black"];
            };
            default
            {
                _variants = ["Opfor"];
            };
        };
    }
    else
    {
        _variants = ["Opfor", "Black"];
    };

    _vehicles set ["taru", [
        ["O_Heli_Transport_04_covered_F", "O_Heli_Transport_04_bench_F"],
        _variants,
        true
    ]];
};

_dict set [RAND_VEH_HELI_T_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = createHashMap;

// Orca
if (Escape_Csat_Use_Camo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _variants = ["Black"];
        };
        default
        {
            _variants = ["Opfor"];
        };
    };
}
else
{
    _variants = ["Opfor", "Black", "Blackcustom"];
};

_vehicles set ["orca", [
    ["O_Heli_Light_02_dynamicLoadout_F", "O_Heli_Light_02_v2_F"],
    _variants,
    true
]];

_dict set [RAND_VEH_HELI_L_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = createHashMap;

// Kajman
if (Escape_Csat_Use_Camo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _variants = ["Black"];
        };
        default
        {
            _variants = ["Opfor"];
        };
    };
}
else
{
    _variants = ["Opfor", "Black"];
};

_vehicles set ["kajman", [["O_Heli_Attack_02_dynamicLoadout_F"], _variants, true]];

_dict set [RAND_VEH_HELI_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_HELI_UAV_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = createHashMap;

// Neophron
_vehicles set ["neophron", [["O_Plane_CAS_02_dynamicLoadout_F"], true, true]];

// Shikra
if (Escape_Using_Jets) then
{
    if (Escape_Csat_Use_Camo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _variants = ["CamoGreyHex", "CamoBlue"];
            };
            default
            {
                _variants = ["CamoAridHex"];
            };
        };
    }
    else
    {
        _variants = ["CamoAridHex", "CamoGreyHex", "CamoBlue"];
    };

    _vehicles set ["shikra", [
        ["O_Plane_Fighter_02_F", "O_Plane_Fighter_02_Stealth_F"],
        _variants,
        true
    ]];
};

// Xi'an
if (Escape_Using_Apex) then
{
    if (Escape_Csat_Use_Camo) then
    {
        switch (_map) do
        {
            case TANOA_KEY:
            {
                _variants = ["GreenHex"];
            };
            case LIVONIA_KEY:
            {
                _variants = ["Grey"];
            };
            default
            {
                _variants = ["Hex"];
            };
        };
    }
    else
    {
        _variants = ["Hex", "Grey"];
    };

    _vehicles set ["xian", [["O_T_VTOL_02_infantry_dynamicLoadout_F"], _variants, true]];
};

_dict set [RAND_VEH_PLANE_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = createHashMap;

// Ababil
_vehicles set ["ababil", [["O_UAV_02_dynamicLoadout_F"], true, true]];

_dict set [RAND_VEH_PLANE_UAV_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = createHashMap;

// HMG
_vehicles set ["hmg", [["O_HMG_01_F"], true, true]];

// GMG
_vehicles set ["gmg", [["O_GMG_01_F"], true, true]];

_dict set [RAND_VEH_TURRET_L_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret mid
_vehicles = createHashMap;

// Titan AA
_vehicles set ["titanAa", [["O_static_AA_F"], true, true]];

// Titan AA
_vehicles set ["titanAt", [["O_static_AT_F"], true, true]];

_dict set [RAND_VEH_TURRET_M_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = createHashMap;

// HMG
_vehicles set ["hmg", [["O_HMG_01_high_F"], true, true]];

// GMG
_vehicles set ["gmg", [["O_GMG_01_high_F"], true, true]];

_dict set [RAND_VEH_TURRET_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Turret special
_vehicles = createHashMap;
_dict set [RAND_VEH_TURRET_S_KEY, _vehicles];

private _side = str east;
private _sideDict = Escape_Random_Vehicles get _side;
_sideDict set [CSAT_KEY, _dict];
Escape_Random_Vehicles set [_side, _sideDict];

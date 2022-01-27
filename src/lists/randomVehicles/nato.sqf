/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_vehicles", "_veh", "_variants"];

if (!isServer) exitWith {};

private _dict = createHashMap;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Quadbike
_vehicles = createHashMap;

// Quadbike
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_Quadbike_01_F"];
        };
        default
        {
            _veh = ["B_Quadbike_01_F"];
        };
    };
}
else
{
    _veh = ["B_Quadbike_01_F"];
};

_vehicles set ["quadbike", [_veh, true, true]];

_dict set [RAND_VEH_QUADBIKE_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = createHashMap;

// Prowler
if (Escape_Using_Apex) then
{
    _veh = ["B_LSV_01_unarmed_F"];

    if (Escape_Nato_Use_Camo) then
    {
        switch (_map) do
        {
            case TANOA_KEY;
            case LIVONIA_KEY:
            {
                _variants = ["Olive"];
            };
            default
            {
                _variants = ["Sand"];
            };
        };
    }
    else
    {
        _variants = ["Black", "Sand"];
    };

    _vehicles set ["prowler", [_veh, _variants, true]];
};

_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = createHashMap;

// Prowler
if (Escape_Using_Apex) then
{
    _veh = ["B_LSV_01_armed_F", "B_LSV_01_AT_F"];

    if (Escape_Nato_Use_Camo) then
    {
        switch (_map) do
        {
            case TANOA_KEY;
            case LIVONIA_KEY:
            {
                _variants = ["Olive"];
            };
            default
            {
                _variants = ["Sand"];
            };
        };
    }
    else
    {
        _variants = ["Black", "Sand"];
    };

    _vehicles set ["prowler", [_veh, _variants, true]];
};

_dict set [RAND_VEH_CAR_ARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;

// HEMTT
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh =
            [
                "B_T_Truck_01_mover_F",
                "B_T_Truck_01_cargo_F",
                "B_T_Truck_01_transport_F",
                "B_T_Truck_01_covered_F",
                "B_T_Truck_01_box_F"
            ];
        };
        default
        {
            _veh =
            [
                "B_Truck_01_mover_F",
                "B_Truck_01_cargo_F",
                "B_Truck_01_transport_F",
                "B_Truck_01_covered_F",
                "B_Truck_01_box_F"
            ];
        };
    };
}
else
{
    _veh =
    [
        "B_Truck_01_mover_F",
        "B_Truck_01_cargo_F",
        "B_Truck_01_transport_F",
        "B_Truck_01_covered_F",
        "B_Truck_01_box_F"
    ];
};

_vehicles set ["hemtt", [_veh, true, true]];

_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks armed
_vehicles = createHashMap;
_dict set [RAND_VEH_TRUCK_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;

// HEMTT
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh =
            [
                "B_T_Truck_01_flatbed_F",
                "B_T_Truck_01_ammo_F",
                "B_T_Truck_01_fuel_F",
                "B_T_Truck_01_medical_F",
                "B_T_Truck_01_Repair_F"
            ];
        };
        default
        {
            _veh =
            [
                "B_Truck_01_flatbed_F",
                "B_Truck_01_ammo_F",
                "B_Truck_01_fuel_F",
                "B_Truck_01_medical_F",
                "B_Truck_01_Repair_F"
            ];
        };
    };
}
else
{
    _veh =
    [
        "B_Truck_01_flatbed_F",
        "B_Truck_01_ammo_F",
        "B_Truck_01_fuel_F",
        "B_Truck_01_medical_F",
        "B_Truck_01_Repair_F"
    ];
};

_vehicles set ["hemtt", [_veh, true, true]];

_dict set [RAND_VEH_UTIL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = createHashMap;

// Hunter
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_MRAP_01_F"];
        };
        default
        {
            _veh = ["B_MRAP_01_F"];
        };
    };
}
else
{
    _veh = ["B_MRAP_01_F"];
};

_vehicles set ["hunter", [_veh, true, true]];

_dict set [RAND_VEH_MRAP_UNARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = createHashMap;

// Hunter
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_MRAP_01_hmg_F", "B_T_MRAP_01_gmg_F"];
        };
        default
        {
            _veh = ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"];
        };
    };
}
else
{
    _veh = ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"];
};

_vehicles set ["hunter", [_veh, true, true]];

_dict set [RAND_VEH_MRAP_ARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV unarmed
_vehicles = createHashMap;

// Stomper
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_UGV_01_F"];
        };
        default
        {
            _veh = ["B_UGV_01_F"];
        };
    };
}
else
{
    _veh = ["B_UGV_01_F"];
};

_vehicles set ["stomper", [_veh, true, true]];

_dict set [RAND_VEH_UGV_UNARMED_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV armed
_vehicles = createHashMap;

// Stomper
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_UGV_01_rcws_F"];
        };
        default
        {
            _veh = ["B_UGV_01_rcws_F"];
        };
    };
}
else
{
    _veh = ["B_UGV_01_rcws_F"];
};

_vehicles set ["stomper", [_veh, true, true]];

_dict set [RAND_VEH_UGV_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = createHashMap;

// Marshall
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_APC_Wheeled_01_cannon_F"];
        };
        default
        {
            _veh = ["B_APC_Wheeled_01_cannon_F"];
        };
    };
}
else
{
    _veh = ["B_APC_Wheeled_01_cannon_F"];
};

_vehicles set ["marshall", [
    _veh,
    true,
    ["Escape_Marshall_Default", "Escape_Marshall_Cage", "Escape_Marshall_Net"]
]];

_dict set [RAND_VEH_IFV_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = createHashMap;

// Panther
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_APC_Tracked_01_rcws_F"];
        };
        default
        {
            _veh = ["B_APC_Tracked_01_rcws_F"];
        };
    };
}
else
{
    _veh = ["B_APC_Tracked_01_rcws_F"];
};

_vehicles set ["panther", [
    _veh,
    true,
    ["Escape_Panther_Default", "Escape_Panther_Net"]
]];

// Bobcat
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_APC_Tracked_01_CRV_F"];
        };
        default
        {
            _veh = ["B_APC_Tracked_01_CRV_F"];
        };
    };
}
else
{
    _veh = ["B_APC_Tracked_01_CRV_F"];
};

_vehicles set ["bobcat", [
    _veh,
    true,
    ["Escape_Bobcat_Default", "Escape_Bobcat_Net"]
]];

_dict set [RAND_VEH_APC_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = createHashMap;

// Slammer
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_MBT_01_cannon_F", "B_T_MBT_01_TUSK_F"];
        };
        default
        {
            _veh = ["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"];
        };
    };
}
else
{
    _veh = ["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"];
};

_vehicles set ["slammer", [
    _veh,
    true,
    ["Escape_Slammer_Default", "Escape_Slammer_Net"]
]];

_dict set [RAND_VEH_TANK_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Tank special
_vehicles = createHashMap;

// Rhino
if (Escape_Using_Tanks) then
{
    if (Escape_Nato_Use_Camo) then
    {
        switch (_map) do
        {
            case TANOA_KEY;
            case LIVONIA_KEY:
            {
                _variants = ["Green"];
            };
            default
            {
                _variants = ["Sand"];
            };
        };
    }
    else
    {
        _variants = ["Green", "Sand"];
    };

    _vehicles set ["rhino", [
        ["B_AFV_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_up_cannon_F"],
        _variants,
        ["Escape_Rhino_Default", "Escape_Rhino_Cage", "Escape_Rhino_Net"]
    ]];
};

_dict set [RAND_VEH_TANK_SPECIAL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = createHashMap;

// Scorcher
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_MBT_01_arty_F"];
        };
        default
        {
            _veh = ["B_MBT_01_arty_F"];
        };
    };
}
else
{
    _veh = ["B_MBT_01_arty_F"];
    if (Escape_Using_Apex) then { _veh append ["B_T_MBT_01_arty_F"] };
};

_vehicles set ["scorcher", [
    _veh,
    true,
    ["Escape_Scorcher_Default", "Escape_Scorcher_Net"]
]];

// Sandstorm
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_MBT_01_mlrs_F"];
        };
        default
        {
            _veh = ["B_MBT_01_mlrs_F"];
        };
    };
}
else
{
    _veh = ["B_MBT_01_mlrs_F"];
    if (Escape_Using_Apex) then { _veh append ["B_T_MBT_01_mlrs_F"] };
};

_vehicles set ["sandstorm", [
    _veh,
    true,
    ["Escape_Sandstorm_Default", "Escape_Sandstorm_Net"]
]];

_dict set [RAND_VEH_ARTY_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = createHashMap;

// Cheetah
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_APC_Tracked_01_AA_F"];
        };
        default
        {
            _veh = ["B_APC_Tracked_01_AA_F"];
        };
    };
}
else
{
    _veh = ["B_APC_Tracked_01_AA_F"];
    if (Escape_Using_Apex) then { _veh append ["B_T_APC_Tracked_01_AA_F"] };
};

_vehicles set ["cheetah", [
    _veh,
    true,
    ["Escape_Cheetah_Default", "Escape_Cheetah_Net"]
]];

_dict set [RAND_VEH_AA_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = createHashMap;

// Ghost Hawk
if (Escape_Nato_Use_Camo) then
{
    _variants = ["Green"];
}
else
{
    _variants = ["Green", "Black"];
};

[_vehicles, "ghostHawk", [["B_Heli_Transport_01_F"], true, _variants]] call DICT_fnc_set;

// Huron
if (Escape_Using_Heli) then
{
    if (Escape_Nato_Use_Camo) then
    {
        _variants = ["Green"];
    }
    else
    {
        _variants = ["Green", "Black"];
    };

    _vehicles set ["huron", [["B_Heli_Transport_03_F"], true, _variants]];
};

_dict set [RAND_VEH_HELI_T_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = createHashMap;

// Pawnee
_vehicles set ["pawnee", [["B_Heli_Light_01_dynamicLoadout_F"], true, true]];

// Ghost Hawk
if (Escape_Nato_Use_Camo) then
{
    _variants = ["Green"];
}
else
{
    _variants = ["Green", "Black"];
};

_vehicles set ["ghostHawk", [["B_Heli_Transport_01_F"], true, _variants]];

// Huron
if (Escape_Using_Heli) then
{
    if (Escape_Nato_Use_Camo) then
    {
        _variants = ["Green"];
    }
    else
    {
        _variants = ["Green", "Black"];
    };

    _vehicles set ["huron", [["B_Heli_Transport_03_F"], true, _variants]];
};

_dict set [RAND_VEH_HELI_L_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = createHashMap;

// Blackfoot
_vehicles set ["blackfoot", [["B_Heli_Attack_01_dynamicLoadout_F"], true, true]];

_dict set [RAND_VEH_HELI_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter UAV
_vehicles = createHashMap;

// Falcon
if (Escape_Using_Apex) then
{
    _vehicles set ["falcon", [["B_T_UAV_03_dynamicLoadout_F"], true, true]];
};

_dict set [RAND_VEH_HELI_UAV_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = createHashMap;

// Wipeout
_vehicles set ["wipeout", [["B_Plane_CAS_01_dynamicLoadout_F"], true, true]];

// F/A-181
if (Escape_Using_Jets) then
{
    _vehicles set ["fa181", [["B_Plane_Fighter_01_F", "B_Plane_Fighter_01_Stealth_F"], true, true]];
};

_dict set [RAND_VEH_PLANE_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = createHashMap;

// Greyhawk
_vehicles set ["greyhawk", [["B_UAV_02_dynamicLoadout_F"], true, true]];

// Sentinal
if (Escape_Using_Jets) then
{
    _vehicles set ["sentinal", [["B_UAV_05_F"], true, true]];
};

_dict set [RAND_VEH_PLANE_UAV_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = createHashMap;

// HMG
_vehicles set ["hmg", [["B_HMG_01_F"], true, true]];

// GMG
_vehicles set ["gmg", [["B_GMG_01_F"], true, true]];

_dict set [RAND_VEH_TURRET_L_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret mid
_vehicles = createHashMap;

// Titan AA
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_Static_AA_F"];
        };
        default
        {
            _veh = ["B_static_AA_F"];
        };
    };
}
else
{
    _veh = ["B_static_AA_F"];
    if (Escape_Using_Apex) then { _veh append ["B_T_Static_AA_F"] };
};

_vehicles set ["titanAa", [_veh, true, true]];

// Titan AT
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _veh = ["B_T_Static_AT_F"];
        };
        default
        {
            _veh = ["B_static_AT_F"];
        };
    };
}
else
{
    _veh = ["B_static_AT_F"];
    if (Escape_Using_Apex) then { _veh append ["B_T_Static_AT_F"] };
};

_vehicles set ["titanAt", [_veh, true, true]];

_dict set [RAND_VEH_TURRET_M_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = createHashMap;

// HMG
_vehicles set ["hmg", [["B_HMG_01_high_F"], true, true]];

// GMG
_vehicles set ["gmg", [["B_GMG_01_high_F"], true, true]];

_dict set [RAND_VEH_TURRET_H_KEY, _vehicles];

private _side = str west;
private _sideDict = Escape_Random_Vehicles get _side;
_sideDict set [NATO_KEY, _dict];
Escape_Random_Vehicles set [_side, _sideDict];

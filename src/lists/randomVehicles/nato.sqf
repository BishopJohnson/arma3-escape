/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_vehicles", "_veh", "_variants"];

if (!isServer) exitWith {};

private _dict = call DICT_fnc_create;

private _map = worldName;
private _useMapCamo = "IncludeNato" call BIS_fnc_getParamValue == 2;
private _usingApex = "IncludeApex" call BIS_fnc_getParamValue == 1;
private _usingContact = "IncludeContact" call BIS_fnc_getParamValue == 1;
private _usingHeli = "IncludeHelicopters" call BIS_fnc_getParamValue == 1;
private _usingJets = "IncludeJets" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = call DICT_fnc_create;

// Quadbike
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_Quadbike_01_F"] };
};

[_vehicles, "quadbike", [_veh, true, true]] call DICT_fnc_set;

// Prowler
if (_usingApex) then
{
    _veh = ["B_LSV_01_unarmed_F"];

    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case TANOA_KEY:
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
        _variants = ["Black", "Olive", "Sand"];
    };

    [_vehicles, "prowler", [_veh, _variants, true]] call DICT_fnc_set;
};

// HEMTT
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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

    if (_usingApex) then
    {
        _veh append
        [
            "B_T_Truck_01_mover_F",
            "B_T_Truck_01_cargo_F",
            "B_T_Truck_01_transport_F",
            "B_T_Truck_01_covered_F",
            "B_T_Truck_01_box_F"
        ]
    };
};

[_dict, RAND_VEH_CAR_UNARMED_KEY, _vehicles] call DICT_fnc_set;

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = call DICT_fnc_create;

// Prowler
if (_usingApex) then
{
    _veh = ["B_LSV_01_armed_F", "B_LSV_01_AT_F"];

    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case TANOA_KEY:
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
        _variants = ["Black", "Olive", "Sand"];
    };

    [_vehicles, "prowler", [_veh, _variants, true]] call DICT_fnc_set;
};

[_dict, RAND_VEH_CAR_ARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = call DICT_fnc_create;

// HEMTT
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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

    if (_usingApex) then
    {
        _veh append
        [
            "B_T_Truck_01_flatbed_F",
            "B_T_Truck_01_ammo_F",
            "B_T_Truck_01_fuel_F",
            "B_T_Truck_01_medical_F",
            "B_T_Truck_01_Repair_F"
        ]
    };
};

[_vehicles, "hemtt", [_veh, true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_UTIL_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = call DICT_fnc_create;

// Hunter
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_MRAP_01_F"] };
};

[_vehicles, "hunter", [_veh, true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_MRAP_UNARMED_KEY, _vehicles] call DICT_fnc_set;

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = call DICT_fnc_create;

// Hunter
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_MRAP_01_hmg_F", "B_T_MRAP_01_gmg_F"] };
};

[_vehicles, "hunter", [_veh, true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_MRAP_ARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = call DICT_fnc_create;

// Marshall
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_APC_Wheeled_01_cannon_F"] };
};

[_vehicles, "marshall", [
    _veh,
    true,
    ["Escape_Marshall_Default", "Escape_Marshall_Cage", "Escape_Marshall_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_IFV_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = call DICT_fnc_create;

// Panther
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_APC_Tracked_01_rcws_F"] };
};

[_vehicles, "panther", [
    _veh,
    true,
    ["Escape_Panther_Default", "Escape_Panther_Net"]
]] call DICT_fnc_set;

// Bobcat
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_APC_Tracked_01_CRV_F"] };
};

[_vehicles, "bobcat", [
    _veh,
    true,
    ["Escape_Bobcat_Default", "Escape_Bobcat_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_APC_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = call DICT_fnc_create;

// Slammer
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_MBT_01_cannon_F", "B_T_MBT_01_TUSK_F"] };
};

[_vehicles, "slammer", [
    _veh,
    true,
    ["Escape_Slammer_Default", "Escape_Slammer_Net"]
]] call DICT_fnc_set;

// Rhino
if (_usingTanks) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case TANOA_KEY:
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
        _variants = ["Olive", "Sand"];
    };

    [_vehicles, "rhino", [
        ["B_AFV_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_up_cannon_F"],
        _variants,
        ["Escape_Rhino_Default", "Escape_Rhino_Cage", "Escape_Rhino_Net"]
    ]] call DICT_fnc_set;
};

[_dict, RAND_VEH_TANK_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = call DICT_fnc_create;

// Scorcher
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_MBT_01_arty_F"] };
};

[_vehicles, "scorcher", [
    _veh,
    true,
    ["Escape_Scrocher_Default", "Escape_Scrocher_Net"]
]] call DICT_fnc_set;

// Sandstorm
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_MBT_01_mlrs_F"] };
};

[_vehicles, "sandstorm", [
    _veh,
    true,
    ["Escape_Sandstorm_Default", "Escape_Sandstorm_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_ARTY_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = call DICT_fnc_create;

// Sandstorm
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["B_T_APC_Tracked_01_AA_F"] };
};

[_vehicles, "cheetah", [
    _veh,
    true,
    ["Escape_Cheetah_Default", "Escape_Cheetah_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_AA_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = call DICT_fnc_create;

// Ghost Hawk
if (_useMapCamo) then
{
    _variants = ["Green"];
}
else
{
    _variants = ["Green", "Black"];
};

[_vehicles, "ghostHawk", [["B_Heli_Transport_01_F"], true, _variants]] call DICT_fnc_set;

// Huron
if (_usingHeli) then
{
    if (_useMapCamo) then
    {
        _variants = ["Green"];
    }
    else
    {
        _variants = ["Green", "Black"];
    };

    [_vehicles, "huron", [["B_Heli_Transport_03_F"], true, _variants]] call DICT_fnc_set;
};

[_dict, RAND_VEH_HELI_T_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = call DICT_fnc_create;

// Pawnee
[_vehicles, "pawnee", [["B_Heli_Light_01_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

// Ghost Hawk
if (_useMapCamo) then
{
    _variants = ["Green"];
}
else
{
    _variants = ["Green", "Black"];
};

[_vehicles, "ghostHawk", [["B_Heli_Transport_01_F"], true, _variants]] call DICT_fnc_set;

// Huron
if (_usingHeli) then
{
    if (_useMapCamo) then
    {
        _variants = ["Green"];
    }
    else
    {
        _variants = ["Green", "Black"];
    };

    [_vehicles, "huron", [["B_Heli_Transport_03_F"], true, _variants]] call DICT_fnc_set;
};

[_dict, RAND_VEH_HELI_L_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = call DICT_fnc_create;

// Blackfoot
[_vehicles, "blackfoot", [["B_Heli_Attack_01_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_H_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = call DICT_fnc_create;

// Wipeout
[_vehicles, "wipeout", [["B_Plane_CAS_01_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

// F/A-181
if (_usingJets) then
{
    [_vehicles, "fa181", [["B_Plane_Fighter_01_F", "B_Plane_Fighter_01_Stealth_F"], true, true]] call DICT_fnc_set;
};

[_dict, RAND_VEH_PLANE_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = call DICT_fnc_create;

// Falcon
if (_usingApex) then
{
    [_vehicles, "falcon", [["B_T_UAV_03_dynamicLoadout_F"], true, true]] call DICT_fnc_set;
};

// Greyhawk
[_vehicles, "greyhawk", [["B_UAV_02_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

// Sentinal
if (_usingJets) then
{
    [_vehicles, "sentinal", [["B_UAV_05_F"], true, true]] call DICT_fnc_set;
};

[_dict, RAND_VEH_PLANE_UAV_KEY, _vehicles] call DICT_fnc_set;

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = call DICT_fnc_create;

// HMG
[_vehicles, "hmg", [["B_HMG_01_F"], true, true]] call DICT_fnc_set;

// GMG
[_vehicles, "gmg", [["B_GMG_01_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_TURRET_L_KEY, _vehicles] call DICT_fnc_set;

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = call DICT_fnc_create;

// HMG
[_vehicles, "hmg", [["B_HMG_01_high_F"], true, true]] call DICT_fnc_set;

// GMG
[_vehicles, "gmg", [["B_GMG_01_high_F"], true, true]] call DICT_fnc_set;

// Titan AA
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
        {
            _vehicles = ["B_T_Static_AA_F"];
        };
        default
        {
            _vehicles = ["B_static_AA_F"];
        };
    };
}
else
{
    _vehicles = ["B_static_AA_F"];
    if (_usingApex) then { _vehicles append ["B_T_Static_AA_F"] };
};

[_vehicles, "titanAa", [_vehicles, true, true]] call DICT_fnc_set;

// Titan AT
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
        {
            _vehicles = ["B_T_Static_AT_F"];
        };
        default
        {
            _vehicles = ["B_static_AT_F"];
        };
    };
}
else
{
    _vehicles = ["B_static_AT_F"];
    if (_usingApex) then { _vehicles append ["B_T_Static_AT_F"] };
};

[_vehicles, "titanAt", [_vehicles, true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_TURRET_H_KEY, _vehicles] call DICT_fnc_set;

private _sideDict = [Escape_Random_Vehicles, str west] call DICT_fnc_get;
[_sideDict, NATO_KEY, _dict] call DICT_fnc_set;
[Escape_Random_Vehicles, str west, _sideDict] call DICT_fnc_set;

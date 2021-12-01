/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_vehicles", "_veh", "_variants"];

if (!isServer) exitWith {};

private _include = "IncludeCsat" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = call DICT_fnc_create;

private _map = worldName;
private _useMapCamo = _include == 2;
private _usingApex = "IncludeApex" call BIS_fnc_getParamValue == 1;
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
    if (_usingApex) then { _veh append ["O_T_Quadbike_01_ghex_F"] };
};

[_vehicles, "quadbike", [_veh, true, true]] call DICT_fnc_set;

// Qilin
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case TANOA_KEY:
            {
                _variants = ["GreenHex"];
            };
            case LIVONIA_KEY:
            {
                _variants = ["Black"];
            };
            default
            {
                _variants = ["Arid"];
            };
        };
    }
    else
    {
        _variants = ["Arid", "Black", "GreenHex"];
    };

    [_vehicles, "qilin", [["O_LSV_02_unarmed_F"], _variants, true]] call DICT_fnc_set;
};

// Zamak
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["O_T_Truck_02_transport_F", "O_T_Truck_02_covered_F"]; };
};

[_vehicles, "zamak", [_veh, true, true]] call DICT_fnc_set;

// Tempest
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then
    {
        _veh append ["O_T_Truck_03_transport_ghex_F", "O_T_Truck_03_covered_ghex_F", "O_T_Truck_03_device_ghex_F"];
    };
};

[_vehicles, "tempest", [_veh, true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_CAR_UNARMED_KEY, _vehicles] call DICT_fnc_set;

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = call DICT_fnc_create;

// Qilin
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case TANOA_KEY:
            {
                _variants = ["GreenHex"];
            };
            case LIVONIA_KEY:
            {
                _variants = ["Black"];
            };
            default
            {
                _variants = ["Arid"];
            };
        };
    }
    else
    {
        _variants = ["Arid", "Black", "GreenHex"];
    };

    [_vehicles, "qilin", [["O_LSV_02_armed_F", "O_LSV_02_AT_F"], _variants, true]] call DICT_fnc_set;
};

[_dict, RAND_VEH_CAR_ARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = call DICT_fnc_create;

// Zamak
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    _veh =
    [
        "O_Truck_02_box_F",
        "O_Truck_02_Ammo_F",
        "O_Truck_02_fuel_F",
        "O_Truck_02_medical_F"
    ];

    if (_usingApex) then
    {
        _veh append
        [
            "O_T_Truck_02_box_F",
            "O_T_Truck_02_Ammo_F",
            "O_T_Truck_02_fuel_F",
            "O_T_Truck_02_medical_F"
        ]
    };
};

[_vehicles, "zamak", [_veh, true, true]] call DICT_fnc_set;

// Tempest
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    _veh =
    [
        "O_Truck_03_ammo_F",
        "O_Truck_03_fuel_F",
        "O_Truck_03_medical_F",
        "O_Truck_03_repair_F"
    ];

    if (_usingApex) then
    {
        _veh append
        [
            "O_T_Truck_03_ammo_ghex_F",
            "O_T_Truck_03_fuel_ghex_F",
            "O_T_Truck_03_medical_ghex_F",
            "O_T_Truck_03_repair_ghex_F"
        ]
    };
};

[_vehicles, "tempest", [_veh, true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_UTIL_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = call DICT_fnc_create;

// Ifrit
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["O_T_MRAP_02_ghex_F"] };
};

[_vehicles, "ifrit", [_veh, true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_MRAP_UNARMED_KEY, _vehicles] call DICT_fnc_set;

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = call DICT_fnc_create;

// Ifrit
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["O_T_MRAP_02_hmg_ghex_F", "O_T_MRAP_02_gmg_ghex_F"] };
};

[_vehicles, "ifrit", [_veh, true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_MRAP_ARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = call DICT_fnc_create;

// Marid
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["O_T_APC_Wheeled_02_rcws_v2_ghex_F"] };
};

[_vehicles, "marid", [
    _veh,
    true,
    ["Escape_Marid_Default", "Escape_Marid_Cage", "Escape_Marid_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_IFV_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = call DICT_fnc_create;

// Kamysh
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["O_T_APC_Tracked_02_cannon_ghex_F"] };
};

[_vehicles, "kamysh", [
    _veh,
    true,
    ["Escape_Kamysh_Default", "Escape_Kamysh_Cage", "Escape_Kamysh_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_APC_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = call DICT_fnc_create;

// T-100
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["O_T_MBT_02_cannon_ghex_F"] };
};

[_vehicles, "t100", [_veh, true, ["Escape_T100_Default", "Escape_T100_Net"]]] call DICT_fnc_set;

// T-140
if (_usingTanks) then
{
    if (_useMapCamo) then
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
        _variants = ["Hex", "Grey", "GreenHex", "Jungle"];
    };

    [_vehicles, "t140", [
        ["O_MBT_04_cannon_F", "O_MBT_04_command_F"],
        _variants,
        ["Escape_T140_Default", "Escape_T140_Net"]
    ]] call DICT_fnc_set;
};

[_dict, RAND_VEH_TANK_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = call DICT_fnc_create;

// Sochor
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["O_T_MBT_02_arty_ghex_F"] };
};

[_vehicles, "sochor", [
    _veh,
    true,
    ["Escape_Sochor_Default", "Escape_Sochor_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_ARTY_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = call DICT_fnc_create;

// Tigris
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    if (_usingApex) then { _veh append ["O_T_APC_Tracked_02_AA_ghex_F"] };
};

[_vehicles, "tigris", [
    _veh,
    true,
    ["Escape_Tigris_Default", "Escape_Tigris_Cage", "Escape_Tigris_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_AA_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = call DICT_fnc_create;

// Orca
if (_useMapCamo) then
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

[_vehicles, "orca", [["O_Heli_Light_02_unarmed_F"], _variants, true]] call DICT_fnc_set;

// Taru
if (_usingHeli) then
{
    if (_useMapCamo) then
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

    [_vehicles, "taru", [
        ["O_Heli_Transport_04_covered_F", "O_Heli_Transport_04_bench_F"],
        _variants,
        true
    ]] call DICT_fnc_set;
};

[_dict, RAND_VEH_HELI_T_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = call DICT_fnc_create;

// Orca
if (_useMapCamo) then
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

[_vehicles, "orca", [
    ["O_Heli_Light_02_dynamicLoadout_F", "O_Heli_Light_02_v2_F"],
    _variants,
    true
]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_L_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = call DICT_fnc_create;

// Kajman
if (_useMapCamo) then
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

[_vehicles, "kajman", [["O_Heli_Attack_02_dynamicLoadout_F"], _variants, true]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_H_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = call DICT_fnc_create;

// Neophron
if (!_useMapCamo || _map != TANOA_KEY) then
{
    [_vehicles, "neophron", [["O_Plane_CAS_02_dynamicLoadout_F"], true, true]] call DICT_fnc_set;
};

// Shikra
if (_usingJets) then
{
    if (_useMapCamo) then
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

    [_vehicles, "shikra", [
        ["O_Plane_Fighter_02_F", "O_Plane_Fighter_02_Stealth_F"],
        _variants,
        true
    ]] call DICT_fnc_set;
};

// Xi'an
if (_usingApex) then
{
    if (_useMapCamo) then
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
        _variants = ["Hex", "Grey", "GreenHex"];
    };

    [_vehicles, "xian", [["O_T_VTOL_02_infantry_dynamicLoadout_F"], _variants, true]] call DICT_fnc_set;
};

[_dict, RAND_VEH_PLANE_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = call DICT_fnc_create;

// Ababil
[_vehicles, "ababil", [["O_UAV_02_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_PLANE_UAV_KEY, _vehicles] call DICT_fnc_set;

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = call DICT_fnc_create;

// HMG
[_vehicles, "hmg", [["O_HMG_01_F"], true, true]] call DICT_fnc_set;

// GMG
[_vehicles, "gmg", [["O_GMG_01_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_TURRET_L_KEY, _vehicles] call DICT_fnc_set;

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = call DICT_fnc_create;

// HMG
[_vehicles, "hmg", [["O_HMG_01_high_F"], true, true]] call DICT_fnc_set;

// GMG
[_vehicles, "gmg", [["O_GMG_01_high_F"], true, true]] call DICT_fnc_set;

// Titan AA
[_vehicles, "titanAa", [["O_static_AA_F"], true, true]] call DICT_fnc_set;

// Titan AA
[_vehicles, "titanAt", [["O_static_AT_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_TURRET_H_KEY, _vehicles] call DICT_fnc_set;

private _sideDict = [Escape_Random_Vehicles, str east] call DICT_fnc_get;
[_sideDict, CSAT_KEY, _dict] call DICT_fnc_set;
[Escape_Random_Vehicles, str east, _sideDict] call DICT_fnc_set;

/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_vehicles", "_veh", "_variants"];

if (!isServer) exitWith {};

private _include = "IncludeAaf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = call DICT_fnc_create;

private _usingJets = "IncludeJets" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = call DICT_fnc_create;

// Quadbike
[_vehicles, "quadbike", [["I_Quadbike_01_F"], true, true]] call DICT_fnc_set;

// Zamak
[_vehicles, "zamak", [["I_Truck_02_transport_F", "I_Truck_02_covered_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_CAR_UNARMED_KEY, _vehicles] call DICT_fnc_set;

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_CAR_ARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = call DICT_fnc_create;

// Zamak
[_vehicles, "zamak", [
    ["I_Truck_02_box_F", "I_Truck_02_ammo_F", "I_Truck_02_fuel_F", "I_Truck_02_medical_F"],
    true,
    true
]] call DICT_fnc_set;

[_dict, RAND_VEH_UTIL_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_MRAP_UNARMED_KEY, _vehicles] call DICT_fnc_set;

// Strider
[_vehicles, "strider", [["I_MRAP_03_F"], true, true]] call DICT_fnc_set;

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = call DICT_fnc_create;

// Strider
[_vehicles, "strider", [["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_MRAP_ARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = call DICT_fnc_create;

// Gorgon
[_vehicles, "gorgon", [
    ["I_APC_Wheeled_03_cannon_F"],
    true,
    ["Escape_Gorgon_Default", "Escape_Gorgon_Cage", "Escape_Gorgon_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_IFV_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = call DICT_fnc_create;

// Mora
[_vehicles, "mora", [
    ["I_APC_tracked_03_cannon_F"],
    true,
    ["Escape_Gorgon_Default", "Escape_Mora_Cage", "Escape_Mora_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_APC_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = call DICT_fnc_create;

// Kuma
[_vehicles, "kuma", [
    ["I_MBT_03_cannon_F"],
    true,
    ["Escape_Kuma_Default", "Escape_Kuma_Net"]
]] call DICT_fnc_set;

// Nyx
if (_usingTanks) then
{
    [_vehicles, "nyx", [
        ["I_LT_01_scout_F", "I_LT_01_cannon_F", "I_LT_01_AT_F"],
        true,
        ["Escape_Kuma_Default", "Escape_Kuma_Net"]
    ]] call DICT_fnc_set;
};

[_dict, RAND_VEH_TANK_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = call DICT_fnc_create;

// Zamak MRL
[_vehicles, "zamak", [["I_Truck_02_MRL_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_ARTY_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = call DICT_fnc_create;

// Nyx
if (_usingTanks) then
{
    [_vehicles, "nyx", [
        ["I_LT_01_AA_F"],
        true,
        ["Escape_Kuma_Default", "Escape_Kuma_Net"]
    ]] call DICT_fnc_set;
};

[_dict, RAND_VEH_AA_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = call DICT_fnc_create;

// Hellcat
[_vehicles, "hellcat", [["I_Heli_light_03_unarmed_F"], ["AAF"], true]] call DICT_fnc_set;

// Mohawk
[_vehicles, "mohawk", [["I_Heli_Transport_02_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_T_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = call DICT_fnc_create;

// Hellcat
[_vehicles, "hellcat", [["I_Heli_light_03_dynamicLoadout_F"], ["AAF"], true]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_L_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = call DICT_fnc_create;

// Hellcat
[_vehicles, "hellcat", [["I_Heli_light_03_dynamicLoadout_F"], ["AAF"], true]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_H_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = call DICT_fnc_create;

// Buzzard
[_vehicles, "buzzard", [["I_Plane_Fighter_03_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

// Gryphon
if (_usingJets) then
{
    [_vehicles, "gryphon", [["I_Plane_Fighter_04_F"], ["DigitalCamoGreen"], true]] call DICT_fnc_set;
};

[_dict, RAND_VEH_PLANE_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = call DICT_fnc_create;

// K40 Ababil
[_vehicles, "ababil", [["I_UAV_02_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_PLANE_UAV_KEY, _vehicles] call DICT_fnc_set;

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = call DICT_fnc_create;

// HMG
[_vehicles, "hmg", [["I_HMG_01_F", "I_HMG_02_F"], true, true]] call DICT_fnc_set;

// GMG
[_vehicles, "gmg", [["I_GMG_01_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_TURRET_L_KEY, _vehicles] call DICT_fnc_set;

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = call DICT_fnc_create;

// HMG
[_vehicles, "hmg", [["I_HMG_01_high_F", "I_HMG_02_high_F"], true, true]] call DICT_fnc_set;

// GMG
[_vehicles, "gmg", [["I_GMG_01_high_F"], true, true]] call DICT_fnc_set;

// Titan AA
[_vehicles, "titanAa", [["I_static_AA_F"], true, true]] call DICT_fnc_set;

// Titan AA
[_vehicles, "titanAt", [["I_static_AT_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_TURRET_H_KEY, _vehicles] call DICT_fnc_set;

private _sideDict = [Escape_Random_Vehicles, str independent] call DICT_fnc_get;
[_sideDict, AAF_KEY, _dict] call DICT_fnc_set;
[Escape_Random_Vehicles, str independent, _sideDict] call DICT_fnc_set;

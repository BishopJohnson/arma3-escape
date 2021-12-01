/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_vehicles", "_veh", "_variants"];

if (!isServer) exitWith {};

private _include = "IncludeLdf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = call DICT_fnc_create;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = call DICT_fnc_create;

// Quadbike
[_vehicles, "quadbike", [["I_E_Quadbike_01_F"], true, true]] call DICT_fnc_set;

// Offroad
[_vehicles, "offroad", [
    ["I_E_Offroad_01_covered_F"],
    ["EAF"],
    ["Escape_Offroad_Default", "Escape_Offroad_Comms"]
]] call DICT_fnc_set;

// Van
[_vehicles, "van", [["I_E_Van_02_vehicle_F", "I_E_Van_02_transport_F"], true, true]] call DICT_fnc_set;

// Zamak
[_vehicles, "zamak", [["I_E_Truck_02_transport_F", "I_E_Truck_02_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_CAR_UNARMED_KEY, _vehicles] call DICT_fnc_set;

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_CAR_ARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = call DICT_fnc_create;

// Van
[_vehicles, "van", [
    ["I_E_Van_02_medevac_F"],
    true,
    true
]] call DICT_fnc_set;

// Zamak
[_vehicles, "zamak", [
    ["I_E_Truck_02_box_F", "I_E_Truck_02_Ammo_F", "I_E_Truck_02_fuel_F", "I_E_Truck_02_medical_F"],
    true,
    true
]] call DICT_fnc_set;

[_dict, RAND_VEH_UTIL_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_MRAP_UNARMED_KEY, _vehicles] call DICT_fnc_set;

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_MRAP_ARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_IFV_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = call DICT_fnc_create;

// Odyniec (Mora)
[_vehicles, "odyniec", [
    ["I_E_APC_tracked_03_cannon_F"],
    true,
    ["Escape_Odyniec_Default", "Escape_Odyniec_Cage", "Escape_Odyniec_Net"]
]] call DICT_fnc_set;

[_dict, RAND_VEH_APC_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_TANK_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = call DICT_fnc_create;

// Zamak MLR
[_vehicles, "zamak", [["I_E_Truck_02_MRL_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_ARTY_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_AA_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = call DICT_fnc_create;

// Czapla (Hellcat)
[_vehicles, "czapla", [["I_E_Heli_light_03_unarmed_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_T_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = call DICT_fnc_create;

// Czapla (Hellcat)
[_vehicles, "czapla", [["I_E_Heli_light_03_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_L_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = call DICT_fnc_create;

// Czapla (Hellcat)
[_vehicles, "czapla", [["I_E_Heli_light_03_dynamicLoadout_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_HELI_H_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = call DICT_fnc_create;

// Gryphon
[_vehicles, "gryphon", [["I_Plane_Fighter_04_F"], ["CamoGrey"], true]] call DICT_fnc_set;

[_dict, RAND_VEH_PLANE_KEY, _vehicles] call DICT_fnc_set;

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = call DICT_fnc_create;
[_dict, RAND_VEH_PLANE_UAV_KEY, _vehicles] call DICT_fnc_set;

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = call DICT_fnc_create;

// HMG
[_vehicles, "hmg", [["I_E_HMG_01_F", "I_E_HMG_02_F"], true, true]] call DICT_fnc_set;

// GMG
[_vehicles, "gmg", [["I_E_GMG_01_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_TURRET_L_KEY, _vehicles] call DICT_fnc_set;

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = call DICT_fnc_create;

// HMG
[_vehicles, "hmg", [["I_E_HMG_01_high_F", "I_E_HMG_02_high_F"], true, true]] call DICT_fnc_set;

// GMG
[_vehicles, "gmg", [["I_E_GMG_01_high_F"], true, true]] call DICT_fnc_set;

// Titan AA
[_vehicles, "titanAa", [["I_E_static_AA_F"], true, true]] call DICT_fnc_set;

// Titan AA
[_vehicles, "titanAt", [["I_E_static_AT_F"], true, true]] call DICT_fnc_set;

[_dict, RAND_VEH_TURRET_H_KEY, _vehicles] call DICT_fnc_set;

private _sideDict = [Escape_Random_Vehicles, str independent] call DICT_fnc_get;
[_sideDict, LDF_KEY, _dict] call DICT_fnc_set;
[Escape_Random_Vehicles, str independent, _sideDict] call DICT_fnc_set;

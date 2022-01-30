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

private _dict = createHashMap;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Quadbike
_vehicles = createHashMap;

// Quadbike
_vehicles set ["quadbike", [["I_E_Quadbike_01_F"], true, true]];

_dict set [RAND_VEH_QUADBIKE_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = createHashMap;

// Offroad
_vehicles set ["offroad", [
    ["I_E_Offroad_01_covered_F"],
    ["EAF"],
    ["Escape_Offroad_Default", "Escape_Offroad_Comms"]
]];

// Van
_vehicles set ["van", [["I_E_Van_02_vehicle_F", "I_E_Van_02_transport_F"], true, true]];

_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = createHashMap;
_dict set [RAND_VEH_CAR_ARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;

// Zamak
_vehicles set ["zamak", [["I_E_Truck_02_transport_F", "I_E_Truck_02_F"], true, true]];

_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks armed
_vehicles = createHashMap;
_dict set [RAND_VEH_TRUCK_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;

// Van
_vehicles set ["van", [
    ["I_E_Van_02_medevac_F"],
    true,
    true
]];

// Zamak
_vehicles set ["zamak", [
    ["I_E_Truck_02_box_F", "I_E_Truck_02_Ammo_F", "I_E_Truck_02_fuel_F", "I_E_Truck_02_medical_F"],
    true,
    true
]];

_dict set [RAND_VEH_UTIL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = createHashMap;
_dict set [RAND_VEH_MRAP_UNARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = createHashMap;
_dict set [RAND_VEH_MRAP_ARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV unarmed
_vehicles = createHashMap;

// Stomper
_vehicles set ["stomper", [["I_E_UGV_01_F"], true, true]];

_dict set [RAND_VEH_UGV_UNARMED_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV armed
_vehicles = createHashMap;

// Stomper
_vehicles set ["stomper", [["I_E_UGV_01_rcws_F"], true, true]];

_dict set [RAND_VEH_UGV_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = createHashMap;
_dict set [RAND_VEH_IFV_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = createHashMap;

// Odyniec (Mora)
_vehicles set ["odyniec", [
    ["I_E_APC_tracked_03_cannon_F"],
    true,
    ["Escape_Odyniec_Default", "Escape_Odyniec_Cage", "Escape_Odyniec_Net"]
]];

_dict set [RAND_VEH_APC_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = createHashMap;
_dict set [RAND_VEH_TANK_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Tank special
_vehicles = createHashMap;
_dict set [RAND_VEH_TANK_SPECIAL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = createHashMap;

// Zamak MLR
_vehicles set ["zamak", [["I_E_Truck_02_MRL_F"], true, true]];

_dict set [RAND_VEH_ARTY_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = createHashMap;
_dict set [RAND_VEH_AA_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = createHashMap;

// Czapla (Hellcat)
_vehicles set ["czapla", [["I_E_Heli_light_03_unarmed_F"], true, true]];

_dict set [RAND_VEH_HELI_T_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = createHashMap;

// Czapla (Hellcat)
_vehicles set ["czapla", [["I_E_Heli_light_03_dynamicLoadout_F"], true, true]];

_dict set [RAND_VEH_HELI_L_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = createHashMap;

// Czapla (Hellcat)
_vehicles set ["czapla", [["I_E_Heli_light_03_dynamicLoadout_F"], true, true]];

_dict set [RAND_VEH_HELI_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_HELI_UAV_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = createHashMap;

// Gryphon
_vehicles set ["gryphon", [["I_Plane_Fighter_04_F"], ["CamoGrey"], true]];

_dict set [RAND_VEH_PLANE_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_PLANE_UAV_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = createHashMap;

// HMG
_vehicles set ["hmg", [["I_E_HMG_01_F", "I_E_HMG_02_F"], true, true]];

// GMG
_vehicles set ["gmg", [["I_E_GMG_01_F"], true, true]];

_dict set [RAND_VEH_TURRET_L_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret mid
_vehicles = createHashMap;

// Titan AA
_vehicles set ["titanAa", [["I_E_static_AA_F"], true, true]];

// Titan AA
_vehicles set ["titanAt", [["I_E_static_AT_F"], true, true]];

_dict set [RAND_VEH_TURRET_M_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = createHashMap;

// HMG
_vehicles set ["hmg", [["I_E_HMG_01_high_F", "I_E_HMG_02_high_F"], true, true]];

// GMG
_vehicles set ["gmg", [["I_E_GMG_01_high_F"], true, true]];

_dict set [RAND_VEH_TURRET_H_KEY, _vehicles];

private _side = str independent;
private _sideDict = Escape_Random_Vehicles get _side;
_sideDict set [LDF_KEY, _dict];
Escape_Random_Vehicles set [_side, _sideDict];

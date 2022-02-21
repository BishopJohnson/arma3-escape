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
_dict set [RAND_VEH_QUADBIKE_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = createHashMap;

// MRZR
_vehicles set ["mrzr", [["rhsusf_mrzr4_d"], ["mud"], true]];

// Humvee
_vehicles set ["m1043", [["rhsusf_m1043_d_s"], true, true]];

// Humvee (enhanced variant)
_vehicles set ["m1151", [["rhsusf_m1151_usmc_d"], true, true]];

_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = createHashMap;

// Humvee
_vehicles set ["m1043", [
    ["rhsusf_m1043_d_s_m2", "rhsusf_m1043_d_s_mk19", "rhsusf_m1045_d_s"],
    true,
    true
]];

// Humvee (enhanced variant)
_vehicles set ["m1151", [
    ["rhsusf_m1151_m2_v3_usmc_d", "rhsusf_m1151_m240_v3_usmc_d", "rhsusf_m1151_mk19_v3_usmc_d", "rhsusf_m1151_m2crows_usmc_d", "rhsusf_m1151_mk19crows_usmc_d"],
    true,
    true
]];

_dict set [RAND_VEH_CAR_ARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;
_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks armed
_vehicles = createHashMap;
_dict set [RAND_VEH_TRUCK_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;
_dict set [RAND_VEH_UTIL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = createHashMap;

// CGR
_vehicles set ["cgr", [["rhsusf_CGRCAT1A2_usmc_d"], true, true]];

// M1240
_vehicles set ["m1240", [["rhsusf_m1240a1_usmc_d"], true, true]];

_dict set [RAND_VEH_MRAP_UNARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = createHashMap;

// CGR
_vehicles set ["cgr", [
    ["rhsusf_CGRCAT1A2_M2_usmc_d", "rhsusf_CGRCAT1A2_Mk19_usmc_d"],
    true,
    true
]];

// M1232
_vehicles set ["m1232", [
    ["rhsusf_M1232_MC_M2_usmc_d", "rhsusf_M1232_MC_MK19_usmc_d"],
    true, true
]];

// M1240
_vehicles set ["m1240", [
    ["rhsusf_m1240a1_m2_usmc_d", "rhsusf_m1240a1_m240_usmc_d", "rhsusf_m1240a1_mk19_usmc_d", "rhsusf_m1240a1_m2crows_usmc_d", "rhsusf_m1240a1_mk19crows_usmc_d"],
    true,
    true
]];

_dict set [RAND_VEH_MRAP_ARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV unarmed
_vehicles = createHashMap;
_dict set [RAND_VEH_UGV_UNARMED_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV armed
_vehicles = createHashMap;
_dict set [RAND_VEH_UGV_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = createHashMap;
_dict set [RAND_VEH_IFV_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = createHashMap;
_dict set [RAND_VEH_APC_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = createHashMap;

// Abrams
_vehicles set ["abrams", [["rhsusf_m1a1fep_d"], true, true]];

_dict set [RAND_VEH_TANK_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Tank special
_vehicles = createHashMap;
_dict set [RAND_VEH_TANK_SPECIAL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = createHashMap;
_dict set [RAND_VEH_ARTY_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = createHashMap;
_dict set [RAND_VEH_AA_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = createHashMap;

// Sea Stallion
_vehicles set ["seaStallion", [["rhsusf_CH53E_USMC_GAU21_D"], true, true]];

_dict set [RAND_VEH_HELI_T_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = createHashMap;

// Huey
_vehicles set ["huey", [["RHS_UH1Y_d"], true, true]];

// Sea Stallion
_vehicles set ["seaStallion", [["rhsusf_CH53E_USMC_GAU21_D"], true, true]];

_dict set [RAND_VEH_HELI_L_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = createHashMap;

// Viper
_vehicles set ["viper", [["RHS_AH1Z"], true, true]];

_dict set [RAND_VEH_HELI_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_HELI_UAV_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = createHashMap;
_dict set [RAND_VEH_PLANE_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_PLANE_UAV_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = createHashMap;

// Browning
_vehicles set ["browning", [["RHS_M2StaticMG_MiniTripod_USMC_D"], true, true]];

// Mk19
_vehicles set ["mk19", [["RHS_MK19_TriPod_USMC_D"], true, true]];

// TOW
_vehicles set ["tow", [["RHS_TOW_TriPod_USMC_D"], true, true]];

_dict set [RAND_VEH_TURRET_L_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret mid
_vehicles = createHashMap;
_dict set [RAND_VEH_TURRET_M_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = createHashMap;

// Browning
_vehicles set ["browning", [["RHS_M2StaticMG_USMC_D"], true, true]];

_dict set [RAND_VEH_TURRET_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Turret special
_vehicles = createHashMap;

// Stinger
_vehicles set ["stinger", [["RHS_Stinger_AA_pod_USMC_D"], true, true]];

_dict set [RAND_VEH_TURRET_S_KEY, _vehicles];

private _side = str west;
private _sideDict = Escape_Random_Vehicles get _side;
_sideDict set [US_MARINES_KEY, _dict];
Escape_Random_Vehicles set [_side, _sideDict];

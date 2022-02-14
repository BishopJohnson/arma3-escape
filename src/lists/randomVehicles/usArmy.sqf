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
_vehicles set ["mrzr", ["rhsusf_mrzr4_d", ["mud"], true]];

// Humvee
_vehicles set ["m1043", ["rhsusf_m1043_d", true, true]];

// Humvee (enhanced variant)
_vehicles set ["m1151", ["rhsusf_m1151_usarmy_d", true, true]];

_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = createHashMap;

// Humvee
_vehicles set ["m1043", [
    ["rhsusf_m1043_d_m2", "rhsusf_m1043_d_mk19", "rhsusf_m1045_d"],
    true,
    true
]];

// Humvee (enhanced variant)
_vehicles set ["m1151", [
    [
        ["rhsusf_m1151_m2_v1_usarmy_d", "rhsusf_m1151_m2_lras3_v1_usarmy_d", "rhsusf_m1151_m240_v1_usarmy_d", "rhsusf_m1151_mk19_v1_usarmy_d"],
        ["rhsusf_m1151_m2_v2_usarmy_d", "rhsusf_m1151_m240_v2_usarmy_d", "rhsusf_m1151_mk19_v2_usarmy_d"],
        ["rhsusf_m1151_m2crows_usarmy_d", "rhsusf_m1151_mk19crows_usarmy_d"]
    ],
    true,
    true
]];

_dict set [RAND_VEH_CAR_ARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;

// M1083
_vehicles set ["m1083", ["rhsusf_M1083A1P2_B_D_fmtv_usarmy", true, true]];

// HEMTT
_vehicles set ["m977", ["rhsusf_M977A4_usarmy_d", true, true]];

_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks armed
_vehicles = createHashMap;

// M1083
_vehicles set ["m1085", ["rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy", true, true]];

// HEMTT
_vehicles set ["hemtt", ["rhsusf_M977A4_BKIT_M2_usarmy_d", true, true]];

_dict set [RAND_VEH_TRUCK_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;

// M1085
_vehicles set ["m1083", ["rhsusf_MA085A1P2_B_D_Medical_fmtv_usarmy", true, true]];

// HEMTT
_vehicles set ["hemtt", [
    ["rhsusf_M977A4_AMMO_usarmy_d", "rhsusf_M977A4_REPAIR_usarmy_d", "rhsusf_M978A4_usarmy_d"],
    true,
    true
]];

_dict set [RAND_VEH_UTIL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = createHashMap;

// M1220
_vehicles set ["m1220", ["rhsusf_M1220_usarmy_d", true, true]];

// M1232
_vehicles set ["m1232", ["rhsusf_M1232_usarmy_d", true, true]];

// M1240
_vehicles set ["m1240", ["rhsusf_M1240a1_usarmy_d", true, true]];

_dict set [RAND_VEH_MRAP_UNARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = createHashMap;

// M1117
_vehicles set ["m1117", ["rhsusf_M1117_D", true, true]];

// M1220
_vehicles set ["m1220", [
    [
        ["rhsusf_M1220_M2_usarmy_d", "rhsusf_M1220_MK19_usarmy_d"],
        ["rhsusf_M1220_M153_M2_usarmy_d", "rhsusf_M1220_M153_MK19_usarmy_d"]
    ],
    true,
    true
]];

// M1232
_vehicles set ["m1232", [
    ["rhsusf_M1232_M2_usarmy_d", "rhsusf_M1232_MK19_usarmy_d"],
    true,
    true
]];

// M1240
_vehicles set ["m1240", [
    [
        ["rhsusf_M1240a1_m2_usarmy_d", "rhsusf_M1240a1_m240_usarmy_d", "rhsusf_M1240a1_mk19_usarmy_d"],
        ["rhsusf_M1240a1_m2crows_usarmy_d", "rhsusf_M1240a1_mk19crows_usarmy_d"]
    ],
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

// Stryker
_vehicles set ["m1126", [
    [
        ["rhsusf_stryker_m1126_m2_d", "rhsusf_stryker_m1126_mk19_d"],
        ["rhsusf_stryker_m1127_m2_d"],
        ["rhsusf_stryker_m1132_m2_np_d"],
        ["rhsusf_stryker_m1134_d"]
    ],
    true,
    true
]];

// Bradley
_vehicles set ["bradley", [
    [
        ["RHS_M2A2"],
        ["RHS_M2A2_BUSKI"],
        ["RHS_M2A3"],
        ["RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII"]
    ],
    true,
    true
]];

_dict set [RAND_VEH_IFV_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = createHashMap;

// M113
_vehicles set ["m113", [
    [
        ["rhsusf_M113d_usarmy_unarmed", "rhsusf_M113d_usarmy_M240", "rhsusf_M113d_usarmy_MK19", "rhsusf_M113d_usarmy_medical", "rhsusf_M113d_usarmy_supply"],
        ["rhsusf_M113d_usarmy"]
    ],
    true,
    true
]];

_dict set [RAND_VEH_APC_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = createHashMap;

// Abrams
_vehicles set ["abrams", [
    [
        ["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy"],
        ["rhsusf_m1a2sep1tuskiid_usarmy"],
        ["rhsusf_m1a2sep2d_usarmy"]
    ],
    true,
    true
]];

_dict set [RAND_VEH_TANK_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Tank special
_vehicles = createHashMap;
_dict set [RAND_VEH_TANK_SPECIAL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = createHashMap;

// M142
_vehicles set ["m142", ["rhsusf_M142_usarmy_D", true, true]];

// M109
_vehicles set ["m109", ["rhsusf_m109d_usarmy", true, true]];

_dict set [RAND_VEH_ARTY_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = createHashMap;

// Bradley
_vehicles set ["bradley", ["RHS_M6", true, true]];

_dict set [RAND_VEH_AA_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = createHashMap;

// Blackhawk
_vehicles set ["blackHawk", ["RHS_UH60M_d", true, true]];

// Chinook
_vehicles set ["chinook", ["RHS_CH_47F_10", true, true]];

_dict set [RAND_VEH_HELI_T_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = createHashMap;

// Little Bird
_vehicles set ["littleBird", ["RHS_MELB_AH6M", true, true]];

// Black Hawk
_vehicles set ["blackHawk", ["RHS_UH60M_d", true, true]];

// Chinook
_vehicles set ["chinook", ["RHS_CH_47F_10", true, true]];

_dict set [RAND_VEH_HELI_L_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = createHashMap;

// Apache
_vehicles set ["apache", ["RHS_AH64D", true, true]];

_dict set [RAND_VEH_HELI_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_HELI_UAV_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = createHashMap;

// Warthog
_vehicles set ["warthog", ["RHS_A10", true, true]];

// Raptor
_vehicles set ["raptor", ["rhsusf_f22", true, true]];

_dict set [RAND_VEH_PLANE_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_PLANE_UAV_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = createHashMap;

// Browning
_vehicles set ["browning", [["RHS_M2StaticMG_MiniTripod_D"], true, true]];

// Mk19
_vehicles set ["browning", [["RHS_MK19_TriPod_D"], true, true]];

// TOW
_vehicles set ["browning", [["RHS_TOW_TriPod_D"], true, true]];

_dict set [RAND_VEH_TURRET_L_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret mid
_vehicles = createHashMap;
_dict set [RAND_VEH_TURRET_M_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = createHashMap;

// Browning
_vehicles set ["browning", [["RHS_M2StaticMG_D"], true, true]];

_dict set [RAND_VEH_TURRET_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Turret special
_vehicles = createHashMap;

// Stinger
_vehicles set ["stinger", [["RHS_Stinger_AA_pod_D"], true, true]];

_dict set [RAND_VEH_TURRET_S_KEY, _vehicles];

private _side = str west;
private _sideDict = Escape_Random_Vehicles get _side;
_sideDict set [US_ARMY_KEY, _dict];
Escape_Random_Vehicles set [_side, _sideDict];

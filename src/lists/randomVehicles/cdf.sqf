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

// UAZ
_vehicles set ["uaz", [
    ["rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_open"],
    true,
    true
]];

_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = createHashMap;

// UAZ
_vehicles set ["uaz", [
    ["rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_ags", "rhsgref_cdf_reg_uaz_spg9"],
    true,
    true
]];

_dict set [RAND_VEH_CAR_ARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;

// GAZ
_vehicles set ["gaz", ["rhsgref_cdf_gaz66", true, true]];

// Ural
_vehicles set ["ural", [
    ["rhsgref_cdf_ural", "rhsgref_cdf_ural_open"],
    true,
    true
]];

// ZiL
_vehicles set ["zil", ["rhsgref_cdf_zil131", true, true]];

_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks armed
_vehicles = createHashMap;
_dict set [RAND_VEH_TRUCK_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;

// GAZ
_vehicles set ["gaz", ["rhsgref_cdf_gaz66_ammo", true, true]];

// Ural
_vehicles set ["ural", [
    ["rhsgref_cdf_ural_fuel", "rhsgref_cdf_ural_repair"],
    true,
    true
]];

_dict set [RAND_VEH_UTIL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = createHashMap;

// BRDM
_vehicles set ["brdm", ["rhsgref_BRDM2UM", true, true]];

_dict set [RAND_VEH_MRAP_UNARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = createHashMap;

// BRDM
_vehicles set ["brdm", [
    ["rhsgref_BRDM2", "rhsgref_BRDM2_HQ", "rhsgref_BRDM2_ATGM"],
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

// BMD
_vehicles set ["bmd", [
    [
        ["rhsgref_cdf_bmd1", "rhsgref_cdf_bmd1k"],
        ["rhsgref_cdf_bmd1pk"],
        ["rhsgref_cdf_bmd1p", "rhsgref_cdf_bmd2"]
    ],
    true,
    true
]];

// BMP
_vehicles set ["bmp", [
    [
        ["rhsgref_cdf_bmp1", "rhsgref_cdf_bmp1d", "rhsgref_cdf_bmp1k"],
        ["rhsgref_cdf_bmp1p"],
        ["rhsgref_cdf_bmp2", "rhsgref_cdf_bmp2e", "rhsgref_cdf_bmp2d", "rhsgref_cdf_bmp2k"]
    ],
    true,
    true
]];

_dict set [RAND_VEH_IFV_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = createHashMap;

// BTR
_vehicles set ["btr", [
    ["rhsgref_cdf_btr60", "rhsgref_cdf_btr70", "rhsgref_cdf_btr80"],
    true,
    true
]];

_dict set [RAND_VEH_APC_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = createHashMap;

// T-72
_vehicles set ["t72", [
    ["rhsgref_cdf_t72ba_tv", "rhsgref_cdf_t72bb_tv"],
    true,
    true
]];

// T-80
_vehicles set ["t80", [
    [
        ["rhsgref_cdf_t80b_tv", "rhsgref_cdf_t80bv_tv"],
        ["rhsgref_cdf_t80u_tv", "rhsgref_cdf_t80uk_tv"]
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

// Ural
_vehicles set ["ural", ["rhsgref_cdf_reg_BM21", true, true]];

// 2S1
_vehicles set ["ural", [
    ["rhsgref_cdf_2s1", "rhsgref_cdf_2s1_at"],
    true,
    true
]];

_dict set [RAND_VEH_ARTY_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = createHashMap;

// GAZ
_vehicles set ["gaz", ["rhsgref_cdf_gaz66_zu23", true, true]];

// Ural
_vehicles set ["ural", ["rhsgref_cdf_ural_Zu23", true, true]];

// ZSU
_vehicles set ["zsu", ["rhsgref_cdf_zsu234", true, true]];

_dict set [RAND_VEH_AA_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = createHashMap;

// Mi-8
_vehicles set ["mi8", ["rhsgref_cdf_reg_Mi8amt", true, true]];

_dict set [RAND_VEH_HELI_T_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = createHashMap;

// Mi-8
_vehicles set ["mi8", ["rhsgref_cdf_reg_Mi17Sh", true, true]];

_dict set [RAND_VEH_HELI_L_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = createHashMap;

// Hind
_vehicles set ["hind", [
    ["rhsgref_cdf_Mi24D_early", "rhsgref_cdf_Mi24D", "rhsgref_Mi24g_CAS", "rhsgref_cdf_Mi35"],
    true,
    true
]];

_dict set [RAND_VEH_HELI_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_HELI_UAV_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = createHashMap;

// Frogfoot
_vehicles set ["frogfoot", ["rhsgref_cdf_su25", true, true]];

// L-39/L-159
_vehicles set ["albatros", [
    ["rhs_l39_cdf", "rhs_l159_CDF"],
    true,
    true
]];

// Fulcrum (MiG-29)
_vehicles set ["fulcrum", ["rhsgref_cdf_mig29s", true, true]];

_dict set [RAND_VEH_PLANE_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_PLANE_UAV_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = createHashMap;

// DSHkM
_vehicles set ["dshkm", [["rhsgref_cdf_DSHKM_Mini_TriPod"], true, true]];

// NSV
_vehicles set ["nsv", [["rhsgref_cdf_NSV_TriPod"], true, true]];

// AGS-30
_vehicles set ["ags30", [["rhsgref_cdf_AGS30_TriPod"], true, true]];

// SPG-9
_vehicles set ["spg9", [["rhsgref_cdf_SPG9M"], true, true]];

_dict set [RAND_VEH_TURRET_L_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret mid
_vehicles = createHashMap;
_dict set [RAND_VEH_TURRET_M_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = createHashMap;

// DSHkM
_vehicles set ["dshkm", [["rhsgref_cdf_DSHKM"], true, true]];

_dict set [RAND_VEH_TURRET_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Turret special
_vehicles = createHashMap;

// Igla
_vehicles set ["igla", [["rhsgref_cdf_Igla_AA_pod"], true, true]];

// ZU-23
_vehicles set ["zu23", [["RHSgref_cdf_ZU23"], true, true]];

_dict set [RAND_VEH_TURRET_S_KEY, _vehicles];

private _side = str independent;
private _sideDict = Escape_Random_Vehicles get _side;
_sideDict set [CDF_KEY, _dict];
Escape_Random_Vehicles set [_side, _sideDict];

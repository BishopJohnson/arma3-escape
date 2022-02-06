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
    ["RHS_UAZ_MSV_01", "rhs_uaz_open_MSV_01"],
    true,
    true
]];

// GAZ
_vehicles set ["gaz", [
    ["rhs_tigr_3camo_msv", "rhs_tigr_m_3camo_msv"],
    true,
    true
]];

_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = createHashMap;

// GAZ
_vehicles set ["gaz", ["rhs_tigr_sts_3camo_msv", true, true]];

_dict set [RAND_VEH_CAR_ARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;

// GAZ
_vehicles set ["gaz", ["rhs_gaz66_msv", true, true]];

// Ural
_vehicles set ["ural", [
    ["RHS_Ural_MSV_01", "RHS_Ural_Open_MSV_01"],
    true,
    true
]];

// ZiL
_vehicles set ["zil", ["rhs_zil131_msv", true, true]];

// KrAZ
_vehicles set ["kraz", [
    ["rhs_kraz255b1_bmkt_msv", "rhs_kraz255b1_pmp_msv", "rhs_kraz255b1_cargo_open_msv"],
    true,
    true
]];

// KamAZ
_vehicles set ["kamaz", ["rhs_kamaz5350_msv", true, true]];

_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks armed
_vehicles = createHashMap;
_dict set [RAND_VEH_TRUCK_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;

// GAZ
_vehicles set ["gaz", ["rhs_gaz66_ammo_msv", true, true]];

// Ural
_vehicles set ["ural", [
    ["RHS_Ural_Ammo_MSV_01", "RHS_Ural_Fuel_MSV_01", "RHS_Ural_Repair_MSV_01"],
    true,
    true
]];

// KamAZ
_vehicles set ["kamaz", ["rhs_kamaz5350_ammo_msv", true, true]];

_dict set [RAND_VEH_UTIL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = createHashMap;

// BRDM
_vehicles set ["brdm", ["rhsgref_BRDM2UM_msv", true, true]];

_dict set [RAND_VEH_MRAP_UNARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = createHashMap;

// BRDM
_vehicles set ["brdm", [
    ["rhsgref_BRDM2_msv", "rhsgref_BRDM2_HQ_msv", "rhsgref_BRDM2_ATGM_msv"],
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

// BMP
_vehicles set ["bmp", [
    [
        ["rhs_bmp1_msv", "rhs_bmp1d_msv", "rhs_bmp1k_msv"],
        ["rhs_bmp1p_msv"],
        ["rhs_bmp2e_msv", "rhs_bmp2_msv", "rhs_bmp2d_msv", "rhs_bmp2k_msv"],
        ["rhs_bmp3_msv", "rhs_bmp3_late_msv", "rhs_bmp3m_msv", "rhs_bmp3mera_msv"]
    ],
    true,
    true
]];

// BRM
_vehicles set ["t14", ["rhs_brm1k_msv", true, true]];

// Obyekt
_vehicles set ["obyekt", ["rhs_Ob_681_2", true, true]];

// PRP
_vehicles set ["prp", ["rhs_prp3_msv", true, true]];

// T-15
_vehicles set ["t15", ["rhs_t15_tv", true, true]];

_dict set [RAND_VEH_IFV_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = createHashMap;

// BTR
_vehicles set ["btr", [
    ["rhs_btr60_msv", "rhs_btr70_msv", "rhs_btr80_msv", "rhs_btr80a_msv"],
    true,
    true
]];

_dict set [RAND_VEH_APC_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = createHashMap;

// T-72
_vehicles set ["t72", [
    [
        ["rhs_t72ba_tv", "rhs_t72bb_tv", "rhs_t72bc_tv"],
        ["rhs_t72bd_tv"],
        ["rhs_t72be_tv"]
    ],
    true,
    true
]];

// T-80
_vehicles set ["t80", [
    [
        ["rhs_t80", "rhs_t80a", "rhs_t80b", "rhs_t80bk", "rhs_t80bv", "rhs_t80bvk"],
        ["rhs_t80u", "rhs_t80u45m", "rhs_t80uk", "rhs_t80um"],
        ["rhs_t80ue1"]
    ],
    true,
    true
]];

// T-90
_vehicles set ["t90", [
    [
        ["rhs_t90_tv", "rhs_t90a_tv", "rhs_t90saa_tv"],
        ["rhs_t90am_tv", "rhs_t90sab_tv", "rhs_t90sm_tv"]
    ],
    true,
    true
]];

// T-14
_vehicles set ["t14", ["rhs_t14_tv", true, true]];

_dict set [RAND_VEH_TANK_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Tank special
_vehicles = createHashMap;

// 2S25
_vehicles set ["2S25", ["rhs_sprut_vdv", true, true]];

_dict set [RAND_VEH_TANK_SPECIAL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = createHashMap;

// Ural
_vehicles set ["ural", ["RHS_BM21_MSV_01", true, true]];

// 2S1
_vehicles set ["2S1", [
    ["rhs_2s1_tv", "rhs_2s1_at_tv"],
    true,
    true
]];

// 2S3
_vehicles set ["2S3", [
    ["rhs_2s3_tv", "rhs_2s3_at_tv"],
    true,
    true
]];

_dict set [RAND_VEH_ARTY_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = createHashMap;

// GAZ
_vehicles set ["gaz", ["rhs_gaz66_zu23_msv", true, true]];

// Ural
_vehicles set ["ural", ["RHS_Ural_Zu23_MSV_01", true, true]];

// ZSU-23
_vehicles set ["zsu23", ["rhs_zsu234_aa", true, true]];

_dict set [RAND_VEH_AA_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = createHashMap;

// Ka-60
_vehicles set ["ka60", ["rhs_ka60_c", true, true]];

_dict set [RAND_VEH_HELI_T_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = createHashMap;

// Mi-8
_vehicles set ["mi8", [
    ["RHS_Mi8AMTSh_vvsc", "RHS_Mi8MTV3_heavy_vvsc"],
    true,
    true
]];

_dict set [RAND_VEH_HELI_L_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = createHashMap;

// Ka-52
_vehicles set ["ka52", ["RHS_Ka52_vvsc", true, true]];

// Hind
_vehicles set ["hind", ["RHS_Mi24V_vvsc", true, true]];

// Havoc
_vehicles set ["havoc", ["rhs_mi28n_vvsc", true, true]];

_dict set [RAND_VEH_HELI_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_HELI_UAV_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = createHashMap;

// Frogfoot
_vehicles set ["frogfoot", ["RHS_Su25SM_vvsc", true, true]];

// Fulcrum (MiG-29)
_vehicles set ["fulcrum", ["rhs_mig29s_vvsc", true, true]];

// Felon (Su-57)
_vehicles set ["felon", ["RHS_T50_vvs_blueonblue", ["standard4"], true]];

_dict set [RAND_VEH_PLANE_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_PLANE_UAV_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = createHashMap;
_dict set [RAND_VEH_TURRET_L_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret mid
_vehicles = createHashMap;
_dict set [RAND_VEH_TURRET_M_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = createHashMap;
_dict set [RAND_VEH_TURRET_H_KEY, _vehicles];

private _side = str east;
private _sideDict = Escape_Random_Vehicles get _side;
_sideDict set [RU_KEY, _dict];
Escape_Random_Vehicles set [_side, _sideDict];

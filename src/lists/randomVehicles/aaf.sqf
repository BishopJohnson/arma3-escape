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

private _dict = createHashMap;

private _usingJets = "IncludeJets" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Quadbike
_vehicles = createHashMap;

// Quadbike
_vehicles set ["quadbike", [["I_Quadbike_01_F"], true, true]];

_dict set [RAND_VEH_QUADBIKE_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = createHashMap;
_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars armed
_vehicles = createHashMap;
_dict set [RAND_VEH_CAR_ARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;

// Zamak
_vehicles set ["zamak", [["I_Truck_02_transport_F", "I_Truck_02_covered_F"], true, true]];

_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks armed
_vehicles = createHashMap;
_dict set [RAND_VEH_TRUCK_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;

// Zamak
_vehicles set ["zamak", [
    ["I_Truck_02_box_F", "I_Truck_02_ammo_F", "I_Truck_02_fuel_F", "I_Truck_02_medical_F"],
    true,
    true
]];

_dict set [RAND_VEH_UTIL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs unarmed
_vehicles = createHashMap;

// Strider
_vehicles set ["strider", [["I_MRAP_03_F"], true, true]];

_dict set [RAND_VEH_MRAP_UNARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// MRAPs armed
_vehicles = createHashMap;

// Strider
_vehicles set ["strider", [["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"], true, true]];

_dict set [RAND_VEH_MRAP_ARMED_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV unarmed
_vehicles = createHashMap;

// Stomper
_vehicles set ["stomper", [["I_UGV_01_F"], true, true]];

_dict set [RAND_VEH_UGV_UNARMED_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// UGV armed
_vehicles = createHashMap;

// Stomper
_vehicles set ["stomper", [["I_UGV_01_rcws_F"], true, true]];

_dict set [RAND_VEH_UGV_ARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// IFVs
_vehicles = createHashMap;

// Gorgon
_vehicles set ["gorgon", [
    ["I_APC_Wheeled_03_cannon_F"],
    true,
    ["Escape_Gorgon_Default", "Escape_Gorgon_Cage", "Escape_Gorgon_Net"]
]];

_dict set [RAND_VEH_IFV_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// APCs
_vehicles = createHashMap;

// Mora
_vehicles set ["mora", [
    ["I_APC_tracked_03_cannon_F"],
    true,
    ["Escape_Gorgon_Default", "Escape_Mora_Cage", "Escape_Mora_Net"]
]];

_dict set [RAND_VEH_APC_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Tanks
_vehicles = createHashMap;

// Kuma
_vehicles set ["kuma", [
    ["I_MBT_03_cannon_F"],
    true,
    ["Escape_Kuma_Default", "Escape_Kuma_Net"]
]];

_dict set [RAND_VEH_TANK_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Tank special
_vehicles = createHashMap;

// Nyx
if (_usingTanks) then
{
    _vehicles set ["nyx", [
        ["I_LT_01_scout_F", "I_LT_01_cannon_F", "I_LT_01_AT_F"],
        true,
        ["Escape_Kuma_Default", "Escape_Kuma_Net"]
    ]];
};

_dict set [RAND_VEH_TANK_SPECIAL_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Artillery
_vehicles = createHashMap;

// Zamak MRL
_vehicles set ["zamak", [["I_Truck_02_MRL_F"], true, true]];

_dict set [RAND_VEH_ARTY_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Anti-Air
_vehicles = createHashMap;

// Nyx
if (_usingTanks) then
{
    _vehicles set ["nyx", [
        ["I_LT_01_AA_F"],
        true,
        ["Escape_Kuma_Default", "Escape_Kuma_Net"]
    ]];
};

_dict set [RAND_VEH_AA_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter transport
_vehicles = createHashMap;

// Hellcat
_vehicles set ["hellcat", [["I_Heli_light_03_unarmed_F"], ["AAF"], true]];

// Mohawk
_vehicles set ["mohawk", [["I_Heli_Transport_02_F"], true, true]];

_dict set [RAND_VEH_HELI_T_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter light
_vehicles = createHashMap;

// Hellcat
_vehicles set ["hellcat", [["I_Heli_light_03_dynamicLoadout_F"], ["AAF"], true]];

_dict set [RAND_VEH_HELI_L_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter heavy
_vehicles = createHashMap;

// Hellcat
_vehicles set ["hellcat", [["I_Heli_light_03_dynamicLoadout_F"], ["AAF"], true]];

_dict set [RAND_VEH_HELI_H_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Helicopter UAV
_vehicles = createHashMap;
_dict set [RAND_VEH_HELI_UAV_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane
_vehicles = createHashMap;

// Buzzard
_vehicles set ["buzzard", [["I_Plane_Fighter_03_dynamicLoadout_F"], true, true]];

// Gryphon
if (_usingJets) then
{
    _vehicles set ["gryphon", [["I_Plane_Fighter_04_F"], ["DigitalCamoGreen"], true]];
};

_dict set [RAND_VEH_PLANE_KEY, _vehicles];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Plane UAV
_vehicles = createHashMap;

// K40 Ababil
_vehicles set ["ababil", [["I_UAV_02_dynamicLoadout_F"], true, true]];

_dict set [RAND_VEH_PLANE_UAV_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret low
_vehicles = createHashMap;

// HMG
_vehicles set ["hmg", [["I_HMG_01_F", "I_HMG_02_F"], true, true]];

// GMG
_vehicles set ["gmg", [["I_GMG_01_F"], true, true]];

_dict set [RAND_VEH_TURRET_L_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret mid
_vehicles = createHashMap;

// Titan AA
_vehicles set ["titanAa", [["I_static_AA_F"], true, true]];

// Titan AA
_vehicles set ["titanAt", [["I_static_AT_F"], true, true]];

_dict set [RAND_VEH_TURRET_M_KEY, _vehicles];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Turret high
_vehicles = createHashMap;

// HMG
_vehicles set ["hmg", [["I_HMG_01_high_F", "I_HMG_02_high_F"], true, true]];

// GMG
_vehicles set ["gmg", [["I_GMG_01_high_F"], true, true]];

_dict set [RAND_VEH_TURRET_H_KEY, _vehicles];

private _sideDict = Escape_Random_Vehicles get str independent;
_sideDict set [AAF_KEY, _dict];
Escape_Random_Vehicles set [str independent, _sideDict];

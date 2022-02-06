/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeRu" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["juniorSgt", ["rhs_msv_emr_junior_sergeant", true]];
_units set ["sgt", ["rhs_msv_emr_sergeant", true]];
_units set ["efreitor", ["rhs_msv_emr_efreitor", true]];
_units set ["officer", ["rhs_msv_emr_officer", true]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["rifleman", ["rhs_msv_emr_rifleman", true]];
_units set ["grenadier", ["rhs_msv_emr_grenadier", true]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["rshg2At", ["rhs_msv_emr_RShG2", true]];
_units set ["lightAt", ["rhs_msv_emr_LAT", true]];
_units set ["rpgGrenadier", ["rhs_msv_emr_grenadier_rpg", true]];
_units set ["rpgAt", ["rhs_msv_emr_at", true]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["iglaAa", ["rhs_msv_emr_aa", true]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["rhs_msv_emr_arifleman_rpk", true]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["rhs_msv_emr_marksman", true]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["machinGunnerPkm", ["rhs_msv_emr_machinegunner", true]];
_units set ["machinGunnerPkp", ["rhs_msv_emr_arifleman", true]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["asstMachinGunner", ["rhs_msv_emr_machinegunner_assistant", true]];
_units set ["asstAt", ["rhs_msv_emr_strelok_rpg_asst", true]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;
_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["cls", ["rhs_msv_emr_medic", true]];
_units set ["engineer", ["rhs_msv_emr_engineer", true]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;
_dict set [UNIT_CLASS_UAV, _units];

private _side = str east;
private _sideDict = Escape_Units get _side;
_sideDict set [RU_KEY, _dict];
Escape_Units set [_side, _sideDict];

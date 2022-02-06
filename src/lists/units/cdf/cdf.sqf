/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeCdf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["squadLeader", ["rhsgref_cdf_reg_squadleader", true]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["riflemanAk74", ["rhsgref_cdf_reg_rifleman", true]];
_units set ["riflemanAkm", ["rhsgref_cdf_reg_rifleman_akm", true]];
_units set ["riflemanAks74", ["rhsgref_cdf_reg_rifleman_aks74", true]];
_units set ["grenadier", ["rhsgref_cdf_reg_grenadier", true]];
_units set ["riflemanLight", ["rhsgref_cdf_reg_rifleman_lite", true]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["lightAt", ["rhsgref_cdf_reg_rifleman_rpg75", true]];
_units set ["heavyAt", ["rhsgref_cdf_reg_grenadier_rpg", true]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["iglaAa", ["rhsgref_cdf_reg_specialist_aa", true]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["rhsgref_cdf_reg_arifleman_rpk", true]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["rhsgref_cdf_reg_marksman", true]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["machineGunner", ["rhsgref_cdf_reg_machinegunner", true]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;
_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["cls", ["rhsgref_cdf_reg_medic", true]];
_units set ["engineer", ["rhsgref_cdf_reg_engineer", true]];

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;
_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;
_dict set [UNIT_CLASS_UAV, _units];

private _side = str independent;
private _sideDict = Escape_Units get _side;
_sideDict set [CDF_KEY, _dict];
Escape_Units set [_side, _sideDict];

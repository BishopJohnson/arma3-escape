/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeUsArmy" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["rhsusf_army_ocp_teamleader", true]];
_units set ["squadLeader", ["rhsusf_army_ocp_squadleader", true]];
_units set ["officer", ["rhsusf_army_ocp_officer", true]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["riflemanM4", ["rhsusf_army_ocp_rifleman", true]];
_units set ["riflemanM16", ["rhsusf_army_ocp_rifleman_m16", true]];
_units set ["grenadier", ["rhsusf_army_ocp_grenadier", true]];
_units set ["riflemanLight", ["rhsusf_army_ocp_riflemanl", true]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["riflemanAt", ["rhsusf_army_ocp_riflemanat", true]];
_units set ["maawsAt", ["rhsusf_army_ocp_maaws", true]];
_units set ["javelinAt", ["rhsusf_army_ocp_javelin", true]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["stingerAa", ["rhsusf_army_ocp_aa", true]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["rhsusf_army_ocp_autorifleman", true]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["rhsusf_army_ocp_marksman", true]];
_units set ["sniper", ["rhsusf_army_ocp_sniper", true]];
_units set ["sniperM24", ["rhsusf_army_ocp_sniperm24sws", true]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["machineGunner", ["rhsusf_army_ocp_machinegunner", true]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["asstAutorifleman", ["rhsusf_army_ocp_autoriflemana", true]];
_units set ["asstMachineGunner", ["rhsusf_army_ocp_machinegunnera", true]];
_units set ["asstJavelinAt", ["rhsusf_army_ocp_javelin_assistant", true]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["cls", ["rhsusf_army_ocp_medic", true]];
_units set ["engineer", ["rhsusf_army_ocp_engineer", true]];
_units set ["exp", ["rhsusf_army_ocp_expolsives", true]];

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;
_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;
_dict set [UNIT_CLASS_UAV, _units];

private _side = str west;
private _sideDict = Escape_Units get _side;
_sideDict set [US_ARMY_KEY, _dict];
Escape_Units set [_side, _sideDict];

/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeSpetsnaz" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", [["O_R_Soldier_TL_F", "O_R_Patrol_Soldier_TL_F"], true]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["O_R_JTAC_F", true]];
_units set ["grenadier", [["O_R_Soldier_GL_F", "O_R_Patrol_Soldier_GL_F"], true]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["lightAt", [["O_R_Soldier_LAT_F", "O_R_Patrol_Soldier_LAT_F"], true]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;
_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", [["O_R_Soldier_AR_F", "O_R_Patrol_Soldier_AR_F", "O_R_Patrol_Soldier_AR2_F"], true]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", [["O_R_soldier_M_F", "O_R_Patrol_Soldier_M_F"], true]];

if (_usingMarksmen) then
{
    _units set ["sharpshooter", ["O_R_Patrol_Soldier_M2_F", true]];
};

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;
_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["O_R_Patrol_Soldier_A_F", true]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", [["O_R_medic_F", "O_R_Patrol_Soldier_Medic"], true]];
_units set ["engineer", ["O_R_Patrol_Soldier_Engineer_F", true]];
_units set ["exp", ["O_R_soldier_exp_F", true]];

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;
_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;
_dict set [UNIT_CLASS_UAV, _units];

private _side = str east;
private _sideDict = Escape_Units get _side;
_sideDict set [SPETSNAZ_KEY, _dict];
Escape_Units set [_side, _sideDict];

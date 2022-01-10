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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["O_R_Soldier_TL_F", compile preprocessFile "src\lists\units\spetsnaz\teamLeader.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["O_R_JTAC_F", compile preprocessFile "src\lists\units\spetsnaz\jtac.sqf"]];
_units set ["grenadier", ["O_R_Soldier_GL_F", compile preprocessFile "src\lists\units\spetsnaz\grenadier.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["lightAt", ["O_R_Soldier_LAT_F", compile preprocessFile "src\lists\units\spetsnaz\riflemanAt.sqf"]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;
_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["O_R_Soldier_AR_F", compile preprocessFile "src\lists\units\spetsnaz\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["O_R_soldier_M_F", compile preprocessFile "src\lists\units\spetsnaz\marksman.sqf"]];

if (Escape_Using_Marksmen) then
{
    _units set ["sharpshooter", ["O_R_Patrol_Soldier_M2_F", compile preprocessFile "src\lists\units\spetsnaz\marksman.sqf"]];
};

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;
_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["O_R_Patrol_Soldier_A_F", compile preprocessFile "src\lists\units\spetsnaz\ammoBearer.sqf"]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["O_R_medic_F", compile preprocessFile "src\lists\units\spetsnaz\cls.sqf"]];
_units set ["engineer", ["O_R_Patrol_Soldier_Engineer_F", compile preprocessFile "src\lists\units\spetsnaz\engineer.sqf"]];
_units set ["exp", ["O_R_soldier_exp_F", compile preprocessFile "src\lists\units\spetsnaz\explosiveSpc.sqf"]];

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

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

_units set ["squadLeader", ["rhsgref_cdf_reg_squadleader", compile preprocessFile "src\lists\units\cdf\squadLeader.sqf"]];
/* Do not include officer unit */

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["rifleman", ["rhsgref_cdf_reg_rifleman", compile preprocessFile "src\lists\units\cdf\rifleman.sqf"]];
_units set ["grenadier", ["rhsgref_cdf_reg_grenadier", compile preprocessFile "src\lists\units\cdf\grenadier.sqf"]];
_units set ["riflemanLight", ["rhsgref_cdf_reg_rifleman_lite", compile preprocessFile "src\lists\units\cdf\riflemanLight.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["riflemanAt", ["rhsgref_cdf_reg_rifleman_rpg75", compile preprocessFile "src\lists\units\cdf\riflemanAt.sqf"]];
_units set ["heavyAt", ["rhsgref_cdf_reg_grenadier_rpg", compile preprocessFile "src\lists\units\cdf\missileSpcAt.sqf"]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["iglaAa", ["rhsgref_cdf_reg_specialist_aa", compile preprocessFile "src\lists\units\cdf\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["rhsgref_cdf_reg_arifleman_rpk", compile preprocessFile "src\lists\units\cdf\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["rhsgref_cdf_reg_marksman", compile preprocessFile "src\lists\units\cdf\marksman.sqf"]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["machineGunner", ["rhsgref_cdf_reg_machinegunner", compile preprocessFile "src\lists\units\cdf\machineGunner.sqf"]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;
_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["cls", ["rhsgref_cdf_reg_medic", compile preprocessFile "src\lists\units\cdf\cls.sqf"]];
_units set ["engineer", ["rhsgref_cdf_reg_engineer", compile preprocessFile "src\lists\units\cdf\engineer.sqf"]];

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

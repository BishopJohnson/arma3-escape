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

_units set ["teamLeader", ["rhsusf_army_ocp_teamleader", compile preprocessFile "src\lists\units\usArmy\teamLeader.sqf"]];
_units set ["squadLeader", ["rhsusf_army_ocp_squadleader", compile preprocessFile "src\lists\units\usArmy\squadLeader.sqf"]];
_units set ["officer", ["rhsusf_army_ocp_officer", compile preprocessFile "src\lists\units\usArmy\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["riflemanM4", ["rhsusf_army_ocp_rifleman", compile preprocessFile "src\lists\units\usArmy\rifleman.sqf"]];
_units set ["grenadier", ["rhsusf_army_ocp_grenadier", compile preprocessFile "src\lists\units\usArmy\grenadier.sqf"]];
_units set ["riflemanLight", ["rhsusf_army_ocp_riflemanl", compile preprocessFile "src\lists\units\usArmy\riflemanLight.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["riflemanAt", ["rhsusf_army_ocp_riflemanat", compile preprocessFile "src\lists\units\usArmy\riflemanAt.sqf"]];
_units set ["maawsAt", ["rhsusf_army_ocp_maaws", compile preprocessFile "src\lists\units\usArmy\riflemanAtHeavy.sqf"]];
_units set ["javelinAt", ["rhsusf_army_ocp_javelin", compile preprocessFile "src\lists\units\usArmy\missileSpcAt.sqf"]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["stingerAa", ["rhsusf_army_ocp_aa", compile preprocessFile "src\lists\units\usArmy\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["rhsusf_army_ocp_autorifleman", compile preprocessFile "src\lists\units\usArmy\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["rhsusf_army_ocp_marksman", compile preprocessFile "src\lists\units\usArmy\marksman.sqf"]];
_units set ["sniper", ["rhsusf_army_ocp_sniper", compile preprocessFile "src\lists\units\usArmy\sniper.sqf"]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["machineGunner", ["rhsusf_army_ocp_machinegunner", compile preprocessFile "src\lists\units\usArmy\machineGunner.sqf"]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["asstAutorifleman", ["rhsusf_army_ocp_autoriflemana", compile preprocessFile "src\lists\units\usArmy\asstAutorifleman.sqf"]];
_units set ["asstMachineGunner", ["rhsusf_army_ocp_machinegunnera", compile preprocessFile "src\lists\units\usArmy\asstMachineGunner.sqf"]];
_units set ["asstJavelinAt", ["rhsusf_army_ocp_javelin_assistant", compile preprocessFile "src\lists\units\usArmy\asstAtSpc.sqf"]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["cls", ["rhsusf_army_ocp_medic", compile preprocessFile "src\lists\units\usArmy\cls.sqf"]];
_units set ["engineer", ["rhsusf_army_ocp_engineer", compile preprocessFile "src\lists\units\usArmy\engineer.sqf"]];
_units set ["exp", ["rhsusf_army_ocp_expolsives", compile preprocessFile "src\lists\units\usArmy\explosiveSpc.sqf"]];

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

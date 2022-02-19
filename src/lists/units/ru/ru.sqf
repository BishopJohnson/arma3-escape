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

_units set ["jrSergeant", ["rhs_msv_emr_junior_sergeant", compile preprocessFile "src\lists\units\ru\jrSergeant.sqf"]];
_units set ["sergeant", ["rhs_msv_emr_sergeant", compile preprocessFile "src\lists\units\ru\sergeant.sqf"]];
_units set ["efreitor", ["rhs_msv_emr_efreitor", compile preprocessFile "src\lists\units\ru\efreitor.sqf"]];
_units set ["officer", ["rhs_msv_emr_officer", compile preprocessFile "src\lists\units\ru\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["rifleman", ["rhs_msv_emr_rifleman", compile preprocessFile "src\lists\units\ru\rifleman.sqf"]];
_units set ["grenadier", ["rhs_msv_emr_grenadier", compile preprocessFile "src\lists\units\ru\grenadier.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["riflemanAt", ["rhs_msv_emr_RShG2", compile preprocessFile "src\lists\units\ru\riflemanAt.sqf"]];
_units set ["lightAt", ["rhs_msv_emr_LAT", compile preprocessFile "src\lists\units\ru\riflemanAtLight.sqf"]];
_units set ["AtGrenadier", ["rhs_msv_emr_grenadier_rpg", compile preprocessFile "src\lists\units\ru\riflemanAtGrenadier.sqf"]];
_units set ["rpgAt", ["rhs_msv_emr_at", compile preprocessFile "src\lists\units\ru\missileSpcAt.sqf"]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["iglaAa", ["rhs_msv_emr_aa", compile preprocessFile "src\lists\units\ru\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["rhs_msv_emr_arifleman_rpk", compile preprocessFile "src\lists\units\ru\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["rhs_msv_emr_marksman", compile preprocessFile "src\lists\units\ru\marksman.sqf"]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["machinGunner", ["rhs_msv_emr_machinegunner", compile preprocessFile "src\lists\units\ru\machineGunner.sqf"]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["asstMachinGunner", ["rhs_msv_emr_machinegunner_assistant", compile preprocessFile "src\lists\units\ru\asstMachineGunner.sqf"]];
_units set ["asstAtGrenadier", ["rhs_msv_emr_strelok_rpg_asst", compile preprocessFile "src\lists\units\ru\asstAtGrenadier.sqf"]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;
_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["cls", ["rhs_msv_emr_medic", compile preprocessFile "src\lists\units\ru\cls.sqf"]];
_units set ["engineer", ["rhs_msv_emr_engineer", compile preprocessFile "src\lists\units\ru\engineer.sqf"]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;
_dict set [UNIT_CLASS_UAV, _units];

private _side = str east;
private _sideDict = Escape_Units get _side;
_sideDict set [RU_KEY, _dict];
Escape_Units set [_side, _sideDict];

/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeUsMarines" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["rhsusf_usmc_marpat_d_teamleader", compile preprocessFile "src\lists\units\usMarines\teamLeader.sqf"]];
_units set ["squadLeader", ["rhsusf_usmc_marpat_d_squadleader", compile preprocessFile "src\lists\units\usMarines\squadLeader.sqf"]];
_units set ["officer", ["rhsusf_usmc_marpat_d_officer", compile preprocessFile "src\lists\units\usMarines\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["rifleman", ["rhsusf_usmc_marpat_d_rifleman", compile preprocessFile "src\lists\units\usMarines\rifleman.sqf"]];
_units set ["grenadier", ["rhsusf_usmc_marpat_d_grenadier", compile preprocessFile "src\lists\units\usMarines\grenadier.sqf"]];
_units set ["riflemanLight", ["rhsusf_usmc_marpat_d_rifleman_light", compile preprocessFile "src\lists\units\usMarines\riflemanLight.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["riflemanAt", ["rhsusf_usmc_marpat_d_riflemanat", compile preprocessFile "src\lists\units\usMarines\riflemanAt.sqf"]];
_units set ["lawAt", ["rhsusf_usmc_marpat_d_rifleman_law", compile preprocessFile "src\lists\units\usMarines\riflemanAtLight.sqf"]];
_units set ["smawsAt", ["rhsusf_usmc_marpat_d_smaw", compile preprocessFile "src\lists\units\usMarines\riflemanAtHeavy.sqf"]];
_units set ["javelinAt", ["rhsusf_usmc_marpat_d_javelin", compile preprocessFile "src\lists\units\usMarines\missileSpcAt.sqf"]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["stingerAa", ["rhsusf_usmc_marpat_d_stinger", compile preprocessFile "src\lists\units\usMarines\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["rhsusf_usmc_marpat_d_autorifleman_m249", compile preprocessFile "src\lists\units\usMarines\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["rhsusf_usmc_marpat_d_marksman", compile preprocessFile "src\lists\units\usMarines\marksman.sqf"]];
_units set ["sniper", ["rhsusf_usmc_marpat_d_sniper", compile preprocessFile "src\lists\units\usMarines\sniper.sqf"]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["machineGunner", ["rhsusf_usmc_marpat_d_machinegunner", compile preprocessFile "src\lists\units\usArmy\machineGunner.sqf"]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["asstAutorifleman", ["rhsusf_usmc_marpat_d_autorifleman_m249_ass", compile preprocessFile "src\lists\units\usMarines\asstAutorifleman.sqf"]];
_units set ["asstMachineGunner", ["rhsusf_usmc_marpat_d_machinegunner_ass", compile preprocessFile "src\lists\units\usMarines\asstMachineGunner.sqf"]];
_units set ["asstJavelinAt", ["rhsusf_usmc_marpat_d_javelin_assistant", compile preprocessFile "src\lists\units\usMarines\asstAtSpc.sqf"]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["engineer", ["rhsusf_usmc_marpat_d_engineer", compile preprocessFile "src\lists\units\usMarines\engineer.sqf"]];
_units set ["exp", ["rhsusf_usmc_marpat_d_explosives", compile preprocessFile "src\lists\units\usMarines\explosiveSpc.sqf"]];

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;
_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;
_dict set [UNIT_CLASS_UAV, _units];

private _side = str west;
private _sideDict = Escape_Units get _side;
_sideDict set [US_MARINES_KEY, _dict];
Escape_Units set [_side, _sideDict];

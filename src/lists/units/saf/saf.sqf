/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeSaf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["rhssaf_army_m10_digital_ft_lead", compile preprocessFile "src\lists\units\saf\teamLeader.sqf"]];
_units set ["squadLeader", ["rhssaf_army_m10_digital_sq_lead", compile preprocessFile "src\lists\units\saf\squadLeader.sqf"]];
_units set ["officer", ["rhssaf_army_m10_digital_officer", compile preprocessFile "src\lists\units\saf\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["rifleman", ["rhssaf_army_m10_digital_rifleman_m70", compile preprocessFile "src\lists\units\saf\rifleman.sqf"]];
_units set ["grenadier", ["rhssaf_army_m10_digital_gl", compile preprocessFile "src\lists\units\saf\grenadier.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["riflemanAt", ["rhssaf_army_m10_digital_rifleman_at", compile preprocessFile "src\lists\units\saf\riflemanAt.sqf"]];
_units set ["smawsAt", ["rhssaf_army_m10_digital_spec_at", compile preprocessFile "src\lists\units\saf\missileSpcAt.sqf"]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["iglaAa", ["rhssaf_army_m10_digital_spec_aa", compile preprocessFile "src\lists\units\saf\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;
_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["rhssaf_army_m10_digital_sniper_m76", compile preprocessFile "src\lists\units\saf\marksman.sqf"]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["machineGunner", ["rhssaf_army_m10_digital_mgun_m84", compile preprocessFile "src\lists\units\saf\machineGunner.sqf"]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["rhssaf_army_m10_digital_rifleman_ammo", compile preprocessFile "src\lists\units\saf\ammoBearer.sqf"]];
_units set ["asstMachineGunner", ["rhssaf_army_m10_digital_asst_mgun", compile preprocessFile "src\lists\units\saf\asstMachineGunner.sqf"]];
_units set ["asstAt", ["rhssaf_army_m10_digital_asst_spec_at", compile preprocessFile "src\lists\units\saf\asstAtSpc.sqf"]];
_units set ["asstAa", ["rhssaf_army_m10_digital_asst_spec_aa", compile preprocessFile "src\lists\units\saf\asstAaSpc.sqf"]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["cls", ["rhssaf_army_m10_digital_medic", compile preprocessFile "src\lists\units\saf\cls.sqf"]];
_units set ["engineer", ["rhssaf_army_m10_digital_engineer", compile preprocessFile "src\lists\units\saf\engineer.sqf"]];
_units set ["exp", ["rhssaf_army_m10_digital_exp", compile preprocessFile "src\lists\units\saf\explosiveSpc.sqf"]];
_units set ["repair", ["rhssaf_army_m10_digital_repair", compile preprocessFile "src\lists\units\saf\repairSpc.sqf"]];

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;
_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;
_dict set [UNIT_CLASS_UAV, _units];

private _side = str independent;
private _sideDict = Escape_Units get _side;
_sideDict set [SAF_KEY, _dict];
Escape_Units set [_side, _sideDict];

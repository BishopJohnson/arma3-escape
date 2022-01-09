/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeAaf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["I_Soldier_TL_F", compile preprocessFile "src\lists\units\aaf\teamLeader.sqf"]];
_units set ["squadLeader", ["I_Soldier_SL_F", compile preprocessFile "src\lists\units\aaf\squadLeader.sqf"]];
_units set ["officer", ["I_officer_F", compile preprocessFile "src\lists\units\aaf\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["I_Soldier_F", compile preprocessFile "src\lists\units\aaf\rifleman.sqf"]];
_units set ["grenadier", ["I_Soldier_GL_F", compile preprocessFile "src\lists\units\aaf\grenadier.sqf"]];
_units set ["light", ["I_Soldier_lite_F", compile preprocessFile "src\lists\units\aaf\riflemanLight.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["heavyAt", ["I_Soldier_LAT_F", compile preprocessFile "src\lists\units\aaf\riflemanAt.sqf"]];
_units set ["titanAt", ["I_Soldier_AT_F", compile preprocessFile "src\lists\units\aaf\riflemanAt.sqf"]];

if (Escape_Using_Tanks) then
{
    _units set ["lightAt", ["I_Soldier_LAT2_F", compile preprocessFile "src\lists\units\aaf\riflemanAtLight.sqf"]];
};

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["titanAa", ["I_Soldier_AA_F", compile preprocessFile "src\lists\units\aaf\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["I_Soldier_AR_F", compile preprocessFile "src\lists\units\aaf\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["I_Soldier_M_F", compile preprocessFile "src\lists\units\aaf\marksman.sqf"]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;
_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["I_Soldier_A_F", compile preprocessFile "src\lists\units\aaf\ammoBearer.sqf"]];
_units set ["asstAutorifleman", ["I_Soldier_AAR_F", compile preprocessFile "src\lists\units\aaf\asstAutorifleman.sqf"]];
_units set ["asstAt", ["I_Soldier_AAT_F", compile preprocessFile "src\lists\units\aaf\asstAtSpc.sqf"]];
_units set ["asstAa", ["I_Soldier_AAA_F", compile preprocessFile "src\lists\units\aaf\asstAaSpc.sqf"]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["I_medic_F", compile preprocessFile "src\lists\units\aaf\cls.sqf"]];
_units set ["engineer", ["I_engineer_F", compile preprocessFile "src\lists\units\aaf\engineer.sqf"]];
_units set ["exp", ["I_Soldier_exp_F", compile preprocessFile "src\lists\units\aaf\explosiveSpc.sqf"]];
_units set ["repair", ["I_Soldier_repair_F", compile preprocessFile "src\lists\units\aaf\repairSpc.sqf"]];

if (Escape_Using_Orange) then
{
    _units set ["mine", ["I_soldier_mine_F", compile preprocessFile "src\lists\units\aaf\mineSpc.sqf"]];
};

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["asstMg", ["I_support_AMG_F", compile preprocessFile "src\lists\units\aaf\asstGunnerHmgGmg.sqf"]];
_units set ["asstMortar", ["I_support_AMort_F", compile preprocessFile "src\lists\units\aaf\asstGunnerMortar.sqf"]];
_units set ["hmg", ["I_support_MG_F", compile preprocessFile "src\lists\units\aaf\gunnerHmg.sqf"]];
_units set ["gmg", ["I_support_GMG_F", compile preprocessFile "src\lists\units\aaf\gunnerGmg.sqf"]];
_units set ["mortar", ["I_support_Mort_F", compile preprocessFile "src\lists\units\aaf\gunnerMortar.sqf"]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;

_units set ["uav", ["I_soldier_UAV_F", compile preprocessFile "src\lists\units\aaf\uavDarter.sqf"]];

if (Escape_Using_Orange) then
{
    _units set ["uavPackage", ["I_soldier_UAV_06_F", compile preprocessFile "src\lists\units\aaf\uavPelican.sqf"]];
    _units set ["uavMedical", ["I_soldier_UAV_06_medical_F", compile preprocessFile "src\lists\units\aaf\uavPelicanMed.sqf"]];
};

if (Escape_Using_Contact) then
{
    _units set ["uavDemining", ["I_soldier_UAV_F", compile preprocessFile "src\lists\units\aaf\uavDemining.sqf"]];
};

_dict set [UNIT_CLASS_UAV, _units];

private _side = str independent;
private _sideDict = Escape_Units get _side;
_sideDict set [AAF_KEY, _dict];
Escape_Units set [_side, _sideDict];

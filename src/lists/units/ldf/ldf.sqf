/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeLdf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["I_E_Soldier_TL_F", compile preprocessFile "src\lists\units\ldf\teamLeader.sqf"]];
_units set ["squadLeader", ["I_E_Soldier_SL_F", compile preprocessFile "src\lists\units\ldf\squadLeader.sqf"]];
_units set ["officer", ["I_E_officer_F", compile preprocessFile "src\lists\units\ldf\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["I_E_Soldier_F", compile preprocessFile "src\lists\units\ldf\rifleman.sqf"]];
_units set ["grenadier", ["I_E_Soldier_GL_F", compile preprocessFile "src\lists\units\ldf\grenadier.sqf"]];
_units set ["light", ["I_E_Soldier_lite_F", compile preprocessFile "src\lists\units\ldf\riflemanLight.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["heavyAt", ["I_E_Soldier_LAT_F", compile preprocessFile "src\lists\units\ldf\riflemanAt.sqf"]];
_units set ["titanAt", ["I_E_Soldier_AT_F", compile preprocessFile "src\lists\units\ldf\missileSpcAt.sqf"]];

if (Escape_Using_Tanks) then
{
    _units set ["lightAt", ["I_E_Soldier_LAT2_F", compile preprocessFile "src\lists\units\ldf\riflemanAtLight.sqf"]];
};

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["titanAa", ["I_E_Soldier_AA_F", compile preprocessFile "src\lists\units\ldf\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["I_E_Soldier_AR_F", compile preprocessFile "src\lists\units\ldf\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["I_E_Soldier_M_F", compile preprocessFile "src\lists\units\ldf\marksman.sqf"]];

if (Escape_Using_Marksmen) then
{
    _units set ["sharpshooter", ["I_E_Soldier_M_F", compile preprocessFile "src\lists\units\ldf\sharpshooter.sqf"]];
};

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

if (Escape_Using_Marksmen) then
{
    _units set ["heavyGunner", ["I_E_Soldier_AR_F", compile preprocessFile "src\lists\units\ldf\heavyGunner.sqf"]];
};

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["I_E_Soldier_A_F", compile preprocessFile "src\lists\units\ldf\ammoBearer.sqf"]];
_units set ["asstAutorifleman", ["I_E_Soldier_AAR_F", compile preprocessFile "src\lists\units\ldf\asstAutorifleman.sqf"]];
_units set ["asstAt", ["I_E_Soldier_AAT_F", compile preprocessFile "src\lists\units\ldf\asstAtSpc.sqf"]];
_units set ["asstAa", ["I_E_Soldier_AAA_F", compile preprocessFile "src\lists\units\ldf\asstAaSpc.sqf"]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["I_E_medic_F", compile preprocessFile "src\lists\units\ldf\cls.sqf"]];
_units set ["engineer", ["I_E_engineer_F", compile preprocessFile "src\lists\units\ldf\engineer.sqf"]];
_units set ["exp", ["I_E_Soldier_exp_F", compile preprocessFile "src\lists\units\ldf\explosiveSpc.sqf"]];
_units set ["repair", ["I_E_Soldier_repair_F", compile preprocessFile "src\lists\units\ldf\repairSpc.sqf"]];

if (Escape_Using_Orange) then
{
    _units set ["mine", ["I_E_soldier_mine_F", compile preprocessFile "src\lists\units\ldf\mineSpc.sqf"]];
};

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["asstMg", ["I_E_support_AMG_F", compile preprocessFile "src\lists\units\ldf\asstGunnerHmgGmg.sqf"]];
_units set ["asstMortar", ["I_E_support_AMort_F", compile preprocessFile "src\lists\units\ldf\asstGunnerMortar.sqf"]];
_units set ["hmg", ["I_E_support_MG_F", compile preprocessFile "src\lists\units\ldf\gunnerHmg.sqf"]];
_units set ["gmg", ["I_E_support_GMG_F", compile preprocessFile "src\lists\units\ldf\gunnerGmg.sqf"]];
_units set ["mortar", ["I_E_support_Mort_F", compile preprocessFile "src\lists\units\ldf\gunnerMortar.sqf"]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;

_units set ["uav", ["I_E_soldier_UAV_F", compile preprocessFile "src\lists\units\ldf\uavDarter.sqf"]];
_units set ["uavDemining", ["I_E_soldier_UGV_02_Demining_F", compile preprocessFile "src\lists\units\ldf\uavDemining.sqf"]];

if (Escape_Using_Orange) then
{
    _units set ["uavPackage", ["I_E_soldier_UAV_06_F", compile preprocessFile "src\lists\units\ldf\uavPelican.sqf"]];
    _units set ["uavMedical", ["I_E_soldier_UAV_06_medical_F", compile preprocessFile "src\lists\units\ldf\uavPelicanMed.sqf"]];
};

_dict set [UNIT_CLASS_UAV, _units];

private _side = str independent;
private _sideDict = Escape_Units get _side;
_sideDict set [LDF_KEY, _dict];
Escape_Units set [_side, _sideDict];

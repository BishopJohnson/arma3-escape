/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeChinese" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["O_T_Soldier_TL_F", compile preprocessFile "src\lists\units\csatP\teamLeader.sqf"]];
_units set ["squadLeader", ["O_T_Soldier_SL_F", compile preprocessFile "src\lists\units\csatP\squadLeader.sqf"]];
_units set ["officer", ["O_T_officer_F", compile preprocessFile "src\lists\units\csatP\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["O_T_Soldier_F", compile preprocessFile "src\lists\units\csatP\rifleman.sqf"]];
_units set ["grenadier", ["O_T_Soldier_GL_F", compile preprocessFile "src\lists\units\csatP\grenadier.sqf"]];
_units set ["light", ["O_Soldier_lite_F", compile preprocessFile "src\lists\units\csatP\riflemanLight.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["lightAt", ["O_T_Soldier_LAT_F", compile preprocessFile "src\lists\units\csatP\riflemanAt.sqf"]];
_units set ["titanAt", ["O_T_Soldier_AT_F", compile preprocessFile "src\lists\units\csatP\missileSpcAt.sqf"]];

if (Escape_Using_Tanks) then
{
    _units set ["heavyAt", ["O_T_Soldier_HAT_F", compile preprocessFile "src\lists\units\csatP\riflemanAtHeavy.sqf"]];
};

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["titanAa", ["O_T_Soldier_AA_F", compile preprocessFile "src\lists\units\csatP\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["O_T_Soldier_AR_F", compile preprocessFile "src\lists\units\csatP\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["O_T_soldier_M_F", compile preprocessFile "src\lists\units\csatP\marksman.sqf"]];

if (Escape_Using_Marksmen) then
{
    _units set ["sharpshooter", ["O_Sharpshooter_F", compile preprocessFile "src\lists\units\csatP\sharpshooter.sqf"]];
};

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

if (Escape_Using_Marksmen) then
{
    _units set ["heavyGunner", ["O_HeavyGunner_F", compile preprocessFile "src\lists\units\csatP\heavyGunner.sqf"]];
};

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["O_T_Soldier_A_F", compile preprocessFile "src\lists\units\csatP\ammoBearer.sqf"]];
_units set ["asstAutorifleman", ["O_T_Soldier_AAR_F", compile preprocessFile "src\lists\units\csatP\asstAutorifleman.sqf"]];
_units set ["asstAt", ["O_T_Soldier_AAT_F", compile preprocessFile "src\lists\units\csatP\asstAtSpc.sqf"]];
_units set ["asstAa", ["O_T_Soldier_AAA_F", compile preprocessFile "src\lists\units\csatP\asstAaSpc.sqf"]];

if (Escape_Using_Tanks) then
{
    _units set ["asstHAt", ["O_T_Soldier_AHAT_F", compile preprocessFile "src\lists\units\csatP\asstHeavyAt.sqf"]];
};

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["O_T_medic_F", compile preprocessFile "src\lists\units\csatP\cls.sqf"]];
_units set ["engineer", ["O_T_engineer_F", compile preprocessFile "src\lists\units\csatP\engineer.sqf"]];
_units set ["exp", ["O_T_soldier_exp_F", compile preprocessFile "src\lists\units\csatP\explosiveSpc.sqf"]];
_units set ["repair", ["O_T_soldier_repair_F", compile preprocessFile "src\lists\units\csatP\repairSpc.sqf"]];

if (Escape_Using_Orange) then
{
    _units set ["mine", ["O_T_soldier_mine_F", compile preprocessFile "src\lists\units\csatP\mineSpc.sqf"]];
};

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["asstMg", ["O_T_support_AMG_F", compile preprocessFile "src\lists\units\csatP\asstGunnerHmgGmg.sqf"]];
_units set ["asstMortar", ["O_T_support_AMort_F", compile preprocessFile "src\lists\units\csatP\asstGunnerMortar.sqf"]];
_units set ["hmg", ["O_T_support_MG_F", compile preprocessFile "src\lists\units\csatP\gunnerHmg.sqf"]];
_units set ["gmg", ["O_T_support_GMG_F", compile preprocessFile "src\lists\units\csatP\gunnerGmg.sqf"]];
_units set ["mortar", ["O_T_support_Mort_F", compile preprocessFile "src\lists\units\csatP\gunnerMortar.sqf"]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;

_units set ["uav", ["O_T_soldier_UAV_F", compile preprocessFile "src\lists\units\csatP\uavDarter.sqf"]];

if (Escape_Using_Orange) then
{
    _units set ["uavPackage", ["O_T_soldier_UAV_06_F", compile preprocessFile "src\lists\units\csatP\uavPelican.sqf"]];
    _units set ["uavMedical", ["O_T_soldier_UAV_06_medical_F", compile preprocessFile "src\lists\units\csatP\uavPelicanMed.sqf"]];
};

if (Escape_Using_Contact) then
{
    _units set ["uavDemining", ["O_soldier_UAV_F", compile preprocessFile "src\lists\units\csatP\uavDemining.sqf"]];
};

_dict set [UNIT_CLASS_UAV, _units];

private _side = str east;
private _sideDict = Escape_Units get _side;
_sideDict set [CSAT_P_KEY, _dict];
Escape_Units set [_side, _sideDict];

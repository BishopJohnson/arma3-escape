/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _include = "IncludeIranian" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["O_Soldier_TL_F", compile preprocessFile "src\lists\units\csat\teamLeader.sqf"]];
_units set ["squadLeader", ["O_Soldier_SL_F", compile preprocessFile "src\lists\units\csat\squadLeader.sqf"]];
_units set ["officer", ["O_officer_F", compile preprocessFile "src\lists\units\csat\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["O_Soldier_F", compile preprocessFile "src\lists\units\csat\rifleman.sqf"]];
_units set ["grenadier", ["O_Soldier_GL_F", compile preprocessFile "src\lists\units\csat\grenadier.sqf"]];
_units set ["light", ["O_Soldier_lite_F", compile preprocessFile "src\lists\units\csat\riflemanLight.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["lightAt", ["O_Soldier_LAT_F", compile preprocessFile "src\lists\units\csat\riflemanAt.sqf"]];
_units set ["titanAt", ["O_Soldier_AT_F", compile preprocessFile "src\lists\units\csat\missileSpcAt.sqf"]];

if (Escape_Using_Tanks) then
{
    _units set ["heavyAt", ["O_Soldier_HAT_F", compile preprocessFile "src\lists\units\csat\riflemanAtHeavy.sqf"]];
};

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["titanAa", ["O_Soldier_AA_F", compile preprocessFile "src\lists\units\csat\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["O_Soldier_AR_F", compile preprocessFile "src\lists\units\csat\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["O_soldier_M_F", compile preprocessFile "src\lists\units\csat\marksman.sqf"]];

if (Escape_Using_Marksmen) then
{
    _units set ["sharpshooter", ["O_Sharpshooter_F", compile preprocessFile "src\lists\units\csat\sharpshooter.sqf"]];
};

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

if (Escape_Using_Marksmen) then
{
    _units set ["heavyGunner", ["O_HeavyGunner_F", compile preprocessFile "src\lists\units\csat\heavyGunner.sqf"]];
};

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["O_Soldier_A_F", compile preprocessFile "src\lists\units\csat\ammoBearer.sqf"]];
_units set ["asstAutorifleman", ["O_Soldier_AAR_F", compile preprocessFile "src\lists\units\csat\asstAutorifleman.sqf"]];
_units set ["asstAt", ["O_Soldier_AAT_F", compile preprocessFile "src\lists\units\csat\asstAtSpc.sqf"]];
_units set ["asstAa", ["O_Soldier_AAA_F", compile preprocessFile "src\lists\units\csat\asstAaSpc.sqf"]];

if (Escape_Using_Tanks) then
{
    _units set ["asstHAt", ["O_Soldier_AHAT_F", compile preprocessFile "src\lists\units\csat\asstHeavyAt.sqf"]];
};

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["O_medic_F", compile preprocessFile "src\lists\units\csat\cls.sqf"]];
_units set ["engineer", ["O_engineer_F", compile preprocessFile "src\lists\units\csat\engineer.sqf"]];
_units set ["exp", ["O_soldier_exp_F", compile preprocessFile "src\lists\units\csat\explosiveSpc.sqf"]];
_units set ["repair", ["O_soldier_repair_F", compile preprocessFile "src\lists\units\csat\repairSpc.sqf"]];

if (Escape_Using_Orange) then
{
    _units set ["mine", ["O_soldier_mine_F", compile preprocessFile "src\lists\units\csat\mineSpc.sqf"]];
};

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["asstMg", ["O_support_AMG_F", compile preprocessFile "src\lists\units\csat\asstGunnerHmgGmg.sqf"]];
_units set ["asstMortar", ["O_support_AMort_F", compile preprocessFile "src\lists\units\csat\asstGunnerMortar.sqf"]];
_units set ["hmg", ["O_support_MG_F", compile preprocessFile "src\lists\units\csat\gunnerHmg.sqf"]];
_units set ["gmg", ["O_support_GMG_F", compile preprocessFile "src\lists\units\csat\gunnerGmg.sqf"]];
_units set ["mortar", ["O_support_Mort_F", compile preprocessFile "src\lists\units\csat\gunnerMortar.sqf"]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;

_units set ["uav", ["O_soldier_UAV_F", compile preprocessFile "src\lists\units\csat\uavDarter.sqf"]];

if (Escape_Using_Orange) then
{
    _units set ["uavPackage", ["O_soldier_UAV_06_F", compile preprocessFile "src\lists\units\csat\uavPelican.sqf"]];
    _units set ["uavMedical", ["O_soldier_UAV_06_medical_F", compile preprocessFile "src\lists\units\csat\uavPelicanMed.sqf"]];
};

if (Escape_Using_Contact) then
{
    _units set ["uavDemining", ["O_soldier_UAV_F", compile preprocessFile "src\lists\units\csat\uavDemining.sqf"]];
};

_dict set [UNIT_CLASS_UAV, _units];

private _side = str east;
private _sideDict = Escape_Units get _side;
_sideDict set [CSAT_KEY, _dict];
Escape_Units set [_side, _sideDict];

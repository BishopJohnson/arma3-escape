/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\..\define.hpp"

private ["_units"];

if (!isServer) exitWith {};

private _dict = createHashMap;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["B_Soldier_TL_F", compile preprocessFile "src\lists\units\nato\teamLeader.sqf"]];
_units set ["squadLeader", ["B_Soldier_SL_F", compile preprocessFile "src\lists\units\nato\squadLeader.sqf"]];
_units set ["officer", ["B_officer_F", compile preprocessFile "src\lists\units\nato\officer.sqf"]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["B_Soldier_F", compile preprocessFile "src\lists\units\nato\rifleman.sqf"]];
_units set ["grenadier", ["B_Soldier_GL_F", compile preprocessFile "src\lists\units\nato\grenadier.sqf"]];
_units set ["light", ["B_Soldier_lite_F", compile preprocessFile "src\lists\units\nato\riflemanLight.sqf"]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["heavyAt", ["B_soldier_LAT_F", compile preprocessFile "src\lists\units\nato\riflemanAt.sqf"]];
_units set ["lightAt", ["B_soldier_LAT2_F", compile preprocessFile "src\lists\units\nato\riflemanAtLight.sqf"]];
_units set ["titanAt", ["B_soldier_AT_F", compile preprocessFile "src\lists\units\nato\missileSpcAt.sqf"]];

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["titanAa", ["B_soldier_AA_F", compile preprocessFile "src\lists\units\nato\missileSpcAa.sqf"]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["B_Soldier_AR_F", compile preprocessFile "src\lists\units\nato\autorifleman.sqf"]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["B_soldier_M_F", compile preprocessFile "src\lists\units\nato\marksman.sqf"]];
_units set ["sharpshooter", ["B_Sharpshooter_F", compile preprocessFile "src\lists\units\nato\sharpshooter.sqf"]];

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

_units set ["heavyGunner", ["B_HeavyGunner_F", compile preprocessFile "src\lists\units\nato\heavyGunner.sqf"]];

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["B_Soldier_A_F", compile preprocessFile "src\lists\units\nato\ammoBearer.sqf"]];
_units set ["asstAutorifleman", ["B_soldier_AAR_F", compile preprocessFile "src\lists\units\nato\asstAutorifleman.sqf"]];
_units set ["asstAt", ["B_soldier_AAT_F", compile preprocessFile "src\lists\units\nato\asstAtSpc.sqf"]];
_units set ["asstAa", ["B_soldier_AAA_F", compile preprocessFile "src\lists\units\nato\asstAaSpc.sqf"]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["B_medic_F", compile preprocessFile "src\lists\units\nato\cls.sqf"]];
_units set ["engineer", ["B_engineer_F", compile preprocessFile "src\lists\units\nato\engineer.sqf"]];
_units set ["exp", ["B_soldier_exp_F", compile preprocessFile "src\lists\units\nato\explosiveSpc.sqf"]];
_units set ["mine", ["B_soldier_mine_F", compile preprocessFile "src\lists\units\nato\mineSpc.sqf"]];
_units set ["repair", ["B_soldier_repair_F", compile preprocessFile "src\lists\units\nato\repairSpc.sqf"]];

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["asstMg", ["B_support_AMG_F", compile preprocessFile "src\lists\units\nato\asstGunnerHmgGmg.sqf"]];
_units set ["asstMortar", ["B_support_AMort_F", compile preprocessFile "src\lists\units\nato\asstGunnerMortar.sqf"]];
_units set ["hmg", ["B_support_MG_F", compile preprocessFile "src\lists\units\nato\gunnerHmg.sqf"]];
_units set ["gmg", ["B_support_GMG_F", compile preprocessFile "src\lists\units\nato\gunnerGmg.sqf"]];
_units set ["mortar", ["B_support_Mort_F", compile preprocessFile "src\lists\units\nato\gunnerMortar.sqf"]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;

_units set ["uav", ["B_soldier_UAV_F", compile preprocessFile "src\lists\units\nato\uavDarter.sqf"]];
_units set ["uavPackage", ["B_soldier_UAV_06_F", compile preprocessFile "src\lists\units\nato\uavPelican.sqf"]];
_units set ["uavMedical", ["B_soldier_UAV_06_medical_F", compile preprocessFile "src\lists\units\nato\uavPelicanMed.sqf"]];
_units set ["uavDemining", ["B_soldier_UGV_02_Demining_F", compile preprocessFile "src\lists\units\nato\uavDemining.sqf"]];

_dict set [UNIT_CLASS_UAV, _units];

private _side = str west;
private _sideDict = Escape_Units get _side;
_sideDict set [NATO_KEY, _dict];
Escape_Units set [_side, _sideDict];

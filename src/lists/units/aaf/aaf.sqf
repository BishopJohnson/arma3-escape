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

private _usingContact = "IncludeContact" call BIS_fnc_getParamValue == 1;
private _usingOrange = "IncludeOrange" call BIS_fnc_getParamValue == 1;
private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["I_Soldier_TL_F", true]];
_units set ["squadLeader", ["I_Soldier_SL_F", true]];
_units set ["officer", ["I_officer_F", true]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["I_Soldier_F", true]];
_units set ["grenadier", ["I_Soldier_GL_F", true]];
_units set ["light", ["I_Soldier_lite_F", true]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["heavyAt", ["I_Soldier_LAT_F", true]];
_units set ["titanAt", ["I_Soldier_AT_F", true]];

if (_usingTanks) then
{
    _units set ["lightAt", ["I_Soldier_LAT2_F", true]];
};

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["titanAa", ["I_Soldier_AA_F", true]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["I_Soldier_AR_F", true]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["I_Soldier_M_F", true]];

if (_usingMarksmen) then
{
    /* TODO: Create loadout for sharpshooter.
    _units set ["sharpshooter", ["I_Soldier_M_F", true]];*/
};

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

if (_usingMarksmen) then
{
    /* TODO: Create loadout for heavy gunner.
    _units set ["heavyGunner", ["I_Soldier_AR_F", true]];*/
};

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["I_Soldier_A_F", true]];
_units set ["asstAutorifleman", ["I_Soldier_AAR_F", true]];
_units set ["asstAt", ["I_Soldier_AAT_F", true]];
_units set ["asstAa", ["I_Soldier_AAA_F", true]];

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["I_medic_F", true]];
_units set ["engineer", ["I_engineer_F", true]];
_units set ["exp", ["I_Soldier_exp_F", true]];
_units set ["repair", ["I_Soldier_repair_F", true]];

if (_usingOrange) then
{
    _units set ["mine", ["I_soldier_mine_F", true]];
};

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["asstMg", ["I_support_AMG_F", true]];
_units set ["asstMortar", ["I_support_AMort_F", true]];
_units set ["hmg", ["I_support_MG_F", true]];
_units set ["gmg", ["I_support_GMG_F", true]];
_units set ["mortar", ["I_support_Mort_F", true]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;

_units set ["uav", ["I_soldier_UAV_F", true]];

if (_usingOrange) then
{
    _units set ["uavPackage", ["I_soldier_UAV_06_F", true]];
    _units set ["uavMedical", ["I_soldier_UAV_06_medical_F", true]];
};

if (_usingContact) then
{
    /* TODO: Create loadout for demining UAV operator.
    _units set ["uavDemining", ["I_soldier_UAV_F", true]];*/
};

_dict set [UNIT_CLASS_UAV, _units];

private _side = str independent;
private _sideDict = Escape_Units get _side;
_sideDict set [AAF_KEY, _dict];
Escape_Units set [_side, _sideDict];

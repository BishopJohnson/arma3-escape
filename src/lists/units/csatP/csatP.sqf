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

private _usingContact = "IncludeContact" call BIS_fnc_getParamValue == 1;
private _usingOrange = "IncludeOrange" call BIS_fnc_getParamValue == 1;
private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["O_T_Soldier_TL_F", true]];
_units set ["squadLeader", ["O_T_Soldier_SL_F", true]];
_units set ["officer", ["O_T_officer_F", true]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["O_T_Soldier_F", true]];
_units set ["grenadier", ["O_T_Soldier_GL_F", true]];

/* TODO: Create loadout for rifleman light.
_units set ["light", ["O_Soldier_lite_F", true]];*/

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["lightAt", ["O_T_Soldier_LAT_F", true]];
_units set ["titanAt", ["O_T_Soldier_AT_F", true]];

if (_usingTanks) then
{
    _units set ["heavyAt", ["O_T_Soldier_HAT_F", true]];
};

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["titanAa", ["O_T_Soldier_AA_F", true]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["O_T_Soldier_AR_F", true]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["O_T_soldier_M_F", true]];

if (_usingMarksmen) then
{
    /* TODO: Create loadout for sharpshooter.
    _units set ["sharpshooter", ["O_Sharpshooter_F", true]];*/
};

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

if (_usingMarksmen) then
{
    /* TODO: Create loadout for heavy gunner.
    _units set ["heavyGunner", ["O_HeavyGunner_F", true]];*/
};

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["O_T_Soldier_A_F", true]];
_units set ["asstAutorifleman", ["O_T_Soldier_AAR_F", true]];
_units set ["asstAt", ["O_T_Soldier_AAT_F", true]];
_units set ["asstAa", ["O_T_Soldier_AAA_F", true]];

if (_usingTanks) then
{
    _units set ["asstHAt", ["O_T_Soldier_AHAT_F", true]];
};

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["O_T_medic_F", true]];
_units set ["engineer", ["O_T_engineer_F", true]];
_units set ["exp", ["O_T_soldier_exp_F", true]];
_units set ["repair", ["O_T_soldier_repair_F", true]];

if (_usingOrange) then
{
    _units set ["mine", ["O_T_soldier_mine_F", true]];
};

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["asstMg", ["O_T_support_AMG_F", true]];
_units set ["asstMortar", ["O_T_support_AMort_F", true]];
_units set ["hmg", ["O_T_support_MG_F", true]];
_units set ["gmg", ["O_T_support_GMG_F", true]];
_units set ["mortar", ["O_T_support_Mort_F", true]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;

_units set ["uav", ["O_T_soldier_UAV_F", true]];

if (_usingOrange) then
{
    _units set ["uavPackage", ["O_T_soldier_UAV_06_F", true]];
    _units set ["uavMedical", ["O_T_soldier_UAV_06_medical_F", true]];
};

/* TODO: Create loadout for demining UAV operator.
if (_usingContact) then
{
    _units set ["uavDemining", ["O_soldier_UAV_F", true]];
};*/

_dict set [UNIT_CLASS_UAV, _units];

private _side = str east;
private _sideDict = Escape_Units get _side;
_sideDict set [CSAT_P_KEY, _dict];
Escape_Units set [_side, _sideDict];
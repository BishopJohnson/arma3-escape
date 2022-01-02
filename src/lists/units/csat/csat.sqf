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

private _usingContact = "IncludeContact" call BIS_fnc_getParamValue == 1;
private _usingOrange = "IncludeOrange" call BIS_fnc_getParamValue == 1;
private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Leaders
_units = createHashMap;

_units set ["teamLeader", ["O_Soldier_TL_F", true]];
_units set ["squadLeader", ["O_Soldier_SL_F", true]];
_units set ["officer", ["O_officer_F", true]];

_dict set [UNIT_CLASS_LEADER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Riflemen
_units = createHashMap;

_units set ["soldier", ["O_Soldier_F", true]];
_units set ["grenadier", ["O_Soldier_GL_F", true]];
_units set ["light", ["O_Soldier_lite_F", true]];

_dict set [UNIT_CLASS_RIFLEMEN, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AT
_units = createHashMap;

_units set ["lightAt", ["O_Soldier_LAT_F", true]];
_units set ["titanAt", ["O_Soldier_AT_F", true]];

if (_usingTanks) then
{
    _units set ["heavyAt", ["O_Soldier_HAT_F", true]];
};

_dict set [UNIT_CLASS_AT, _units];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// AA
_units = createHashMap;

_units set ["titanAa", ["O_Soldier_AA_F", true]];

_dict set [UNIT_CLASS_AA, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Autoriflemen
_units = createHashMap;

_units set ["autorifleman", ["O_Soldier_AR_F", true]];

_dict set [UNIT_CLASS_AUTORIFLEMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Marksmen
_units = createHashMap;

_units set ["marksman", ["O_soldier_M_F", true]];

if (_usingMarksmen) then
{
    _units set ["sharpshooter", ["O_Sharpshooter_F", true]];
};

_dict set [UNIT_CLASS_MARKSMEN, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Heavy gunner
_units = createHashMap;

if (_usingMarksmen) then
{
    _units set ["heavyGunner", ["O_HeavyGunner_F", true]];
};

_dict set [UNIT_CLASS_HEAVY_GUNNER, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo
_units = createHashMap;

_units set ["ammoBearer", ["O_Soldier_A_F", true]];
_units set ["asstAutorifleman", ["O_Soldier_AAR_F", true]];
_units set ["asstAt", ["O_Soldier_AAT_F", true]];
_units set ["asstAa", ["O_Soldier_AAA_F", true]];

if (_usingTanks) then
{
    _units set ["asstHAt", ["O_Soldier_AHAT_F", true]];
};

_dict set [UNIT_CLASS_AMMO, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////// Support
_units = createHashMap;

_units set ["medic", ["O_medic_F", true]];
_units set ["engineer", ["O_engineer_F", true]];
_units set ["exp", ["O_soldier_exp_F", true]];
_units set ["repair", ["O_soldier_repair_F", true]];

if (_usingOrange) then
{
    _units set ["mine", ["O_soldier_mine_F", true]];
};

_dict set [UNIT_CLASS_SUPPORT, _units];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Field weapon
_units = createHashMap;

_units set ["asstMg", ["O_support_AMG_F", true]];
_units set ["asstMortar", ["O_support_AMort_F", true]];
_units set ["hmg", ["O_support_MG_F", true]];
_units set ["gmg", ["O_support_GMG_F", true]];
_units set ["mortar", ["O_support_Mort_F", true]];

_dict set [UNIT_CLASS_FIELD_WEAPON, _units];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UAV
_units = createHashMap;

_units set ["uav", ["O_soldier_UAV_F", true]];

if (_usingOrange) then
{
    _units set ["uavPackage", ["O_soldier_UAV_06_F", true]];
    _units set ["uavMedical", ["O_soldier_UAV_06_medical_F", true]];
};

if (_usingContact) then
{
    /* TODO: Create loadout for demining UAV operator.
    _units set ["uavDemining", ["O_soldier_UAV_F", true]];*/
};

_dict set [UNIT_CLASS_UAV, _units];

private _side = str east;
private _sideDict = Escape_Units get _side;
_sideDict set [CSAT_KEY, _dict];
Escape_Units set [_side, _sideDict];

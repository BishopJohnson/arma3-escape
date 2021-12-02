/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _usingApex = "IncludeApex" call BIS_fnc_getParamValue == 1;
private _usingContact = "IncludeContact" call BIS_fnc_getParamValue == 1;
private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;

// Basic weapons
_common = [Escape_Random_Cargo_Basic, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// AKM
if (_usingApex) then
{
    [_common, "akm", [
        ["arifle_AKM_F"],
        ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"]
    ]] call DICT_fnc_set;
};

// TRG
[_common, "trg", [["arifle_TRG21_F", "arifle_TRG20_F"], ["30Rnd_556x45_Stanag"]]] call DICT_fnc_set;

// TRG GL
[_common, "trgGl", [
    ["arifle_TRG21_GL_F"],
    ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"]
]] call DICT_fnc_set;

// LIM
if (_usingApex) then
{
    [_common, "lim", [["LMG_03_F"], ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"]]] call DICT_fnc_set;
};

// AKS-74U
if (_usingApex) then
{
    [_rare, "aks", [["arifle_AKS_F"], ["30Rnd_545x39_Mag_F"]]] call DICT_fnc_set;
};

// Protector
if (_usingApex) then
{
    [_rare, "protector", [["SMG_05_F"], ["30Rnd_9x21_Mag_SMG_02"]]] call DICT_fnc_set;
};

// Kozlice
if (_usingContact) then
{
    [_rare, "kozlice", [
        ["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
        ["2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug"]
    ]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Basic, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Launchers
_common = [Escape_Random_Cargo_Launcher, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;

// RPG-7
if (_usingApex) then
{
    [_common, "rpg7", [["launch_RPG7_F"], ["RPG7_F"]]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Launcher, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;

// Special weapons
_common = [Escape_Random_Cargo_Special, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;

// MK14
if (_usingMarksmen) then
{
    [_common, "mk14", [
        ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F", "srifle_DMR_06_hunter_F"],
        ["20Rnd_762x51_Mag"]
    ]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Special, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;

// Prison start weapons
_common = [Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// PM 9
if (_usingApex) then
{
    [_common, "pm9", [["hgun_Pistol_01_F"], ["10Rnd_9x21_Mag"]]] call DICT_fnc_set;
};

// Protector
if (_usingApex) then
{
    [_rare, "protector", [["SMG_05_F"], ["30Rnd_9x21_Mag_SMG_02"]]] call DICT_fnc_set;
};

// Kozlice
if (_usingContact) then
{
    [_rare, "kozlice", [
        ["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
        ["2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug"]
    ]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

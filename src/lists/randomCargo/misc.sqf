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
_common = Escape_Random_Cargo_Basic get RAND_CARGO_COMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// AKM
if (_usingApex) then
{
    _common set ["akm", [["arifle_AKM_F"], ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"]]];
};

// TRG
_common set ["trg", [["arifle_TRG21_F", "arifle_TRG20_F"], ["30Rnd_556x45_Stanag"]]];

// TRG GL
_common set ["trgGl", [
    ["arifle_TRG21_GL_F"],
    ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"]
]];

// LIM
if (_usingApex) then
{
    _common set ["lim", [["LMG_03_F"], ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"]]];
};

// AKS-74U
if (_usingApex) then
{
    _rare set ["aks", [["arifle_AKS_F"], ["30Rnd_545x39_Mag_F"]]];
};

// Protector
if (_usingApex) then
{
    _rare set ["protector", [["SMG_05_F"], ["30Rnd_9x21_Mag_SMG_02"]]];
};

// Kozlice
if (_usingContact) then
{
    _rare set ["kozlice", [
        ["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
        ["2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug"]
    ]];
};

Escape_Random_Cargo_Basic set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;

// RPG-7
if (_usingApex) then
{
    _common set ["rpg7", [["launch_RPG7_F"], ["RPG7_F"]]];
};

Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, _common];

// Special weapons
_common = Escape_Random_Cargo_Special get RAND_CARGO_COMMON_KEY;

// MK14
if (_usingMarksmen) then
{
    _common set ["mk14", [
        ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F", "srifle_DMR_06_hunter_F"],
        ["20Rnd_762x51_Mag"]
    ]];
};

Escape_Random_Cargo_Special set [RAND_CARGO_COMMON_KEY, _common];

// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_rare = Escape_Random_Cargo_Prison get RAND_CARGO_RARE_KEY;

// PM 9
if (_usingApex) then
{
    _common set ["pm9", [["hgun_Pistol_01_F"], ["10Rnd_9x21_Mag"]]];
};

// Protector
if (_usingApex) then
{
    _rare set ["protector", [["SMG_05_F"], ["30Rnd_9x21_Mag_SMG_02"]]];
};

// Kozlice
if (_usingContact) then
{
    _rare set ["kozlice", [
        ["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
        ["2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug"]
    ]];
};

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_RARE_KEY, _rare];

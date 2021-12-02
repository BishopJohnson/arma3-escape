/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeAaf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

// Basic weapons
_uncommon = [Escape_Random_Cargo_Basic, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// Mk20
[_uncommon, "mk20", [
    ["arifle_Mk20_F", "arifle_Mk20C_F"],
    ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"]
]] call DICT_fnc_set;

// Mk20 GL
[_uncommon, "mk20Gl", [
    ["arifle_Mk20_GL_F"],
    [
        "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow",
        "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"
    ]
]] call DICT_fnc_set;

// Mk200
_weapons = ["LMG_Mk200_F"];
_ammo = ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"];

if ([_uncommon, MK_200_KEY] call DICT_fnc_exists) then
{
    _temp = [_uncommon, MK_200_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    [_rare, MK_200_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_uncommon, MK_200_KEY, [_weapons, _ammo]] call DICT_fnc_set;
};

// SDAR
if ([_rare, SDAR_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_rare, SDAR_KEY, [["arifle_SDAR_F"], ["30Rnd_556x45_Stanag_red", "20Rnd_556x45_UW_mag"]]] call DICT_fnc_set;
};

// PDW
[_rare, "pdw", [["hgun_PDW2000_F"], ["30Rnd_9x21_Mag"]]] call DICT_fnc_set;

[Escape_Random_Cargo_Basic, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Launchers
_common = [Escape_Random_Cargo_Launcher, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Launcher, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Launcher, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// MAAWS
if (_usingTanks) then
{
    _weapons = ["launch_MRAWS_olive_F", "launch_MRAWS_olive_rail_F"];
    _ammo = ["MRAWS_HEAT_F", "MRAWS_HE_F"];

    if ([_rare, MAAWS_KEY] call DICT_fnc_exists) then
    {
        _temp = [_rare, MAAWS_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        [_rare, MAAWS_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_rare, MAAWS_KEY, [_weapons, _ammo]] call DICT_fnc_set;
    };
};

// PCML
if ([_uncommon, PCML_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_uncommon, PCML_KEY, [["launch_NLAW_F"], ["NLAW_F"]]] call DICT_fnc_set;
};

// Titan AA
_weapons = ["launch_I_Titan_F"];
_ammo = ["Titan_AA"];

if ([_rare, TITAN_AA_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, TITAN_AA_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    [_rare, TITAN_AA_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, TITAN_AA_KEY, [_weapons, _ammo]] call DICT_fnc_set;
};

// Titan AT
_weapons = ["launch_I_Titan_short_F"];
_ammo = ["Titan_AT", "Titan_AP"];

if ([_rare, TITAN_AT_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, TITAN_AT_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    [_rare, TITAN_AT_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, TITAN_AT_KEY, [_weapons, _ammo]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Launcher, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Launcher, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Launcher, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Special weapons
_common = [Escape_Random_Cargo_Special, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Special, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// Mk18 ABR
[_common, "mk18", [["srifle_EBR_F"], ["20Rnd_762x51_Mag"]]] call DICT_fnc_set;

// Lynx
_weapons = ["srifle_GM6_F"];
_ammo = ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"];

if ([_rare, LYNX_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, LYNX_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    [_rare, LYNX_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, LYNX_KEY, [_weapons, _ammo]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Special, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Special, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Prison start weapons
_common = [Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;

// ACP-C2
[_common, "acp", [["hgun_ACPC2_F", "hgun_ACPC2_snds_F"], ["9Rnd_45ACP_Mag"]]] call DICT_fnc_set;

// PDW
[_uncommon, "pdw", [["hgun_PDW2000_F"], ["30Rnd_9x21_Mag"]]] call DICT_fnc_set;

[Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;

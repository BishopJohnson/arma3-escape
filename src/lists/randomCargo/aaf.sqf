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

// Basic weapons
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// Mk20
_uncommon set ["mk20", [
    ["arifle_Mk20_F", "arifle_Mk20C_F"],
    ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"]
]];

// Mk20 GL
_uncommon set ["mk20Gl", [
    ["arifle_Mk20_GL_F"],
    [
        "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow",
        "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"
    ]
]];

// Mk200
_weapons = ["LMG_Mk200_F"];
_ammo = ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"];

if (MK_200_KEY in _uncommon) then
{
    _temp = _uncommon get MK_200_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _uncommon set [MK_200_KEY, _temp];
}
else
{
    _uncommon set [MK_200_KEY, [_weapons, _ammo]];
};

// SDAR
if (SDAR_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [SDAR_KEY, [["arifle_SDAR_F"], ["30Rnd_556x45_Stanag_red", "20Rnd_556x45_UW_mag"]]];
};

// PDW
_rare set ["pdw", [["hgun_PDW2000_F"], ["30Rnd_9x21_Mag"]]];

Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Launcher get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Launcher get RAND_CARGO_RARE_KEY;

// MAAWS
if (Escape_Using_Tanks) then
{
    _weapons = ["launch_MRAWS_olive_F", "launch_MRAWS_olive_rail_F"];
    _ammo = ["MRAWS_HEAT_F", "MRAWS_HE_F"];

    if (MAAWS_KEY in _common) then
    {
        _temp = _common get MAAWS_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        _common set [MAAWS_KEY, _temp];
    }
    else
    {
        _common set [MAAWS_KEY, [_weapons, _ammo]];
    };
};

// PCML
if (PCML_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [PCML_KEY, [["launch_NLAW_F"], ["NLAW_F"]]];
};

// Titan AA
_weapons = ["launch_I_Titan_F"];
_ammo = ["Titan_AA"];

if (TITAN_AA_KEY in _rare) then
{
    _temp = _rare get TITAN_AA_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [TITAN_AA_KEY, _temp];
}
else
{
    _rare set [TITAN_AA_KEY, [_weapons, _ammo]];
};

// Titan AT
_weapons = ["launch_I_Titan_short_F"];
_ammo = ["Titan_AT", "Titan_AP"];

if (TITAN_AT_KEY in _rare) then
{
    _temp = _rare get TITAN_AT_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [TITAN_AT_KEY, _temp];
}
else
{
    _rare set [TITAN_AT_KEY, [_weapons, _ammo]];
};

Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Launcher set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Launcher set [RAND_CARGO_RARE_KEY, _rare];

// Special weapons
_common = Escape_Random_Cargo_Special get RAND_CARGO_COMMON_KEY;
_rare = Escape_Random_Cargo_Special get RAND_CARGO_RARE_KEY;

// Mk18 ABR
_common set ["mk18", [["srifle_EBR_F"], ["20Rnd_762x51_Mag"]]];

// Lynx
_weapons = ["srifle_GM6_F"];
_ammo = ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"];

if (LYNX_KEY in _rare) then
{
    _temp = _rare get LYNX_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [LYNX_KEY, _temp];
}
else
{
    _rare set [LYNX_KEY, [_weapons, _ammo]];
};

Escape_Random_Cargo_Special set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, _rare];

// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Prison get RAND_CARGO_UNCOMMON_KEY;

// ACP-C2
_common set ["acp", [["hgun_ACPC2_F", "hgun_ACPC2_snds_F"], ["9Rnd_45ACP_Mag"]]];

// PDW
_uncommon set ["pdw", [["hgun_PDW2000_F"], ["30Rnd_9x21_Mag"]]];

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_UNCOMMON_KEY, _uncommon];

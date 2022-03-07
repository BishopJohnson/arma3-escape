/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeUsArmy" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _map = worldName;

////////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// M4
if (M4_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [M4_KEY, [
        ["rhs_weap_m4", "rhs_weap_m4_carryhandle"],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag"]
    ]];
};

// M4 GL
if (M4_GL_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [M4_GL_KEY, [
        ["rhs_weap_m4_m203", "rhs_weap_m4_carryhandle_m203"],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_M433_HEDP"]
    ]];
};

// M4A1
if (M4_A1_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [M4_A1_KEY, [
        ["rhs_weap_m4a1", "rhs_weap_m4a1_carryhandle"],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag"]
    ]];
};

// M4A1 GL
if (M4_A1_GL_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [M4_A1_GL_KEY, [
        ["rhs_weap_m4a1_M203", "rhs_weap_m4a1_carryhandle_M203"],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_M433_HEDP"]
    ]];
};

// M16A4
if (M16_A4_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [M16_A4_KEY, [
        ["rhs_weap_m16a4", "rhs_weap_m16a4_carryhandle"],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag"]
    ]];
};

// M16A4 GL
if (M16_A4_GL_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [M16_A4_GL_KEY, [
        ["rhs_weap_m16a4_carryhandle_M203"],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_M433_HEDP"]
    ]];
};

// M249
_weapons = ["rhs_weap_m249_light_L"];
_ammo = ["rhsusf_100Rnd_556x45_soft_pouch"];

if (M249_KEY in _rare) then
{
    _temp = _rare get M249_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [M249_KEY, _temp];
}
else
{
    _rare set [M249_KEY, [_weapons, _ammo]];
};

// MP7
if (MP7_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [MP7_KEY, [["rhsusf_weap_MP7A2"], ["rhsusf_mag_40Rnd_46x30_FMJ"]]];
};

Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Launcher get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Launcher get RAND_CARGO_RARE_KEY;

// AT4
if (AT4_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [AT4_KEY, [["rhs_weap_M136", "rhs_weap_M136_hedp", "rhs_weap_M136_hp"], []]];
};

// MAAWS
if (MAAWS_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [MAAWS_KEY, [["rhs_weap_maaws"], ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"]]];
};

// Stinger
if (STINGER_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [STINGER_KEY, [["rhs_weap_fim92"], ["rhs_fim92_mag"]]];
};

// Javelin
if (JAVELIN_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [JAVELIN_KEY, [["rhs_weap_fgm148"], ["rhs_fgm148_magazine_AT"]]];
};

Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Launcher set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Launcher set [RAND_CARGO_RARE_KEY, _rare];

//////////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons
_common = Escape_Random_Cargo_Special get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Special get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Special get RAND_CARGO_RARE_KEY;

// M590
if (M590_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [M590_KEY, [["rhs_weap_M590_8RD"], ["rhsusf_8Rnd_00Buck"]]];
};

// M14 EBR
_uncommon set ["m14Ebr", [["rhs_weap_m14ebrri"], ["rhsusf_20Rnd_762x51_m118_special_Mag"]]];

// M24
if (Escape_Us_Army_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["rhs_weap_m24sws_wd"];
        };
        default
        {
            _weapons = ["rhs_weap_m24sws_d"];
        };
    };
}
else
{
    _weapons = ["rhs_weap_m24sws"];
};

_uncommon set ["m24", [_weapons, ["rhsusf_5Rnd_762x51_m993_Mag"]]];

// M2010
if (Escape_Us_Army_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["rhs_weap_XM2010_wd"];
        };
        default
        {
            _weapons = ["rhs_weap_XM2010_d"];
        };
    };
}
else
{
    _weapons = ["rhs_weap_XM2010"];
};

_uncommon set ["m2010", [_weapons, ["rhsusf_5Rnd_300winmag_xm2010"]]];

// M240
_weapons = ["rhs_weap_m240B"];
_ammo = ["rhsusf_50Rnd_762x51"];

if (M240_KEY in _rare) then
{
    _temp = _rare get M240_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [M240_KEY, _temp];
}
else
{
    _rare set [M240_KEY, [_weapons, _ammo]];
};

// M107
if (Escape_Us_Army_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["rhs_weap_M107_w"];
        };
        default
        {
            _weapons = ["rhs_weap_M107_d"];
        };
    };
}
else
{
    _weapons = ["rhs_weap_M107"];
};

if (M107_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [M107_KEY, [_weapons, ["rhsusf_mag_10Rnd_STD_50BMG_M33"]]];
};

// M32
if (M32_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [M32_KEY, [["rhs_weap_m32"], ["rhsusf_mag_6Rnd_M433_HEDP"]]];
};

Escape_Random_Cargo_Special set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Special set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, _rare];

/////////////////////////////////////////////////////////////////////////////////////////////////// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_rare = Escape_Random_Cargo_Prison get RAND_CARGO_RARE_KEY;

// Beretta
if (BERETTA_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [BERETTA_KEY, [["rhsusf_weap_m9"], ["rhsusf_mag_15Rnd_9x19_FMJ"]]];
};

// Glock
if (M32_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [M32_KEY, [["rhsusf_weap_glock17g4"], ["rhsusf_mag_17Rnd_9x19_JHP"]]];
};

// MP7
if (MP7_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [MP7_KEY, [["rhsusf_weap_MP7A2"], ["rhsusf_mag_40Rnd_46x30_FMJ"]]];
};

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_RARE_KEY, _rare];

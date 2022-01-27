/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeLdf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _map = worldName;

// Basic weapons
_common = Escape_Random_Cargo_Basic get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// Promet
if (Escape_Ldf_Use_Camo) then
{
    _weapons = ["arifle_MSBS65_F"];
}
else
{
    _weapons = ["arifle_MSBS65_F", "arifle_MSBS65_black_F", "arifle_MSBS65_camo_F", "arifle_MSBS65_sand_F"];
};

_common set ["promet", [_weapons, ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"]]];

// Promet GL
if (Escape_Ldf_Use_Camo) then
{
    _weapons =
    [
        ["arifle_MSBS65_GL_F"],
        ["arifle_MSBS65_UBS_F"]
    ];
}
else
{
    _weapons =
    [
        ["arifle_MSBS65_GL_F", "arifle_MSBS65_GL_black_F", "arifle_MSBS65_GL_camo_F", "arifle_MSBS65_GL_sand_F"],
        ["arifle_MSBS65_UBS_F", "arifle_MSBS65_UBS_black_F", "arifle_MSBS65_UBS_camo_F", "arifle_MSBS65_UBS_sand_F"]
    ];
};

_common set ["prometGl", [
    _weapons,
    [
        [
            "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer",
            "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"
        ],
        [
            "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer",
            "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug"
        ]
    ]
]];

// Mk200
_weapons = ["LMG_Mk200_black_F"];
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

// P90
if (P_90_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [P_90_KEY, [
        ["SMG_03_black", "SMG_03_TR_black", "SMG_03C_black", "SMG_03C_TR_black"],
        ["50Rnd_570x28_SMG_03"]
    ]];
};

Escape_Random_Cargo_Basic set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Launcher get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Launcher get RAND_CARGO_RARE_KEY;

// MAAWS
if (Escape_Using_Tanks) then
{
    _weapons = ["launch_MRAWS_green_F", "launch_MRAWS_green_rail_F"];
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
_weapons = ["launch_I_Titan_eaf_F"];
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
_uncommon = Escape_Random_Cargo_Special get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Special get RAND_CARGO_RARE_KEY;

// Promet MR
if (Escape_Ldf_Use_Camo) then
{
    _weapons = ["arifle_MSBS65_Mark_F"];
}
else
{
    _weapons = ["arifle_MSBS65_Mark_F", "arifle_MSBS65_Mark_black_F", "arifle_MSBS65_Mark_camo_F", "arifle_MSBS65_Mark_sand_F"];
};

_common set ["prometMr", [_weapons, ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"]]];

// MkI EMR
if (Escape_Using_Marksmen) then
{
    _weapons = ["srifle_DMR_03_F"];
    _ammo = ["20Rnd_762x51_Mag"];

    if (MKI_EMR_KEY in _common) then
    {
        _temp = _common get MKI_EMR_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        _common set [MKI_EMR_KEY, _temp];
    }
    else
    {
        _common set [MKI_EMR_KEY, [_weapons, _ammo]];
    };
};

// SPMG
if (Escape_Using_Marksmen) then
{
    _weapons = ["MMG_02_black_F"];
    _ammo = ["200Rnd_338_Mag"];

    if (SPMG_KEY in _uncommon) then
    {
        _temp = _uncommon get SPMG_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        _uncommon set [SPMG_KEY, _temp];
    }
    else
    {
        _uncommon set [SPMG_KEY, [_weapons, _ammo]];
    };
};

// MAR-10
if (Escape_Using_Marksmen) then
{
    _weapons = ["srifle_DMR_02_F"];
    _ammo = ["10Rnd_338_Mag"];

    if (MAR_10_KEY in _uncommon) then
    {
        _temp = _uncommon get MAR_10_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        _uncommon set [MAR_10_KEY, _temp];
    }
    else
    {
        _uncommon set [MAR_10_KEY, [_weapons, _ammo]];
    };
};

// LRR
_weapons = ["srifle_LRR_F"];
_ammo = ["7Rnd_408_Mag"];

if (LRR_KEY in _rare) then
{
    _temp = _rare get LRR_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [LRR_KEY, _temp];
}
else
{
    _rare set [LRR_KEY, [_weapons, _ammo]];
};

Escape_Random_Cargo_Special set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Special set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, _rare];

// Prison start weapons
_uncommon = Escape_Random_Cargo_Prison get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Prison get RAND_CARGO_RARE_KEY;

// 4Five
_weapons = ["hgun_Pistol_heavy_01_green_F"];
_ammo = ["11Rnd_45ACP_Mag"];

if (FOUR_FIVE_KEY in _uncommon) then
{
    _temp = _uncommon get FOUR_FIVE_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _uncommon set [FOUR_FIVE_KEY, _temp];
}
else
{
    _uncommon set [FOUR_FIVE_KEY, [_weapons, _ammo]];
};

// P90
if (P_90_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [P_90_KEY, [
        ["SMG_03_black", "SMG_03_TR_black", "SMG_03C_black", "SMG_03C_TR_black"],
        ["50Rnd_570x28_SMG_03"]
    ]];
};

Escape_Random_Cargo_Prison set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Prison set [RAND_CARGO_RARE_KEY, _rare];

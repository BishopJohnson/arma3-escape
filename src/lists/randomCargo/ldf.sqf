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
private _useMapCamo = _include == 2;
private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

// Basic weapons
_common = [Escape_Random_Cargo_Basic, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Basic, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// Promet
if (_useMapCamo) then
{
    _weapons = ["arifle_MSBS65_F", "arifle_MSBS65_GL_F", "arifle_MSBS65_UBS_F"];
}
else
{
    _weapons =
    [
        "arifle_MSBS65_F", "arifle_MSBS65_black_F", "arifle_MSBS65_camo_F", "arifle_MSBS65_sand_F",
        "arifle_MSBS65_GL_F", "arifle_MSBS65_GL_black_F", "arifle_MSBS65_GL_camo_F", "arifle_MSBS65_GL_sand_F",
        "arifle_MSBS65_UBS_F", "arifle_MSBS65_UBS_black_F", "arifle_MSBS65_UBS_camo_F", "arifle_MSBS65_UBS_sand_F"
    ];
};

[_common, "promet", [
    _weapons,
    ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug"]
]] call DICT_fnc_set;

// Mk200
if ([_uncommon, MK_200_KEY] call DICT_fnc_exists) then
{
    _temp = [_uncommon, MK_200_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (["LMG_Mk200_black_F"]);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"]);
    [_rare, MK_200_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_uncommon, MK_200_KEY, [
        ["LMG_Mk200_black_F"],
        ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"]
    ]] call DICT_fnc_set;
};

// P90
if ([_rare, P_90_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_rare, P_90_KEY, [
        ["SMG_03_black", "SMG_03_TR_black", "SMG_03C_black", "SMG_03C_TR_black"],
        ["50Rnd_570x28_SMG_03"]
    ]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Basic, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Basic, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Launchers
_common = [Escape_Random_Cargo_Launcher, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Launcher, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Launcher, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// MAAWS
if (_usingTanks) then
{
    if ([_common, MAAWS_KEY] call DICT_fnc_exists) then
    {
        _temp = [_common, MAAWS_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (["launch_MRAWS_green_F", "launch_MRAWS_green_rail_F"]);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["MRAWS_HEAT_F", "MRAWS_HE_F"]);
        [_common, MAAWS_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_common, MAAWS_KEY, [
            ["launch_MRAWS_green_F", "launch_MRAWS_green_rail_F"],
            ["MRAWS_HEAT_F", "MRAWS_HE_F"]
        ]] call DICT_fnc_set;
    };
};

// PCML
if ([_uncommon, PCML_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_uncommon, PCML_KEY, [
        ["launch_NLAW_F"],
        ["NLAW_F"]
    ]] call DICT_fnc_set;
};

// Titan AA
if ([_rare, TITAN_AA_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, TITAN_AA_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (["launch_I_Titan_eaf_F"]);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["Titan_AA"]);
    [_rare, TITAN_AA_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, TITAN_AA_KEY, [
        ["launch_I_Titan_eaf_F"],
        ["Titan_AA"]
    ]] call DICT_fnc_set;
};

// Titan AT
if ([_rare, TITAN_AT_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, TITAN_AT_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (["launch_I_Titan_short_F"]);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["Titan_AT", "Titan_AP"]);
    [_rare, TITAN_AT_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, TITAN_AT_KEY, [
        ["launch_I_Titan_short_F"],
        ["Titan_AT", "Titan_AP"]
    ]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Launcher, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Launcher, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Launcher, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Special weapons
_common = [Escape_Random_Cargo_Special, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Special, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Special, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// Promet MR
if (_useMapCamo) then
{
    _weapons = ["arifle_MSBS65_Mark_F"];
}
else
{
    _weapons = ["arifle_MSBS65_Mark_F", "arifle_MSBS65_Mark_black_F", "arifle_MSBS65_Mark_camo_F", "arifle_MSBS65_Mark_sand_F"];
};

[_common, "prometMr", [
    _weapons,
    ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"]
]] call DICT_fnc_set;

// MkI EMR
if (_usingMarksmen) then
{
    if ([_common, MKI_EMR_KEY] call DICT_fnc_exists) then
    {
        _temp = [_common, MKI_EMR_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (["srifle_DMR_03_F"]);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["20Rnd_762x51_Mag"]);
        [_common, MKI_EMR_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_common, MKI_EMR_KEY, [
            ["srifle_DMR_03_F"],
            ["20Rnd_762x51_Mag"]
        ]] call DICT_fnc_set;
    };
};

// SPMG
if (_usingMarksmen) then
{
    if ([_uncommon, SPMG_KEY] call DICT_fnc_exists) then
    {
        _temp = [_uncommon, SPMG_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (["MMG_02_black_F"]);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["200Rnd_338_Mag"]);
        [_uncommon, SPMG_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_uncommon, SPMG_KEY, [
            ["MMG_02_black_F"],
            ["200Rnd_338_Mag"]
        ]] call DICT_fnc_set;
    };
};

// MAR-10
if (_usingMarksmen) then
{
    if ([_uncommon, MAR_10_KEY] call DICT_fnc_exists) then
    {
        _temp = [_uncommon, MAR_10_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (["srifle_DMR_02_F"]);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["10Rnd_338_Mag"]);
        [_uncommon, MAR_10_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_uncommon, MAR_10_KEY, [
            ["srifle_DMR_02_F"],
            ["10Rnd_338_Mag"]
        ]] call DICT_fnc_set;
    };
};

// LRR
if ([_rare, LRR_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, LRR_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (["srifle_LRR_F"]);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["7Rnd_408_Mag"]);
    [_rare, LRR_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, LRR_KEY, [
        ["srifle_LRR_F"],
        ["7Rnd_408_Mag"]
    ]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Special, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Special, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Special, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Prison start weapons
_uncommon = [Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// 4Five
if ([_uncommon, FOUR_FIVE_KEY] call DICT_fnc_exists) then
{
    _temp = [_uncommon, FOUR_FIVE_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (["hgun_Pistol_heavy_01_green_F"]);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["11Rnd_45ACP_Mag"]);
    [_uncommon, FOUR_FIVE_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_uncommon, FOUR_FIVE_KEY, [
        ["hgun_Pistol_heavy_01_green_F"],
        ["11Rnd_45ACP_Mag"]
    ]] call DICT_fnc_set;
};

// P90
if ([_rare, P_90_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_rare, P_90_KEY, [
        ["SMG_03_black", "SMG_03_TR_black", "SMG_03C_black", "SMG_03C_TR_black"],
        ["50Rnd_570x28_SMG_03"]
    ]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

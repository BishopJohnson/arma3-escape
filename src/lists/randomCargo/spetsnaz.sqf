/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeSpetsnaz" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _map = worldName;
private _useMapCamo = _include == 2;
private _usingApex = "IncludeApex" call BIS_fnc_getParamValue == 1;
private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;

// Basic weapons
_common = Escape_Random_Cargo_Basic get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;

// AK-12
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["arifle_AK12_lush_F", "arifle_AK12U_lush_F"];
            _ammo = ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"];
        };
        default
        {
            _weapons = ["arifle_AK12_GL_arid_F", "arifle_AK12U_arid_F"];
            _ammo = ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"];
        };
    };
}
else
{
    _weapons =
    [
        ["arifle_AK12_lush_F", "arifle_AK12U_lush_F"],
        ["arifle_AK12_GL_arid_F", "arifle_AK12U_arid_F"]
    ];
    _ammo =
    [
        ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"],
        ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"]
    ];

    if (_usingApex) then
    {
        _weapons pushBack ["arifle_AK12_F", "arifle_AK12U_F"];
        _ammo pushBack ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"];
    };
};

if (AK_12_KEY in _common) then
{
    _temp = _common get AK_12_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    [_common, AK_12_KEY, _temp] call DICT_fnc_set;
}
else
{
    _common set [AK_12_KEY, [_weapons, _ammo]];
};

// AK-12 GL
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["arifle_AK12_GL_lush_F"];
            _ammo = ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"];
        };
        default
        {
            _weapons = ["arifle_AK12_GL_lush_F"];
            _ammo = ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"];
        };
    };

    _ammo append ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"];
}
else
{
    _weapons =
    [
        ["arifle_AK12_GL_lush_F"],
        ["arifle_AK12_GL_arid_F"]
    ];
    _ammo =
    [
        ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"],
        ["30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"]
    ];

    if (_usingApex) then
    {
        _weapons pushBack ["arifle_AK12_GL_F"];
        _ammo pushBack ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"];
    };

    {
        _x append ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"];
    } forEach _ammo;
};

if (AK_12_GL_KEY in _common) then
{
    _temp = _common get AK_12_GL_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _common set [AK_12_GL_KEY, _temp];
}
else
{
    _common set [AK_12_GL_KEY, [_weapons, _ammo]];
};

// RPK
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["arifle_RPK12_lush_F"];
            _ammo = ["75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_Tracer_F"];
        };
        default
        {
            _weapons = ["arifle_RPK12_arid_F"];
            _ammo = ["75rnd_762x39_AK12_Arid_Mag_F", "75rnd_762x39_AK12_Arid_Mag_Tracer_F"];
        };
    };
}
else
{
    _weapons =
    [
        ["arifle_RPK12_F"],
        ["arifle_RPK12_arid_F"],
        ["arifle_RPK12_lush_F"]
    ];
    _ammo =
    [
        ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"],
        ["75rnd_762x39_AK12_Arid_Mag_F", "75rnd_762x39_AK12_Arid_Mag_Tracer_F"],
        ["75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_Tracer_F"]
    ];
};

_uncommon set ["rpk", [_weapons, _ammo]];

Escape_Random_Cargo_Basic set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];

// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;

// RPG-42
if (RPG_42_KEY in _common) then
{
    _weapons = ["launch_RPG32_green_F"];
    _ammo = ["RPG32_F", "RPG32_HE_F"];

    _temp = _common get RPG_42_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _common set [RPG_42_KEY, _temp];
}
else
{
    _common set [RPG_42_KEY, [_weapons, _ammo]];
};

Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, _common];

// Special weapons
_common = Escape_Random_Cargo_Special get RAND_CARGO_COMMON_KEY;

// ASP-1
if (_usingMarksmen) then
{
    _weapons = ["srifle_DMR_04_F"];
    _ammo = ["10Rnd_127x54_Mag"];

    if (ASP_1_KEY in _common) then
    {
        _temp = _common get ASP_1_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        _common set [ASP_1_KEY, _temp];
    }
    else
    {
        _common set [ASP_1_KEY, [_weapons, _ammo]];
    };
};

Escape_Random_Cargo_Special set [RAND_CARGO_COMMON_KEY, _common];

// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;

// Rook
if (ROOK_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [ROOK_KEY, [["hgun_Rook40_F", "hgun_Rook40_snds_F"], ["16Rnd_9x21_Mag"]]];
};

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];

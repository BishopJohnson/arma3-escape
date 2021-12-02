/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeChinese" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _map = worldName;
private _useMapCamo = _include == 2;
private _usingMarksmen = ["IncludeMarksmen", 0] call BIS_fnc_getParamValue == 1;
private _usingTanks = ["IncludeTanks", 0] call BIS_fnc_getParamValue == 1;

// Basic weapons
_common = [Escape_Random_Cargo_Basic, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Basic, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// CAR-95
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["arifle_CTAR_ghex_F"];
        };
        default
        {
            _weapons = ["arifle_CTAR_hex_F"];
        };
    };
}
else
{
    _weapons = ["arifle_CTAR_blk_F", "arifle_CTAR_hex_F", "arifle_CTAR_ghex_F"];
};

[_common, "car95", [
    _weapons,
    ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"]
]] call DICT_fnc_set;

// CAR-95 GL
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["arifle_CTAR_GL_ghex_F"];
        };
        default
        {
            _weapons = ["arifle_CTAR_GL_hex_F"];
        };
    };
}
else
{
    _weapons = ["arifle_CTAR_GL_blk_F", "arifle_CTAR_GL_hex_F", "arifle_CTAR_GL_ghex_F"];
};

[_common, "car95Gl", [
    _weapons,
    [
        "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F",
        "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"
    ]
]] call DICT_fnc_set;

// CAR-95-1
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["arifle_CTARS_ghex_F"];
            _ammo = ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"];
        };
        default
        {
            _weapons = ["arifle_CTARS_hex_F"];
            _ammo = ["100Rnd_580x42_hex_Mag_F", "100Rnd_580x42_hex_Mag_Tracer_F"];
        };
    };
}
else
{
    _weapons =
    [
        ["arifle_CTARS_blk_F"],
        ["arifle_CTARS_hex_F"],
        ["arifle_CTARS_ghex_F"]
    ];
    _ammo =
    [
        ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"],
        ["100Rnd_580x42_hex_Mag_F", "100Rnd_580x42_hex_Mag_Tracer_F"],
        ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"]
    ];
};

[_uncommon, "car951", [_weapons, _ammo]] call DICT_fnc_set;

// Type 115
_ammo = ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"];

if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["arifle_ARX_ghex_F"];
        };
        default
        {
            _weapons = ["arifle_ARX_hex_F"];
        };
    };
}
else
{
    _weapons = ["arifle_ARX_blk_F", "arifle_ARX_hex_F", "arifle_ARX_ghex_F"];
};

if ([_rare, TYPE_115_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, TYPE_115_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    [_rare, TYPE_115_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, TYPE_115_KEY, [_weapons, _ammo]] call DICT_fnc_set;
};

// SDAR
if ([_rare, SDAR_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_rare, SDAR_KEY, [["arifle_SDAR_F"], ["30Rnd_556x45_Stanag_red", "20Rnd_556x45_UW_mag"]]] call DICT_fnc_set;
};

// Sting
if ([_rare, STING_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_rare, STING_KEY, [["SMG_02_F"], ["30Rnd_9x21_Mag_SMG_02"]]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Basic, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Basic, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Launchers
_common = [Escape_Random_Cargo_Launcher, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Launcher, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Launcher, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// RPG-42
_ammo = ["RPG32_F", "RPG32_HE_F"];

if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["launch_RPG32_ghex_F"];
        };
        default
        {
            _weapons = ["launch_RPG32_F"];
        };
    };
}
else
{
    _weapons = ["launch_RPG32_F", "launch_RPG32_ghex_F"];
};

if ([_common, RPG_42_KEY] call DICT_fnc_exists) then
{
    _temp = [_common, RPG_42_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    [_common, RPG_42_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_common, RPG_42_KEY, [_weapons, _ammo]] call DICT_fnc_set;
};

// Vorona
if (_usingTanks) then
{
    _ammo = ["Vorona_HEAT", "Vorona_HE"];

    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _weapons = ["launch_O_Vorona_green_F"];
            };
            default
            {
                _weapons = ["launch_O_Vorona_brown_F"];
            };
        };
    }
    else
    {
        _weapons = ["launch_O_Vorona_brown_F", "launch_O_Vorona_green_F"];
    };

    if ([_uncommon, VORONA_KEY] call DICT_fnc_exists) then
    {
        _temp = [_uncommon, VORONA_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        [_uncommon, VORONA_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_uncommon, VORONA_KEY, [_weapons, _ammo]] call DICT_fnc_set;
    };
};

// Titan AA
_ammo = ["Titan_AA"];

if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["launch_O_Titan_ghex_F"];
        };
        default
        {
            _weapons = ["launch_O_Titan_F"];
        };
    };
}
else
{
    _weapons = ["launch_O_Titan_F", "launch_O_Titan_ghex_F"];
};

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
_ammo = ["Titan_AT", "Titan_AP"];

if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["launch_O_Titan_short_ghex_F"];
        };
        default
        {
            _weapons = ["launch_O_Titan_short_F"];
        };
    };
}
else
{
    _weapons = ["launch_O_Titan_short_F", "launch_O_Titan_short_ghex_F"];
};

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
_uncommon = [Escape_Random_Cargo_Special, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Special, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// ASP-1
if (_usingMarksmen) then
{
    _ammo = ["10Rnd_127x54_Mag"];

    if (_useMapCamo) then
    {
        _weapons = ["srifle_DMR_04_F"];
    }
    else
    {
        _weapons = ["srifle_DMR_04_F", "srifle_DMR_04_Tan_F"];
    };

    if ([_common, ASP_1_KEY] call DICT_fnc_exists) then
    {
        _temp = [_common, ASP_1_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        [_common, ASP_1_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_common, ASP_1_KEY, [_weapons, _ammo]] call DICT_fnc_set;
    };
};

// Cyrus
if (_usingMarksmen) then
{
    _ammo = ["10Rnd_93x64_DMR_05_Mag"];

    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _weapons = ["srifle_DMR_04_F"];
            };
            default
            {
                _weapons = ["srifle_DMR_05_hex_F"];
            };
        };
    }
    else
    {
        _weapons = ["srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"];
    };

    if ([_uncommon, Cyrus_KEY] call DICT_fnc_exists) then
    {
        _temp = [_uncommon, Cyrus_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        [_uncommon, Cyrus_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_uncommon, Cyrus_KEY, [_weapons, _ammo]] call DICT_fnc_set;
    };
};

// Lynx
_ammo = ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"];

if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons = ["srifle_GM6_ghex_F"];
        };
        default
        {
            _weapons = ["srifle_GM6_camo_F"];
        };
    };
}
else
{
    _weapons = ["srifle_GM6_F", "srifle_GM6_camo_F", "srifle_GM6_ghex_F"];
};

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
[Escape_Random_Cargo_Special, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Special, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Prison start weapons
_common = [Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// Rook
if ([_common, ROOK_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_common, ROOK_KEY, [["hgun_Rook40_F", "hgun_Rook40_snds_F"], ["16Rnd_9x21_Mag"]]] call DICT_fnc_set;
};

// Zubr
if ([_uncommon, ZUBR_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_uncommon, ZUBR_KEY, [["hgun_Pistol_heavy_02_F"], ["6Rnd_45ACP_Cylinder"]]] call DICT_fnc_set;
};

// Sting
if ([_rare, STING_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_rare, STING_KEY, [["SMG_02_F"], ["30Rnd_9x21_Mag_SMG_02"]]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

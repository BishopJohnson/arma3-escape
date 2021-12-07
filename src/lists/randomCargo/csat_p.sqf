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
_common = Escape_Random_Cargo_Basic get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

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

_common set ["car95", [
    _weapons,
    ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"]
]];

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

_common set ["car95Gl", [
    _weapons,
    [
        "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F",
        "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"
    ]
]];

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

_uncommon set ["car951", [_weapons, _ammo]];

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

if (TYPE_115_KEY in _rare) then
{
    _temp = _rare get TYPE_115_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [TYPE_115_KEY, _temp];
}
else
{
    _rare set [TYPE_115_KEY, [_weapons, _ammo]];
};

// SDAR
if (SDAR_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [SDAR_KEY, [["arifle_SDAR_F"], ["30Rnd_556x45_Stanag_red", "20Rnd_556x45_UW_mag"]]];
};

// Sting
if (STING_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [STING_KEY, [["SMG_02_F"], ["30Rnd_9x21_Mag_SMG_02"]]];
};

Escape_Random_Cargo_Basic set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Launcher get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Launcher get RAND_CARGO_RARE_KEY;

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

if (RPG_42_KEY in _common) then
{
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

    if (VORONA_KEY in _uncommon) then
    {
        _temp = _uncommon get VORONA_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        _uncommon set [VORONA_KEY, _temp];
    }
    else
    {
        _uncommon set [VORONA_KEY, [_weapons, _ammo]];
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

    if (CYRUS_KEY in _uncommon) then
    {
        _temp = _uncommon get CYRUS_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        _uncommon set [CYRUS_KEY, _temp];
    }
    else
    {
        _uncommon set [CYRUS_KEY, [_weapons, _ammo]];
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
Escape_Random_Cargo_Special set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, _rare];

// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Prison get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Prison get RAND_CARGO_RARE_KEY;

// Rook
if (ROOK_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [ROOK_KEY, [["hgun_Rook40_F", "hgun_Rook40_snds_F"], ["16Rnd_9x21_Mag"]]];
};

// Zubr
if (ZUBR_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [ZUBR_KEY, [["hgun_Pistol_heavy_02_F"], ["6Rnd_45ACP_Cylinder"]]];
};

// Sting
if (STING_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [STING_KEY, [["SMG_02_F"], ["30Rnd_9x21_Mag_SMG_02"]]];
};

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Prison set [RAND_CARGO_RARE_KEY, _rare];

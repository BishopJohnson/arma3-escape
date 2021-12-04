/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeIranian" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _map = worldName;
private _useMapCamo = _include == 2;
private _usingApex = "IncludeApex" call BIS_fnc_getParamValue == 1;
private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

// TODO: Add CAR-95 variants
// Basic weapons
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// Katiba
_uncommon set ["katiba", [
    ["arifle_Katiba_F", "arifle_Katiba_C_F"],
    ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"]
]];

// Katiba GL
_uncommon set ["katibaGl", [
    ["arifle_Katiba_GL_F"],
    [
        "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer",
        "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"
    ]
]];

// Zafir
_uncommon set ["zafir", [["LMG_Zafir_F"], ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"]]];

// Type 115
if (_usingApex) then
{
    _ammo = ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"];

    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY:
            {
                _weapons = ["arifle_ARX_blk_F"];
            };
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
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    _weapons = ["launch_RPG32_F"];
    if (_usingApex) then { _weapons append ["launch_RPG32_ghex_F"] };
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
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    _weapons = ["launch_O_Titan_F"];
    if (_usingApex) then { _weapons append ["launch_O_Titan_ghex_F"] };
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
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
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
    _weapons = ["launch_O_Titan_short_F"];
    if (_usingApex) then { _weapons append ["launch_O_Titan_short_ghex_F"] };
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

// TODO: Add CMR-76 variants
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

// Navid
if (_usingMarksmen) then
{
    _ammo = ["150Rnd_93x64_Mag"];

    if (_useMapCamo) then
    {
        _weapons = ["MMG_01_hex_F"];
    }
    else
    {
        _weapons = ["MMG_01_hex_F", "MMG_01_tan_F"];
    };

    _uncommon set ["navid", [_weapons, _ammo]];
};

// Rahim
_uncommon set ["rahim", [["srifle_DMR_01_F"], ["10Rnd_762x54_Mag"]]];

// Cyrus
if (_usingMarksmen) then
{
    _ammo = ["10Rnd_93x64_DMR_05_Mag"];

    if (_useMapCamo) then
    {
        switch (_map) do
        {
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

    if (Cyrus_KEY in _uncommon) then
    {
        _temp = _uncommon get Cyrus_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (_ammo);
        _uncommon set [Cyrus_KEY, _temp];
    }
    else
    {
        _uncommon set [Cyrus_KEY, [_weapons, _ammo]];
    };
};

// Lynx
_ammo = ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"];

if (_useMapCamo) then
{
    switch (_map) do
    {
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
    _weapons = ["srifle_GM6_F", "srifle_GM6_camo_F"];
    if (_usingApex) then { _weapons append ["srifle_GM6_ghex_F"] };
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

/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _map = worldName;
private _useMapCamo = "IncludeNato" call BIS_fnc_getParamValue == 2;
private _usingApex = "IncludeApex" call BIS_fnc_getParamValue == 1;
private _usingContact = "IncludeContact" call BIS_fnc_getParamValue == 1;
private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;
private _usingTanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;

// Basic weapons
_common = [Escape_Random_Cargo_Basic, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Basic, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// SPAR-16
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case _map == LIVONIA_KEY:
            {
                _weapons = ["arifle_SPAR_01_blk_F", "arifle_SPAR_01_GL_blk_F"];
            };
            case _map == TANOA_KEY:
            {
                _weapons = ["arifle_SPAR_01_khk_F", "arifle_SPAR_01_GL_khk_F"];
            };
            default // Altis, Malden, Stratis, VR, ect...
            {
                _weapons = ["arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_snd_F"];
            };
        };
    }
    else
    {
        _weapons =
        [
            "arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F",
            "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F"
        ];
    };

    [_common, "spar16", [
        _weapons,
        ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"]
    ]] call DICT_fnc_set;
};

// MX
if (_useMapCamo) then
{
    switch (_map) do
    {
        case _map == LIVONIA_KEY:
        {
            _weapons = ["arifle_MX_Black_F", "arifle_MX_GL_Black_F", "arifle_MXC_Black_F"];
        };
        case _map == TANOA_KEY:
        {
            _weapons = ["arifle_MX_khk_F", "arifle_MX_GL_khk_F", "arifle_MXC_khk_F"];
        };
        default // Altis, Malden, Stratis, VR, ect...
        {
            _weapons = ["arifle_MX_F", "arifle_MX_GL_F", "arifle_MXC_F"];
        };
    };
}
else
{
    _weapons =
    [
        "arifle_MX_F", "arifle_MX_Black_F",
        "arifle_MX_GL_F", "arifle_MX_GL_Black_F",
        "arifle_MXC_F", "arifle_MXC_Black_F"
    ];
    if (_usingContact) then { _weapons append ["arifle_MX_khk_F", "arifle_MX_GL_khk_F", "arifle_MXC_khk_F"] };
};

[_uncommon, "mx", [
    _weapons,
    ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"]
]] call DICT_fnc_set;

// MX-SW
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY:
        {
            _weapons = ["arifle_MX_SW_Black_F"];
        };
        case TANOA_KEY:
        {
            _weapons = ["arifle_MX_SW_khk_F"];
        };
        default // Altis, Malden, Stratis, VR, ect...
        {
            _weapons = ["arifle_MX_SW_F"];
        };
    };
}
else
{
    _weapons = ["arifle_MX_SW_F", "arifle_MX_SW_Black_F"];
    if (_usingApex) then { _weapons append ["arifle_MX_SW_khk_F"] };
};

[_uncommon, "mxsw", [
    _weapons,
    ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"]
]] call DICT_fnc_set;

// SPAR-16S
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case _map == LIVONIA_KEY:
            {
                _weapons = ["arifle_SPAR_02_blk_F"];
            };
            case _map == TANOA_KEY:
            {
                _weapons = ["arifle_SPAR_02_khk_F"];
            };
            default // Altis, Malden, Stratis, VR, ect...
            {
                _weapons = ["arifle_SPAR_02_snd_F"];
            };
        };
    }
    else
    {
        _weapons = ["arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F"];
    };

    [_common, "spar16s", [
        _weapons,
        ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"]
    ]] call DICT_fnc_set;
};

// SDAR
if ([_rare, SDAR_KEY] call DICT_fnc_exists) then { /* No unique values that could be ommitted */ }
else
{
    [_rare, SDAR_KEY, [
        ["arifle_SDAR_F"],
        ["30Rnd_556x45_Stanag_red", "20Rnd_556x45_UW_mag"]
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

// Vermin
[_rare, "vermin", [
    ["SMG_01_F"],
    ["30Rnd_45ACP_Mag_SMG_01"]
]] call DICT_fnc_set;

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
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case _map == LIVONIA_KEY;
            case _map == TANOA_KEY:
            {
                _weapons = ["launch_MRAWS_green_F", "launch_MRAWS_green_rail_F"];
            };
            default // Altis, Malden, Stratis, VR, ect...
            {
                _weapons = ["launch_MRAWS_sand_F", "launch_MRAWS_sand_rail_F"];
            };
        };
    }
    else
    {
        _weapons = ["launch_MRAWS_sand_F", "launch_MRAWS_green_F", "launch_MRAWS_sand_rail_F", "launch_MRAWS_green_rail_F"];
    };

    if ([_common, MAAWS_KEY] call DICT_fnc_exists) then
    {
        _temp = [_common, MAAWS_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["MRAWS_HEAT_F", "MRAWS_HE_F"]);
        [_common, MAAWS_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_common, MAAWS_KEY, [
            _weapons,
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
if (_useMapCamo) then
{
    switch (_map) do
    {
        case _map == LIVONIA_KEY;
        case _map == TANOA_KEY:
        {
            _weapons = ["launch_B_Titan_tna_F"];
        };
        default // Altis, Malden, Stratis, VR, ect...
        {
            _weapons = ["launch_B_Titan_F"];
        };
    };
}
else
{
    _weapons = ["launch_B_Titan_F"];
    if (_usingApex || _usingContact) then { _weapons append ["launch_B_Titan_tna_F"] };
};

if ([_rare, TITAN_AA_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, TITAN_AA_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["Titan_AA"]);
    [_rare, TITAN_AA_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, TITAN_AA_KEY, [
        _weapons,
        ["Titan_AA"]
    ]] call DICT_fnc_set;
};

// Titan AT
if (_useMapCamo) then
{
    switch (_map) do
    {
        case _map == LIVONIA_KEY;
        case _map == TANOA_KEY:
        {
            _weapons = ["launch_B_Titan_short_tna_F"];
        };
        default // Altis, Malden, Stratis, VR, ect...
        {
            _weapons = ["launch_B_Titan_short_F"];
        };
    };
}
else
{
    _weapons = ["launch_B_Titan_short_F"];
    if (_usingApex || _usingContact) then { _weapons append ["launch_B_Titan_short_tna_F"] };
};

if ([_rare, TITAN_AT_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, TITAN_AT_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["Titan_AT", "Titan_AP"]);
    [_rare, TITAN_AT_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, TITAN_AT_KEY, [
        _weapons,
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

// SPAR-17
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case _map == LIVONIA_KEY:
            {
                _weapons = ["arifle_SPAR_03_blk_F"];
            };
            case _map == TANOA_KEY:
            {
                _weapons = ["arifle_SPAR_03_khk_F"];
            };
            default // Altis, Malden, Stratis, VR, ect...
            {
                _weapons = ["arifle_SPAR_03_snd_F"];
            };
        };
    }
    else
    {
        _weapons = ["arifle_SPAR_03_snd_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F"];
    };

    [_common, "spar17", [
        _weapons,
        ["20Rnd_762x51_Mag"]
    ]] call DICT_fnc_set;
};

// MkI EMR
if (_usingMarksmen) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY:
            {
                _weapons = ["srifle_DMR_03_F", "srifle_DMR_03_woodland_F"];
            };
            case TANOA_KEY:
            {
                _weapons = ["srifle_DMR_03_khaki_F"];
            };
            default // Altis, Malden, Stratis, VR, ect...
            {
                _weapons = ["srifle_DMR_03_tan_F"];
            };
        }
    }
    else
    {
        _weapons = ["srifle_DMR_03_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F"];
    };

    if ([_common, MKI_EMR_KEY] call DICT_fnc_exists) then
    {
        _temp = [_common, MKI_EMR_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["20Rnd_762x51_Mag"]);
        [_common, MKI_EMR_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_common, MKI_EMR_KEY, [
            _weapons,
            ["20Rnd_762x51_Mag"]
        ]] call DICT_fnc_set;
    };
};

// SPMG
if (_usingMarksmen) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _weapons = ["MMG_02_black_F"];
            };
            default // Altis, Malden, Stratis, VR, ect...
            {
                _weapons = ["MMG_02_sand_F"];
            };
        }
    }
    else
    {
        _weapons = ["MMG_02_black_F", "MMG_02_sand_F", "MMG_02_camo_F"];
    };

    if ([_uncommon, SPMG_KEY] call DICT_fnc_exists) then
    {
        _temp = [_uncommon, SPMG_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["200Rnd_338_Mag"]);
        [_uncommon, SPMG_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_uncommon, SPMG_KEY, [
            _weapons,
            ["200Rnd_338_Mag"]
        ]] call DICT_fnc_set;
    };
};

// MXM
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY:
        {
            _weapons = ["arifle_MXM_Black_F"];
        };
        case TANOA_KEY:
        {
            _weapons = ["arifle_MXM_khk_F"];
        };
        default // Altis, Malden, Stratis, VR, ect...
        {
            _weapons = ["arifle_MXM_F"];
        };
    }
}
else
{
    _weapons = ["arifle_MXM_F", "arifle_MXM_Black_F"];
    if (_usingApex) then { _weapons append ["arifle_MXM_khk_F"] };
};

[_uncommon, "mxm", [
    _weapons,
    ["30Rnd_65x39_caseless_mag"]
]] call DICT_fnc_set;

// MAR-10
if (_usingMarksmen) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY:
            {
                _weapons = ["srifle_DMR_02_F"];
            };
            case TANOA_KEY:
            {
                _weapons = ["srifle_DMR_02_camo_F"];
            };
            default // Altis, Malden, Stratis, VR, ect...
            {
                _weapons = ["srifle_DMR_02_sniper_F"];
            };
        }
    }
    else
    {
        _weapons = ["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F"];
    };

    if ([_uncommon, MAR_10_KEY] call DICT_fnc_exists) then
    {
        _temp = [_uncommon, MAR_10_KEY] call DICT_fnc_get;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["10Rnd_338_Mag"]);
        [_uncommon, MAR_10_KEY, _temp] call DICT_fnc_set;
    }
    else
    {
        [_uncommon, MAR_10_KEY, [
            _weapons,
            ["10Rnd_338_Mag"]
        ]] call DICT_fnc_set;
    };
};

// LRR
if (_useMapCamo) then
{
    switch (_map) do
    {
        case LIVONIA_KEY:
        {
            _weapons = ["srifle_LRR_F"];
        };
        case TANOA_KEY:
        {
            _weapons = ["srifle_LRR_tna_F"];
        };
        default // Altis, Malden, Stratis, VR, ect...
        {
            _weapons = ["srifle_LRR_camo_F"];
        };
    }
}
else
{
    _weapons = ["srifle_LRR_F", "srifle_LRR_camo_F"];
    if (_usingApex) then { _weapons append ["srifle_LRR_tna_F"] };
};

if ([_rare, LRR_KEY] call DICT_fnc_exists) then
{
    _temp = [_rare, LRR_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["7Rnd_408_Mag"]);
    [_rare, LRR_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_rare, LRR_KEY, [
        _weapons,
        ["7Rnd_408_Mag"]
    ]] call DICT_fnc_set;
};

[Escape_Random_Cargo_Special, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Special, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Special, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

// Prison start weapons
_common = [Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY] call DICT_fnc_get;
_uncommon = [Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY] call DICT_fnc_get;
_rare = [Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY] call DICT_fnc_get;

// PO7
if (_useMapCamo) then
{
    switch (_map) do
    {
        case TANOA_KEY:
        {
            _weapons = ["hgun_P07_khk_F", "hgun_P07_khk_Snds_F"];
        };
        default // Altis, Livonia, Malden, Stratis, VR, ect...
        {
            _weapons = ["hgun_P07_F", "hgun_P07_snds_F"];
        };
    }
}
else
{
    _weapons = ["hgun_P07_F", "hgun_P07_snds_F"];
    if (_usingApex) then { _weapons append ["hgun_P07_khk_F", "hgun_P07_khk_Snds_F"] };
};

if ([_common, P_07_KEY] call DICT_fnc_exists) then
{
    _temp = [_common, P_07_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["16Rnd_9x21_Mag"]);
    [_common, P_07_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_common, P_07_KEY, [
        _weapons,
        ["16Rnd_9x21_Mag"]
    ]] call DICT_fnc_set;
};

// 4Five
if ([_uncommon, FOUR_FIVE_KEY] call DICT_fnc_exists) then
{
    _temp = [_uncommon, FOUR_FIVE_KEY] call DICT_fnc_get;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (["hgun_Pistol_heavy_01_F"]);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (["11Rnd_45ACP_Mag"]);
    [_uncommon, FOUR_FIVE_KEY, _temp] call DICT_fnc_set;
}
else
{
    [_uncommon, FOUR_FIVE_KEY, [
        ["hgun_Pistol_heavy_01_F"],
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

// Vermin
[_rare, "vermin", [
    ["SMG_01_F"],
    ["30Rnd_45ACP_Mag_SMG_01"]
]] call DICT_fnc_set;

[Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY, _common] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY, _uncommon] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY, _rare] call DICT_fnc_set;

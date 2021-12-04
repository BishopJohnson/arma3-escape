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
_common = Escape_Random_Cargo_Basic get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// SPAR-16
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY:
            {
                _weapons = ["arifle_SPAR_01_blk_F"];
                _ammo = ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_red"];
            };
            case TANOA_KEY:
            {
                _weapons = ["arifle_SPAR_01_khk_F"];
                _ammo = ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_red"];
            };
            default
            {
                _weapons = ["arifle_SPAR_01_snd_F"];
                _ammo = ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"];
            };
        };
    }
    else
    {
        _weapons =
        [
            ["arifle_SPAR_01_blk_F"],
            ["arifle_SPAR_01_khk_F"],
            ["arifle_SPAR_01_snd_F"]
        ];
        _ammo =
        [
            ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_red"],
            ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_red"],
            ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"]
        ];
    };

    _common set ["spar16", [_weapons, _ammo]];
};

// SPAR-16 GL
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY:
            {
                _weapons = ["arifle_SPAR_01_GL_blk_F"];
                _ammo = ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_red"];
            };
            case TANOA_KEY:
            {
                _weapons = ["arifle_SPAR_01_GL_khk_F"];
                _ammo = ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_red"];
            };
            default
            {
                _weapons = ["arifle_SPAR_01_GL_snd_F"];
                _ammo = ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"];
            };
        };

        _ammo append ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell"];
    }
    else
    {
        _weapons =
        [
            ["arifle_SPAR_01_GL_blk_F"],
            ["arifle_SPAR_01_GL_khk_F"],
            ["arifle_SPAR_01_GL_snd_F"]
        ];
        _ammo =
        [
            ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_red"],
            ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_red"],
            ["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"]
        ];

        {
            _x append ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell"];
        } forEach _ammo;
    };

    _common set ["spar16Gl", [_weapons, _ammo]];
};

// MX
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY):
        {
            _weapons = ["arifle_MX_Black_F", "arifle_MXC_Black_F"];
            _ammo = ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"];
        };
        case (_map == TANOA_KEY && _usingApex):
        {
            _weapons = ["arifle_MX_khk_F", "arifle_MXC_khk_F"];
            _ammo = ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"];
        };
        default
        {
            _weapons = ["arifle_MX_F", "arifle_MXC_F"];
            _ammo = ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"];
        };
    };
}
else
{
    _weapons =
    [
        ["arifle_MX_F", "arifle_MXC_F"],
        ["arifle_MX_Black_F", "arifle_MXC_Black_F"]
    ];
    _ammo =
    [
        ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"],
        ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"]
    ];

    if (_usingApex) then
    {
        _weapons pushBack ["arifle_MX_khk_F", "arifle_MXC_khk_F"];
        _ammo pushBack ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"];
    };
};

_uncommon set ["mx", [_weapons, _ammo]];

// MX GL
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY):
        {
            _weapons = ["arifle_MX_GL_Black_F"];
            _ammo = ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"];
        };
        case (_map == TANOA_KEY && _usingApex):
        {
            _weapons = ["arifle_MX_GL_khk_F"];
            _ammo = ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"];
        };
        default
        {
            _weapons = ["arifle_MX_GL_F"];
            _ammo = ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"];
        };
    };

    _ammo append ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell"];
}
else
{
    _weapons =
    [
        ["arifle_MX_GL_F"],
        ["arifle_MX_GL_Black_F"]
    ];
    _ammo =
    [
        ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"],
        ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"]
    ];

    if (_usingApex) then
    {
        _weapons pushBack ["arifle_MX_GL_khk_F"];
        _ammo pushBack ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"];
    };

    {
        _x append ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell"];
    } forEach _ammo;
};

_uncommon set ["mxGl", [_weapons, _ammo]];

// MX-SW
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY):
        {
            _weapons = ["arifle_MX_SW_Black_F"];
            _ammo = ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"];
        };
        case (_map == TANOA_KEY && _usingApex):
        {
            _weapons = ["arifle_MX_SW_khk_F"];
            _ammo = ["100Rnd_65x39_caseless_khaki_mag", "100Rnd_65x39_caseless_khaki_mag_tracer"];
        };
        default
        {
            _weapons = ["arifle_MX_SW_F"];
            _ammo = ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"];
        };
    };
}
else
{
    _weapons =
    [
        ["arifle_MX_SW_F"],
        ["arifle_MX_SW_Black_F"]
    ];
    _ammo =
    [
        ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"],
        ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"]
    ];

    if (_usingApex) then
    {
        _weapons pushBack ["arifle_MX_SW_khk_F"];
        _ammo pushBack ["100Rnd_65x39_caseless_khaki_mag", "100Rnd_65x39_caseless_khaki_mag_tracer"];
    };
};

_uncommon set ["mxsw", [_weapons, _ammo]];

// SPAR-16S
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY:
            {
                _weapons = ["arifle_SPAR_02_blk_F"];
                _ammo = ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"];
            };
            case TANOA_KEY:
            {
                _weapons = ["arifle_SPAR_02_khk_F"];
                _ammo = ["150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"];
            };
            default
            {
                _weapons = ["arifle_SPAR_02_snd_F"];
                _ammo = ["150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F"];
            };
        };
    }
    else
    {
        _weapons =
        [
            ["arifle_SPAR_02_blk_F"],
            ["arifle_SPAR_02_khk_F"],
            ["arifle_SPAR_02_snd_F"]
        ];
        _ammo =
        [
            ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"],
            ["150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F"],
            ["150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F"]
        ];
    };

    _common set ["spar16s", [_weapons, _ammo]];
};

// SDAR
if (SDAR_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [SDAR_KEY, [["arifle_SDAR_F"], ["30Rnd_556x45_Stanag_red", "20Rnd_556x45_UW_mag"]]];
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

// Vermin
_rare set ["vermin", [["SMG_01_F"], ["30Rnd_45ACP_Mag_SMG_01"]]];

Escape_Random_Cargo_Basic set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Launcher get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Launcher get RAND_CARGO_RARE_KEY;

// MAAWS
if (_usingTanks) then
{
    _ammo = ["MRAWS_HEAT_F", "MRAWS_HE_F"];

    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _weapons = ["launch_MRAWS_green_F", "launch_MRAWS_green_rail_F"];
            };
            default
            {
                _weapons = ["launch_MRAWS_sand_F", "launch_MRAWS_sand_rail_F"];
            };
        };
    }
    else
    {
        _weapons =
        [
            "launch_MRAWS_sand_F", "launch_MRAWS_sand_rail_F",
            "launch_MRAWS_green_F", "launch_MRAWS_green_rail_F"
        ];
    };

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
_ammo = ["Titan_AA"];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && _usingContact);
        case (_map == TANOA_KEY && _usingApex):
        {
            _weapons = ["launch_B_Titan_tna_F"];
        };
        default
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
        case (_map == LIVONIA_KEY && _usingContact);
        case (_map == TANOA_KEY && _usingApex):
        {
            _weapons = ["launch_B_Titan_short_tna_F"];
        };
        default
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

// SPAR-17
if (_usingApex) then
{
    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY:
            {
                _weapons = ["arifle_SPAR_03_blk_F"];
            };
            case TANOA_KEY:
            {
                _weapons = ["arifle_SPAR_03_khk_F"];
            };
            default
            {
                _weapons = ["arifle_SPAR_03_snd_F"];
            };
        };
    }
    else
    {
        _weapons = ["arifle_SPAR_03_snd_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F"];
    };

    _common set ["spar17", [_weapons, ["20Rnd_762x51_Mag"]]];
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
            default
            {
                _weapons = ["srifle_DMR_03_tan_F"];
            };
        };
    }
    else
    {
        _weapons = ["srifle_DMR_03_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F"];
    };

    if (MKI_EMR_KEY in _common) then
    {
        _temp = _common get MKI_EMR_KEY;
        {
            _temp select 0 pushBackUnique _x;
        } forEach (_weapons);
        {
            _temp select 1 pushBackUnique _x;
        } forEach (["20Rnd_762x51_Mag"]);
        _common set [MKI_EMR_KEY, _temp];
    }
    else
    {
        _common set [MKI_EMR_KEY, [_weapons, ["20Rnd_762x51_Mag"]]];
    };
};

// SPMG
if (_usingMarksmen) then
{
    _ammo = ["200Rnd_338_Mag"];

    if (_useMapCamo) then
    {
        switch (_map) do
        {
            case LIVONIA_KEY;
            case TANOA_KEY:
            {
                _weapons = ["MMG_02_black_F"];
            };
            default
            {
                _weapons = ["MMG_02_sand_F"];
            };
        };
    }
    else
    {
        _weapons = ["MMG_02_black_F", "MMG_02_sand_F", "MMG_02_camo_F"];
    };

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

// MXM
if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY):
        {
            _weapons = ["arifle_MXM_Black_F"];
            _ammo = ["30Rnd_65x39_caseless_black_mag"];
        };
        case (_map == TANOA_KEY && _usingApex):
        {
            _weapons = ["arifle_MXM_khk_F"];
            _ammo = ["30Rnd_65x39_caseless_khaki_mag"];
        };
        default
        {
            _weapons = ["arifle_MXM_F"];
            _ammo = ["30Rnd_65x39_caseless_mag"];
        };
    };
}
else
{
    _weapons =
    [
        ["arifle_MXM_F"],
        ["arifle_MXM_Black_F"]
    ];
    _ammo =
    [
        ["30Rnd_65x39_caseless_mag"],
        ["30Rnd_65x39_caseless_black_mag"]
    ];

    if (_usingApex) then
    {
        _weapons pushBack ["arifle_MXM_khk_F"];
        _ammo pushBack ["30Rnd_65x39_caseless_khaki_mag"];
    };
};

_uncommon set ["mxm", [_weapons, _ammo]];

// MAR-10
if (_usingMarksmen) then
{
    _ammo = ["10Rnd_338_Mag"];

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
            default
            {
                _weapons = ["srifle_DMR_02_sniper_F"];
            };
        };
    }
    else
    {
        _weapons = ["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F"];
    };

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
_ammo = ["7Rnd_408_Mag"];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY):
        {
            _weapons = ["srifle_LRR_F"];
        };
        case (_map == TANOA_KEY && _usingApex):
        {
            _weapons = ["srifle_LRR_tna_F"];
        };
        default
        {
            _weapons = ["srifle_LRR_camo_F"];
        };
    };
}
else
{
    _weapons = ["srifle_LRR_F", "srifle_LRR_camo_F"];
    if (_usingApex) then { _weapons append ["srifle_LRR_tna_F"] };
};

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
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Prison get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Prison get RAND_CARGO_RARE_KEY;

// PO7
_ammo = ["16Rnd_9x21_Mag"];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && _usingApex):
        {
            _weapons = ["hgun_P07_khk_F", "hgun_P07_khk_Snds_F"];
        };
        default
        {
            _weapons = ["hgun_P07_F", "hgun_P07_snds_F"];
        };
    };
}
else
{
    _weapons = ["hgun_P07_F", "hgun_P07_snds_F"];
    if (_usingApex) then { _weapons append ["hgun_P07_khk_F", "hgun_P07_khk_Snds_F"] };
};

if (P_07_KEY in _common) then
{
    _temp = _common get P_07_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _common set [P_07_KEY, _temp];
}
else
{
    _common set [P_07_KEY, [_weapons, _ammo]];
};

// 4Five
_weapons = ["hgun_Pistol_heavy_01_F"];
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

// Vermin
_rare set ["vermin", [["SMG_01_F"], ["30Rnd_45ACP_Mag_SMG_01"]]];

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Prison set [RAND_CARGO_RARE_KEY, _rare];

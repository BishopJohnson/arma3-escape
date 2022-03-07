/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeSaf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _map = worldName;

////////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons
_common = Escape_Random_Cargo_Basic get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// M70
_common set ["m70", [
    ["rhs_weap_m70b3n", "rhs_weap_m92"],
    ["rhsgref_30rnd_556x45_m21"]
]];

// M70 GL
_common set ["m70Gl", [
    ["rhs_weap_m70b3n_pbg40"],
    ["rhssaf_30Rnd_762x39mm_M67", "rhs_VOG25"]
]];

// M21
_uncommon set ["m21", [
    ["rhs_weap_m21a", "rhs_weap_m21a_pr", "rhs_weap_m21s", "rhs_weap_m21s_pr"],
    ["rhsgref_30rnd_556x45_m21"]
]];

// M21 GL
_uncommon set ["m21Gl", [
    ["rhs_weap_m21a_pbg40", "rhs_weap_m21a_pr_pbg40"],
    ["rhs_30Rnd_545x39_7N6M_AK", "rhs_VOG25"]
]];

// HK416
_rare set ["hk416", [
    ["rhs_weap_hk416d145", "rhs_weap_hk416d10"],
    ["rhs_mag_30Rnd_556x45_Mk318_Stanag"]
]];

// HK416 GL
_rare set ["hk416Gl", [
    ["rhs_weap_hk416d10_m320"],
    ["rhs_mag_30Rnd_556x45_Mk318_Stanag", "rhs_mag_M433_HEDP"]
]];

// G36
_rare set ["g36", [
    ["rhs_weap_g36kv", "rhs_weap_g36c"],
    ["rhssaf_30rnd_556x45_EPR_G36"]
]];

// G36 GL
_rare set ["g36Gl", [
    ["rhs_weap_g36kv_ag36"],
    ["rhssaf_30rnd_556x45_EPR_G36", "rhs_mag_M433_HEDP"]
]];

// SCAR-H
if (Escape_Saf_Use_Camo) then
{
    switch (_map) do
    {
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _weapons = ["rhs_weap_SCARH_FDE_STD", "rhs_weap_SCARH_FDE_CQC"];
        };
        default
        {
            _weapons = ["rhs_weap_SCARH_STD", "rhs_weap_SCARH_CQC"];
        };
    };
}
else
{
    _weapons = ["rhs_weap_SCARH_STD", "rhs_weap_SCARH_CQC"];
};

_ammo = ["rhs_mag_20Rnd_SCAR_762x51_m118_special"];

if (SCAR_H_KEY in _rare) then
{
    _temp = _rare get SCAR_H_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [SCAR_H_KEY, _temp];
}
else
{
    _rare set [SCAR_H_KEY, [_weapons, _ammo]];
};

// M249
_weapons = ["rhs_weap_minimi_para_railed"];
_ammo = ["rhsusf_200rnd_556x45_mixed_box"];

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

// Scorpion
if (SCORPION_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [SCORPION_KEY, [["rhs_weap_scorpion"], ["rhsgref_20rnd_765x17_vz61"]]];
};

Escape_Random_Cargo_Basic set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Launcher get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Launcher get RAND_CARGO_RARE_KEY;

// M80
_common set ["m80", [["rhs_weap_m80"], []]];

// SMAW
if (SMAW_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [SMAW_KEY, [["rhs_weap_smaw_green"], ["rhs_mag_smaw_HEAA"]]];
};

// Igla
if (IGLA_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [IGLA_KEY, [["rhs_weap_igla"], ["rhs_mag_9k38_rocket"]]];
};

Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Launcher set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Launcher set [RAND_CARGO_RARE_KEY, _rare];

//////////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons
_uncommon = Escape_Random_Cargo_Special get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Special get RAND_CARGO_RARE_KEY;

// M84
_uncommon set ["m84", [["rhs_weap_m84"], ["rhs_100Rnd_762x54mmR"]]];

// M76
if (M76_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [M76_KEY, [["rhs_weap_m76"], ["rhsgref_10Rnd_792x57_m76"]]];
};

// M82
_rare set ["m82", [["rhs_weap_m82a1"], ["rhsusf_mag_10Rnd_STD_50BMG_M33"]]];

Escape_Random_Cargo_Special set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, _rare];

/////////////////////////////////////////////////////////////////////////////////////////////////// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Prison get RAND_CARGO_UNCOMMON_KEY;

// CZ99
if (CZ99_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [CZ99_KEY, [["rhs_weap_cz99"], ["rhssaf_mag_15Rnd_9x19_FMJ"]]];
};

// Scorpion
if (SCORPION_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [SCORPION_KEY, [["rhs_weap_scorpion"], ["rhsgref_20rnd_765x17_vz61"]]];
};

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_UNCOMMON_KEY, _uncommon];

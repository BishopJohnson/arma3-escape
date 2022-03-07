/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

////////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons
_common = Escape_Random_Cargo_Basic get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// AKM
_common set [AKM_KEY, [["rhs_weap_akm"], ["rhs_30Rnd_762x39mm_89"]]];

// M14
_uncommon set [M14_KEY, [["rhs_weap_m14"], ["rhsusf_20Rnd_762x51_m80_Mag"]]];

// FAL
_uncommon set ["fal", [["rhs_weap_l1a1_wood"], ["rhs_mag_20Rnd_762x51_m80_fnfal"]]];

// SCAR-H
_weapons = ["rhs_weap_mk17_STD", "rhs_weap_mk17_CQC"];
_ammo = ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr"];

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

Escape_Random_Cargo_Basic set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Launcher get RAND_CARGO_UNCOMMON_KEY;

// RPG-7
_weapons = ["rhs_weap_rpg7"];
_ammo = ["rhs_rpg7_PG7V_mag"];

if (RPG_7_KEY in _common) then
{
    _temp = _common get RPG_7_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _common set [RPG_7_KEY, _temp];
}
else
{
    _common set [RPG_7_KEY, [_weapons, _ammo]];
};

// LAW
if (LAW_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [LAW_KEY, [["rhs_weap_m72a7"], []]];
};

Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Launcher set [RAND_CARGO_UNCOMMON_KEY, _uncommon];

//////////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons
_rare = Escape_Random_Cargo_Special get RAND_CARGO_RARE_KEY;

// M1 Garand
_rare set ["m1", [["rhs_weap_m1garand_sa43"], ["rhsgref_8Rnd_762x63_M2B_M1rifle"]]];

// MG42
_rare set ["mg42", [["rhs_weap_mg42"], ["rhsgref_50Rnd_792x57_SmE_drum"]]];

// M79
_rare set ["m79", [["rhs_weap_m79"], ["rhs_mag_M441_HE"]]];

Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, _rare];

/////////////////////////////////////////////////////////////////////////////////////////////////// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Prison get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Prison get RAND_CARGO_RARE_KEY;

// CZ99
if (CZ99_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [CZ99_KEY, [["rhs_weap_cz99"], ["rhssaf_mag_15Rnd_9x19_FMJ"]]];
};

// 6P53
_common set ["6P53", [["rhs_weap_6p53"], ["rhs_18rnd_9x21mm_7N28"]]];

// 6P9
_common set ["6P9", [["rhs_weap_pb_6p9"], ["rhs_mag_9x18_8_57N181S"]]];

// TT-33
_common set ["tt33", [["rhs_weap_tt33"], ["rhs_mag_762x25_8"]]];

// M1911
if (M1911_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [M1911_KEY, [["rhsusf_weap_m1911a1"], ["rhsusf_mag_7x45acp_MHP"]]];
};

// Scorpion
if (SCORPION_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [SCORPION_KEY, [["rhs_weap_scorpion"], ["rhsgref_20rnd_765x17_vz61"]]];
};

// M3
_rare set ["m3", [["rhs_weap_m3a1"], ["rhsgref_30rnd_1143x23_M1911B_SMG"]]];

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Prison set [RAND_CARGO_RARE_KEY, _rare];

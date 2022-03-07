/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeRu" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

////////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// AK-74M
_uncommon set ["ak74M", [
    ["rhs_weap_ak74m", "rhs_weap_aks74u"],
    ["rhs_30Rnd_545x39_7N10_AK"]
]];

// AK-74M GL
_uncommon set ["ak74MGl", [
    ["rhs_weap_ak74m_gp25"],
    ["rhs_30Rnd_545x39_7N10_AK", "rhs_VOG25"]
]];

// RPK-74M
_weapons = ["rhs_weap_rpk74m"];
_ammo = ["rhs_45Rnd_545X39_7N10_AK"];

if (RPK_74M_KEY in _uncommon) then
{
    _temp = _uncommon get RPK_74M_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _uncommon set [RPK_74M_KEY, _temp];
}
else
{
    _uncommon set [RPK_74M_KEY, [_weapons, _ammo]];
};

// PP-2000
_rare set ["pp2000", [["rhs_weap_pp2000"], ["rhs_mag_9x19mm_7n21_20"]]];

Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, _rare];

////////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers
_common = Escape_Random_Cargo_Launcher get RAND_CARGO_COMMON_KEY;
_rare = Escape_Random_Cargo_Launcher get RAND_CARGO_RARE_KEY;

// RPG-7
_weapons = ["rhs_weap_rpg7"];
_ammo = ["rhs_rpg7_PG7VL_mag"];

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

// Igla
if (IGLA_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [IGLA_KEY, [["rhs_weap_igla"], ["rhs_mag_9k38_rocket"]]];
};

// RShG-2
_rare set ["rshg2", [["rhs_weap_rshg2"], []]];

// RPG-26
_rare set ["rpg26", [["rhs_weap_rpg26"], []]];

Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Launcher set [RAND_CARGO_RARE_KEY, _rare];

//////////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons
_uncommon = Escape_Random_Cargo_Special get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Special get RAND_CARGO_RARE_KEY;

// PKM & PKP
_weapons = ["rhs_weap_pkm", "rhs_weap_pkp"];
_ammo = ["rhs_100Rnd_762x54mmR"];

if (PKM_KEY in _uncommon) then
{
    _temp = _uncommon get PKM_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _uncommon set [PKM_KEY, _temp];
}
else
{
    _uncommon set [PKM_KEY, [_weapons, _ammo]];
};

// SVD
_uncommon set ["svd", [["rhs_weap_svdp", "rhs_weap_svds"], ["rhs_10Rnd_762x54mmR_7N1"]]];

// VSS
_uncommon set ["vss", [["rhs_weap_vss"], ["rhs_20rnd_9x39mm_SP6"]]];

// AS Val
_uncommon set ["asVal", [["rhs_weap_asval"], ["rhs_20rnd_9x39mm_SP6"]]];

// T-5000
_rare set ["t5000", [["rhs_weap_t5000"], ["rhs_5Rnd_338lapua_t5000"]]];

Escape_Random_Cargo_Special set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, _rare];

/////////////////////////////////////////////////////////////////////////////////////////////////// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_rare = Escape_Random_Cargo_Prison get RAND_CARGO_RARE_KEY;

// MP-443
_common set ["mp443", [["rhs_weap_pya"], ["rhs_mag_9x19_17"]]];

// Makarov
_common set ["makarov", [["rhs_weap_makarov_pm"], ["rhs_mag_9x18_8_57N181S"]]];

// PP-2000
_rare set ["pp2000", [["rhs_weap_pp2000"], ["rhs_mag_9x19mm_7n21_20"]]];

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_RARE_KEY, _rare];

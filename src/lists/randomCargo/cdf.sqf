/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_common", "_uncommon", "_rare", "_temp", "_weapons", "_ammo"];

if (!isServer) exitWith {};

private _include = "IncludeCdf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

////////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons
_uncommon = Escape_Random_Cargo_Basic get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Basic get RAND_CARGO_RARE_KEY;

// AK-74
_uncommon set ["ak74", [
    ["rhs_weap_aks74", "rhs_weap_aks74u"],
    ["rhs_30Rnd_545x39_7N6M_AK"]
]];

// AK-74 GL
_uncommon set ["ak74Gl", [
    ["rhs_weap_ak74_gp25"],
    [
        "rhs_30Rnd_545x39_7N6M_AK",
        "rhs_VOG25", "rhs_GRD40_White"
    ]
]];

// RPK-74M
_weapons = ["rhs_weap_rpk74m"];
_ammo = ["rhs_45Rnd_545X39_7N6M_AK"];

if (RPK_74M_KEY in _rare) then
{
    _temp = _rare get RPK_74M_KEY;
    {
        _temp select 0 pushBackUnique _x;
    } forEach (_weapons);
    {
        _temp select 1 pushBackUnique _x;
    } forEach (_ammo);
    _rare set [RPK_74M_KEY, _temp];
}
else
{
    _rare set [RPK_74M_KEY, [_weapons, _ammo]];
};

// Scorpion
if (SCORPION_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [SCORPION_KEY, [["rhs_weap_scorpion"], ["rhsgref_20rnd_765x17_vz61"]]];
};

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

// RPG-75
_rare set ["rpg75", [["rhs_weap_rpg75"], []]];

Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Launcher set [RAND_CARGO_RARE_KEY, _rare];

//////////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons
_uncommon = Escape_Random_Cargo_Special get RAND_CARGO_UNCOMMON_KEY;
_rare = Escape_Random_Cargo_Special get RAND_CARGO_RARE_KEY;

// PKM
_weapons = ["rhs_weap_pkm"];
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

// M76
if (M76_KEY in _rare) then { /* No unique values that could be ommitted */ }
else
{
    _rare set [M76_KEY, [["rhs_weap_m76"], ["rhsgref_10Rnd_792x57_m76"]]];
};

Escape_Random_Cargo_Special set [RAND_CARGO_UNCOMMON_KEY, _uncommon];
Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, _rare];

/////////////////////////////////////////////////////////////////////////////////////////////////// Prison start weapons
_common = Escape_Random_Cargo_Prison get RAND_CARGO_COMMON_KEY;
_uncommon = Escape_Random_Cargo_Prison get RAND_CARGO_UNCOMMON_KEY;

// Glock
if (GLOCK_KEY in _common) then { /* No unique values that could be ommitted */ }
else
{
    _common set [GLOCK_KEY, [["rhsusf_weap_glock17g4"], ["rhsusf_mag_17Rnd_9x19_FMJ"]]];
};

// Scorpion
if (SCORPION_KEY in _uncommon) then { /* No unique values that could be ommitted */ }
else
{
    _uncommon set [SCORPION_KEY, [["rhs_weap_scorpion"], ["rhsgref_20rnd_765x17_vz61"]]];
};

Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, _common];
Escape_Random_Cargo_Prison set [RAND_CARGO_UNCOMMON_KEY, _uncommon];

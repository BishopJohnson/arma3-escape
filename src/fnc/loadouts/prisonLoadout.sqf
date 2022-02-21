/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

#define MAGAZINE_COUNT 3

if (!hasInterface) exitWith { hint "Does not have an interface in 'prisonLoadout.sqf'" };

// Removes all player gear
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

// Readds basic items
player linkItem "ItemWatch";
player linkItem "ItemCompass";
player linkItem "ItemRadio";

private _map = worldName;
private "_uniform";
switch (PLAYER_FACTION) do
{
    case NATO_KEY:
    {
        if (Escape_Nato_Use_Camo) then
        {
            switch true do
            {
                case (_map == LIVONIA_KEY && Escape_Using_Contact):
                {
                    _uniform = selectRandom
                    [
                        "U_B_CombatUniform_mcam_wdl_f",
                        "U_B_CombatUniform_tshirt_mcam_wdL_f",
                        "U_B_CombatUniform_vest_mcam_wdl_f"
                    ];
                };
                case (_map == TANOA_KEY && Escape_Using_Apex):
                {
                    _uniform = selectRandom
                    [
                        "U_B_T_Soldier_F",
                        "U_B_T_Soldier_AR_F",
                        "U_B_T_Soldier_SL_F"
                    ];
                };
                default
                {
                    _uniform = selectRandom
                    [
                        "U_B_CombatUniform_mcam",
                        "U_B_CombatUniform_mcam_tshirt",
                        "U_B_CombatUniform_mcam_vest"
                    ];
                };
            };
        }
        else
        {
            _uniform = selectRandom
            [
                "U_B_CombatUniform_mcam",
                "U_B_CombatUniform_mcam_tshirt",
                "U_B_CombatUniform_mcam_vest"
            ];
        };
    };
    case CSAT_KEY:
    {
        if (Escape_Csat_Use_Camo) then
        {
            switch true do
            {
                case (_map == LIVONIA_KEY && Escape_Using_Apex);
                case (_map == TANOA_KEY && Escape_Using_Apex):
                {
                    _uniform = "U_O_T_Soldier_F";
                };
                default
                {
                    _uniform = "U_O_CombatUniform_ocamo";
                };
            };
        }
        else
        {
            _uniform = "U_O_CombatUniform_ocamo";
        };
    };
    case AAF_KEY:
    {
        _uniform = selectRandom ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"];
    };
    case US_ARMY_KEY:
    {
        if (Escape_Us_Army_Use_Ucp) then
        {
            _uniform = "rhs_uniform_acu_ucp2";
        }
        else
        {
            _uniform = "rhs_uniform_acu_oefcp";
        };
    };
    case US_MARINES_KEY:
    {
        if (Escape_Us_Marines_Use_Camo) then
        {
            switch (_map) do
            {
                case BYSTRICA_KEY;
                case CHERNARUS_KEY;
                case CHERNARUS_SUMMER_KEY;
                case LIVONIA_KEY;
                case TANOA_KEY:
                {
                    _uniform = "rhs_uniform_FROG01_wd";
                };
                default
                {
                    _uniform = "rhs_uniform_FROG01_d";
                };
            };
        }
        else
        {
            _uniform = "rhs_uniform_FROG01_d";
        };
    };
    case RU_KEY:
    {
        _uniform = "rhs_uniform_vkpo_gloves_alt";
    };
    case CDF_KEY:
    {
        _uniform = "rhsgref_uniform_ttsko_mountain";
    };
};

player forceAddUniform _uniform;

private _rarity = selectRandomWeighted
[/* commonality key          weight */
    RAND_CARGO_COMMON_KEY,   0.5,
    RAND_CARGO_UNCOMMON_KEY, 0.35,
    RAND_CARGO_RARE_KEY,     0.15
];

// Gets the weapon group to give the player
private _weaponDict = Escape_Random_Cargo_Prison get _rarity;
private _weaponGroupKey = selectRandom keys _weaponDict;
private _weaponGroup = _weaponDict get _weaponGroupKey;

// Selects the weapon and magazine types
private _weapons = _weaponGroup select 0;
private _ammo = _weaponGroup select 1;
if (typeName (_weapons select 0) == "ARRAY") then
{
    private _idx = [0, count _weapons - 1] call BIS_fnc_randomInt;
    _weapons = _weapons select _idx;
    _ammo = _ammo select _idx;
};

player addMagazines [selectRandom _ammo, MAGAZINE_COUNT];
player addWeapon selectRandom _weapons;

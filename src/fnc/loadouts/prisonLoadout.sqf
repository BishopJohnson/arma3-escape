/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

#define MAGAZINE_COUNT 3

params ["_side"];

if (!hasInterface) exitWith {};

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

switch (_side) do
{
    case west:        { player forceAddUniform "U_B_CombatUniform_mcam" };
    case east:        { player forceAddUniform "U_O_SpecopsUniform_ocamo" };
    case independent: { player forceAddUniform "U_I_CombatUniform" };
};

private _rarity = selectRandomWeighted
[/* commonality key          weight */
    RAND_CARGO_COMMON_KEY,   0.5,
    RAND_CARGO_UNCOMMON_KEY, 0.35,
    RAND_CARGO_RARE_KEY,     0.15
];

// Gets the weapon group to give the player
private _weaponGroupKeys = [Escape_Random_Cargo_Prison, _rarity] call DICT_fnc_get call DICT_fnc_keys;
private _weaponGroup = [Escape_Random_Cargo_Prison, _rarity, selectRandom _weaponGroupKeys] call DICT_fnc_get;

// Selects the weapon and magazine types
private _weapon = selectRandom (_weaponGroup select 0);
private _magazine = selectRandom (_weaponGroup select 1);

player addMagazines [_magazine, MAGAZINE_COUNT];
player addWeapon _weapon;

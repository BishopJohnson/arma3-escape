/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

// Remove existing items
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;

comment "Add weapons";
_unit addWeapon "rhs_weap_scorpion";
_unit addPrimaryWeaponItem "rhsgref_20rnd_765x17_vz61";

comment "Add containers";
_unit forceAddUniform "rhssaf_uniform_heli_pilot";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 4 do {_unit addItemToUniform "rhsgref_20rnd_765x17_vz61";};
for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m75";};
_unit addItemToUniform "rhssaf_mag_brd_m83_white";
_unit addItemToUniform "rhssaf_mag_brd_m83_green";
_unit addHeadgear "rhsusf_hgu56p_visor_saf";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";

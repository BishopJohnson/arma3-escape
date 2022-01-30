/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

// Remove existing items
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;

comment "Add weapons";
_unit addWeapon "arifle_Mk20_F";
_unit addPrimaryWeaponItem "30Rnd_556x45_Stanag";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_CombatUniform_shortsleeve";
_unit addVest "V_PlateCarrierIA2_dgtl";
_unit addBackpack "I_Fieldpack_oli_Medic";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellOrange";
_unit addItemToVest "SmokeShellPurple";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit";};
_unit addHeadgear "H_HelmetIA";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit addPrimaryWeaponItem "acc_pointer_IR";
    for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
    _unit linkItem "NVGoggles_INDEP";
};

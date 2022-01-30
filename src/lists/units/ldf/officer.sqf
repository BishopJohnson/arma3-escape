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
_unit addWeapon "arifle_MSBS65_F";
_unit addPrimaryWeaponItem "optic_Aco";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_msbs_mag";
_unit addWeapon "hgun_Pistol_heavy_01_green_F";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_E_Uniform_01_officer_F";
_unit addVest "V_BandollierB_oli";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_msbs_mag";};
_unit addItemToVest "30Rnd_65x39_caseless_msbs_mag";
for "_i" from 1 to 2 do {_unit addItemToVest "11Rnd_45ACP_Mag";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellBlue";
_unit addHeadgear "H_Beret_EAF_01_F";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit addItemToUniform "Chemlight_blue";
    _unit addItemToVest "Chemlight_blue";
};

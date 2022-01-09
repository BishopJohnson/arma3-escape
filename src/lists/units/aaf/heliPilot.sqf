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
_unit addWeapon "hgun_PDW2000_F";
_unit addPrimaryWeaponItem "optic_Holosight_smg";
_unit addPrimaryWeaponItem "30Rnd_9x21_Yellow_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_HeliPilotCoveralls";
_unit addVest "V_TacVest_oli";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_9x21_Yellow_Mag";};
_unit addItemToVest "30Rnd_9x21_Yellow_Mag";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellOrange";
_unit addItemToVest "SmokeShellPurple";
_unit addHeadgear "H_PilotHelmetHeli_I";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit addItemToUniform "Chemlight_green";
    _unit addItemToVest "Chemlight_green";
    _unit linkItem "NVGoggles_INDEP";
};

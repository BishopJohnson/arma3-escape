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
_unit addWeapon "SMG_03C_black";
_unit addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
_unit addWeapon "hgun_Pistol_heavy_01_green_F";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_E_Uniform_01_coveralls_F";
_unit addVest "V_CarrierRigKBT_01_EAF_F";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "50Rnd_570x28_SMG_03";
_unit addItemToUniform "SmokeShellBlue";
for "_i" from 1 to 3 do {_unit addItemToVest "50Rnd_570x28_SMG_03";};
for "_i" from 1 to 2 do {_unit addItemToVest "11Rnd_45ACP_Mag";};
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellOrange";
_unit addHeadgear "H_PilotHelmetHeli_I_E";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit addItemToUniform "Chemlight_blue";
    _unit addItemToVest "Chemlight_blue";
    _unit linkItem "NVGoggles_INDEP";
};

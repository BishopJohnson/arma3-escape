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
_unit addWeapon "srifle_DMR_03_F";
_unit addPrimaryWeaponItem "optic_AMS";
_unit addPrimaryWeaponItem "20Rnd_762x51_Mag";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
_unit addWeapon "hgun_Pistol_heavy_01_green_F";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_E_Uniform_01_F";
_unit addVest "V_CarrierRigKBT_01_light_EAF_F";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "20Rnd_762x51_Mag";
for "_i" from 1 to 2 do {_unit addItemToVest "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellBlue";
for "_i" from 1 to 6 do {_unit addItemToVest "20Rnd_762x51_Mag";};
_unit addHeadgear "H_HelmetHBK_F";

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
    _unit addItemToUniform "Chemlight_blue";
    _unit addItemToVest "Chemlight_blue";
    _unit linkItem "NVGoggles_INDEP";
};

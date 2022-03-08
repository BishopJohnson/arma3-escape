/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

if (Escape_Us_Army_Use_Ucp) then
{
    _uniform = "rhs_uniform_acu_ucp2";
    _vest = "rhsusf_iotv_ucp_SAW";
    _backpack = "rhsusf_assault_eagleaiii_ucp_mg";
    _helmet = "rhsusf_ach_helmet_ucp";
}
else
{
    _uniform = "rhs_uniform_acu_oefcp";
    _vest = "rhsusf_iotv_ocp_SAW";
    _backpack = "rhsusf_assault_eagleaiii_ocp_mg";
    _helmet = "rhsusf_ach_helmet_ocp";
};

// Remove existing items
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;

comment "Add weapons";
_unit addWeapon "rhs_weap_m240B";
_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
_unit addPrimaryWeaponItem "rhsusf_50Rnd_762x51";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_FMJ";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack _backpack;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 5 do {_unit addItemToVest "rhsusf_50Rnd_762x51";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";};
_unit addItemToVest "rhs_mag_m67";
for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit linkItem "rhsusf_ANPVS_14";
};

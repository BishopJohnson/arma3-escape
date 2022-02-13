/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_cap", "_helmet", "_nvg"];

private _map = worldName;
if (Escape_Us_Army_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _acc = "rhsusf_acc_anpeq15_top_bk";
        };
        default
        {
            _acc = "rhsusf_acc_anpeq15_top";
        };
    };
}
else
{
    _acc = "rhsusf_acc_anpeq15_top";
};

if (Escape_Us_Army_Use_Ucp) then
{
    _uniform = "rhs_uniform_acu_ucp2";
    _vest = "rhsusf_iotv_ucp_Medic";
    _backpack = "rhsusf_assault_eagleaiii_ucp_medic";
    _cap = "rhsusf_patrolcap_ucp";
    _helmet = "rhsusf_ach_helmet_ucp";
}
else
{
    _uniform = "rhs_uniform_acu_oefcp";
    _vest = "rhsusf_iotv_ocp_Medic";
    _backpack = "rhsusf_assault_eagleaiii_ocp_medic";
    _cap = "rhsusf_patrolcap_ocp";
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
_unit addWeapon "rhs_weap_m4";
_unit addPrimaryWeaponItem _acc;
_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_FMJ";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack _backpack;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform _cap;
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";};
_unit addItemToVest "rhs_mag_m18_red";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit";};
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
    _unit addItemToUniform "rhsusf_ANPVS_14";
}
else
{
    _unit addItemToUniform "rhsusf_ANPVS_14";
};
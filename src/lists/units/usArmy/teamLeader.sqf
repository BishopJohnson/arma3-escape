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
            _acc = "rhsusf_acc_anpeq15_bk";
        };
        default
        {
            _acc = "rhsusf_acc_anpeq15";
        };
    };
}
else
{
    _acc = "rhsusf_acc_anpeq15";
};

if (Escape_Us_Army_Use_Ucp) then
{
    _uniform = "rhs_uniform_acu_ucp2";
    _vest = "rhsusf_iotv_ucp_Teamleader";
    _cap = "rhsusf_patrolcap_ucp";
    _helmet = "rhsusf_ach_helmet_ESS_ucp";
}
else
{
    _uniform = "rhs_uniform_acu_oefcp";
    _vest = "rhsusf_iotv_ocp_Teamleader";
    _cap = "rhsusf_patrolcap_ocp";
    _helmet = "rhsusf_ach_helmet_ESS_ocp";
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
_unit addWeapon "rhs_weap_m4a1";
_unit addPrimaryWeaponItem _acc;
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG2";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addPrimaryWeaponItem "rhsusf_acc_kac_grip";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform _cap;
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
_unit addItemToVest "rhs_mag_m18_purple";
_unit addItemToVest "rhs_mag_m18_yellow";
_unit addItemToVest "rhs_mag_m67";
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
}
else
{
    _unit addItemToUniform "rhsusf_ANPVS_14";
};

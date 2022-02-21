/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

private _map = worldName;
if (Escape_Us_Marines_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _uniform = "rhs_uniform_FROG01_wd";
            _helmet = "rhsusf_lwh_helmet_marpatwd_headset";
        };
        default
        {
            _uniform = "rhs_uniform_FROG01_d";
            _helmet = "rhsusf_lwh_helmet_marpatd_headset";
        };
    };
}
else
{
    _uniform = "rhs_uniform_FROG01_d";
    _helmet = "rhsusf_lwh_helmet_marpatd_headset";
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
_unit addWeapon "rhs_weap_m4_carryhandle";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG3_USMC";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855_Stanag";
_unit addPrimaryWeaponItem "rhsusf_acc_kac_grip";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "rhsusf_spc_squadleader";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855_Stanag";
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_Stanag";};
_unit addItemToVest "rhs_mag_m67";
_unit addItemToVest "rhs_mag_an_m8hc";
_unit addItemToVest "rhs_mag_m18_purple";
_unit addItemToVest "rhs_mag_m18_yellow";
_unit addItemToVest "rhs_mag_m18_red";
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
    _unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
    _unit addItemToUniform "Chemlight_red";
    _unit addItemToVest "Chemlight_red";
    _unit linkItem "rhsusf_ANPVS_14";
};

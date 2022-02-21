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
            _helmet = "rhsusf_lwh_helmet_marpatwd";
        };
        default
        {
            _uniform = "rhs_uniform_FROG01_d";
            _helmet = "rhsusf_lwh_helmet_marpatd";
        };
    };
}
else
{
    _uniform = "rhs_uniform_FROG01_d";
    _helmet = "rhsusf_lwh_helmet_marpatd";
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
_unit addWeapon "rhs_weap_m16a4_carryhandle";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855_Stanag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "rhsusf_spc_rifleman";
_unit addBackpack "rhsusf_assault_eagleaiii_coy_ar";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
_unit addItemToVest "rhs_mag_an_m8hc";
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_M855_soft_pouch";};
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
    _unit linkItem "rhsusf_ANPVS_14";
};

/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

private _primaryLoadout = selectRandomWeighted [true, 0.8, false, 0.2];
if (_primaryLoadout) then
{
    _weaponP = "rhs_weap_m249_pip_L";
    _bipod = "rhsusf_acc_kac_grip_saw_bipod";
    _mag = "rhsusf_100Rnd_556x45_M855_soft_pouch";
    _vest = "rhsusf_spc_mg";
    _backpack = "rhsusf_assault_eagleaiii_coy_ar";
}
else
{
    _weaponP = "rhs_weap_m27iar_grip";
    _bipod = "rhsusf_acc_harris_bipod";
    _mag = "rhs_mag_30Rnd_556x45_M855_Stanag";
    _vest = "rhsusf_spc_iar";
    _backpack = "rhsusf_assault_eagleaiii_coy_m27";
};

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
            _helmet = "rhsusf_lwh_helmet_marpatwd_ess";
        };
        default
        {
            _uniform = "rhs_uniform_FROG01_d";
            _helmet = "rhsusf_lwh_helmet_marpatd_ess";
        };
    };
}
else
{
    _uniform = "rhs_uniform_FROG01_d";
    _helmet = "rhsusf_lwh_helmet_marpatd_ess";
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
_unit addWeapon _weaponP;
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG2_USMC";
_unit addPrimaryWeaponItem _mag;
_unit addPrimaryWeaponItem _bipod;

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack _backpack;

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

if (_primaryLoadout) then
{
    _unit addWeapon "rhsusf_weap_m9";
    _unit addHandgunItem "rhsusf_mag_15Rnd_9x19_FMJ";
    _unit addItemToUniform "rhsusf_mag_15Rnd_9x19_FMJ";
    for "_i" from 1 to 2 do {_unit addItemToVest _mag;};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";};
    for "_i" from 1 to 4 do {_unit addItemToBackpack _mag;};
}
else
{
    for "_i" from 1 to 12 do {_unit addItemToVest _mag;};
    for "_i" from 1 to 10 do {_unit addItemToBackpack _mag;};
};

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
    _unit linkItem "rhsusf_ANPVS_14";
};

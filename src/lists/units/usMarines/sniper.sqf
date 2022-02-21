/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_binocular", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

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
            _weaponP = "rhs_weap_m40a5_wd";
            _binocular = "rhsusf_bino_lerca_1200_black";
            _optic = "rhsusf_acc_M8541_low_wd";
            _uniform = "rhs_uniform_FROG01_wd";
            _helmet = "rhsusf_mich_helmet_marpatwd_norotos_arc";
        };
        default
        {
            _weaponP = "rhs_weap_m40a5_d";
            _binocular = "rhsusf_bino_lerca_1200_tan";
            _optic = "rhsusf_acc_M8541_low_d";
            _uniform = "rhs_uniform_FROG01_d";
            _helmet = "rhsusf_mich_helmet_marpatd_norotos_arc";
        };
    };
}
else
{
    _weaponP = "rhs_weap_m40a5";
    _binocular = "rhsusf_bino_lerca_1200_black";
    _optic = "rhsusf_acc_M8541_low";
    _uniform = "rhs_uniform_FROG01_d";
    _helmet = "rhsusf_mich_helmet_marpatd_norotos_arc";
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
_unit addPrimaryWeaponItem _optic;
_unit addPrimaryWeaponItem "rhsusf_10Rnd_762x51_m118_special_Mag";
_unit addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_FMJ";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "rhsusf_spc_sniper";

comment "Add binoculars";
_unit addWeapon _binocular;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhsusf_10Rnd_762x51_m118_special_Mag";
for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_10Rnd_762x51_m118_special_Mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";};
_unit addItemToVest "rhs_mag_an_m8hc";
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

/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_cap", "_helmet", "_nvg"];

private _primaryLoudout = selectRandomWeighted [true, 0.8, false, 0.2];

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
            if (_primaryLoudout) then
            {
                _weaponP = "rhs_weap_XM2010_wd";
                _optic = "rhsusf_acc_LEUPOLDMK4_2";
                _mag = "rhsusf_5Rnd_300winmag_xm2010";
            }
            else
            {
                _weaponP = "rhs_weap_m24sws_wd";
                _optic = "rhsusf_acc_LEUPOLDMK4_wd";
                _mag = "rhsusf_5Rnd_762x51_m993_Mag";
            };
        };
        default
        {
            if (_primaryLoudout) then
            {
                _weaponP = "rhs_weap_XM2010_d";
                _optic = "rhsusf_acc_LEUPOLDMK4_2_d";
                _mag = "rhsusf_5Rnd_300winmag_xm2010";
            }
            else
            {
                _weaponP = "rhs_weap_m24sws_d";
                _optic = "rhsusf_acc_LEUPOLDMK4_d";
                _mag = "rhsusf_5Rnd_762x51_m993_Mag";
            };
        };
    };
}
else
{
    if (_primaryLoudout) then
    {
        _weaponP = "rhs_weap_XM2010";
        _optic = "rhsusf_acc_LEUPOLDMK4_2";
        _mag = "rhsusf_5Rnd_300winmag_xm2010";
    }
    else
    {
        _weaponP = "rhs_weap_m24sws";
        _optic = "rhsusf_acc_LEUPOLDMK4";
        _mag = "rhsusf_5Rnd_762x51_m993_Mag";
    };
};

if (Escape_Us_Army_Use_Ucp) then
{
    _uniform = "rhs_uniform_acu_ucp2";
    _vest = "rhsusf_iotv_ucp_Teamleader";
    _cap = "rhsusf_patrolcap_ucp";
    _helmet = "rhsusf_ach_helmet_ucp";
}
else
{
    _uniform = "rhs_uniform_acu_oefcp";
    _vest = "rhsusf_iotv_ocp_Teamleader";
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
_unit addWeapon _weaponP;
_unit addPrimaryWeaponItem _optic;
_unit addPrimaryWeaponItem _mag;
_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_FMJ";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add binoculars";
_unit addWeapon "rhsusf_bino_lrf_Vector21";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform _cap;
for "_i" from 1 to 3 do {_unit addItemToUniform _mag;};
for "_i" from 1 to 4 do {_unit addItemToVest _mag;};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";};
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
}
else
{
    _unit addItemToUniform "rhsusf_ANPVS_14";
};

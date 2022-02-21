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
            _helmet = "rhsusf_mich_helmet_marpatwd_norotos";
        };
        default
        {
            _uniform = "rhs_uniform_FROG01_d";
            _helmet = "rhsusf_mich_helmet_marpatd_norotos";
        };
    };
}
else
{
    _uniform = "rhs_uniform_FROG01_d";
    _helmet = "rhsusf_mich_helmet_marpatd_norotos";
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
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG2_USMC";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855_Stanag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "rhsusf_spc_light";
_unit addBackpack "rhsusf_assault_eagleaiii_coy_eod";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_Stanag";};
_unit addItemToVest "ClaymoreDirectionalMine_Remote_Mag";
_unit addItemToVest "rhs_mag_m18_red";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "rhsusf_m112x4_mag";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_m112_mag";};
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
    _unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a_top";
    _unit addItemToUniform "Chemlight_green";
    _unit addItemToVest "Chemlight_green";
    _unit linkItem "rhsusf_ANPVS_14";
};

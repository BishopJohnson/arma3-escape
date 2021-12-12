/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

private _map = worldName;
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weaponP = "srifle_DMR_03_khaki_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_AMS_khk";
            _bipod = "bipod_01_F_khk";
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrier1_tna_F";
            _helmet = "H_HelmetB_tna_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "srifle_DMR_03_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_AMS";
            _bipod = "bipod_01_F_blk";
            _uniform = "U_B_CombatUniform_mcam_wdl_f";
            _vest = "V_PlateCarrier1_wdl";
            _helmet = "H_HelmetB_plain_wdl";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "srifle_DMR_03_tan_F";
            _weaponS = "hgun_P07_F";
            _optic = "optic_AMS_snd";
            _bipod = "bipod_01_F_snd";
            _uniform = "U_B_CombatUniform_mcam";
            _vest = "V_PlateCarrier1_rgr";
            _helmet = "H_HelmetB";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "srifle_DMR_03_tan_F";
    _weaponS = "hgun_P07_F";
    _optic = "optic_AMS_snd";
    _bipod = "bipod_01_F_snd";
    _uniform = "U_B_CombatUniform_mcam";
    _vest = "V_PlateCarrier1_rgr";
    _helmet = "H_HelmetB";
    _nvg = "NVGoggles";
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
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem _optic;
_unit addPrimaryWeaponItem "20Rnd_762x51_Mag";
_unit addPrimaryWeaponItem _bipod;
_unit addWeapon _weaponS;
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "20Rnd_762x51_Mag";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 6 do {_unit addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem _nvg;
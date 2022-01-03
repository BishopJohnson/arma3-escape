/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

private _map = worldName;
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weaponP = "arifle_MXC_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Holosight_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrierGL_tna_F";
            _helmet = "H_HelmetB_Enh_tna_F";
            _backpack = "B_Carryall_oli_Mine";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MXC_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Holosight_blk_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _uniform = "U_B_CombatUniform_mcam_wdl_f";
            _vest = "V_PlateCarrierGL_wdl";
            _helmet = "H_HelmetSpecB_wdl";
            _backpack = "B_Carryall_wdl_Mine";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MXC_F";
            _weaponS = "hgun_P07_F";
            _optic = "optic_Holosight";
            _mag = "30Rnd_65x39_caseless_mag";
            _uniform = "U_B_CombatUniform_mcam";
            _vest = "V_PlateCarrierGL_rgr";
            _helmet = "H_HelmetSpecB";
            _backpack = "B_Carryall_oli_Mine";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MXC_F";
    _weaponS = "hgun_P07_F";
    _optic = "optic_Holosight";
    _mag = "30Rnd_65x39_caseless_mag";
    _uniform = "U_B_CombatUniform_mcam";
    _vest = "V_PlateCarrierGL_rgr";
    _helmet = "H_HelmetSpecB";
    _backpack = "B_Carryall_oli_Mine";
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
_unit addPrimaryWeaponItem _mag;
_unit addWeapon _weaponS;
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack _backpack;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform _mag;};
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToVest _mag;};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "APERSMine_Range_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "Chemlight_green";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "APERSMine_Range_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "APERSBoundingMine_Range_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "APERSTripMine_Wire_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "APERSMineDispenser_Mag";};
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem _nvg;

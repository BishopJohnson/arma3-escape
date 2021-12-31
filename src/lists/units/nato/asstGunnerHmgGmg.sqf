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
            _weaponP = "arifle_MXC_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Holosight_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _uniform = "U_B_T_Soldier_AR_F";
            _helmet = "H_HelmetB_Light_tna_F";
            _backpack = "B_HMG_01_support_grn_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MXC_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Holosight_blk_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _uniform = "U_B_CombatUniform_tshirt_mcam_wdL_f";
            _helmet = "H_HelmetB_light_wdl";
            _backpack = "B_HMG_01_support_grn_F";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MXC_F";
            _weaponS = "hgun_P07_F";
            _optic = "optic_Holosight";
            _mag = "30Rnd_65x39_caseless_mag";
            _uniform = "U_B_CombatUniform_mcam_tshirt";
            _helmet = "H_HelmetB_light";
            _backpack = "B_HMG_01_support_F";
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
    _uniform = "U_B_CombatUniform_mcam_tshirt";
    _helmet = "H_HelmetB_light";
    _backpack = "B_HMG_01_support_F";
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
_unit addVest "V_Chestrig_rgr";
_unit addBackpack _backpack;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform _mag;};
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 5 do {_unit addItemToVest _mag;};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "B_IR_Grenade";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "Chemlight_green";
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem _nvg;

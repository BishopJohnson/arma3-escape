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
            _weaponP = "arifle_MX_SW_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _bipod = "bipod_01_F_khk";
            _mag = "100Rnd_65x39_caseless_khaki_mag";
            _uniform = "U_B_T_Soldier_AR_F";
            _vest = "V_PlateCarrier2_tna_F";
            _helmet = "H_HelmetB_tna_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MX_SW_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _bipod = "bipod_01_F_blk";
            _mag = "100Rnd_65x39_caseless_black_mag";
            _uniform = "U_B_CombatUniform_tshirt_mcam_wdL_f";
            _vest = "V_PlateCarrier2_wdl";
            _helmet = "H_HelmetB_plain_wdl";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MX_SW_F";
            _weaponS = "hgun_P07_F";
            _bipod = "bipod_01_F_snd";
            _mag = "100Rnd_65x39_caseless_mag";
            _uniform = "U_B_CombatUniform_mcam_tshirt";
            _vest = "V_PlateCarrier2_rgr";
            _helmet = "H_HelmetB_grass";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MX_SW_F";
    _weaponS = "hgun_P07_F";
    _bipod = "bipod_01_F_snd";
    _mag = "100Rnd_65x39_caseless_mag";
    _uniform = "U_B_CombatUniform_mcam_tshirt";
    _vest = "V_PlateCarrier2_rgr";
    _helmet = "H_HelmetB_grass";
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
_unit addPrimaryWeaponItem _mag;
_unit addPrimaryWeaponItem _bipod;
_unit addWeapon _weaponS;
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "HandGrenade";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "SmokeShellGreen";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 5 do {_unit addItemToVest _mag;};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addItemToVest "Chemlight_green";
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem _nvg;
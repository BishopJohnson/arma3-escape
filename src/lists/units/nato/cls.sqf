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
            _weaponP = "arifle_MX_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrierSpec_tna_F";
            _helmet = "H_HelmetB_Light_tna_F";
            _backpack = "B_AssaultPack_tna_BTMedic_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MX_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _uniform = "U_B_CombatUniform_tshirt_mcam_wdL_f";
            _vest = "V_PlateCarrierSpec_wdl";
            _helmet = "H_HelmetB_light_wdl";
            _backpack = "B_AssaultPack_wdl_BWMedic_F";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MX_F";
            _weaponS = "hgun_P07_F";
            _mag = "30Rnd_65x39_caseless_mag";
            _uniform = "U_B_CombatUniform_mcam_tshirt";
            _vest = "V_PlateCarrierSpec_rgr";
            _helmet = "H_HelmetB_light_desert";
            _backpack = "B_AssaultPack_rgr_Medic";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MX_F";
    _weaponS = "hgun_P07_F";
    _mag = "30Rnd_65x39_caseless_mag";
    _uniform = "U_B_CombatUniform_mcam_tshirt";
    _vest = "V_PlateCarrierSpec_rgr";
    _helmet = "H_HelmetB_light_desert";
    _backpack = "B_AssaultPack_rgr_Medic";
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
this addWeapon _weaponP;
this addPrimaryWeaponItem "acc_pointer_IR";
this addPrimaryWeaponItem _mag;
this addWeapon _weaponS;
this addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
this forceAddUniform _uniform;
this addVest _vest;
this addBackpack _backpack;

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform _mag;};
this addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {this addItemToVest _mag;};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "SmokeShellBlue";
this addItemToVest "SmokeShellOrange";
this addItemToVest "Chemlight_green";
this addItemToBackpack "Medikit";
for "_i" from 1 to 10 do {this addItemToBackpack "FirstAidKit";};
this addHeadgear _helmet;

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem _nvg;

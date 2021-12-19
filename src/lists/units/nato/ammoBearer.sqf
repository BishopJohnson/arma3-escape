/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_mag1", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

private _usingMarksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;

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
            _mag1 = "100Rnd_65x39_caseless_khaki_mag"; // 100 round MX SW mag
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrier1_tna_F";
            _helmet = "H_HelmetB_tna_F";
            _backpack = "B_Carryall_oli_BTAmmo_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MX_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _mag1 = "100Rnd_65x39_caseless_black_mag"; // 100 round MX SW mag
            _uniform = "U_B_CombatUniform_mcam_wdl_f";
            _vest = "V_PlateCarrier1_wdl";
            _helmet = "H_HelmetB_plain_wdl";
            _backpack = "B_Carryall_wdl_BWAmmo_F";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MX_F";
            _weaponS = "hgun_P07_F";
            _mag = "30Rnd_65x39_caseless_mag";
            _mag1 = "100Rnd_65x39_caseless_mag"; // 100 round MX SW mag
            _uniform = "U_B_CombatUniform_mcam";
            _vest = "V_PlateCarrier1_rgr";
            _helmet = "H_HelmetB_grass";
            _backpack = "B_AssaultPack_mcamo_Ammo";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MX_F";
    _weaponS = "hgun_P07_F";
    _mag = "30Rnd_65x39_caseless_mag";
    _mag1 = "100Rnd_65x39_caseless_mag"; // 100 round MX SW mag
    _uniform = "U_B_CombatUniform_mcam";
    _vest = "V_PlateCarrier1_rgr";
    _helmet = "H_HelmetB_grass";
    _backpack = "B_AssaultPack_mcamo_Ammo";
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
this addPrimaryWeaponItem "optic_Aco";
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
for "_i" from 1 to 9 do {this addItemToVest _mag;};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "Chemlight_green";
for "_i" from 1 to 4 do {this addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 6 do {this addItemToBackpack _mag;};
this addItemToBackpack _mag1;
this addItemToBackpack "NLAW_F";
for "_i" from 1 to 2 do {this addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {this addItemToBackpack "MiniGrenade";};
for "_i" from 1 to 3 do {this addItemToBackpack "1Rnd_HE_Grenade_shell";};
this addItemToBackpack "3Rnd_HE_Grenade_shell";
this addHeadgear _helmet;

comment "Marksmen DLC items";
if (_usingMarksmen) then
{
    for "_i" from 1 to 2 do {this addItemToBackpack "10Rnd_338_Mag";};
    for "_i" from 1 to 2 do {this addItemToBackpack "20Rnd_762x51_Mag";};
};

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem _nvg;

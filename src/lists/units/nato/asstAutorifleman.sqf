/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_muzzle1", "_muzzle2", "_mag", "_mag1", "_mag2", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

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
            _bipod = "bipod_01_F_blk";
            _muzzle1 = "muzzle_snds_338_black";
            _muzzle2 = "muzzle_snds_H_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _mag1 = "100Rnd_65x39_caseless_khaki_mag";
            _mag2 = "100Rnd_65x39_caseless_khaki_mag_Tracer";
            _uniform = "U_B_T_Soldier_AR_F";
            _helmet = "H_HelmetB_Light_tna_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MX_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _bipod = "bipod_01_F_blk";
            _muzzle1 = "muzzle_snds_338_black";
            _muzzle2 = "muzzle_snds_H_blk_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _mag1 = "100Rnd_65x39_caseless_black_mag";
            _mag2 = "100Rnd_65x39_caseless_black_mag_tracer";
            _uniform = "U_B_CombatUniform_tshirt_mcam_wdL_f";
            _helmet = "H_HelmetB_light_wdl";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MX_F";
            _weaponS = "hgun_P07_F";
            _bipod = "bipod_01_F_snd";
            _muzzle1 = "muzzle_snds_338_sand";
            _muzzle2 = "muzzle_snds_H_snd_F";
            _mag = "30Rnd_65x39_caseless_mag";
            _mag1 = "100Rnd_65x39_caseless_mag";
            _mag2 = "100Rnd_65x39_caseless_mag_Tracer";
            _uniform = "U_B_CombatUniform_mcam_tshirt";
            _helmet = "H_HelmetB_light";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MX_F";
    _weaponS = "hgun_P07_F";
    _bipod = "bipod_01_F_snd";
    _muzzle1 = "muzzle_snds_338_sand";
    _muzzle2 = "muzzle_snds_H";
    _mag = "30Rnd_65x39_caseless_mag";
    _mag1 = "100Rnd_65x39_caseless_mag";
    _mag2 = "100Rnd_65x39_caseless_mag_Tracer";
    _uniform = "U_B_CombatUniform_mcam_tshirt";
    _helmet = "H_HelmetB_light";
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
this addVest "V_Chestrig_rgr";
this addBackpack "B_Kitbag_rgr_AAR";

comment "Add binoculars";
this addWeapon "Rangefinder";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform _mag;};
this addItemToUniform "Chemlight_green";
for "_i" from 1 to 5 do {this addItemToVest _mag;};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {this addItemToVest "B_IR_Grenade";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "Chemlight_green";
this addItemToBackpack "optic_tws_mg";
this addItemToBackpack _bipod;
this addItemToBackpack _muzzle2;
for "_i" from 1 to 2 do {this addItemToBackpack _mag1;};
for "_i" from 1 to 2 do {this addItemToBackpack _mag2;};
this addHeadgear _helmet;

comment "Marksmen DLC items";
if (_usingMarksmen) then
{
    this addItemToBackpack _muzzle1;
    for "_i" from 1 to 2 do {this addItemToBackpack "130Rnd_338_Mag";};
};

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem _nvg;

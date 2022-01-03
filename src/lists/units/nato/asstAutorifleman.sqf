/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

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
_unit addWeapon _weaponP;
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Aco";
_unit addPrimaryWeaponItem _mag;
_unit addWeapon _weaponS;
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "V_Chestrig_rgr";
_unit addBackpack "B_Kitbag_rgr_AAR";

comment "Add binoculars";
_unit addWeapon "Rangefinder";

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
_unit addItemToBackpack "optic_tws_mg";
_unit addItemToBackpack _bipod;
_unit addItemToBackpack _muzzle2;
for "_i" from 1 to 2 do {_unit addItemToBackpack _mag1;};
for "_i" from 1 to 2 do {_unit addItemToBackpack _mag2;};
_unit addHeadgear _helmet;

comment "Marksmen DLC items";
if (_usingMarksmen) then
{
    _unit addItemToBackpack _muzzle1;
    for "_i" from 1 to 2 do {_unit addItemToBackpack "130Rnd_338_Mag";};
};

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem _nvg;

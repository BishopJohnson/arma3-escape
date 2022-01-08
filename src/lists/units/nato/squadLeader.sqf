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
            _weaponP = "arifle_MX_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Hamr_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _tracerMag = "30Rnd_65x39_caseless_khaki_mag_Tracer";
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrierGL_tna_F";
            _helmet = "H_HelmetB_Enh_tna_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _weaponP = "arifle_MX_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Hamr";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _tracerMag = "30Rnd_65x39_caseless_black_mag_Tracer";
            _uniform = "U_B_CombatUniform_vest_mcam_wdl_f";
            _vest = "V_PlateCarrierGL_wdl";
            _helmet = "H_HelmetSpecB_wdl";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MX_F";
            _weaponS = "hgun_P07_F";
            _optic = "optic_Hamr";
            _mag = "30Rnd_65x39_caseless_mag";
            _tracerMag = "30Rnd_65x39_caseless_mag_Tracer";
            _uniform = "U_B_CombatUniform_mcam_vest";
            _vest = "V_PlateCarrierGL_rgr";
            _helmet = "H_HelmetB_desert";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MX_F";
    _weaponS = "hgun_P07_F";
    _optic = "optic_Hamr";
    _mag = "30Rnd_65x39_caseless_mag";
    _tracerMag = "30Rnd_65x39_caseless_mag_Tracer";
    _uniform = "U_B_CombatUniform_mcam_vest";
    _vest = "V_PlateCarrierGL_rgr";
    _helmet = "H_HelmetB_desert";
    _nvg = "NVGoggles";
};

comment "Remove existing items";
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
_unit addWeapon _weaponS;
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform _mag;};
_unit addItemToVest _mag;
for "_i" from 1 to 2 do {_unit addItemToVest _tracerMag;};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellBlue";
_unit addItemToVest "SmokeShellOrange";
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit addPrimaryWeaponItem "acc_pointer_IR";
    _unit addItemToUniform "Chemlight_green";
    _unit addItemToVest "Chemlight_green";
    for "_i" from 1 to 2 do {_unit addItemToVest "B_IR_Grenade";};
    _unit linkItem _nvg;
};

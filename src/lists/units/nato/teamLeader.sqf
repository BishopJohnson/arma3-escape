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
    switch (worldName) do
    {
        case TANOA_KEY:
        {
            _weaponP = "arifle_MX_GL_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Hamr_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _tracerMag = "30Rnd_65x39_caseless_khaki_mag_Tracer";
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrierGL_tna_F";
            _helmet = "H_HelmetB_Enh_tna_F";
            _nvg = "NVGoggles_tna_F";
        };
        case LIVONIA_KEY:
        {
            _weaponP = "arifle_MX_GL_Black_F";
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
            _weaponP = "arifle_MX_GL_F";
            _weaponS = "hgun_P07_F";
            _optic = "optic_Hamr";
            _mag = "30Rnd_65x39_caseless_mag";
            _tracerMag = "30Rnd_65x39_caseless_mag_Tracer";
            _uniform = "U_B_CombatUniform_mcam_vest";
            _vest = "V_PlateCarrierGL_rgr";
            _helmet = "H_HelmetSpecB";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MX_GL_F";
    _weaponS = "hgun_P07_F";
    _optic = "optic_Hamr";
    _mag = "30Rnd_65x39_caseless_mag";
    _tracerMag = "30Rnd_65x39_caseless_mag_Tracer";
    _uniform = "U_B_CombatUniform_mcam_vest";
    _vest = "V_PlateCarrierGL_rgr";
    _helmet = "H_HelmetSpecB";
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
_unit addPrimaryWeaponItem "acc_pointer_IR";
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
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest _mag;
for "_i" from 1 to 2 do {_unit addItemToVest _tracerMag;};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
for "_i" from 1 to 5 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellBlue";
_unit addItemToVest "SmokeShellOrange";
_unit addItemToVest "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell";
_unit addItemToVest "1Rnd_SmokeOrange_Grenade_shell";
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit linkItem _nvg;

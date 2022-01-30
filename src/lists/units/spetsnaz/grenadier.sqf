/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_muzzle", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

private _map = worldName;
if (Escape_Spetsnaz_Use_Camo) then
{
    removeGoggles _unit;

    switch (_map) do
    {
        case TANOA_KEY:
        {
            _weaponP = "arifle_AK12_GL_lush_F";
            _mag = "30rnd_762x39_AK12_Lush_Mag_F";
            _optic = selectRandom ["optic_Holosight_lush_F", "optic_Arco_AK_lush_F"];
            _muzzle = "muzzle_snds_B_lush_F";
            _uniform = "U_O_R_Gorka_01_F";
            _helmet = "H_HelmetAggressor_cover_F";
        };
        case LIVONIA_KEY:
        {
            _unit addGoggles "G_Balaclava_blk";
            _weaponP = "arifle_AK12_GL_lush_F";
            _mag = "30rnd_762x39_AK12_Lush_Mag_F";
            _optic = selectRandom ["optic_Holosight_lush_F", "optic_Arco_AK_lush_F"];
            _muzzle = "muzzle_snds_B_lush_F";
            _uniform = "U_O_R_Gorka_01_camo_F";
            _helmet = "H_HelmetAggressor_cover_taiga_F";
        };
        default
        {
            _weaponP = "arifle_AK12_GL_arid_F";
            _mag = "30rnd_762x39_AK12_Arid_Mag_F";
            _optic = selectRandom ["optic_Holosight_arid_F", "optic_Arco_AK_arid_F"];
            _muzzle = "muzzle_snds_B_arid_F";
            _uniform = "U_O_R_Gorka_01_brown_F";
            _helmet = "H_HelmetAggressor_cover_F";
        };
    };
}
else
{
    if (Escape_Using_Apex) then
    {
        _weaponP = "arifle_AK12_GL_F";
        _mag = "30Rnd_762x39_AK12_Mag_F";
        _optic = selectRandom ["optic_Holosight_blk_F", "optic_Arco_AK_blk_F"];
        _muzzle = "muzzle_snds_B";
    }
    else
    {
        _weaponP = "arifle_AK12_GL_lush_F";
        _mag = "30rnd_762x39_AK12_Lush_Mag_F";
        _optic = selectRandom ["optic_Holosight_lush_F", "optic_Arco_AK_lush_F"];
        _muzzle = "muzzle_snds_B_lush_F";
    };

    _uniform = "U_O_R_Gorka_01_F";
    _helmet = "H_HelmetAggressor_cover_F";
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
if (selectRandom [true, false]) then {_unit addPrimaryWeaponItem _muzzle;};
_unit addPrimaryWeaponItem _optic;
_unit addPrimaryWeaponItem _mag;
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "V_SmershVest_01_F";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform _mag;};
for "_i" from 1 to 3 do {_unit addItemToVest _mag;};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
for "_i" from 1 to 5 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
_unit addItemToVest "1Rnd_SmokeOrange_Grenade_shell";
_unit addItemToVest "1Rnd_SmokeYellow_Grenade_shell";
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit addPrimaryWeaponItem "acc_pointer_IR";
    _unit addItemToUniform "Chemlight_red";
    _unit addItemToVest "Chemlight_red";
    _unit linkItem "O_NVGoggles_grn_F";
};

/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_muzzle", "_mag", "_mag1", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

private _map = worldName;
if (Escape_Spetsnaz_Use_Camo) then
{
    removeGoggles _unit;

    switch (_map) do
    {
        case TANOA_KEY:
        {
            _weaponP = "arifle_AK12U_lush_F";
            _mag = "30rnd_762x39_AK12_Lush_Mag_F";
            _mag1 = "75rnd_762x39_AK12_Lush_Mag_F";
            _muzzle = "muzzle_snds_B_lush_F";
            _uniform = "U_O_R_Gorka_01_F";
            _helmet = "H_HelmetAggressor_cover_F";
            _backpack = "B_Carryall_green_F";
        };
        case LIVONIA_KEY:
        {
            _unit addGoggles "G_Balaclava_blk";
            _weaponP = "arifle_AK12U_lush_F";
            _mag = "30rnd_762x39_AK12_Lush_Mag_F";
            _mag1 = "75rnd_762x39_AK12_Lush_Mag_F";
            _muzzle = "muzzle_snds_B_lush_F";
            _uniform = "U_O_R_Gorka_01_camo_F";
            _helmet = "H_HelmetAggressor_cover_taiga_F";
            _backpack = "B_Carryall_taiga_F";
        };
        default
        {
            _weaponP = "arifle_AK12_arid_F";
            _mag = "30rnd_762x39_AK12_Arid_Mag_F";
            _mag1 = "75rnd_762x39_AK12_Arid_Mag_F";
            _muzzle = "muzzle_snds_B_arid_F";
            _uniform = "U_O_R_Gorka_01_brown_F";
            _helmet = "H_HelmetAggressor_cover_F";
            _backpack = "B_Carryall_green_F";
        };
    };
}
else
{
    if (Escape_Using_Apex) then
    {
        _weaponP = "arifle_AK12_F";
        _mag = "30Rnd_762x39_AK12_Mag_F";
        _mag1 = "75rnd_762x39_AK12_Mag_F";
        _muzzle = "muzzle_snds_B";
    }
    else
    {
        _weaponP = "arifle_AK12U_lush_F";
        _mag = "30rnd_762x39_AK12_Lush_Mag_F";
        _mag1 = "75rnd_762x39_AK12_Lush_Mag_F";
        _muzzle = "muzzle_snds_B_lush_F";
    };

    _uniform = "U_O_R_Gorka_01_F";
    _helmet = "H_HelmetAggressor_cover_F";
    _backpack = "B_Carryall_green_F";
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
_unit addPrimaryWeaponItem _mag;
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "V_SmershVest_01_F";
_unit addBackpack _backpack;

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
_unit addItemToUniform "16Rnd_9x21_Mag";
for "_i" from 1 to 5 do {_unit addItemToVest _mag;};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "SmokeShell";
for "_i" from 1 to 8 do {_unit addItemToBackpack _mag;};
for "_i" from 1 to 3 do {_unit addItemToBackpack _mag1;};
_unit addItemToBackpack "RPG32_F";
_unit addItemToBackpack "RPG32_HE_F";
for "_i" from 1 to 3 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
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
    for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
    _unit linkItem "O_NVGoggles_grn_F";
};

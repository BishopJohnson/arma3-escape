/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_muzzle", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

private _map = worldName;
if (Escape_Nato_Use_Camo) then
{
    removeGoggles _unit;

    switch (_map) do
    {
        case TANOA_KEY:
        {
            _uniform = "U_O_R_Gorka_01_F";
            _helmet = "H_HelmetAggressor_cover_F";
        };
        case LIVONIA_KEY:
        {
            _unit addGoggles "G_Balaclava_blk";
            _uniform = "U_O_R_Gorka_01_camo_F";
            _helmet = "H_HelmetAggressor_cover_taiga_F";
        };
        default
        {
            _uniform = "U_O_R_Gorka_01_brown_F";
            _helmet = "H_HelmetAggressor_cover_F";
        };
    };
}
else
{
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
_unit addWeapon "srifle_DMR_04_F";
_unit addPrimaryWeaponItem "optic_DMS_weathered_Kir_F";
_unit addPrimaryWeaponItem "10Rnd_127x54_Mag";
_unit addPrimaryWeaponItem "bipod_02_F_blk";
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "V_SmershVest_01_F";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "10Rnd_127x54_Mag";
for "_i" from 1 to 8 do {_unit addItemToVest "10Rnd_127x54_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellRed";
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

/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

private _map = worldName;
if (Escape_Csat_Pacific_Use_Camo) then
{
    switch (_map) do
    {
        case TANOA_KEY;
        case LIVONIA_KEY:
        {
            _weaponP = "arifle_CTAR_ghex_F";
            _weaponL = "launch_RPG32_ghex_F";
            _uniform = "U_O_T_Soldier_F";
            _vest = "V_TacVest_oli";
            _helmet = "H_HelmetO_ghex_F";
            _backpack = "B_FieldPack_ghex_OTLAT_F";
            _nvg = "O_NVGoggles_ghex_F";
        };
        default
        {
            _weaponP = "arifle_CTAR_hex_F";
            _weaponL = "launch_RPG32_F";
            _uniform = "U_O_CombatUniform_ocamo";
            _vest = "V_TacVest_khk";
            _helmet = "H_HelmetO_ocamo";
            _backpack = "B_FieldPack_cbr_LAT";
            _nvg = "O_NVGoggles_hex_F";
        };
    };
}
else
{
    _weaponP = "arifle_CTAR_blk_F";
    _weaponL = "launch_RPG32_ghex_F";
    _uniform = "U_O_T_Soldier_F";
    _vest = "V_TacVest_oli";
    _helmet = "H_HelmetO_ghex_F";
    _backpack = "B_FieldPack_ghex_OTLAT_F";
    _nvg = "O_NVGoggles_ghex_F";
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
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "30Rnd_580x42_Mag_F";
_unit addWeapon _weaponL;
_unit addSecondaryWeaponItem "RPG32_F";
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack _backpack;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_580x42_Mag_F";};
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_580x42_Mag_F";};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToBackpack "RPG32_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "RPG32_HE_F";};
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
    _unit linkItem _nvg;
};

comment "Set identity";
[
    _unit,
    selectRandom
    [
        "AsianHead_A3_01",
        "AsianHead_A3_02",
        "AsianHead_A3_03",
        "AsianHead_A3_04",
        "AsianHead_A3_05",
        "AsianHead_A3_06",
        "AsianHead_A3_07"
    ],
    selectRandom ["male01chi", "male02chi", "male03chi"]
] call BIS_fnc_setIdentity;

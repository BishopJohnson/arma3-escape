/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

private _map = worldName;
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Apex);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _uniform = "U_O_T_Soldier_F";
            _vest = "V_TacChestrig_oli_F";
            _helmet = "H_HelmetO_ghex_F";
            _nvg = "O_NVGoggles_ghex_F";
        };
        default
        {
            _uniform = "U_O_CombatUniform_ocamo";
            _vest = "V_Chestrig_khk";
            _helmet = "H_HelmetO_ocamo";
            _nvg = "NVGoggles_OPFOR";
        };
    };
}
else
{
    _uniform = "U_O_CombatUniform_ocamo";
    _vest = "V_Chestrig_khk";
    _helmet = "H_HelmetO_ocamo";
    _nvg = "NVGoggles_OPFOR";
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
_unit addWeapon "arifle_Katiba_C_F";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack "O_Mortar_01_support_F";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
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
    for "_i" from 1 to 2 do {_unit addItemToVest "O_IR_Grenade";};
    _unit linkItem _nvg;
};

comment "Set identity";
[
    _unit,
    selectRandom ["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03"],
    selectRandom ["male01per", "male02per", "male03per"]
] call BIS_fnc_setIdentity;

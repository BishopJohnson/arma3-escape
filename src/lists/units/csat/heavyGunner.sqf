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
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weaponP = "MMG_01_tan_F";
            _optic = "optic_Arco_blk_F";
            _bipod = "bipod_02_F_blk";
            _uniform = "U_O_T_Soldier_F";
            _vest = "V_HarnessO_ghex_F";
            _helmet = "H_HelmetO_ghex_F";
            _nvg = "O_NVGoggles_ghex_F";
        };
        default
        {
            _weaponP = "MMG_01_hex_F";
            _optic = "optic_Arco";
            _bipod = "bipod_02_F_hex";
            _uniform = "U_O_CombatUniform_ocamo";
            _vest = "V_HarnessO_brn";
            _helmet = "H_HelmetO_ocamo";
            _nvg = "NVGoggles_OPFOR";
        };
    };
}
else
{
    _weaponP = "MMG_01_hex_F";
    _optic = "optic_Arco";
    _bipod = "bipod_02_F_hex";
    _uniform = "U_O_CombatUniform_ocamo";
    _vest = "V_HarnessO_brn";
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
_unit addWeapon _weaponP;
_unit addPrimaryWeaponItem _optic;
_unit addPrimaryWeaponItem "150Rnd_93x64_Mag";
_unit addPrimaryWeaponItem _bipod;
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToVest "150Rnd_93x64_Mag";};
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
    for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
    _unit linkItem _nvg;
};

comment "Set identity";
[
    _unit,
    selectRandom ["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03"],
    selectRandom ["male01per", "male02per", "male03per"]
] call BIS_fnc_setIdentity;

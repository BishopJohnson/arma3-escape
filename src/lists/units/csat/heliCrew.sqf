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
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _vest = "V_TacVest_oli";
            _nvg = "O_NVGoggles_ghex_F";
        };
        default
        {
            _vest = "V_TacVest_khk";
            _nvg = "NVGoggles_OPFOR";
        };
    };
}
else
{
    _vest = "V_TacVest_khk";
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
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";

comment "Add containers";
_unit forceAddUniform "U_O_PilotCoveralls";
_unit addVest _vest;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addItemToUniform "SmokeShellRed";
_unit addItemToUniform "SmokeShellOrange";
_unit addItemToUniform "SmokeShellYellow";
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
_unit addHeadgear "H_CrewHelmetHeli_O";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem _nvg;

comment "Set identity";
[
    _unit,
    selectRandom ["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03"],
    selectRandom ["male01per", "male02per", "male03per"]
] call BIS_fnc_setIdentity;

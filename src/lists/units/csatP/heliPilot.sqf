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
if (Escape_Csat_Pacific_Use_Camo) then
{
    switch (_map) do
    {
        case TANOA_KEY;
        case LIVONIA_KEY:
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
    _vest = "V_TacVest_oli";
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
_unit addWeapon "SMG_02_F";
_unit addPrimaryWeaponItem "optic_ACO_grn_smg";
_unit addPrimaryWeaponItem "30Rnd_9x21_Mag_SMG_02_Tracer_Green";
_unit addWeapon "hgun_Rook40_F";

comment "Add containers";
_unit forceAddUniform "U_O_PilotCoveralls";
_unit addVest _vest;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_9x21_Mag_SMG_02_Tracer_Green";};
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

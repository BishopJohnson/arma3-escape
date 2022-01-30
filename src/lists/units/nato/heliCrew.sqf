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
            _weaponP = "arifle_MXC_khk_F";
            _optic = "optic_Holosight_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MXC_Black_F";
            _optic = "optic_Holosight_blk_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
        };
        default
        {
            _weaponP = "arifle_MXC_F";
            _optic = "optic_Holosight";
            _mag = "30Rnd_65x39_caseless_mag";
        };
    };
}
else
{
    _weaponP = "arifle_MXC_F";
    _optic = "optic_Holosight";
    _mag = "30Rnd_65x39_caseless_mag";
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
_unit addPrimaryWeaponItem _mag;

comment "Add containers";
_unit forceAddUniform "U_B_HeliPilotCoveralls";
_unit addVest "V_TacVest_blk";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform _mag;};
_unit addItemToVest _mag;
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellBlue";
_unit addItemToVest "SmokeShellOrange";
_unit addHeadgear "H_CrewHelmetHeli_B";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "NVGoggles";

comment "Night time operation items";
private _dayTime = dayTime;
if (_dayTime < 5 || _dayTime > 19) then
{
    _unit addItemToUniform "Chemlight_green";
    _unit addItemToVest "Chemlight_green";
    _unit linkItem "NVGoggles";
};

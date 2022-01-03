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
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _uniform = "U_B_T_Soldier_F";
            _helmet = "H_MilCap_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MXC_Black_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _uniform = "U_B_CombatUniform_mcam_wdl_f";
            _helmet = "H_MilCap_wdl";
        };
        default
        {
            _weaponP = "arifle_MXC_F";
            _mag = "30Rnd_65x39_caseless_mag";
            _uniform = "U_B_CombatUniform_mcam";
            _helmet = "H_MilCap_mcamo";
        };
    };
}
else
{
    _weaponP = "arifle_MXC_F";
    _mag = "30Rnd_65x39_caseless_mag";
    _uniform = "U_B_CombatUniform_mcam";
    _helmet = "H_MilCap_mcamo";
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
_unit addPrimaryWeaponItem "optic_Aco";
_unit addPrimaryWeaponItem _mag;
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "V_BandollierB_rgr";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform _mag;};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest _mag;
for "_i" from 1 to 2 do {_unit addItemToVest "11Rnd_45ACP_Mag";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "Chemlight_green";
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";

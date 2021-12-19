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
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weaponP = "arifle_MX_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Aco";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrierSpec_tna_F";
            _helmet = "H_HelmetB_tna_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MXC_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Holosight_blk_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _uniform = "U_B_CombatUniform_vest_mcam_wdl_f";
            _vest = "V_PlateCarrier1_wdl";
            _helmet = "H_HelmetB_plain_wdl";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MX_F";
            _weaponS = "hgun_P07_F";
            _optic = "optic_Aco";
            _mag = "30Rnd_65x39_caseless_mag";
            _uniform = "U_B_CombatUniform_mcam";
            _vest = "V_PlateCarrierSpec_rgr";
            _helmet = "H_HelmetB";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MX_F";
    _weaponS = "hgun_P07_F";
    _optic = "optic_Aco";
    _mag = "30Rnd_65x39_caseless_mag";
    _uniform = "U_B_CombatUniform_mcam";
    _vest = "V_PlateCarrierSpec_rgr";
    _helmet = "H_HelmetB";
    _nvg = "NVGoggles";
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
this addWeapon _weaponP;
this addPrimaryWeaponItem "acc_pointer_IR";
this addPrimaryWeaponItem _optic;
this addPrimaryWeaponItem _mag;
this addWeapon _weaponS;
this addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
this forceAddUniform _uniform;
this addVest _vest;
this addBackpack "B_UAV_01_backpack_F";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform _mag;};
this addItemToUniform "Chemlight_green";
this addItemToUniform "HandGrenade";
for "_i" from 1 to 7 do {this addItemToVest _mag;};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "Chemlight_green";
this addHeadgear _helmet;

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "B_UavTerminal";
this linkItem _nvg;

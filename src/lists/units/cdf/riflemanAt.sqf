/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

private _map = worldName;
if (Escape_Cdf_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _uniform = "rhsgref_uniform_ttsko_forest";
            _vest = "rhs_6b5_rifleman";
            _helmet = "rhsgref_6b27m_ttsko_forest";
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _uniform = "rhsgref_uniform_3color_desert";
            _vest = "rhs_6b5_rifleman_khaki";
            _helmet = "rhsgref_helmet_pasgt_3color_desert";
        };
        default
        {
            _uniform = "rhsgref_uniform_ttsko_mountain";
            _vest = "rhs_6b5_rifleman_ttsko";
            _helmet = "rhsgref_6b27m_ttsko_mountain";
        };
    };
}
else
{
    _uniform = "rhsgref_uniform_ttsko_mountain";
    _vest = "rhs_6b5_rifleman_ttsko";
    _helmet = "rhsgref_6b27m_ttsko_mountain";
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
_unit addWeapon "rhs_weap_ak74";
_unit addPrimaryWeaponItem "rhs_acc_dtk1983";
_unit addPrimaryWeaponItem "rhs_30Rnd_545x39_7N6M_AK";
_unit addWeapon "rhs_weap_rpg75";
_unit addSecondaryWeaponItem "rhs_rpg75_mag";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_30Rnd_545x39_7N6M_AK";};
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_7N6M_AK";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

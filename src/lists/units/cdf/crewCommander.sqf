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
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _uniform = "rhsgref_uniform_3color_desert";
        };
        default
        {
            _uniform = "rhsgref_uniform_ttsko_mountain";
        };
    };
}
else
{
    _uniform = "rhsgref_uniform_ttsko_mountain";
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
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_FMJ";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest "rhs_vest_commander";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_FMJ";};
_unit addItemToUniform "rhs_mag_rdg2_white";
_unit addItemToVest "rhs_mag_rdg2_white";
_unit addItemToVest "rhs_mag_nspn_red";
_unit addHeadgear "rhs_tsh4";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

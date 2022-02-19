/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

private _map = worldName;
if (Escape_Ru_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case LIVONIA_KEY:
        {
            _uniform = "rhs_uniform_vkpo_gloves_alt";
            _vest = "rhs_6b45_rifleman";
            _helmet = "rhs_vkpo_cap";
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _uniform = "rhs_uniform_emr_des_patchless";
            _vest = "rhs_6b5_khaki";
            _helmet = "rhs_fieldcap_khk";
        };
        default
        {
            _uniform = "rhs_uniform_flora";
            _vest = "rhs_6b23";
            _helmet = "rhs_fieldcap_vsr";
        };
    };
}
else
{
    _uniform = "rhs_uniform_vkpo_gloves_alt";
    _vest = "rhs_6b45_rifleman";
    _helmet = "rhs_vkpo_cap";
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
_unit addWeapon "rhs_weap_aks74u";
_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u";
_unit addPrimaryWeaponItem "rhs_30Rnd_545x39_7N10_AK";
_unit addWeapon "rhs_weap_pya";
_unit addHandgunItem "rhs_mag_9x19_17";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhs_30Rnd_545x39_7N10_AK";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_9x19_17";};
_unit addItemToVest "rhs_mag_rdg2_white";
_unit addItemToVest "rhs_mag_nspd";
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

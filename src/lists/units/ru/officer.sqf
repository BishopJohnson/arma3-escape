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
            _vest = "rhs_6b45_holster";
            _helmet = "rhs_vkpo_cap";
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _uniform = "rhs_uniform_emr_des_patchless";
            _vest = "rhs_6b5_officer_khaki";
            _helmet = "rhs_fieldcap_khk";
        };
        default
        {
            _uniform = "rhs_uniform_flora";
            _vest = "rhs_6b23_crewofficer";
            _helmet = "rhs_fieldcap_vsr";
        };
    };
}
else
{
    _uniform = "rhs_uniform_vkpo_gloves_alt";
    _vest = "rhs_6b45_holster";
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
_unit addWeapon "rhs_weap_ak74m_folded";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addPrimaryWeaponItem "rhs_30Rnd_545x39_7N10_AK";
_unit addWeapon "rhs_weap_makarov_pm";
_unit addHandgunItem "rhs_mag_9x18_8_57N181S";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_30Rnd_545x39_7N10_AK";};
_unit addItemToUniform "rhs_mag_9x18_8_57N181S";
_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

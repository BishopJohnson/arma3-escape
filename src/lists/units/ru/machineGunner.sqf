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
            _vest = "rhs_6b45_mg";
            _backpack = "rhs_rk_sht_30_emr_mg";
            _helmet = "rhs_6b47_emr_1";
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _uniform = "rhs_uniform_emr_des_patchless";
            _vest = "rhs_6b5_khaki";
            _backpack = "rhs_sidorMG";
            _helmet = "rhs_6b27m_green";
        };
        default
        {
            _uniform = "rhs_uniform_flora";
            _vest = "rhs_6b23_rifleman";
            _backpack = "rhs_sidorMG";
            _helmet = "rhs_6b26";
        };
    };
}
else
{
    _uniform = "rhs_uniform_vkpo_gloves_alt";
    _vest = "rhs_6b45_mg";
    _backpack = "rhs_rk_sht_30_emr_mg";
    _helmet = "rhs_6b47_emr_1";
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
_unit addWeapon selectRandom ["rhs_weap_pkp", "rhs_weap_pkm"];
_unit addPrimaryWeaponItem "rhs_100Rnd_762x54mmR";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack _backpack;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhs_mag_rgn";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

private _map = worldName;
if (Escape_Saf_Use_Camo) then
{
    switch (_map) do
    {
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _uniform = "rhssaf_uniform_m10_digital_desert";
            _vest = "rhssaf_vest_md12_digital_desert";
            _backpack = "B_Kitbag_tan";
            _helmet = "rhssaf_helmet_m97_black_nocamo_black_ess_bare";
        };
        default
        {
            _uniform = "rhssaf_uniform_m10_digital_summer";
            _vest = "rhssaf_vest_md12_digital";
            _backpack = "rhssaf_kitbag_digital";
            _helmet = "rhssaf_helmet_m97_digital_black_ess_bare";
        };
    };
}
else
{
    _uniform = "rhssaf_uniform_m10_digital_summer";
    _vest = "rhssaf_vest_md12_digital";
    _backpack = "rhssaf_Kitbag_smb_AT";
    _helmet = "rhssaf_helmet_m97_digital_black_ess_bare";
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
_unit addWeapon "rhs_weap_m21s";
_unit addPrimaryWeaponItem "rhs_acc_pkas";
_unit addPrimaryWeaponItem "rhsgref_30rnd_556x45_m21";
_unit addWeapon "rhs_weap_smaw_green";
_unit addSecondaryWeaponItem "rhs_mag_smaw_HEAA";

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack _backpack;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsgref_30rnd_556x45_m21";};
for "_i" from 1 to 7 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhssaf_mag_br_m84";};
_unit addItemToVest "rhssaf_mag_brd_m83_white";
_unit addItemToVest "rhssaf_mag_brd_m83_green";
_unit addItemToBackpack "rhs_mag_smaw_HEAA";
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

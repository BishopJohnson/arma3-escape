/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

params ["_unit"];

private ["_weaponP", "_weaponS", "_weaponL", "_muzzle", "_acc", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_backpack", "_helmet", "_nvg"];

private _primaryLoadout = selectRandomWeighted [true, 0.8, false, 0.2];
if (_primaryLoadout) then
{
    _weaponP = "rhs_weap_m70b3n";
    _mag = "rhssaf_30Rnd_762x39mm_M67";
}
else
{
    _weaponP = "rhs_weap_m21a";
    _mag = "rhsgref_30rnd_556x45_m21";
};

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
            _helmet = "rhssaf_helmet_m97_black_nocamo";
        };
        default
        {
            _uniform = "rhssaf_uniform_m10_digital_summer";
            _helmet = "rhssaf_helmet_m97_digital";

            if (_primaryLoadout) then
            {
                _vest = "rhssaf_vest_md12_m70_rifleman";
            }
            else
            {
                _vest = "rhssaf_vest_md12_digital";
            };
        };
    };
}
else
{
    _uniform = "rhssaf_uniform_m10_digital_summer";
    _helmet = "rhssaf_helmet_m97_digital";

    if (_primaryLoadout) then
    {
        _vest = "rhssaf_vest_md12_m70_rifleman";
    }
    else
    {
        _vest = "rhssaf_vest_md12_digital";
    };
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
_unit addPrimaryWeaponItem _mag;

if (_primaryLoadout) then
{
    if (selectRandomWeighted [true, 0.1, false, 0.9]) then { _unit addPrimaryWeaponItem "rhs_acc_pkas" };
}
else
{
    _unit addPrimaryWeaponItem "rhs_acc_pkas";
};

comment "Add containers";
_unit forceAddUniform _uniform;
_unit addVest _vest;

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform _mag;};
for "_i" from 1 to 7 do {_unit addItemToVest _mag;};
for "_i" from 1 to 2 do {_unit addItemToVest "rhssaf_mag_br_m84";};
_unit addHeadgear _helmet;

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

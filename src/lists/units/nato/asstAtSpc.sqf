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
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
        };
        default
        {
        };
    };
}
else
{
    _weaponP = "";
    _weaponS = "";
    _weaponL = "";
    _optic = "";
    _bipod = "";
    _mag = "";
    _tracerMag = "";
    _uniform = "";
    _vest = "";
    _helmet = "";
    _backpack = "";
    _nvg = "";
};

// Remove existing items
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;

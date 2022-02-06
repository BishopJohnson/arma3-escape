/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params
[
    [
        "_typeWeight",
        [
            UNIT_CLASS_LEADER,          0.125,
            UNIT_CLASS_RIFLEMEN,        0.375,
            UNIT_CLASS_AT,              0.1,
            UNIT_CLASS_AA,              0.025,
            UNIT_CLASS_AUTORIFLEMEN,    0.125,
            UNIT_CLASS_MARKSMEN,        0.05,
            UNIT_CLASS_HEAVY_GUNNER,    0.05,
            UNIT_CLASS_AMMO,            0.05,
            UNIT_CLASS_SUPPORT,         0.1
        ],
        [[]]
    ]
];

if (!isServer) exitWith {};

private _side = west;
private _faction = US_ARMY_KEY;

private "_unitEntry";
if (isNil "_typeWeight") then
{
    _unitEntry = [_side, _faction] call compile preprocessFile "src\fnc\units\getUnitEntryFromDict.sqf";
}
else
{
    _unitEntry = [_side, _faction, _typeWeight] call compile preprocessFile "src\fnc\units\getUnitEntryFromDict.sqf";
};

if (isNil "_unitEntry") exitWith {};

_unitEntry

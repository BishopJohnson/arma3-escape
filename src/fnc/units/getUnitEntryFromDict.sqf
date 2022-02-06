/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params
[
    "_side",
    "_faction",
    [
        "_typeWeight",
        [
            UNIT_CLASS_LEADER,          0.1,
            UNIT_CLASS_RIFLEMEN,        0.35,
            UNIT_CLASS_AT,              0.1,
            UNIT_CLASS_AA,              0.025,
            UNIT_CLASS_AUTORIFLEMEN,    0.125,
            UNIT_CLASS_MARKSMEN,        0.05,
            UNIT_CLASS_HEAVY_GUNNER,    0.05,
            UNIT_CLASS_AMMO,            0.05,
            UNIT_CLASS_SUPPORT,         0.1,
            UNIT_CLASS_FIELD_WEAPON,    0.025,
            UNIT_CLASS_UAV,             0.025
        ],
        [[]]
    ]
];

if (!isServer) exitWith {};

if (typeName _side == "Side") then
{
    _side = str _side;
};

private "_unitEntry";
private _attempt = 0;
while {isNil "_unitEntry" && _attempt < 5} do
{
    _attempt = _attempt + 1;

    private _type = selectRandomWeighted _typeWeight;
    private _typeDict = Escape_Units get _side get _faction get _type;
    if (isNil "_typeDict") then { continue };

    private _typeKeys = keys _typeDict;
    if (count _typeKeys > 0) then
    {
        _unitEntry = _typeDict get selectRandom _typeKeys;
    };
};

if (isNil "_unitEntry") exitWith {};

_unitEntry

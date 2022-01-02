/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

// TODO: Add parameter to filter unit types.
params
[
    "_pos",
    "_side",
    ["_faction", nil, [""]],
    ["_group", nil],
    ["_typeWeight", nil, [[]]]
];

if (!isServer) exitWith {};

if (typeName _side == "Side") then
{
    _side = str _side;
};

private "_groupSide";
private "_unitEntry";
switch (_side) do
{
    case str west:
    {
        _groupSide = west;
        _unitEntry = [_typeWeight] call compile preprocessFile "src\fnc\units\getNatoUnitEntry.sqf";
    };
    case str east:
    {
        _groupSide = east;

        if (isNil "_faction") then
        {
            private _factionDict = Escape_Random_Vehicles get _side;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case CSAT_KEY:
            {
                _unitEntry = [_typeWeight] call compile preprocessFile "src\fnc\units\getCsatUnitEntry.sqf";
            };
            case CSAT_P_KEY:
            {
                _unitEntry = [_typeWeight] call compile preprocessFile "src\fnc\units\getCsatPacificUnitEntry.sqf";
            };
            case SPETSNAZ_KEY:
            {
                _unitEntry = [_typeWeight] call compile preprocessFile "src\fnc\units\getSpetsnazUnitEntry.sqf";
            };
        };
    };
    case str independent:
    {
        _groupSide = independent;

        if (isNil "_faction") then
        {
            private _factionDict = Escape_Random_Vehicles get _side;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case AAF_KEY:
            {
                _unitEntry = [_typeWeight] call compile preprocessFile "src\fnc\units\getAafUnitEntry.sqf";
            };
            case LDF_KEY:
            {
                _unitEntry = [_typeWeight] call compile preprocessFile "src\fnc\units\getLdfUnitEntry.sqf";
            };
        };
    };
};

if (isNil "_unitEntry") exitWith {};

if (isNil "_group") then
{
    _group = createGroup _groupSide;
};

if (_group == grpNull) exitWith {};

private _unitType = _unitEntry select 0;
if (typeName _unitType == "Array") then
{
    _unitType = selectRandom _unitType;
};

private _unit = _unitType createUnit [_pos, _group];

private _unitLoadout = _unitEntry select 1;
if (typeName _unitLoadout == "Code") then
{
    [_unit] call _unitLoadout;
};

_unit

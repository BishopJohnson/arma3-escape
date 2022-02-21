/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params
[
    "_pos",
    "_side",
    ["_faction", "", [""]],
    ["_group", nil],
    ["_typeWeight", nil, [[]]]
];

if (!isServer) exitWith {};

if (typeName _side == "Side") then
{
    _side = str _side;
};

private "_fnc";
private "_groupSide";
switch (_side) do
{
    case str west:
    {
        _groupSide = west;

        if (count _faction == 0) then
        {
            private _factionDict = Escape_Units get _side;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case NATO_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getNatoUnitEntry.sqf";
            };
            case US_ARMY_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getUsArmyUnitEntry.sqf";
            };
            case US_MARINES_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getUsMarinesUnitEntry.sqf";
            };
        };
    };
    case str east:
    {
        _groupSide = east;

        if (count _faction == 0) then
        {
            private _factionDict = Escape_Units get _side;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case CSAT_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getCsatUnitEntry.sqf";
            };
            case CSAT_P_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getCsatPacificUnitEntry.sqf";
            };
            case SPETSNAZ_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getSpetsnazUnitEntry.sqf";
            };
            case RU_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getRuUnitEntry.sqf";
            };
        };
    };
    case str independent:
    {
        _groupSide = independent;

        if (count _faction == 0) then
        {
            private _factionDict = Escape_Units get _side;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case AAF_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getAafUnitEntry.sqf";
            };
            case LDF_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getLdfUnitEntry.sqf";
            };
            case CDF_KEY:
            {
                _fnc = compile preprocessFile "src\fnc\units\getCdfUnitEntry.sqf";
            };
        };
    };
};

private "_unitEntry";
if (isNil "_typeWeight") then
{
    _unitEntry = [] call _fnc;
}
else
{
    _unitEntry = [_typeWeight] call _fnc;
};

if (isNil "_group") then
{
    _group = createGroup _groupSide;
};

if (isNull _group) exitWith { hint "Cannot create anymore groups to spawn units in" };

private _unitType = _unitEntry select 0;
if (typeName _unitType == "Array") then
{
    _unitType = selectRandom _unitType;
};

private _unit = _group createUnit [_unitType, _pos, [], 0, "NONE"];

if (side _unit != PLAYER_SIDE) then
{
    _unit setSkill ['aimingShake', 0.25];

    // Removes maps
    if (random 1 > 0.9) then
    {
        _unit unlinkItem "ItemMap";
    };
};

private _unitLoadout = _unitEntry select 1;
if (typeName _unitLoadout == "Code") then
{
    [_unit] call _unitLoadout;
};

_unit

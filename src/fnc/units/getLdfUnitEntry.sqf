/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params
[
    ["_typeWeight", nil, [[]]]
];

if (!isServer) exitWith {};

private _unitEntry = [independent, LDF_KEY, _typeWeight] call compile preprocessFile "src\fnc\units\getUnitEntryFromDict.sqf";
if (isNil "_unitEntry") exitWith {};

_unitEntry

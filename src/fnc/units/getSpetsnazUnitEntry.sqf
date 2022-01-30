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

private "_unitEntry";
if (isNil "_typeWeight") then
{
    _unitEntry = [east, SPETSNAZ_KEY] call compile preprocessFile "src\fnc\units\getUnitEntryFromDict.sqf";
}
else
{
    _unitEntry = [east, SPETSNAZ_KEY, _typeWeight] call compile preprocessFile "src\fnc\units\getUnitEntryFromDict.sqf";
};

if (isNil "_unitEntry") exitWith {};

_unitEntry

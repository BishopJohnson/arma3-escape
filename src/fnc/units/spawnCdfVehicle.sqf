/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params ["_pos"];

if (!isServer) exitWith {};

private _side = independent;

private _vehEntry = [_side, CDF_KEY] call compile preprocessFile "src\fnc\units\getVehicleEntryFromDict.sqf";
if (isNil "_vehEntry") exitWith {};

private _veh = _vehEntry select 0;
while { typeName _veh == "Array" } do
{
    _veh = selectRandom _veh;
};

private _variant = _vehEntry select 1;
private _loadout = _vehEntry select 2;

if (typeName _variant == "Array") then
{
    _variant = [selectRandom _variant, 1];
};

if (typeName _loadout == "Array") then
{
    _loadout = selectRandom _loadout;
};

private _vehGroup = [_pos, random 360, _veh, _side] call BIS_fnc_spawnVehicle;
[_vehGroup select 0, _variant, _loadout] call BIS_fnc_initVehicle;
// TODO: Set crew loadout.

_vehGroup

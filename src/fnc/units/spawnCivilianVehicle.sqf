/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params ["_pos"];

if (!isServer) exitWith {};

private _side = civilian;

private _vehEntry =
[
    _side,
    CIVILIAN_KEY,
    [
        // Quadbike (total = 10%)
        RAND_VEH_QUADBIKE_KEY,      0.1,

        // Car/Truck (total = 80%)
        RAND_VEH_CAR_UNARMED_KEY,   0.5,
        RAND_VEH_TRUCK_UNARMED_KEY, 0.3,
        RAND_VEH_UTIL_KEY,          0.1
    ]
] call compile preprocessFile "src\fnc\units\getVehicleEntryFromDict.sqf";

if (isNil "_vehEntry") exitWith {};

private _veh = selectRandom (_vehEntry select 0);
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

_vehGroup
